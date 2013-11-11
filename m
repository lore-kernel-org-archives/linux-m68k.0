From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux 3.1-2-m68k config (was: Re: Linux 3.10-2-m68k FPU support)
Date: Mon, 11 Nov 2013 10:33:26 +0100
Message-ID: <CAMuHMdXKPDo-cNL5btcmy=4obz9WB2W=9BUxbu5m72UXDSyN_w@mail.gmail.com>
References: <CAMuHMdXDDyzdy80gDvS-i96pMSgiCw9AJTD3ts=HaCwC26KWUw@mail.gmail.com>
	<alpine.LNX.2.00.1311111111320.10595@nippy.intranet>
	<Pine.BSM.4.64L.1311110108550.15024@herc.mirbsd.org>
	<alpine.LNX.2.00.1311111600420.13170@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:54281 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751256Ab3KKJd1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Nov 2013 04:33:27 -0500
Received: by mail-pb0-f41.google.com with SMTP id wy17so5024092pbc.0
        for <linux-m68k@vger.kernel.org>; Mon, 11 Nov 2013 01:33:26 -0800 (PST)
In-Reply-To: <alpine.LNX.2.00.1311111600420.13170@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Thorsten Glaser <tg@mirbsd.de>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Nov 11, 2013 at 6:16 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>> > ! CONFIG_FB_SYS_COPYAREA                   : m n
>> > ! CONFIG_FB_SYS_FILLRECT                   : m n
>> > ! CONFIG_FB_SYS_FOPS                       : m n
>> > ! CONFIG_FB_SYS_IMAGEBLIT                  : m n
>> >
>> >Would this prevent the macfb framebuffer console from working in the
>> >absence of kernel modules?
>> >
>>
>> With the switch to initrd, absence of modules is simply no longer
>> supported at all, period.
>
> When something goes wrong, and the kernel messages aren't available to
> tell you what went wrong, then you may lack the information you need to
> support those things that you are willing to support.
>
> Hence I was trying to find an explanation for the screen shot posted,
> which says "console [tty0] enabled" even though the macfb console did not
> appear.

No, without fb/console support you wouldn't even see those.

>> ...
>> Besides, if multi_defconfig has it as "n"...
>
> That should be OK; all of my test kernel configs also disable these
> options.

Indeed. Mac needs the CONFIG_FB_CFB_* counterparts.

CONFIG_FB_SYS_* is for system RAM, while CONFIG_FB_CFB_*
is for iomem. Not that it would matter much on m68k, m68k has no
strict separation between both.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
