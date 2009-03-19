From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: m68k ICE on drivers/net/wimax/i2400m/fw.c
Date: Thu, 19 Mar 2009 14:02:55 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0903191359130.7092@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from gerard.telenet-ops.be ([195.130.132.48]:56025 "EHLO
	gerard.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754273AbZCSNDA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 19 Mar 2009 09:03:00 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

	Hi Stephen,

http://kisskb.ellerman.id.au/kisskb/buildresult/225979/
| drivers/net/wimax/i2400m/fw.c:892: internal compiler error: in splice_child_die, at dwarf2out.c:5347
| distcc[11452] ERROR: compile drivers/net/wimax/i2400m/fw.c on sprygo/32 failed

If upgrading your m68k-unknown-linux-gnu-gcc (GCC) 4.0.2 is not an option (my
4.1.2 20061115 (prerelease) (Debian 4.1.1-21) has no problems with this file),
does the patch below help?

diff --git a/drivers/net/wimax/i2400m/Makefile b/drivers/net/wimax/i2400m/Makefile
index 5d9e018..048e8dd 100644
--- a/drivers/net/wimax/i2400m/Makefile
+++ b/drivers/net/wimax/i2400m/Makefile
@@ -28,3 +28,7 @@ i2400m-sdio-y := 		\
 	sdio-tx.o   		\
 	sdio-fw.o	 	\
 	sdio-rx.o
+
+ifeq ($(ARCH),m68k)
+CFLAGS_fw.o	+= -O1
+endif

Note that you cannot lower the optimization level to -O0, because of
BUILD_BUG_ON().

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
