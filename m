From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 01/10] m68knommu: force setting of CONFIG_CLOCK_FREQ for ColdFire
Date: Tue,  7 Jul 2015 16:55:15 +1000
Message-ID: <1436252124-23051-2-git-send-email-gerg@uclinux.org>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas06p.mx.bigpond.com ([61.9.168.152]:34346 "EHLO
	nskntmtas06p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755479AbbGGGyN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 02:54:13 -0400
In-Reply-To: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

It is possible to disable the clock selection at configuration time,
but for ColdFire targets we always expect a clock frequency to be
selected. This results in the following compile time error:

  CC      arch/m68k/kernel/asm-offsets.s
In file included from ./arch/m68k/include/asm/timex.h:14:0,
                 from include/linux/timex.h:65,
                 from include/linux/sched.h:19,
                 from arch/m68k/kernel/asm-offsets.c:14:
./arch/m68k/include/asm/coldfire.h:25:2: error: #error "Don't know what your ColdFire CPU clock frequency is??"

Remove CONFIG_CLOCK_SELECT completely and always enable CONFIG_CLOCK_FREQ
for ColdFire.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu            | 14 +-------------
 arch/m68k/include/asm/coldfire.h |  2 +-
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 33013df..7da5949 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -416,22 +416,10 @@ config HAVE_MBAR
 config HAVE_IPSBAR
 	bool
 
-config CLOCK_SET
-	bool "Enable setting the CPU clock frequency"
-	depends on COLDFIRE
-	default n
-	help
-	  On some CPU's you do not need to know what the core CPU clock
-	  frequency is. On these you can disable clock setting. On some
-	  traditional 68K parts, and on all ColdFire parts you need to set
-	  the appropriate CPU clock frequency. On these devices many of the
-	  onboard peripherals derive their timing from the master CPU clock
-	  frequency.
-
 config CLOCK_FREQ
 	int "Set the core clock frequency"
 	default "66666666"
-	depends on CLOCK_SET
+	depends on COLDFIRE
 	help
 	  Define the CPU clock frequency in use. This is the core clock
 	  frequency, it may or may not be the same as the external clock
diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index c94557b..50aa4da 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -19,7 +19,7 @@
  *	in any case new boards come along from time to time that have yet
  *	another different clocking frequency.
  */
-#ifdef CONFIG_CLOCK_SET
+#ifdef CONFIG_CLOCK_FREQ
 #define	MCF_CLK		CONFIG_CLOCK_FREQ
 #else
 #error "Don't know what your ColdFire CPU clock frequency is??"
-- 
1.9.1
