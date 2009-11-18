From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: TIF_NOTIFY_RESUME on m68k?
Date: Wed, 18 Nov 2009 21:02:17 +0100
Message-ID: <10f740e80911181202l6cca6b41m827f2c51f639d1f0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k <linux-m68k@lists.linux-m68k.org>
Cc: uClinux development list <uclinux-dev@uclinux.org>, linux-kernel@vger.kernel.org

Has anyone already looked into TIF_NOTIFY_RESUME support for m68k?

http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=d0420c83f39f79afb82010c2d2cafd150eef651b
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=ee18d64c1f632043a02e6f5ba5e045bb26a5465f

These commits broke CONFIG_KEYS=y on m68k, so technically the missing
support is a regression compared to 2.6.31.

Thanks!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
