From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] SUN3X: make dma api and ioremap usable/sun3x_esp platform
 dev
Date: Wed, 27 Apr 2011 22:12:51 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104272209510.5333@ayla.of.borg>
References: <20080131234519.C894BDE58D@solo.franken.de> <20080201151718.GT27644@sammy.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:46342 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752913Ab1D0UMy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Apr 2011 16:12:54 -0400
In-Reply-To: <20080201151718.GT27644@sammy.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Sam Creasey <sammy@sammy.net>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-m68k@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Fri, 1 Feb 2008, Sam Creasey wrote:
> Looks good to me.  I've got hacky console patches here as well, moving
> along the lines daveM suggested of actually using a fake openprom tree
> to get the serial console to work.  The code is crufty (I was using a
> 2.6.24-rc2+geert kernel), and it's not yet updated for sun3x, but the
> sun3x glue should be a simple modification of the sun3 glue. 
> 
> I'll post in a seperate message in a bit.
> 
> Signed-off-by: Sam Creasey <sammy@sammy.net>

While looking into which interrupts are used on sun3x, I noticed the lack of
an actual sun3x_esp platform_device, and discovered this old patch that never
made it into our tree.

Anyone who still cares? FWIW, it doesn't apply anymore...

> On Fri, Feb 01, 2008 at 12:45:19AM +0100, Thomas Bogendoerfer wrote:
> > - use dvma code inside dma api for SUN3/SUN3X
> > - make ioremap use mappings through tt1 for SUN3x
> > - add platform device for converted sun3x_esp driver
> > 
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > ---
> > 
> > This is the first step to get Sun3x back to life. I have a working
> > kernel with these changes (tested on a Sun 3/80). The missing pieces
> > are for the console driver, which is still too hackish to submit, yet.
> > 
> >  arch/m68k/kernel/dma.c         |   43 +++++++++++++++++++++++++++++++++++++++-
> >  arch/m68k/mm/kmap.c            |   24 ++++++++++++++++-----
> >  arch/m68k/sun3x/config.c       |   31 ++++++++++++++++++++++++++++
> >  include/asm-m68k/dma-mapping.h |   25 ++++++++++++++++++----
> >  include/asm-m68k/sun3xprom.h   |    5 ++++
> >  5 files changed, 116 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
> > index 6f8c080..0b9b818 100644
> > --- a/arch/m68k/kernel/dma.c
> > +++ b/arch/m68k/kernel/dma.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/vmalloc.h>
> >  
> >  #include <asm/pgalloc.h>
> > +#include <asm/dvma.h>
> >  
> >  void *dma_alloc_coherent(struct device *dev, size_t size,
> >  			 dma_addr_t *handle, gfp_t flag)
> > @@ -31,7 +32,11 @@ void *dma_alloc_coherent(struct device *dev, size_t size,
> >  	if (!page)
> >  		return NULL;
> >  
> > -	*handle = page_to_phys(page);
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		*handle = dvma_map(page_to_phys(page), size);
> > +	else
> > +		*handle = page_to_phys(page);
> > +
> >  	map = kmalloc(sizeof(struct page *) << order, flag & ~__GFP_DMA);
> >  	if (!map) {
> >  		__free_pages(page, order);
> > @@ -62,6 +67,8 @@ void dma_free_coherent(struct device *dev, size_t size,
> >  		       void *addr, dma_addr_t handle)
> >  {
> >  	pr_debug("dma_free_coherent: %p, %x\n", addr, handle);
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		dvma_unmap((void *)handle);
> >  	vfree(addr);
> >  }
> >  EXPORT_SYMBOL(dma_free_coherent);
> > @@ -100,6 +107,8 @@ dma_addr_t dma_map_single(struct device *dev, void *addr, size_t size,
> >  	dma_addr_t handle = virt_to_bus(addr);
> >  
> >  	dma_sync_single_for_device(dev, handle, size, dir);
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		handle = dvma_map(handle, size);
> >  	return handle;
> >  }
> >  EXPORT_SYMBOL(dma_map_single);
> > @@ -111,6 +120,8 @@ dma_addr_t dma_map_page(struct device *dev, struct page *page,
> >  	dma_addr_t handle = page_to_phys(page) + offset;
> >  
> >  	dma_sync_single_for_device(dev, handle, size, dir);
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		handle = dvma_map(handle, size);
> >  	return handle;
> >  }
> >  EXPORT_SYMBOL(dma_map_page);
> > @@ -123,7 +134,37 @@ int dma_map_sg(struct device *dev, struct scatterlist *sg, int nents,
> >  	for (i = 0; i < nents; sg++, i++) {
> >  		sg->dma_address = sg_phys(sg);
> >  		dma_sync_single_for_device(dev, sg->dma_address, sg->length, dir);
> > +		if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +			sg->dma_address = dvma_map(sg->dma_address, sg->length);
> >  	}
> >  	return nents;
> >  }
> >  EXPORT_SYMBOL(dma_map_sg);
> > +
> > +#if defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
> > +void dma_unmap_single(struct device *dev, dma_addr_t addr,
> > +				    size_t size, enum dma_data_direction dir)
> > +{
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		dvma_unmap((void *)addr);
> > +}
> > +
> > +
> > +void dma_unmap_page(struct device *dev, dma_addr_t addr,
> > +				  size_t size, enum dma_data_direction dir)
> > +{
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		dvma_unmap((void *)addr);
> > +}
> > +
> > +
> > +void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> > +				int nents, enum dma_data_direction dir)
> > +{
> > +	int i;
> > +
> > +	if (MACH_IS_SUN3 || MACH_IS_SUN3X)
> > +		for (i = 0; i < nents; sg++, i++)
> > +			dvma_unmap((void *)sg->dma_address);
> > +}
> > +#endif
> > diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
> > index 46b7d60..e76cb5e 100644
> > --- a/arch/m68k/mm/kmap.c
> > +++ b/arch/m68k/mm/kmap.c
> > @@ -124,6 +124,13 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
> >  			return (void __iomem *)physaddr;
> >  	}
> >  #endif
> > +#ifdef CONFIG_SUN3X
> > +	if (MACH_IS_SUN3X) {
> > +		if ((physaddr >= 0x40000000) && (physaddr + size < 0x80000000)
> > +		    && (cacheflag == IOMAP_NOCACHE_SER))
> > +			return (void __iomem *)physaddr;
> > +	}
> > +#endif
> >  
> >  #ifdef DEBUG
> >  	printk("ioremap: 0x%lx,0x%lx(%d) - ", physaddr, size, cacheflag);
> > @@ -228,13 +235,18 @@ EXPORT_SYMBOL(__ioremap);
> >  void iounmap(void __iomem *addr)
> >  {
> >  #ifdef CONFIG_AMIGA
> > -	if ((!MACH_IS_AMIGA) ||
> > -	    (((unsigned long)addr < 0x40000000) ||
> > -	     ((unsigned long)addr > 0x60000000)))
> > -			free_io_area((__force void *)addr);
> > -#else
> > -	free_io_area((__force void *)addr);
> > +	if (MACH_IS_AMIGA &&
> > +	    (((unsigned long)addr >= 0x40000000) &&
> > +	     ((unsigned long)addr < 0x60000000)))
> > +		return;
> >  #endif
> > +#ifdef CONFIG_SUN3X
> > +	if (MACH_IS_SUN3X &&
> > +	    (((unsigned long)addr >= 0x40000000) &&
> > +	     ((unsigned long)addr < 0x80000000)))
> > +		return;
> > +#endif
> > +	free_io_area((__force void *)addr);
> >  }
> >  EXPORT_SYMBOL(iounmap);
> >  
> > diff --git a/arch/m68k/sun3x/config.c b/arch/m68k/sun3x/config.c
> > index 9878917..e021873 100644
> > --- a/arch/m68k/sun3x/config.c
> > +++ b/arch/m68k/sun3x/config.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/mm.h>
> >  #include <linux/console.h>
> >  #include <linux/init.h>
> > +#include <linux/platform_device.h>
> >  
> >  #include <asm/system.h>
> >  #include <asm/machdep.h>
> > @@ -21,6 +22,30 @@
> >  
> >  #include "time.h"
> >  
> > +static struct resource sun3x_esp_rsrc[] = {
> > +	{
> > +		.start = SUN3X_ESP_BASE,
> > +		.end   = SUN3X_ESP_BASE + 31,
> > +		.flags = IORESOURCE_MEM
> > +	},
> > +	{
> > +		.start = SUN3X_ESP_DMA,
> > +		.end   = SUN3X_ESP_DMA + 15,
> > +		.flags = IORESOURCE_MEM
> > +	},
> > +	{
> > +		.start = 2,
> > +		.end   = 2,
> > +		.flags = IORESOURCE_IRQ
> > +	}
> > +};
> > +
> > +static struct platform_device sun3x_esp_pdev = {
> > +	.name           = "sun3x_esp",
> > +	.num_resources  = ARRAY_SIZE(sun3x_esp_rsrc),
> > +	.resource       = sun3x_esp_rsrc
> > +};
> > +
> >  volatile char *clock_va;
> >  extern volatile unsigned char *sun3_intreg;
> >  
> > @@ -82,6 +107,12 @@ void __init config_sun3x(void)
> >  		break;
> >  	}
> >  #endif
> > +	add_preferred_console("ttyS", 0, "9600");
> > +}
> >  
> > +static int __init sun3x_devinit(void)
> > +{
> > +	platform_device_register(&sun3x_esp_pdev);
> >  }
> >  
> > +device_initcall(sun3x_devinit);
> > diff --git a/include/asm-m68k/dma-mapping.h b/include/asm-m68k/dma-mapping.h
> > index a26cdeb..72e44d9 100644
> > --- a/include/asm-m68k/dma-mapping.h
> > +++ b/include/asm-m68k/dma-mapping.h
> > @@ -49,25 +49,40 @@ static inline void dma_cache_sync(struct device *dev, void *vaddr, size_t size,
> >  
> >  extern dma_addr_t dma_map_single(struct device *, void *, size_t,
> >  				 enum dma_data_direction);
> > +
> > +extern dma_addr_t dma_map_page(struct device *, struct page *,
> > +			       unsigned long, size_t size,
> > +			       enum dma_data_direction);
> > +
> > +extern int dma_map_sg(struct device *, struct scatterlist *, int,
> > +		      enum dma_data_direction);
> > +
> > +#if defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
> > +extern void dma_unmap_single(struct device *dev, dma_addr_t addr,
> > +				    size_t size, enum dma_data_direction dir);
> > +
> > +extern void dma_unmap_page(struct device *dev, dma_addr_t addr,
> > +				  size_t size, enum dma_data_direction dir);
> > +
> > +extern void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> > +				int nents, enum dma_data_direction dir);
> > +
> > +#else
> >  static inline void dma_unmap_single(struct device *dev, dma_addr_t addr,
> >  				    size_t size, enum dma_data_direction dir)
> >  {
> >  }
> >  
> > -extern dma_addr_t dma_map_page(struct device *, struct page *,
> > -			       unsigned long, size_t size,
> > -			       enum dma_data_direction);
> >  static inline void dma_unmap_page(struct device *dev, dma_addr_t address,
> >  				  size_t size, enum dma_data_direction dir)
> >  {
> >  }
> >  
> > -extern int dma_map_sg(struct device *, struct scatterlist *, int,
> > -		      enum dma_data_direction);
> >  static inline void dma_unmap_sg(struct device *dev, struct scatterlist *sg,
> >  				int nhwentries, enum dma_data_direction dir)
> >  {
> >  }
> > +#endif
> >  
> >  extern void dma_sync_single_for_device(struct device *, dma_addr_t, size_t,
> >  				       enum dma_data_direction);
> > diff --git a/include/asm-m68k/sun3xprom.h b/include/asm-m68k/sun3xprom.h
> > index 6735efc..15bd5c0 100644
> > --- a/include/asm-m68k/sun3xprom.h
> > +++ b/include/asm-m68k/sun3xprom.h
> > @@ -25,6 +25,11 @@ unsigned long sun3x_prom_ptov(unsigned long pa, unsigned long size);
> >  #define SUN3X_IDPROM      0x640007d8
> >  #define SUN3X_VIDEO_BASE  0x50400000
> >  #define SUN3X_VIDEO_REGS  0x50300000
> > +#define SUN3X_ESP_BASE    0x66000000
> > +#define SUN3X_ESP_DMA     0x66001000
> > +#define SUN3X_FDC         0x6e000000
> > +#define SUN3X_FDC_FCR     0x6e000400
> > +#define SUN3X_FDC_FVR     0x6e000800
> >  
> >  /* vector table */
> >  #define SUN3X_PROM_BASE   0xfefe0000
> -
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
