From: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Subject: Re: [PATCH 15/17] [m68k] Atari: add platform device definitions for
 ISP1160 USB HCD
Date: Tue, 12 Feb 2013 02:20:08 +0100
Message-ID: <20130212012008.GA17333@mail.biophys.uni-duesseldorf.de>
References: <20130131003135.8B985360095@xplor.waratah.dyndns.org>
 <CAMuHMdU6qfE6AUGKFEGvnxGZHbpDZ7Yg2KO85rApEnPXxEo7zA@mail.gmail.com>
 <20130210224555.GC4977@mail.biophys.uni-duesseldorf.de>
 <CAMuHMdXGLEqchFEkYRCMNSzqDaMo9aRt_hjm-2Mz=vqnAMmUew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from opal-mail.biophys.uni-duesseldorf.de ([134.99.176.33]:43315
	"EHLO mail.biophys.uni-duesseldorf.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932675Ab3BLBUK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 11 Feb 2013 20:20:10 -0500
Content-Disposition: inline
In-Reply-To: <CAMuHMdXGLEqchFEkYRCMNSzqDaMo9aRt_hjm-2Mz=vqnAMmUew@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

Hi Geert,

> >> > -static struct platform_device *atari_ethernec_devices[] __initdata = {
> >> > -       &rtl8019_device
> >>
> >> Oops, removal of atari_ethernec_devices?
> >
> > Superseded by atari_netusbee_devices which holds both ethernet and usb
> > platform data:
> >
> >> > +static struct platform_device *atari_netusbee_devices[] __initdata = {
> >> > +       &rtl8019_device,
> >> > +       &netusbee_device
> >> >  };
> 
> Sorry, I missed that. You want to update the help text for ATARI_ETHERNEC.

Right - and maybe come up with a better name for the option -
ATARI_ROM_PORT_DEVICES? 

 
> BTW, wouldn't it better to rename netusbee_device to isp116x_device, cfr.
> rtl8019_device?

We already have isp1160_device - maybe I'll have to rename that to
isp116x_ethernat_device, and the other one can be isp116x_netusbee_device?
What's the practical limit for these device/struct names? 

> > I'll have to check that CONFIG_ATARI_ETHERNEC is selected when either ne.c
> > or isp116x driver are selected. It might otherwise be possible to select the
> > USB driver only, and not the ethernet one, resulting in a nonfunctional
> > driver.
> 
> ATARI_USB should depend on ...?

Either ATARI_ETHERNAT or ATARI_ETHERNEC, in practice. Not sure I'm building
a kconfig dependency loop - can I rely on things set in Kconfig.devices when
defining ATARI_USB in Kconfig.bus? 

I'll also have to change the help text for ATARI_ETHERNAT to include the USB
function. 

Getting there, I'm sure. 

Cheers,

	Michael
