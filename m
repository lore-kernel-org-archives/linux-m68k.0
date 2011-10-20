From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] m68k: drop unused Kconfig symbols
Date: Thu, 20 Oct 2011 13:23:56 +0200
Message-ID: <1319109836.8405.30.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
"git grep" tested only.

 arch/m68k/Kconfig |   24 +-----------------------
 1 files changed, 1 insertions(+), 23 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 58c6496..3e673ac 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -163,35 +163,13 @@ config HPAPCI
 	  If you want to use the internal "APCI" serial ports on an HP400
 	  machine, say Y here.
 
-config MVME147_SCC
-	bool "SCC support for MVME147 serial ports"
-	depends on MVME147 && BROKEN
-	help
-	  This is the driver for the serial ports on the Motorola MVME147
-	  boards.  Everyone using one of these boards should say Y here.
-
-config MVME162_SCC
-	bool "SCC support for MVME162 serial ports"
-	depends on MVME16x && BROKEN
-	help
-	  This is the driver for the serial ports on the Motorola MVME162 and
-	  172 boards.  Everyone using one of these boards should say Y here.
-
-config BVME6000_SCC
-	bool "SCC support for BVME6000 serial ports"
-	depends on BVME6000 && BROKEN
-	help
-	  This is the driver for the serial ports on the BVME4000 and BVME6000
-	  boards from BVM Ltd.  Everyone using one of these boards should say
-	  Y here.
-
 config DN_SERIAL
 	bool "Support for DN serial port (dummy)"
 	depends on APOLLO
 
 config SERIAL_CONSOLE
 	bool "Support for serial port console"
-	depends on (AMIGA || ATARI || SUN3 || SUN3X || VME || APOLLO) && (ATARI_MFPSER=y || ATARI_MIDI=y || AMIGA_BUILTIN_SERIAL=y || MULTIFACE_III_TTY=y || SERIAL=y || MVME147_SCC || SERIAL167 || MVME162_SCC || BVME6000_SCC || DN_SERIAL)
+	depends on (AMIGA || ATARI || SUN3 || SUN3X || VME || APOLLO) && (ATARI_MFPSER=y || ATARI_MIDI=y || AMIGA_BUILTIN_SERIAL=y || MULTIFACE_III_TTY=y || SERIAL=y || SERIAL167 || DN_SERIAL)
 	---help---
 	  If you say Y here, it will be possible to use a serial port as the
 	  system console (the system console is the device which receives all
-- 
1.7.4.4
