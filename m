From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 25 Jan 2015 11:34:34 +0100
Message-ID: <CAMuHMdWHdr8-Wi2D6APt-uHVnNwojq-wgdTWbp1ZR7uErKgUcg@mail.gmail.com>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
	<Pine.BSM.4.64L.1501181206220.1142@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:41822 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752232AbbAYKeg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Jan 2015 05:34:36 -0500
Received: by mail-la0-f49.google.com with SMTP id gf13so3755708lab.8
        for <linux-m68k@vger.kernel.org>; Sun, 25 Jan 2015 02:34:34 -0800 (PST)
In-Reply-To: <Pine.BSM.4.64L.1501181206220.1142@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jan 18, 2015 at 1:07 PM, Thorsten Glaser <tg@mirbsd.de> wrote:
> Geert Uytterhoeven dixit:
>
>>While init on Beetle's system complained about not being able to open
>>tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
>>broke remote login using ssh on my ARAnyM:
>
> Hm, interesting.
>
> If you do not run udev, you may need the following lines in /etc/rc.local:
>
> (test -e /dev/fd || ln -s /proc/self/fd /dev/fd || :)
> (test -e /dev/stdin || ln -s /proc/self/fd/0 /dev/stdin || :)
> (test -e /dev/stdout || ln -s /proc/self/fd/1 /dev/stdout || :)
> (test -e /dev/stderr || ln -s /proc/self/fd/2 /dev/stderr || :)

I don't have these, but the system doesn't seem to miss them ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
