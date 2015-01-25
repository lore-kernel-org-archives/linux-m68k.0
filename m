From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 25 Jan 2015 12:00:27 +0100
Message-ID: <CAMuHMdU9=GPdqMXPXXHUc0_0msieHxxDvY=2NPGk9O-fYNJbLQ@mail.gmail.com>
References: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f170.google.com ([209.85.217.170]:44512 "EHLO
	mail-lb0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752808AbbAYLA3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Jan 2015 06:00:29 -0500
Received: by mail-lb0-f170.google.com with SMTP id w7so3813554lbi.1
        for <linux-m68k@vger.kernel.org>; Sun, 25 Jan 2015 03:00:27 -0800 (PST)
In-Reply-To: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.org>
Cc: Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Jan 18, 2015 at 12:50 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> While init on Beetle's system complained about not being able to open
> tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
> broke remote login using ssh on my ARAnyM:

FWIW, CONFIG_DEVTMPFS_MOUNT is not set in Debian's
config-3.16.0-4-m68k.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
