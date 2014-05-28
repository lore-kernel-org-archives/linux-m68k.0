From: gerg@uclinux.org
Subject: [PATCH 9/9] m68knommu: use ColdFire DMA timer module on devices that have it
Date: Wed, 28 May 2014 10:49:49 +1000
Message-ID: <1401238189-4402-10-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas04p.mx.bigpond.com ([61.9.168.146]:47362 "EHLO
	nskntmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752068AbaE1At5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:57 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The DMA timer hardware module is present in all of the 520x, 527x, 528x,
53xx and 5441x families of ColdFire SoC. Use it as clock source on those
parts to give a more accurate clock.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/platform/coldfire/Makefile
index 0818f77..cdd0b03 100644
--- a/arch/m68k/platform/coldfire/Makefile
+++ b/arch/m68k/platform/coldfire/Makefile
@@ -17,18 +17,18 @@ asflags-$(CONFIG_FULLDEBUG) := -DDEBUGGER_COMPATIBLE_CACHE=1
 obj-$(CONFIG_COLDFIRE)	+= cache.o clk.o device.o dma.o entry.o vectors.o
 obj-$(CONFIG_M5206)	+= m5206.o timers.o intc.o reset.o
 obj-$(CONFIG_M5206e)	+= m5206.o timers.o intc.o reset.o
-obj-$(CONFIG_M520x)	+= m520x.o pit.o intc-simr.o reset.o
+obj-$(CONFIG_M520x)	+= m520x.o pit.o dma_timer.o intc-simr.o reset.o
 obj-$(CONFIG_M523x)	+= m523x.o pit.o dma_timer.o intc-2.o reset.o
 obj-$(CONFIG_M5249)	+= m5249.o timers.o intc.o intc-5249.o reset.o
 obj-$(CONFIG_M525x)	+= m525x.o timers.o intc.o intc-525x.o reset.o
-obj-$(CONFIG_M527x)	+= m527x.o pit.o intc-2.o reset.o
+obj-$(CONFIG_M527x)	+= m527x.o pit.o dma_timer.o intc-2.o reset.o
 obj-$(CONFIG_M5272)	+= m5272.o intc-5272.o timers.o
-obj-$(CONFIG_M528x)	+= m528x.o pit.o intc-2.o reset.o
+obj-$(CONFIG_M528x)	+= m528x.o pit.o dma_timer.o intc-2.o reset.o
 obj-$(CONFIG_M5307)	+= m5307.o timers.o intc.o reset.o
-obj-$(CONFIG_M53xx)	+= m53xx.o pit.o intc-simr.o reset.o
+obj-$(CONFIG_M53xx)	+= m53xx.o pit.o dma_timer.o intc-simr.o reset.o
 obj-$(CONFIG_M5407)	+= m5407.o timers.o intc.o reset.o
 obj-$(CONFIG_M54xx)	+= m54xx.o sltimers.o intc-2.o
-obj-$(CONFIG_M5441x)	+= m5441x.o pit.o intc-simr.o reset.o
+obj-$(CONFIG_M5441x)	+= m5441x.o pit.o dma_timer.o intc-simr.o reset.o
 
 obj-$(CONFIG_NETtel)	+= nettel.o
 obj-$(CONFIG_CLEOPATRA)	+= nettel.o
-- 
1.8.1.4
