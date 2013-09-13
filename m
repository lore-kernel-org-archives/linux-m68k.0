From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Atafb failed to detect the video mode on ARAnyM after kexec
Date: Fri, 13 Sep 2013 09:34:00 +0200
Message-ID: <CAMuHMdVFRb_-YmjV5VEh1nNsifgyQhw=J3UXHak_vgKix53QSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:59377 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755967Ab3IMHeB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 13 Sep 2013 03:34:01 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so2188212pad.33
        for <linux-m68k@vger.kernel.org>; Fri, 13 Sep 2013 00:34:00 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@vger.kernel.org>

When doing a kexec (WIP) on ARAnyM while the screen was blanked, the
kexec'd kernel failed to initialize atafb. If the screen isn't
blanked, it works fine.

Difference between success and failure is:

 atafb_init: start
 atafb_init: initializing Falcon hw
-atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 311296
-Determined 640x480, depth 4
-   virtual 640x972
-Console: switching to colour frame buffer device 80x30
-fb0: frame buffer device, using 304K of video memory
+atafb: screen_base 0068c000 real_screen_base 0068c000 screen_len 4096

I guess atafb should unblank on shutdown to restore the videl registers, so it
will detect the correct video mode on re-initialization?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
