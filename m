From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 16/17] [m68k] Atari: Add ISP1160 USB host controller
 support (EtherNAT/NetUSBee)
Date: Sun, 10 Feb 2013 22:57:10 +0100
Message-ID: <20130210215710.GB4977@mail.biophys.uni-duesseldorf.de>
References: <20130131003224.18C9B360095@xplor.waratah.dyndns.org>
 <CAMuHMdVKwrGO2DQNABJAS38oFLXvisJzihyAvF5qvGVNkkP-SQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:42551
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756415Ab3BJV5M (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 Feb 2013 16:57:12 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdVKwrGO2DQNABJAS38oFLXvisJzihyAvF5qvGVNkkP-SQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> For this one, I don't know much about the internals. For next submission, please
> CC the driver's maintainer and the linux-usb mailing list.

This one will be discussed at length with the driver maintainer yet. 
 
> >                 for (; len > 1; len -= 2) {
> >                         w = *dp++;
> >                         w |= *dp++ << 8;
> 
> This is a hand-coded little endian load...
> 
> >                         isp116x_raw_write_data16(isp116x, w);
> >                 }
> >                 if (len)
> > +#ifdef CONFIG_ATARI    /* MSch: needs swap */
> > +                       isp116x_raw_write_data16(isp116x, (u16) * dp);
> 
> ... while this just dereferences a u16 *.

It is weird that way - we've seen both aligned and unaligned accesses (the
latter very rarely). This is the only way it actually works.  

> 
> > +#else
> >                         isp116x_write_data16(isp116x, (u16) * dp);
> > +#endif
> 
> Hmm, something looks not right to me. But it could be the insane(?) wiring
> instead. Cfr. the "[PATCH] drivers/block/xsysace - replace
> in(out)_8/in(out)_be16/in(out)_le16 with generic iowrite(read)8/16(be)" thread
> (https://lkml.org/lkml/2013/1/29/354).

That's it - the hardware designers have wired up the data bus byte swapped.
Thanks for the pointer - I'll have to see what the outcome is when the dust
settles. 

> > @@ -593,6 +632,11 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
> >         u16 irqstat;
> >         irqreturn_t ret = IRQ_NONE;
> >
> > +#ifdef CONFIG_ATARI
> > +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> > +               /* EtherNAT control register, disable interrupt for USB */
> > +               *enat_cr = (*enat_cr) & 0xFB;
> > +#endif
> 
> This is the interrupt routine. Shouldn't the interrupt have been
> disabled already
> by the generic IRQ code, by calling .irq_disable() on the EtherNAT
> CPLD irq_chip?

Should have been disabled - I tried to leave it out but still had problems.
I'll revisit that now that the driver has stabilized a bit. 

> > @@ -1291,6 +1339,12 @@ static void isp116x_stop(struct usb_hcd *hcd)
> >         u32 val;
> >
> >         spin_lock_irqsave(&isp116x->lock, flags);
> > +
> > +#ifdef CONFIG_ATARI
> > +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> > +               /* EtherNAT control register, disable interrupt for USB */
> > +                *enat_cr = (*enat_cr) & 0xFB;
> > +#endif
> 
> So hc_driver.stop() is called before the interrupt is disabled?

Not sure about that - I'll have to see what the interrupt register is set to
at that point. 

> 
> >         isp116x_write_reg16(isp116x, HCuPINTENB, 0);
> >
> >         /* Switch off ports' power, some devices don't come up
> > @@ -1394,6 +1448,10 @@ static int isp116x_start(struct usb_hcd *hcd)
> >         isp116x_write_reg32(isp116x, HCRHPORT1, RH_PS_CCS);
> >         isp116x_write_reg32(isp116x, HCRHPORT2, RH_PS_CCS);
> >
> > +#ifdef CONFIG_ATARI
> > +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> > +                *enat_cr = (*enat_cr) | 0x04;          /* EtherNAT control register, enable interrupt for USB */
> > +#endif
> 
> And hc_driver.start() is called without enabling the interrupt later?

hc_driver.start() relies on the interrupt being enabled when the interrupt
was requested - at that point, the chip appears to be in a state that will
immediately generate interrupts. For that reason, the ethernat interrupt
.startup() will not actually enable the interrupt for USB but rely on it
happening in hcd.start(). 

> 
> >         isp116x_show_regs_log(isp116x);
> >         spin_unlock_irqrestore(&isp116x->lock, flags);
> >         return 0;
> > @@ -1539,6 +1597,9 @@ static int isp116x_remove(struct platform_device *pdev)
> >         struct usb_hcd *hcd = platform_get_drvdata(pdev);
> >         struct isp116x *isp116x;
> >         struct resource *res;
> > +#ifdef CONFIG_ATARI
> > +       unsigned long enat_cr_phys;
> > +#endif
> >
> >         if (!hcd)
> >                 return 0;
> > @@ -1552,7 +1613,14 @@ static int isp116x_remove(struct platform_device *pdev)
> >         iounmap(isp116x->addr_reg);
> >         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> >         release_mem_region(res->start, 2);
> > -
> > +#ifdef CONFIG_ATARI
> > +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL) {
> > +               iounmap(enat_cr);
> > +               /* unmap & release EtherNAT CPLD control register - at 0x23 off board base address */
> > +               enat_cr_phys = (res->start & 0xFFFFFF00) + 0x23;
> > +               release_mem_region(enat_cr_phys, 2);
> > +        }
> > +#endif
> 
> All of this is needed because you have to enable/disable the interrupt yourself?

Yep. As I said - I need to go back and investigate whether that's still the
case - I don't really see why I get the USB interrupts as soon as the driver
is probed. 

> > diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
> > index 9a2c400..9d4d89d 100644
> > --- a/drivers/usb/host/isp116x.h
> > +++ b/drivers/usb/host/isp116x.h
> > @@ -364,22 +364,37 @@ struct isp116x_ep {
> >  #define        IRQ_TEST()      do{}while(0)
> >  #endif
> >
> > +
> > +#ifdef CONFIG_ATARI
> > +  /* 16 bit data bus byte swapped in hardware */
> > +#define isp_readw(p)           ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_readw_raw(__pa(p)) : __raw_readw((p)))
> > +#define isp_writew(v,p)                ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_writew_raw((v),__pa(p)) : __raw_writew((v),(p)))
> > +#define isp_raw_readw(p)       ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
> > +#define isp_raw_writew(v,p)    ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_writew((v),__pa(p)) : writew((v),(p)))
> 
> What's the difference between the two cases of the ?-operator?

The first case is the NetUSBee case - it requires going through the ROM port
accessors. The second case is EtherNAT - straight memory mapped card. Both
have the data bus byte swapped. 

> Can you please add comments explaining this?

I'll do that. 

Cheers,

	Michael
