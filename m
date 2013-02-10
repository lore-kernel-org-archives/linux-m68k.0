From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 16/17] [m68k] Atari: Add ISP1160 USB host controller
 support (EtherNAT/NetUSBee)
Date: Sun, 10 Feb 2013 19:49:20 +0100
Message-ID: <CAMuHMdVKwrGO2DQNABJAS38oFLXvisJzihyAvF5qvGVNkkP-SQ@mail.gmail.com>
References: <20130131003224.18C9B360095@xplor.waratah.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f177.google.com ([209.85.210.177]:35573 "EHLO
	mail-ia0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754843Ab3BJStV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 13:49:21 -0500
Received: by mail-ia0-f177.google.com with SMTP id k38so382923iah.22
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 10:49:21 -0800 (PST)
In-Reply-To: <20130131003224.18C9B360095@xplor.waratah.dyndns.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Thu, Jan 31, 2013 at 1:32 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> [PATCH 16/17] [m68k] Atari: Add ISP1160 USB host controller support (EtherNAT/NetUSBee)
>         Debugging of FIFO register access code and NetUSBee support by
>         David Galvez <dgalvez75@gmail.com> (MiNT driver author)

For this one, I don't know much about the internals. For next submission, please
CC the driver's maintainer and the linux-usb mailing list.

> diff --git a/drivers/usb/host/isp116x-hcd.c b/drivers/usb/host/isp116x-hcd.c
> index b64e661..cb0745d 100644
> --- a/drivers/usb/host/isp116x-hcd.c
> +++ b/drivers/usb/host/isp116x-hcd.c
> @@ -82,8 +82,25 @@ MODULE_LICENSE("GPL");
>
>  static const char hcd_name[] = "isp116x-hcd";
>
> +#ifdef CONFIG_ATARI
> +static unsigned char *enat_cr;         /* EtherNAT CPLD control register for USB interrupt enable */
> +#endif
> +
>  /*-----------------------------------------------------------------*/
>
> +  /*
> +   * 16 bit data bus byte swapped in hardware
> +   *
> +   * isp116x_write_addr uses raw_readw - hw byte swap takes care of different endianness
> +   *
> +   * isp116x_write_data16 uses raw_readw - byte swap done in hw so BE data ends up in proper LE format
> +   * isp116x_raw_write_data16 uses readw - effectively same endiannes retained, use for LE format data
> +   *
> +   * reversed semantics of primitives allows to keep the register
> +   * access functions unchanged for commands and control data - byte
> +   * swap done transparently
> +   */
> +
>  /*
>    Write len bytes to fifo, pad till 32-bit boundary
>   */
> @@ -100,18 +117,29 @@ static void write_ptddata_to_fifo(struct isp116x *isp116x, void *buf, int len)
>
>         if ((unsigned long)dp2 & 1) {
>                 /* not aligned */
> +
> +               printk(KERN_INFO "isp116x unaligned FIFO write transfer %p\n", dp2);
> +

Remove the debug print.

>                 for (; len > 1; len -= 2) {
>                         w = *dp++;
>                         w |= *dp++ << 8;

This is a hand-coded little endian load...

>                         isp116x_raw_write_data16(isp116x, w);
>                 }
>                 if (len)
> +#ifdef CONFIG_ATARI    /* MSch: needs swap */
> +                       isp116x_raw_write_data16(isp116x, (u16) * dp);

... while this just dereferences a u16 *.

> +#else
>                         isp116x_write_data16(isp116x, (u16) * dp);
> +#endif

Hmm, something looks not right to me. But it could be the insane(?) wiring
instead. Cfr. the "[PATCH] drivers/block/xsysace - replace
in(out)_8/in(out)_be16/in(out)_le16 with generic iowrite(read)8/16(be)" thread
(https://lkml.org/lkml/2013/1/29/354).

>         } else {
>                 /* aligned */
>                 for (; len > 1; len -= 2) {
>                         /* Keep byte order ! */
> +#ifdef CONFIG_ATARI    /* MSch: needs swap */
> +                       isp116x_write_data16(isp116x, cpu_to_le16(*dp2++));
> +#else
>                         isp116x_raw_write_data16(isp116x, cpu_to_le16(*dp2++));
> +#endif
>                 }
>
>                 if (len)

Same here.

> @@ -137,6 +165,9 @@ static void read_ptddata_from_fifo(struct isp116x *isp116x, void *buf, int len)
>
>         if ((unsigned long)dp2 & 1) {
>                 /* not aligned */
> +
> +               printk(KERN_INFO "isp116x unaligned FIFO read transfer %p\n", dp2);
> +

Remove the debug print.

>                 for (; len > 1; len -= 2) {
>                         w = isp116x_raw_read_data16(isp116x);
>                         *dp++ = w & 0xff;
> @@ -144,12 +175,20 @@ static void read_ptddata_from_fifo(struct isp116x *isp116x, void *buf, int len)
>                 }
>
>                 if (len)
> +#ifdef CONFIG_ATARI    /* MSch: needs swap */
> +                       *dp = 0xff & isp116x_raw_read_data16(isp116x);
> +#else
>                         *dp = 0xff & isp116x_read_data16(isp116x);
> +#endif
>         } else {
>                 /* aligned */
>                 for (; len > 1; len -= 2) {
>                         /* Keep byte order! */
> +#ifdef CONFIG_ATARI    /* MSch: needs swap */
> +                       *dp2++ = le16_to_cpu(isp116x_read_data16(isp116x));
> +#else
>                         *dp2++ = le16_to_cpu(isp116x_raw_read_data16(isp116x));
> +#endif
>                 }
>
>                 if (len)
> @@ -593,6 +632,11 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
>         u16 irqstat;
>         irqreturn_t ret = IRQ_NONE;
>
> +#ifdef CONFIG_ATARI
> +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> +               /* EtherNAT control register, disable interrupt for USB */
> +               *enat_cr = (*enat_cr) & 0xFB;
> +#endif

This is the interrupt routine. Shouldn't the interrupt have been
disabled already
by the generic IRQ code, by calling .irq_disable() on the EtherNAT
CPLD irq_chip?

>         spin_lock(&isp116x->lock);
>         isp116x_write_reg16(isp116x, HCuPINTENB, 0);
>         irqstat = isp116x_read_reg16(isp116x, HCuPINT);
> @@ -636,6 +680,10 @@ static irqreturn_t isp116x_irq(struct usb_hcd *hcd)
>         isp116x_write_reg16(isp116x, HCuPINTENB, isp116x->irqenb);
>        done:
>         spin_unlock(&isp116x->lock);
> +#ifdef CONFIG_ATARI
> +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> +                *enat_cr = (*enat_cr) | 0x04;          /* EtherNAT control register, enable interrupt for USB */
> +#endif
>         return ret;
>  }
>
> @@ -1291,6 +1339,12 @@ static void isp116x_stop(struct usb_hcd *hcd)
>         u32 val;
>
>         spin_lock_irqsave(&isp116x->lock, flags);
> +
> +#ifdef CONFIG_ATARI
> +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> +               /* EtherNAT control register, disable interrupt for USB */
> +                *enat_cr = (*enat_cr) & 0xFB;
> +#endif

So hc_driver.stop() is called before the interrupt is disabled?

>         isp116x_write_reg16(isp116x, HCuPINTENB, 0);
>
>         /* Switch off ports' power, some devices don't come up
> @@ -1394,6 +1448,10 @@ static int isp116x_start(struct usb_hcd *hcd)
>         isp116x_write_reg32(isp116x, HCRHPORT1, RH_PS_CCS);
>         isp116x_write_reg32(isp116x, HCRHPORT2, RH_PS_CCS);
>
> +#ifdef CONFIG_ATARI
> +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL)
> +                *enat_cr = (*enat_cr) | 0x04;          /* EtherNAT control register, enable interrupt for USB */
> +#endif

And hc_driver.start() is called without enabling the interrupt later?

>         isp116x_show_regs_log(isp116x);
>         spin_unlock_irqrestore(&isp116x->lock, flags);
>         return 0;
> @@ -1539,6 +1597,9 @@ static int isp116x_remove(struct platform_device *pdev)
>         struct usb_hcd *hcd = platform_get_drvdata(pdev);
>         struct isp116x *isp116x;
>         struct resource *res;
> +#ifdef CONFIG_ATARI
> +       unsigned long enat_cr_phys;
> +#endif
>
>         if (!hcd)
>                 return 0;
> @@ -1552,7 +1613,14 @@ static int isp116x_remove(struct platform_device *pdev)
>         iounmap(isp116x->addr_reg);
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         release_mem_region(res->start, 2);
> -
> +#ifdef CONFIG_ATARI
> +        if ((unsigned long) hcd->rsrc_start >= 0x80000000UL) {
> +               iounmap(enat_cr);
> +               /* unmap & release EtherNAT CPLD control register - at 0x23 off board base address */
> +               enat_cr_phys = (res->start & 0xFFFFFF00) + 0x23;
> +               release_mem_region(enat_cr_phys, 2);
> +        }
> +#endif

All of this is needed because you have to enable/disable the interrupt yourself?

>         usb_put_hcd(hcd);
>         return 0;
>  }
> @@ -1567,6 +1635,9 @@ static int isp116x_probe(struct platform_device *pdev)
>         int irq;
>         int ret = 0;
>         unsigned long irqflags;
> +#ifdef CONFIG_ATARI
> +       unsigned long enat_cr_phys;
> +#endif
>
>         if (usb_disabled())
>                 return -ENODEV;
> @@ -1613,6 +1684,28 @@ static int isp116x_probe(struct platform_device *pdev)
>                 goto err4;
>         }
>
> +#ifdef CONFIG_ATARI
> +       if ((unsigned long) data->start >= 0x80000000UL) {
> +               printk(KERN_INFO "isp116x: EtherNAT - remap CPLD register\n");
> +
> +               /* map EtherNAT CPLD control register - at 0x23 off board base address */
> +               enat_cr_phys = (data->start & 0xffffff00) + 0x23;
> +               if (!request_mem_region(enat_cr_phys, 2, hcd_name)) {
> +                       ret = -EBUSY;
> +                       goto err41;
> +               }
> +               enat_cr = ioremap(enat_cr_phys, 2);
> +               if (enat_cr == NULL) {
> +                       ret = -ENOMEM;
> +                       goto err42;
> +               }
> +               /* Disable USB interrupt in the EtherNat board */
> +               *enat_cr = (*enat_cr) & 0xFB;
> +       }
> +       printk(KERN_INFO "ISP116X probe: data %p virt. %p, addr %p virt. %p\n",
> +               (void *)data->start, data_reg, (void *)addr->start, addr_reg);
> +#endif
> +

Same here.

>         /* allocate and initialize hcd */
>         hcd = usb_create_hcd(&isp116x_hc_driver, &pdev->dev, dev_name(&pdev->dev));
>         if (!hcd) {
> @@ -1653,11 +1746,20 @@ static int isp116x_probe(struct platform_device *pdev)
>
>         return 0;
>
> +
>        err7:
>         usb_remove_hcd(hcd);
>        err6:
>         usb_put_hcd(hcd);
>        err5:
> +#ifdef CONFIG_ATARI
> +       if ((unsigned long) data->start >= 0x80000000UL)
> +         iounmap(enat_cr);
> +      err42:
> +        if ((unsigned long) data->start >= 0x80000000UL)
> +         release_mem_region(enat_cr_phys, 2);
> +      err41:
> +#endif

and here.

>         iounmap(data_reg);
>        err4:
>         release_mem_region(data->start, 2);
> diff --git a/drivers/usb/host/isp116x.h b/drivers/usb/host/isp116x.h
> index 9a2c400..9d4d89d 100644
> --- a/drivers/usb/host/isp116x.h
> +++ b/drivers/usb/host/isp116x.h
> @@ -364,22 +364,37 @@ struct isp116x_ep {
>  #define        IRQ_TEST()      do{}while(0)
>  #endif
>
> +
> +#ifdef CONFIG_ATARI
> +  /* 16 bit data bus byte swapped in hardware */
> +#define isp_readw(p)           ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_readw_raw(__pa(p)) : __raw_readw((p)))
> +#define isp_writew(v,p)                ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_writew_raw((v),__pa(p)) : __raw_writew((v),(p)))
> +#define isp_raw_readw(p)       ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_readw(__pa(p)) : readw((p)))
> +#define isp_raw_writew(v,p)    ( ( ((unsigned long)(__pa(p)) & 0x00000F00 ) == 0x00000300UL) ? isa_rom_writew((v),__pa(p)) : writew((v),(p)))

What's the difference between the two cases of the ?-operator?
Can you please add comments explaining this?

> +#else
> +  /* sane hardware */
> +#define isp_readw              readw
> +#define isp_writew             writew
> +#define isp_raw_readw          __raw_readw
> +#define isp_raw_writew         __raw_writew
> +#endif
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
