From: <gerg@snapgear.com>
Subject: [PATCH 02/11] m68knommu: move the 520x platform code into the common ColdFire code directory
Date: Wed, 2 May 2012 11:08:57 +1000
Message-ID: <1335920946-11297-3-git-send-email-gerg@snapgear.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48861 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755565Ab2EBBKU (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 May 2012 21:10:20 -0400
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
 arch/m68k/platform/520x/Makefile                   |   17 -----------------
 arch/m68k/platform/coldfire/Makefile               |    2 +-
 .../platform/{520x/config.c => coldfire/m520x.c}   |    0
 4 files changed, 1 insertions(+), 19 deletions(-)
 delete mode 100644 arch/m68k/platform/520x/Makefile
 rename arch/m68k/platform/{520x/config.c => coldfire/m520x.c} (100%)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 8303f3b..090707a 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -115,7 +115,6 @@ core-$(CONFIG_M68000)		+= arch/m68k/platform/68328/
 core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
 core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
-core-$(CONFIG_M520x)		+= arch/m68k/platform/520x/
 core-$(CONFIG_M523x)		+= arch/m68k/platform/523x/
 core-$(CONFIG_M5249)		+= arch/m68k/platform/5249/
 core-$(CONFIG_M527x)		+= arch/m68k/platform/527x/
diff --git a/arch/m68k/platform/520x/Makefile b/arch/m68k/platform/520x/Makefile
deleted file mode 100644
index 03e29d1..0000000
--- a/arch/m68k/platform/520x/Makefile
+++ /dev/null
@@ -1,17 +0,0 @@
-#
-# Makefile for the M5208 specific file.
-#
-
-#
-# If you want to play with the HW breakpoints then you will
-# need to add define this,  which will give you a stack backtrace
-# on the console port whenever a DBG interrupt occurs.  You have to
-# set up you HW breakpoints to trigger a DBG interrupt:
-#
-# ccflags-y := -DTRAP_DBG_INTERRUPT
-# asflags-y := -DTRAP_DBG_INTERRUPT
-#
-
-asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
-
-obj-y := config.o
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index ef729b1..60c1efa 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -17,7 +17,7 @@ asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
 obj-$(CONFIG_M5206)	+= m5206.o timers.o intc.o reset.o
 obj-$(CONFIG_M5206e)	+= m5206.o timers.o intc.o reset.o
-obj-$(CONFIG_M520x)	+= pit.o intc-simr.o reset.o
+obj-$(CONFIG_M520x)	+= m520x.o pit.o intc-simr.o reset.o
 obj-$(CONFIG_M523x)	+= pit.o dma_timer.o intc-2.o reset.o
 obj-$(CONFIG_M5249)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M527x)	+= pit.o intc-2.o reset.o
diff --git a/arch/m68k/platform/520x/config.c b/arch/m68k/platform/coldfire/m520x.c
similarity index 100%
rename from arch/m68k/platform/520x/config.c
rename to arch/m68k/platform/coldfire/m520x.c
-- 
1.7.0.4
