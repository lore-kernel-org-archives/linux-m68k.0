From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 15/17] [m68k] Atari: add platform device definitions for
 ISP1160 USB HCD
Date: Sun, 10 Feb 2013 23:45:55 +0100
Message-ID: <20130210224555.GC4977@mail.biophys.uni-duesseldorf.de>
References: <20130131003135.8B985360095@xplor.waratah.dyndns.org>
 <CAMuHMdU6qfE6AUGKFEGvnxGZHbpDZ7Yg2KO85rApEnPXxEo7zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:42569
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756854Ab3BJWp5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 Feb 2013 17:45:57 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdU6qfE6AUGKFEGvnxGZHbpDZ7Yg2KO85rApEnPXxEo7zA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> >  #define ATARI_ETHERNEC_PHYS_ADDR       0xfffa0000
> >  #define ATARI_ETHERNEC_BASE            0x300
> >  #define ATARI_ETHERNEC_IRQ             IRQ_MFP_TIMER1
> > @@ -716,8 +791,66 @@ static struct platform_device rtl8019_device = {
> >         .resource       = rtl8019_resources,
> >  };
> >
> > -static struct platform_device *atari_ethernec_devices[] __initdata = {
> > -       &rtl8019_device
> 
> Oops, removal of atari_ethernec_devices?

Superseded by atari_netusbee_devices which holds both ethernet and usb
platform data: 

> > +static struct platform_device *atari_netusbee_devices[] __initdata = {
> > +       &rtl8019_device,
> > +       &netusbee_device
> >  };
> >
> >  int __init atari_platform_init(void)
> > @@ -739,7 +872,7 @@ int __init atari_platform_init(void)
> >  #if IS_ENABLED(CONFIG_ATARI_ETHERNEC)
> >         enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
> >         if (hwreg_present(enec_virt)) {
> > -               rv2 = platform_add_devices(atari_ethernec_devices, ARRAY_SIZE(atari_ethernec_devices));
> > +               rv2 = platform_add_devices(atari_netusbee_devices, ARRAY_SIZE(atari_netusbee_devices));
> 
> Oops, removal of atari_ethernec_devices?

The USB driver does the Right Thing (tm) when probing a nonexisting NetUSBee
(amazing, isn't it?) so we can always add both devices regardless of
configuration. 

I'll have to check that CONFIG_ATARI_ETHERNEC is selected when either ne.c
or isp116x driver are selected. It might otherwise be possible to select the
USB driver only, and not the ethernet one, resulting in a nonfunctional
driver. 

Cheers,

	Michael
