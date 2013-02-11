From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 15/17] [m68k] Atari: add platform device definitions for
 ISP1160 USB HCD
Date: Mon, 11 Feb 2013 10:08:24 +0100
Message-ID: <CAMuHMdXGLEqchFEkYRCMNSzqDaMo9aRt_hjm-2Mz=vqnAMmUew@mail.gmail.com>
References: <20130131003135.8B985360095@xplor.waratah.dyndns.org>
	<CAMuHMdU6qfE6AUGKFEGvnxGZHbpDZ7Yg2KO85rApEnPXxEo7zA@mail.gmail.com>
	<20130210224555.GC4977@mail.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ie0-f178.google.com ([209.85.223.178]:42631 "EHLO
	mail-ie0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754185Ab3BKJIZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Feb 2013 04:08:25 -0500
Received: by mail-ie0-f178.google.com with SMTP id c13so7508395ieb.9
        for <linux-m68k@vger.kernel.org>; Mon, 11 Feb 2013 01:08:24 -0800 (PST)
In-Reply-To: <20130210224555.GC4977@mail.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@mail.biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org

Hi Michael,

On Sun, Feb 10, 2013 at 11:45 PM, Michael Schmitz
<schmitz@mail.biophys.uni-duesseldorf.de> wrote:
>> >  #define ATARI_ETHERNEC_PHYS_ADDR       0xfffa0000
>> >  #define ATARI_ETHERNEC_BASE            0x300
>> >  #define ATARI_ETHERNEC_IRQ             IRQ_MFP_TIMER1
>> > @@ -716,8 +791,66 @@ static struct platform_device rtl8019_device = {
>> >         .resource       = rtl8019_resources,
>> >  };
>> >
>> > -static struct platform_device *atari_ethernec_devices[] __initdata = {
>> > -       &rtl8019_device
>>
>> Oops, removal of atari_ethernec_devices?
>
> Superseded by atari_netusbee_devices which holds both ethernet and usb
> platform data:
>
>> > +static struct platform_device *atari_netusbee_devices[] __initdata = {
>> > +       &rtl8019_device,
>> > +       &netusbee_device
>> >  };

Sorry, I missed that. You want to update the help text for ATARI_ETHERNEC.

BTW, wouldn't it better to rename netusbee_device to isp116x_device, cfr.
rtl8019_device?

>> >  int __init atari_platform_init(void)
>> > @@ -739,7 +872,7 @@ int __init atari_platform_init(void)
>> >  #if IS_ENABLED(CONFIG_ATARI_ETHERNEC)

Forgot this: #ifdef CONFIG_ATARI_ETHERNEC, as it's boolean.

>> >         enec_virt = (unsigned char *)ioremap((ATARI_ETHERNEC_PHYS_ADDR), 0xf);
>> >         if (hwreg_present(enec_virt)) {
>> > -               rv2 = platform_add_devices(atari_ethernec_devices, ARRAY_SIZE(atari_ethernec_devices));
>> > +               rv2 = platform_add_devices(atari_netusbee_devices, ARRAY_SIZE(atari_netusbee_devices));
>>
>> Oops, removal of atari_ethernec_devices?
>
> The USB driver does the Right Thing (tm) when probing a nonexisting NetUSBee
> (amazing, isn't it?) so we can always add both devices regardless of
> configuration.
>
> I'll have to check that CONFIG_ATARI_ETHERNEC is selected when either ne.c
> or isp116x driver are selected. It might otherwise be possible to select the
> USB driver only, and not the ethernet one, resulting in a nonfunctional
> driver.

ATARI_USB should depend on ...?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
