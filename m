From: <gerg@snapgear.com>
Subject: [PATCH 05/11] m68knommu: move the 5272 platform code into the common ColdFire code directory
Date: Wed, 2 May 2012 11:09:00 +1000
Message-ID: <1335920946-11297-6-git-send-email-gerg@snapgear.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48872 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755565Ab2EBBKY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 May 2012 21:10:24 -0400
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
 arch/m68k/platform/5272/Makefile                   |   18 ------------------
 arch/m68k/platform/coldfire/Makefile               |    2 +-
 .../platform/{5272/intc.c => coldfire/intc-5272.c} |    0
 .../platform/{5272/config.c => coldfire/m5272.c}   |    0
 5 files changed, 1 insertions(+), 20 deletions(-)
 delete mode 100644 arch/m68k/platform/5272/Makefile
 rename arch/m68k/platform/{5272/intc.c => coldfire/intc-5272.c} (100%)
 rename arch/m68k/platform/{5272/config.c => coldfire/m5272.c} (100%)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 314c10c..2d7a4d9 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -116,7 +116,6 @@ core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
 core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
 core-$(CONFIG_M527x)		+= arch/m68k/platform/527x/
-core-$(CONFIG_M5272)		+= arch/m68k/platform/5272/
 core-$(CONFIG_M528x)		+= arch/m68k/platform/528x/
 core-$(CONFIG_M5307)		+= arch/m68k/platform/5307/
 core-$(CONFIG_M532x)		+= arch/m68k/platform/532x/
diff --git a/arch/m68k/platform/5272/Makefile b/arch/m68k/platform/5272/Makefile
deleted file mode 100644
index 932ddab..0000000
--- a/arch/m68k/platform/5272/Makefile
+++ /dev/null
@@ -1,18 +0,0 @@
-#
-# Makefile for the linux kernel.
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
-obj-y := config.o intc.o
-
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 87ffd2c..ec81d05 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -21,7 +21,7 @@ obj-$(CONFIG_M520x)	+= m520x.o pit.o intc-simr.o reset.o
 obj-$(CONFIG_M523x)	+= m523x.o pit.o dma_timer.o intc-2.o reset.o
 obj-$(CONFIG_M5249)	+= m5249.o timers.o intc.o intc-5249.o reset.o
 obj-$(CONFIG_M527x)	+= pit.o intc-2.o reset.o
-obj-$(CONFIG_M5272)	+= timers.o
+obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o timers.o
 obj-$(CONFIG_M528x)	+= pit.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= timers.o intc.o reset.o
 obj-$(CONFIG_M532x)	+= timers.o intc-simr.o reset.o
diff --git a/arch/m68k/platform/5272/intc.c b/arch/m68k/platform/coldfire/intc-5272.c
similarity index 100%
rename from arch/m68k/platform/5272/intc.c
rename to arch/m68k/platform/coldfire/intc-5272.c
diff --git a/arch/m68k/platform/5272/config.c b/arch/m68k/platform/coldfire/m5272.c
similarity index 100%
rename from arch/m68k/platform/5272/config.c
rename to arch/m68k/platform/coldfire/m5272.c
-- 
1.7.0.4
