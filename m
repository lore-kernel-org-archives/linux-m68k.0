From: <gerg@snapgear.com>
Subject: [PATCH 11/11] m68knommu: move the 54xx platform code into the common ColdFire code directory
Date: Wed, 2 May 2012 11:09:06 +1000
Message-ID: <1335920946-11297-12-git-send-email-gerg@snapgear.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48887 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758176Ab2EBBKe (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 May 2012 21:10:34 -0400
In-Reply-To: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

All these separate directories for each ColdFire CPU SoC varient seems like
overkill. The majority of them only contain a single small config file. Move
these into the common ColdFire code directory.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Makefile                                 |    1 -
 arch/m68k/platform/54xx/Makefile                   |   19 -------------------
 arch/m68k/platform/coldfire/Makefile               |    3 ++-
 arch/m68k/platform/{54xx => coldfire}/firebee.c    |    0
 .../platform/{54xx/config.c => coldfire/m54xx.c}   |    0
 5 files changed, 2 insertions(+), 21 deletions(-)
 delete mode 100644 arch/m68k/platform/54xx/Makefile
 rename arch/m68k/platform/{54xx => coldfire}/firebee.c (100%)
 rename arch/m68k/platform/{54xx/config.c => coldfire/m54xx.c} (100%)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 3154f0f..804f139 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -115,7 +115,6 @@ core-$(CONFIG_M68000)		+= arch/m68k/platform/68328/
 core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
 core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
-core-$(CONFIG_M54xx)		+= arch/m68k/platform/54xx/
 
 
 all:	zImage
diff --git a/arch/m68k/platform/54xx/Makefile b/arch/m68k/platform/54xx/Makefile
deleted file mode 100644
index 6cfd090..0000000
--- a/arch/m68k/platform/54xx/Makefile
+++ /dev/null
@@ -1,19 +0,0 @@
-#
-# Makefile for the m68knommu linux kernel.
-#
-
-#
-# If you want to play with the HW breakpoints then you will
-# need to add define this,  which will give you a stack backtrace
-# on the console port whenever a DBG interrupt occurs. You have to
-# set up you HW breakpoints to trigger a DBG interrupt:
-#
-# EXTRA_CFLAGS += -DTRAP_DBG_INTERRUPT
-# EXTRA_AFLAGS += -DTRAP_DBG_INTERRUPT
-#
-
-asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
-
-obj-y := config.o
-obj-$(CONFIG_FIREBEE) += firebee.o
-
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index d6089c1..76d389d 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -26,10 +26,11 @@ obj-$(CONFIG_M528x)	+= m528x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= m5307.o timers.o intc.o reset.o
 obj-$(CONFIG_M532x)	+= m532x.o timers.o intc-simr.o reset.o
 obj-$(CONFIG_M5407)	+= m5407.o timers.o intc.o reset.o
-obj-$(CONFIG_M54xx)	+= sltimers.o intc-2.o
+obj-$(CONFIG_M54xx)	+= m54xx.o sltimers.o intc-2.o
 
 obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
+obj-$(CONFIG_FIREBEE)	+= firebee.o
 
 obj-y			+= pinmux.o gpio.o
 extra-y := head.o
diff --git a/arch/m68k/platform/54xx/firebee.c b/arch/m68k/platform/coldfire/firebee.c
similarity index 100%
rename from arch/m68k/platform/54xx/firebee.c
rename to arch/m68k/platform/coldfire/firebee.c
diff --git a/arch/m68k/platform/54xx/config.c b/arch/m68k/platform/coldfire/m54xx.c
similarity index 100%
rename from arch/m68k/platform/54xx/config.c
rename to arch/m68k/platform/coldfire/m54xx.c
-- 
1.7.0.4
