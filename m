From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/atari: SCC - Mark Atari serial driver BROKEN
Date: Sun, 5 Dec 2010 12:08:29 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012051204380.29054@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Cfr. commit 412145947adfca60a4b5b4893fbae82dffa25edd ("tty: Mark generic_serial
users as BROKEN")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 4641737..0911d7c 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -514,7 +514,7 @@ config ATARI_MFPSER
 
 config ATARI_SCC
 	tristate "Atari SCC serial support"
-	depends on ATARI
+	depends on ATARI && BROKEN
 	---help---
 	  If you have serial ports based on a Zilog SCC chip (Modem2, Serial2,
 	  LAN) and like to use them under Linux, say Y. All built-in SCC's are
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
