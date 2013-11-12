From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU support)
Date: Tue, 12 Nov 2013 09:44:23 +0100
Message-ID: <CAMuHMdVSA6bGKd+U0Y4=nfT=YKFAi6TFVe__citkOhetsy8pdw@mail.gmail.com>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
	<alpine.LNX.2.00.1311111111320.10595@nippy.intranet>
	<Pine.BSM.4.64L.1311110108550.15024@herc.mirbsd.org>
	<alpine.LNX.2.00.1311111600420.13170@nippy.intranet>
	<CAMuHMdXKPDo-cNL5btcmy=4obz9WB2W=9BUxbu5m72UXDSyN_w@mail.gmail.com>
	<alpine.LNX.2.00.1311121104180.20517@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:41219 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751788Ab3KLIoX (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 12 Nov 2013 03:44:23 -0500
Received: by mail-pb0-f53.google.com with SMTP id up7so6559748pbc.40
        for <linux-m68k@vger.kernel.org>; Tue, 12 Nov 2013 00:44:23 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1311121104180.20517@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Nov 12, 2013 at 1:21 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> > Hence I was trying to find an explanation for the screen shot posted,
>> > which says "console [tty0] enabled" even though the macfb console did
>> > not appear.
>>
>> No, without fb/console support you wouldn't even see those.
>
> "console [tty0] enabled" comes from the early console, which implies
> CONFIG_FRAMEBUFFER_CONSOLE and CONFIG_EARLY_PRINTK. But neither of these
> implies a working macfb...

Ah, I forgot about the Mac's graphical early console.
So you don't get any output in between "console [tty0] enabled.
bootconsole disabled" and the initialization of macfb.
But there are several things that can go wrong there.
As the next line is "Calibrating delay loop...", it could be e.g. an
interrupt problem.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
