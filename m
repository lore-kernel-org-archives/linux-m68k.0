From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: CONFIG_DEVTMPFS_MOUNT
Date: Sun, 18 Jan 2015 12:50:36 +0100
Message-ID: <CAMuHMdV413F57YQw_ODzjgYAi4ndVgOvJ39k_kL0yksCQF5jAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:58935 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbbARLui (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Jan 2015 06:50:38 -0500
Received: by mail-lb0-f180.google.com with SMTP id u10so3856529lbd.11
        for <linux-m68k@vger.kernel.org>; Sun, 18 Jan 2015 03:50:36 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.org>
Cc: Stefan Niestegge <beetle@atari.org>, Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Thorsten,

While init on Beetle's system complained about not being able to open
tty* with CONFIG_DEVTMPFS_MOUNT disabled, enabling CONFIG_DEVTMPFS_MOUNT
broke remote login using ssh on my ARAnyM:

$ ssh atari
PTY allocation request failed on channel 0
stdin: is not a tty

(hang)

Scp still works, as it doesn't need a pty.

IIRC, you logged in succesfully on his machine using ssh?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
