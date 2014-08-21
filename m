From: gerg@uclinux.org
Subject: [PATCH 1/2] m68k: move coldfire platform code
Date: Thu, 21 Aug 2014 13:04:06 +1000
Message-ID: <1408590247-10875-2-git-send-email-gerg@uclinux.org>
References: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv02p.mx.bigpond.com ([61.9.189.234]:62653 "EHLO
	nschwqsrv02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751898AbaHUDLW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Wed, 20 Aug 2014 23:11:22 -0400
In-Reply-To: <1408590247-10875-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Move the m68k ColdFire platform support code directory to be with the
existing m68k platforms. Although the ColdFire is not a platform as such,
we have always kept all its support together. No reason to change that
as this time.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Makefile                            | 4 ++--
 arch/m68k/{platform => }/coldfire/Makefile    | 0
 arch/m68k/{platform => }/coldfire/cache.c     | 0
 arch/m68k/{platform => }/coldfire/clk.c       | 0
 arch/m68k/{platform => }/coldfire/device.c    | 0
 arch/m68k/{platform => }/coldfire/dma.c       | 0
 arch/m68k/{platform => }/coldfire/dma_timer.c | 0
 arch/m68k/{platform => }/coldfire/entry.S     | 0
 arch/m68k/{platform => }/coldfire/firebee.c   | 0
 arch/m68k/{platform => }/coldfire/gpio.c      | 0
 arch/m68k/{platform => }/coldfire/head.S      | 0
 arch/m68k/{platform => }/coldfire/intc-2.c    | 0
 arch/m68k/{platform => }/coldfire/intc-5249.c | 0
 arch/m68k/{platform => }/coldfire/intc-525x.c | 0
 arch/m68k/{platform => }/coldfire/intc-5272.c | 0
 arch/m68k/{platform => }/coldfire/intc-simr.c | 0
 arch/m68k/{platform => }/coldfire/intc.c      | 0
 arch/m68k/{platform => }/coldfire/m5206.c     | 0
 arch/m68k/{platform => }/coldfire/m520x.c     | 0
 arch/m68k/{platform => }/coldfire/m523x.c     | 0
 arch/m68k/{platform => }/coldfire/m5249.c     | 0
 arch/m68k/{platform => }/coldfire/m525x.c     | 0
 arch/m68k/{platform => }/coldfire/m5272.c     | 0
 arch/m68k/{platform => }/coldfire/m527x.c     | 0
 arch/m68k/{platform => }/coldfire/m528x.c     | 0
 arch/m68k/{platform => }/coldfire/m5307.c     | 0
 arch/m68k/{platform => }/coldfire/m53xx.c     | 0
 arch/m68k/{platform => }/coldfire/m5407.c     | 0
 arch/m68k/{platform => }/coldfire/m5441x.c    | 0
 arch/m68k/{platform => }/coldfire/m54xx.c     | 0
 arch/m68k/{platform => }/coldfire/mcf8390.c   | 0
 arch/m68k/{platform => }/coldfire/nettel.c    | 0
 arch/m68k/{platform => }/coldfire/pci.c       | 0
 arch/m68k/{platform => }/coldfire/pit.c       | 0
 arch/m68k/{platform => }/coldfire/reset.c     | 0
 arch/m68k/{platform => }/coldfire/sltimers.c  | 0
 arch/m68k/{platform => }/coldfire/timers.c    | 0
 arch/m68k/{platform => }/coldfire/vectors.c   | 0
 38 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/m68k/{platform => }/coldfire/Makefile (100%)
 rename arch/m68k/{platform => }/coldfire/cache.c (100%)
 rename arch/m68k/{platform => }/coldfire/clk.c (100%)
 rename arch/m68k/{platform => }/coldfire/device.c (100%)
 rename arch/m68k/{platform => }/coldfire/dma.c (100%)
 rename arch/m68k/{platform => }/coldfire/dma_timer.c (100%)
 rename arch/m68k/{platform => }/coldfire/entry.S (100%)
 rename arch/m68k/{platform => }/coldfire/firebee.c (100%)
 rename arch/m68k/{platform => }/coldfire/gpio.c (100%)
 rename arch/m68k/{platform => }/coldfire/head.S (100%)
 rename arch/m68k/{platform => }/coldfire/intc-2.c (100%)
 rename arch/m68k/{platform => }/coldfire/intc-5249.c (100%)
 rename arch/m68k/{platform => }/coldfire/intc-525x.c (100%)
 rename arch/m68k/{platform => }/coldfire/intc-5272.c (100%)
 rename arch/m68k/{platform => }/coldfire/intc-simr.c (100%)
 rename arch/m68k/{platform => }/coldfire/intc.c (100%)
 rename arch/m68k/{platform => }/coldfire/m5206.c (100%)
 rename arch/m68k/{platform => }/coldfire/m520x.c (100%)
 rename arch/m68k/{platform => }/coldfire/m523x.c (100%)
 rename arch/m68k/{platform => }/coldfire/m5249.c (100%)
 rename arch/m68k/{platform => }/coldfire/m525x.c (100%)
 rename arch/m68k/{platform => }/coldfire/m5272.c (100%)
 rename arch/m68k/{platform => }/coldfire/m527x.c (100%)
 rename arch/m68k/{platform => }/coldfire/m528x.c (100%)
 rename arch/m68k/{platform => }/coldfire/m5307.c (100%)
 rename arch/m68k/{platform => }/coldfire/m53xx.c (100%)
 rename arch/m68k/{platform => }/coldfire/m5407.c (100%)
 rename arch/m68k/{platform => }/coldfire/m5441x.c (100%)
 rename arch/m68k/{platform => }/coldfire/m54xx.c (100%)
 rename arch/m68k/{platform => }/coldfire/mcf8390.c (100%)
 rename arch/m68k/{platform => }/coldfire/nettel.c (100%)
 rename arch/m68k/{platform => }/coldfire/pci.c (100%)
 rename arch/m68k/{platform => }/coldfire/pit.c (100%)
 rename arch/m68k/{platform => }/coldfire/reset.c (100%)
 rename arch/m68k/{platform => }/coldfire/sltimers.c (100%)
 rename arch/m68k/{platform => }/coldfire/timers.c (100%)
 rename arch/m68k/{platform => }/coldfire/vectors.c (100%)

diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 7f7830f..2e24775 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -94,7 +94,7 @@ head-y				:= arch/m68k/kernel/head.o
 head-$(CONFIG_SUN3)		:= arch/m68k/kernel/sun3-head.o
 head-$(CONFIG_M68360)		:= arch/m68k/platform/68360/head.o
 head-$(CONFIG_M68000)		:= arch/m68k/platform/68000/head.o
-head-$(CONFIG_COLDFIRE)		:= arch/m68k/platform/coldfire/head.o
+head-$(CONFIG_COLDFIRE)		:= arch/m68k/coldfire/head.o
 
 core-y				+= arch/m68k/kernel/	arch/m68k/mm/
 libs-y				+= arch/m68k/lib/
@@ -116,7 +116,7 @@ core-$(CONFIG_M68060)		+= arch/m68k/ifpsp060/
 core-$(CONFIG_M68KFPU_EMU)	+= arch/m68k/math-emu/
 core-$(CONFIG_M68360)		+= arch/m68k/platform/68360/
 core-$(CONFIG_M68000)		+= arch/m68k/platform/68000/
-core-$(CONFIG_COLDFIRE)		+= arch/m68k/platform/coldfire/
+core-$(CONFIG_COLDFIRE)		+= arch/m68k/coldfire/
 
 
 all:	zImage
diff --git a/arch/m68k/platform/coldfire/Makefile b/arch/m68k/coldfire/Makefile
similarity index 100%
rename from arch/m68k/platform/coldfire/Makefile
rename to arch/m68k/coldfire/Makefile
diff --git a/arch/m68k/platform/coldfire/cache.c b/arch/m68k/coldfire/cache.c
similarity index 100%
rename from arch/m68k/platform/coldfire/cache.c
rename to arch/m68k/coldfire/cache.c
diff --git a/arch/m68k/platform/coldfire/clk.c b/arch/m68k/coldfire/clk.c
similarity index 100%
rename from arch/m68k/platform/coldfire/clk.c
rename to arch/m68k/coldfire/clk.c
diff --git a/arch/m68k/platform/coldfire/device.c b/arch/m68k/coldfire/device.c
similarity index 100%
rename from arch/m68k/platform/coldfire/device.c
rename to arch/m68k/coldfire/device.c
diff --git a/arch/m68k/platform/coldfire/dma.c b/arch/m68k/coldfire/dma.c
similarity index 100%
rename from arch/m68k/platform/coldfire/dma.c
rename to arch/m68k/coldfire/dma.c
diff --git a/arch/m68k/platform/coldfire/dma_timer.c b/arch/m68k/coldfire/dma_timer.c
similarity index 100%
rename from arch/m68k/platform/coldfire/dma_timer.c
rename to arch/m68k/coldfire/dma_timer.c
diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/coldfire/entry.S
similarity index 100%
rename from arch/m68k/platform/coldfire/entry.S
rename to arch/m68k/coldfire/entry.S
diff --git a/arch/m68k/platform/coldfire/firebee.c b/arch/m68k/coldfire/firebee.c
similarity index 100%
rename from arch/m68k/platform/coldfire/firebee.c
rename to arch/m68k/coldfire/firebee.c
diff --git a/arch/m68k/platform/coldfire/gpio.c b/arch/m68k/coldfire/gpio.c
similarity index 100%
rename from arch/m68k/platform/coldfire/gpio.c
rename to arch/m68k/coldfire/gpio.c
diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/coldfire/head.S
similarity index 100%
rename from arch/m68k/platform/coldfire/head.S
rename to arch/m68k/coldfire/head.S
diff --git a/arch/m68k/platform/coldfire/intc-2.c b/arch/m68k/coldfire/intc-2.c
similarity index 100%
rename from arch/m68k/platform/coldfire/intc-2.c
rename to arch/m68k/coldfire/intc-2.c
diff --git a/arch/m68k/platform/coldfire/intc-5249.c b/arch/m68k/coldfire/intc-5249.c
similarity index 100%
rename from arch/m68k/platform/coldfire/intc-5249.c
rename to arch/m68k/coldfire/intc-5249.c
diff --git a/arch/m68k/platform/coldfire/intc-525x.c b/arch/m68k/coldfire/intc-525x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/intc-525x.c
rename to arch/m68k/coldfire/intc-525x.c
diff --git a/arch/m68k/platform/coldfire/intc-5272.c b/arch/m68k/coldfire/intc-5272.c
similarity index 100%
rename from arch/m68k/platform/coldfire/intc-5272.c
rename to arch/m68k/coldfire/intc-5272.c
diff --git a/arch/m68k/platform/coldfire/intc-simr.c b/arch/m68k/coldfire/intc-simr.c
similarity index 100%
rename from arch/m68k/platform/coldfire/intc-simr.c
rename to arch/m68k/coldfire/intc-simr.c
diff --git a/arch/m68k/platform/coldfire/intc.c b/arch/m68k/coldfire/intc.c
similarity index 100%
rename from arch/m68k/platform/coldfire/intc.c
rename to arch/m68k/coldfire/intc.c
diff --git a/arch/m68k/platform/coldfire/m5206.c b/arch/m68k/coldfire/m5206.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m5206.c
rename to arch/m68k/coldfire/m5206.c
diff --git a/arch/m68k/platform/coldfire/m520x.c b/arch/m68k/coldfire/m520x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m520x.c
rename to arch/m68k/coldfire/m520x.c
diff --git a/arch/m68k/platform/coldfire/m523x.c b/arch/m68k/coldfire/m523x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m523x.c
rename to arch/m68k/coldfire/m523x.c
diff --git a/arch/m68k/platform/coldfire/m5249.c b/arch/m68k/coldfire/m5249.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m5249.c
rename to arch/m68k/coldfire/m5249.c
diff --git a/arch/m68k/platform/coldfire/m525x.c b/arch/m68k/coldfire/m525x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m525x.c
rename to arch/m68k/coldfire/m525x.c
diff --git a/arch/m68k/platform/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m5272.c
rename to arch/m68k/coldfire/m5272.c
diff --git a/arch/m68k/platform/coldfire/m527x.c b/arch/m68k/coldfire/m527x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m527x.c
rename to arch/m68k/coldfire/m527x.c
diff --git a/arch/m68k/platform/coldfire/m528x.c b/arch/m68k/coldfire/m528x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m528x.c
rename to arch/m68k/coldfire/m528x.c
diff --git a/arch/m68k/platform/coldfire/m5307.c b/arch/m68k/coldfire/m5307.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m5307.c
rename to arch/m68k/coldfire/m5307.c
diff --git a/arch/m68k/platform/coldfire/m53xx.c b/arch/m68k/coldfire/m53xx.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m53xx.c
rename to arch/m68k/coldfire/m53xx.c
diff --git a/arch/m68k/platform/coldfire/m5407.c b/arch/m68k/coldfire/m5407.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m5407.c
rename to arch/m68k/coldfire/m5407.c
diff --git a/arch/m68k/platform/coldfire/m5441x.c b/arch/m68k/coldfire/m5441x.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m5441x.c
rename to arch/m68k/coldfire/m5441x.c
diff --git a/arch/m68k/platform/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
similarity index 100%
rename from arch/m68k/platform/coldfire/m54xx.c
rename to arch/m68k/coldfire/m54xx.c
diff --git a/arch/m68k/platform/coldfire/mcf8390.c b/arch/m68k/coldfire/mcf8390.c
similarity index 100%
rename from arch/m68k/platform/coldfire/mcf8390.c
rename to arch/m68k/coldfire/mcf8390.c
diff --git a/arch/m68k/platform/coldfire/nettel.c b/arch/m68k/coldfire/nettel.c
similarity index 100%
rename from arch/m68k/platform/coldfire/nettel.c
rename to arch/m68k/coldfire/nettel.c
diff --git a/arch/m68k/platform/coldfire/pci.c b/arch/m68k/coldfire/pci.c
similarity index 100%
rename from arch/m68k/platform/coldfire/pci.c
rename to arch/m68k/coldfire/pci.c
diff --git a/arch/m68k/platform/coldfire/pit.c b/arch/m68k/coldfire/pit.c
similarity index 100%
rename from arch/m68k/platform/coldfire/pit.c
rename to arch/m68k/coldfire/pit.c
diff --git a/arch/m68k/platform/coldfire/reset.c b/arch/m68k/coldfire/reset.c
similarity index 100%
rename from arch/m68k/platform/coldfire/reset.c
rename to arch/m68k/coldfire/reset.c
diff --git a/arch/m68k/platform/coldfire/sltimers.c b/arch/m68k/coldfire/sltimers.c
similarity index 100%
rename from arch/m68k/platform/coldfire/sltimers.c
rename to arch/m68k/coldfire/sltimers.c
diff --git a/arch/m68k/platform/coldfire/timers.c b/arch/m68k/coldfire/timers.c
similarity index 100%
rename from arch/m68k/platform/coldfire/timers.c
rename to arch/m68k/coldfire/timers.c
diff --git a/arch/m68k/platform/coldfire/vectors.c b/arch/m68k/coldfire/vectors.c
similarity index 100%
rename from arch/m68k/platform/coldfire/vectors.c
rename to arch/m68k/coldfire/vectors.c
-- 
1.9.1
