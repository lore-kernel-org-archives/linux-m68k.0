From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: remove ColdFire CLOCK_DIV config option
Date: Mon, 14 Mar 2011 10:38:48 +1000
Message-ID: <1300063128-3165-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:59895 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753312Ab1CNAix (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Mar 2011 20:38:53 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The reality is that you do not need the abiltity to configure the
clock divider for ColdFire CPUs. It is a fixed ratio on any given
ColdFire family member. It is not the same for all ColdFire parts,
but it is always the same in a model range. So hard define the divider
for each supported ColdFire CPU type and remove the Kconfig option.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h |    9 ++++-----
 arch/m68k/include/asm/m5206sim.h |    1 +
 arch/m68k/include/asm/m520xsim.h |    1 +
 arch/m68k/include/asm/m523xsim.h |    1 +
 arch/m68k/include/asm/m5249sim.h |    1 +
 arch/m68k/include/asm/m5272sim.h |    1 +
 arch/m68k/include/asm/m527xsim.h |    1 +
 arch/m68k/include/asm/m528xsim.h |    1 +
 arch/m68k/include/asm/m5307sim.h |    1 +
 arch/m68k/include/asm/m532xsim.h |    1 +
 arch/m68k/include/asm/m5407sim.h |    1 +
 arch/m68k/include/asm/m54xxsim.h |    1 +
 arch/m68knommu/Kconfig           |   11 -----------
 13 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index 98d1d25..c94557b 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -14,14 +14,13 @@
 
 
 /*
- *	Define master clock frequency. This is essentially done at config
- *	time now. No point enumerating dozens of possible clock options
- *	here. Also the peripheral clock (bus clock) divide ratio is set
- *	at config time too.
+ *	Define master clock frequency. This is done at config time now.
+ *	No point enumerating dozens of possible clock options here. And
+ *	in any case new boards come along from time to time that have yet
+ *	another different clocking frequency.
  */
 #ifdef CONFIG_CLOCK_SET
 #define	MCF_CLK		CONFIG_CLOCK_FREQ
-#define	MCF_BUSCLK	(CONFIG_CLOCK_FREQ / CONFIG_CLOCK_DIV)
 #else
 #error "Don't know what your ColdFire CPU clock frequency is??"
 #endif
diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index dfd6d3f..9015ead 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -14,6 +14,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m5206)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		MCF_CLK
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m520xsim.h b/arch/m68k/include/asm/m520xsim.h
index 87f8ce7..ee89801 100644
--- a/arch/m68k/include/asm/m520xsim.h
+++ b/arch/m68k/include/asm/m520xsim.h
@@ -13,6 +13,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m520x)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 3f3dbf0..3852f07 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -13,6 +13,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m523x)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 33b0b4d..805714c 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -13,6 +13,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m5249)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 57ca4de..759c2b0 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -14,6 +14,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m5272)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		MCF_CLK
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index 838fb2b..c23046e 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -13,6 +13,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m527x)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index 47324f2..d798bd5 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -13,6 +13,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m528x)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		MCF_CLK
 
 #include <asm/m52xxacr.h>
 
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index e4365f2..4c94c01 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -16,6 +16,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m5307)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m53xxacr.h>
 
diff --git a/arch/m68k/include/asm/m532xsim.h b/arch/m68k/include/asm/m532xsim.h
index 0dea126..ba4cc78 100644
--- a/arch/m68k/include/asm/m532xsim.h
+++ b/arch/m68k/include/asm/m532xsim.h
@@ -11,6 +11,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m532x)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 3)
 
 #include <asm/m53xxacr.h>
 
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index c1eba01..762c58c 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -16,6 +16,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m5407)"
 #define	CPU_INSTR_PER_JIFFY	3
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m54xxacr.h>
 
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index cc5d94d..daaae27 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -7,6 +7,7 @@
 
 #define	CPU_NAME		"COLDFIRE(m54xx)"
 #define	CPU_INSTR_PER_JIFFY	2
+#define	MCF_BUSCLK		(MCF_CLK / 2)
 
 #include <asm/m54xxacr.h>
 
diff --git a/arch/m68knommu/Kconfig b/arch/m68knommu/Kconfig
index 2e6fe63..b5424cf 100644
--- a/arch/m68knommu/Kconfig
+++ b/arch/m68knommu/Kconfig
@@ -260,17 +260,6 @@ config CLOCK_FREQ
 	  if it is fitted (there are some exceptions). This value will be
 	  specific to the exact CPU that you are using.
 
-config CLOCK_DIV
-	int "Set the core/bus clock divide ratio"
-	default "1"
-	depends on CLOCK_SET
-	help
-	  On many SoC style CPUs the master CPU clock is also used to drive 
-	  on-chip peripherals. The clock that is distributed to these
-	  peripherals is sometimes a fixed ratio of the master clock
-	  frequency. If so then set this to the divider ratio of the
-	  master clock to the peripheral clock. If not sure then select 1.
-
 config OLDMASK
 	bool "Old mask 5307 (1H55J) silicon"
 	depends on M5307
-- 
1.7.0.4
