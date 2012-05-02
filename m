From: <gerg@snapgear.com>
Subject: [PATCH 10/11] m68knommu: move the 532x platform code into the common ColdFire code directory
Date: Wed, 2 May 2012 11:09:05 +1000
Message-ID: <1335920946-11297-11-git-send-email-gerg@snapgear.com>
References: <1335920946-11297-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:48892 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758223Ab2EBBKk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 1 May 2012 21:10:40 -0400
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
 arch/m68k/platform/532x/Makefile                   |   18 ------------------
 arch/m68k/platform/coldfire/Makefile               |    2 +-
 .../platform/{532x/config.c => coldfire/m532x.c}   |    0
 4 files changed, 1 insertions(+), 20 deletions(-)
 delete mode 100644 arch/m68k/platform/532x/Makefile
 rename arch/m68k/platform/{532x/config.c => coldfire/m532x.c} (100%)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 333c0c2..3154f0f 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -115,7 +115,6 @@ core-$(CONFIG_M68000)		+= arch/m68k/platform/68328/
 core-$(CONFIG_M68EZ328)		+= arch/m68k/platform/68EZ328/
 core-$(CONFIG_M68VZ328)		+= arch/m68k/platform/68VZ328/
 core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
-core-$(CONFIG_M532x)		+= arch/m68k/platform/532x/
 core-$(CONFIG_M54xx)		+= arch/m68k/platform/54xx/
 
 
diff --git a/arch/m68k/platform/532x/Makefile b/arch/m68k/platform/532x/Makefile
deleted file mode 100644
index c0d8cf8..0000000
--- a/arch/m68k/platform/532x/Makefile
+++ /dev/null
@@ -1,18 +0,0 @@
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
-# ccflags-y := -DTRAP_DBG_INTERRUPT
-# asflags-y := -DTRAP_DBG_INTERRUPT
-#
-
-asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
-
-#obj-y := config.o usb-mcf532x.o spi-mcf532x.o
-obj-y := config.o
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 48dcd06..d6089c1 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -24,7 +24,7 @@ obj-$(CONFIG_M527x)	+= m527x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o timers.o
 obj-$(CONFIG_M528x)	+= m528x.o pit.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= m5307.o timers.o intc.o reset.o
-obj-$(CONFIG_M532x)	+= timers.o intc-simr.o reset.o
+obj-$(CONFIG_M532x)	+= m532x.o timers.o intc-simr.o reset.o
 obj-$(CONFIG_M5407)	+= m5407.o timers.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= sltimers.o intc-2.o
 
diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/coldfire/m532x.c
similarity index 100%
rename from arch/m68k/platform/532x/config.c
rename to arch/m68k/platform/coldfire/m532x.c
-- 
1.7.0.4
