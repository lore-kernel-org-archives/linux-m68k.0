From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 05/17] [m68k] Atari: fix EtherNAT interrupt number;
 conditionalize EtherNAT platform device register
Date: Sun, 10 Feb 2013 11:11:34 +0100
Message-ID: <CAMuHMdWa_znqNehJ6Q-3Ow73gRMeW_rz0kDc=wecXyo9s5cOHw@mail.gmail.com>
References: <20130131001847.C4D70360095@xplor.waratah.dyndns.org>
	<CAMuHMdWnEMVbzmkJVNDU+AJ6vSY+JFXgqRJvoCx=jZXo+M-fFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ia0-f173.google.com ([209.85.210.173]:41892 "EHLO
	mail-ia0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426Ab3BJKLf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 10 Feb 2013 05:11:35 -0500
Received: by mail-ia0-f173.google.com with SMTP id h37so5654187iak.18
        for <linux-m68k@vger.kernel.org>; Sun, 10 Feb 2013 02:11:34 -0800 (PST)
In-Reply-To: <CAMuHMdWnEMVbzmkJVNDU+AJ6vSY+JFXgqRJvoCx=jZXo+M-fFg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org

On Sun, Feb 10, 2013 at 11:06 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>> -       return platform_add_devices(atari_platform_devices, ARRAY_SIZE(atari_platform_devices));
>> +#if IS_ENABLED(CONFIG_ATARI_ETHERNAT)

#ifdef CONFIG_ATARI_ETHERNAT

CONFIG_ATARI_ETHERNAT is no longer tristate, but boolean.

>> +       enatc_virt = (unsigned char *)ioremap((ATARI_ETHERNAT_PHYS_ADDR+0x23), 0xf);
>> +       if (hwreg_present(enatc_virt)) {
>> +               rv = platform_add_devices(atari_ethernat_devices, ARRAY_SIZE(atari_ethernat_devices));
>> +       }
>> +       iounmap(enatc_virt);
>> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
