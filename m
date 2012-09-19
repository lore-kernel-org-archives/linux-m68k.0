From: <gerg@snapgear.com>
Subject: [PATCH 6/9] m68knommu: make ColdFire Chip Select register definitions absolute addresses
Date: Wed, 19 Sep 2012 15:08:41 +1000
Message-ID: <1348031324-13228-7-git-send-email-gerg@snapgear.com>
References: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:25414 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752936Ab2ISFFI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Sep 2012 01:05:08 -0400
In-Reply-To: <1348031324-13228-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Make all definitions of the ColdFire Chip Select registers absolute addresses.
Currently some are relative to the MBAR peripheral region.

The various ColdFire parts use different methods to address the internal
registers, some are absolute, some are relative to peripheral regions
which can be mapped at different address ranges (such as the MBAR and IPSBAR
registers). We don't want to deal with this in the code when we are
accessing these registers, so make all register definitions the absolute
address - factoring out whether it is an offset into a peripheral region.

This makes them all consistently defined, and reduces the occasional bugs
caused by inconsistent definition of the register addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m5206sim.h     |   50 +++++++++++-----------
 arch/m68k/include/asm/m5249sim.h     |   24 +++++-----
 arch/m68k/include/asm/m525xsim.h     |   30 +++++++-------
 arch/m68k/include/asm/m5272sim.h     |   32 +++++++-------
 arch/m68k/include/asm/m5307sim.h     |   76 +++++++++++++++++-----------------
 arch/m68k/include/asm/m5407sim.h     |   48 +++++++++++-----------
 arch/m68k/platform/coldfire/head.S   |    2 +-
 arch/m68k/platform/coldfire/nettel.c |    4 +-
 8 files changed, 133 insertions(+), 133 deletions(-)

diff --git a/arch/m68k/include/asm/m5206sim.h b/arch/m68k/include/asm/m5206sim.h
index 3e86b03..4cf864f 100644
--- a/arch/m68k/include/asm/m5206sim.h
+++ b/arch/m68k/include/asm/m5206sim.h
@@ -58,31 +58,31 @@
 #define	MCFSIM_DMR1		(MCF_MBAR + 0x5c) /* DRAM 1 Mask reg (r/w) */
 #define	MCFSIM_DCR1		(MCF_MBAR + 0x63) /* DRAM 1 Control reg (r/w) */
 
-#define	MCFSIM_CSAR0		0x64		/* CS 0 Address 0 reg (r/w) */
-#define	MCFSIM_CSMR0		0x68		/* CS 0 Mask 0 reg (r/w) */
-#define	MCFSIM_CSCR0		0x6e		/* CS 0 Control reg (r/w) */
-#define	MCFSIM_CSAR1		0x70		/* CS 1 Address reg (r/w) */
-#define	MCFSIM_CSMR1		0x74		/* CS 1 Mask reg (r/w) */
-#define	MCFSIM_CSCR1		0x7a		/* CS 1 Control reg (r/w) */
-#define	MCFSIM_CSAR2		0x7c		/* CS 2 Address reg (r/w) */
-#define	MCFSIM_CSMR2		0x80		/* CS 2 Mask reg (r/w) */
-#define	MCFSIM_CSCR2		0x86		/* CS 2 Control reg (r/w) */
-#define	MCFSIM_CSAR3		0x88		/* CS 3 Address reg (r/w) */
-#define	MCFSIM_CSMR3		0x8c		/* CS 3 Mask reg (r/w) */
-#define	MCFSIM_CSCR3		0x92		/* CS 3 Control reg (r/w) */
-#define	MCFSIM_CSAR4		0x94		/* CS 4 Address reg (r/w) */
-#define	MCFSIM_CSMR4		0x98		/* CS 4 Mask reg (r/w) */
-#define	MCFSIM_CSCR4		0x9e		/* CS 4 Control reg (r/w) */
-#define	MCFSIM_CSAR5		0xa0		/* CS 5 Address reg (r/w) */
-#define	MCFSIM_CSMR5		0xa4		/* CS 5 Mask reg (r/w) */
-#define	MCFSIM_CSCR5		0xaa		/* CS 5 Control reg (r/w) */
-#define	MCFSIM_CSAR6		0xac		/* CS 6 Address reg (r/w) */
-#define	MCFSIM_CSMR6		0xb0		/* CS 6 Mask reg (r/w) */
-#define	MCFSIM_CSCR6		0xb6		/* CS 6 Control reg (r/w) */
-#define	MCFSIM_CSAR7		0xb8		/* CS 7 Address reg (r/w) */
-#define	MCFSIM_CSMR7		0xbc		/* CS 7 Mask reg (r/w) */
-#define	MCFSIM_CSCR7		0xc2		/* CS 7 Control reg (r/w) */
-#define	MCFSIM_DMCR		0xc6		/* Default control */
+#define	MCFSIM_CSAR0		(MCF_MBAR + 0x64)	/* CS 0 Address reg */
+#define	MCFSIM_CSMR0		(MCF_MBAR + 0x68)	/* CS 0 Mask reg */
+#define	MCFSIM_CSCR0		(MCF_MBAR + 0x6e)	/* CS 0 Control reg */
+#define	MCFSIM_CSAR1		(MCF_MBAR + 0x70)	/* CS 1 Address reg */
+#define	MCFSIM_CSMR1		(MCF_MBAR + 0x74)	/* CS 1 Mask reg */
+#define	MCFSIM_CSCR1		(MCF_MBAR + 0x7a)	/* CS 1 Control reg */
+#define	MCFSIM_CSAR2		(MCF_MBAR + 0x7c)	/* CS 2 Address reg */
+#define	MCFSIM_CSMR2		(MCF_MBAR + 0x80)	/* CS 2 Mask reg */
+#define	MCFSIM_CSCR2		(MCF_MBAR + 0x86)	/* CS 2 Control reg */
+#define	MCFSIM_CSAR3		(MCF_MBAR + 0x88)	/* CS 3 Address reg */
+#define	MCFSIM_CSMR3		(MCF_MBAR + 0x8c)	/* CS 3 Mask reg */
+#define	MCFSIM_CSCR3		(MCF_MBAR + 0x92)	/* CS 3 Control reg */
+#define	MCFSIM_CSAR4		(MCF_MBAR + 0x94)	/* CS 4 Address reg */
+#define	MCFSIM_CSMR4		(MCF_MBAR + 0x98)	/* CS 4 Mask reg */
+#define	MCFSIM_CSCR4		(MCF_MBAR + 0x9e)	/* CS 4 Control reg */
+#define	MCFSIM_CSAR5		(MCF_MBAR + 0xa0)	/* CS 5 Address reg */
+#define	MCFSIM_CSMR5		(MCF_MBAR + 0xa4)	/* CS 5 Mask reg */
+#define	MCFSIM_CSCR5		(MCF_MBAR + 0xaa)	/* CS 5 Control reg */
+#define	MCFSIM_CSAR6		(MCF_MBAR + 0xac)	/* CS 6 Address reg */
+#define	MCFSIM_CSMR6		(MCF_MBAR + 0xb0)	/* CS 6 Mask reg */
+#define	MCFSIM_CSCR6		(MCF_MBAR + 0xb6)	/* CS 6 Control reg */
+#define	MCFSIM_CSAR7		(MCF_MBAR + 0xb8)	/* CS 7 Address reg */
+#define	MCFSIM_CSMR7		(MCF_MBAR + 0xbc)	/* CS 7 Mask reg */
+#define	MCFSIM_CSCR7		(MCF_MBAR + 0xc2)	/* CS 7 Control reg */
+#define	MCFSIM_DMCR		(MCF_MBAR + 0xc6)	/* Default control */
 
 #ifdef CONFIG_M5206e
 #define	MCFSIM_PAR		(MCF_MBAR + 0xca)	/* Pin Assignment */
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index f8384d3..02ada05 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -48,18 +48,18 @@
 #define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
 #define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
-#define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
-#define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
-#define MCFSIM_CSCR0		0x8a		/* CS 0 Control reg (r/w) */
-#define MCFSIM_CSAR1		0x8c		/* CS 1 Address reg (r/w) */
-#define MCFSIM_CSMR1		0x90		/* CS 1 Mask reg (r/w) */
-#define MCFSIM_CSCR1		0x96		/* CS 1 Control reg (r/w) */
-#define MCFSIM_CSAR2		0x98		/* CS 2 Address reg (r/w) */
-#define MCFSIM_CSMR2		0x9c		/* CS 2 Mask reg (r/w) */
-#define MCFSIM_CSCR2		0xa2		/* CS 2 Control reg (r/w) */
-#define MCFSIM_CSAR3		0xa4		/* CS 3 Address reg (r/w) */
-#define MCFSIM_CSMR3		0xa8		/* CS 3 Mask reg (r/w) */
-#define MCFSIM_CSCR3		0xae		/* CS 3 Control reg (r/w) */
+#define	MCFSIM_CSAR0		(MCF_MBAR + 0x80)	/* CS 0 Address reg */
+#define	MCFSIM_CSMR0		(MCF_MBAR + 0x84)	/* CS 0 Mask reg */
+#define	MCFSIM_CSCR0		(MCF_MBAR + 0x8a)	/* CS 0 Control reg */
+#define	MCFSIM_CSAR1		(MCF_MBAR + 0x8c)	/* CS 1 Address reg */
+#define	MCFSIM_CSMR1		(MCF_MBAR + 0x90)	/* CS 1 Mask reg */
+#define	MCFSIM_CSCR1		(MCF_MBAR + 0x96)	/* CS 1 Control reg */
+#define	MCFSIM_CSAR2		(MCF_MBAR + 0x98)	/* CS 2 Address reg */
+#define	MCFSIM_CSMR2		(MCF_MBAR + 0x9c)	/* CS 2 Mask reg */
+#define	MCFSIM_CSCR2		(MCF_MBAR + 0xa2)	/* CS 2 Control reg */
+#define	MCFSIM_CSAR3		(MCF_MBAR + 0xa4)	/* CS 3 Address reg */
+#define	MCFSIM_CSMR3		(MCF_MBAR + 0xa8)	/* CS 3 Mask reg */
+#define	MCFSIM_CSCR3		(MCF_MBAR + 0xae)	/* CS 3 Control reg */
 
 #define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
 #define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index 6a1ab49..158fdd4 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -46,21 +46,21 @@
 #define MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
 #define MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
-#define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
-#define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
-#define MCFSIM_CSCR0		0x8a		/* CS 0 Control reg (r/w) */
-#define MCFSIM_CSAR1		0x8c		/* CS 1 Address reg (r/w) */
-#define MCFSIM_CSMR1		0x90		/* CS 1 Mask reg (r/w) */
-#define MCFSIM_CSCR1		0x96		/* CS 1 Control reg (r/w) */
-#define MCFSIM_CSAR2		0x98		/* CS 2 Address reg (r/w) */
-#define MCFSIM_CSMR2		0x9c		/* CS 2 Mask reg (r/w) */
-#define MCFSIM_CSCR2		0xa2		/* CS 2 Control reg (r/w) */
-#define MCFSIM_CSAR3		0xa4		/* CS 3 Address reg (r/w) */
-#define MCFSIM_CSMR3		0xa8		/* CS 3 Mask reg (r/w) */
-#define MCFSIM_CSCR3		0xae		/* CS 3 Control reg (r/w) */
-#define MCFSIM_CSAR4		0xb0		/* CS 4 Address reg (r/w) */
-#define MCFSIM_CSMR4		0xb4		/* CS 4 Mask reg (r/w) */
-#define MCFSIM_CSCR4		0xba		/* CS 4 Control reg (r/w) */
+#define MCFSIM_CSAR0		(MCF_MBAR + 0x80)	/* CS 0 Address reg */
+#define MCFSIM_CSMR0		(MCF_MBAR + 0x84)	/* CS 0 Mask reg */
+#define MCFSIM_CSCR0		(MCF_MBAR + 0x8a)	/* CS 0 Control reg */
+#define MCFSIM_CSAR1		(MCF_MBAR + 0x8c)	/* CS 1 Address reg */
+#define MCFSIM_CSMR1		(MCF_MBAR + 0x90)	/* CS 1 Mask reg */
+#define MCFSIM_CSCR1		(MCF_MBAR + 0x96)	/* CS 1 Control reg */
+#define MCFSIM_CSAR2		(MCF_MBAR + 0x98)	/* CS 2 Address reg */
+#define MCFSIM_CSMR2		(MCF_MBAR + 0x9c)	/* CS 2 Mask reg */
+#define MCFSIM_CSCR2		(MCF_MBAR + 0xa2)	/* CS 2 Control reg */
+#define MCFSIM_CSAR3		(MCF_MBAR + 0xa4)	/* CS 3 Address reg */
+#define MCFSIM_CSMR3		(MCF_MBAR + 0xa8)	/* CS 3 Mask reg */
+#define MCFSIM_CSCR3		(MCF_MBAR + 0xae)	/* CS 3 Control reg */
+#define MCFSIM_CSAR4		(MCF_MBAR + 0xb0)	/* CS 4 Address reg */
+#define MCFSIM_CSMR4		(MCF_MBAR + 0xb4)	/* CS 4 Mask reg */
+#define MCFSIM_CSCR4		(MCF_MBAR + 0xba)	/* CS 4 Control reg */
 
 #define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
 #define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
diff --git a/arch/m68k/include/asm/m5272sim.h b/arch/m68k/include/asm/m5272sim.h
index 2b21787..3a5319e 100644
--- a/arch/m68k/include/asm/m5272sim.h
+++ b/arch/m68k/include/asm/m5272sim.h
@@ -42,22 +42,22 @@
 #define	MCFSIM_WCR		(MCF_MBAR + 0x288)	/* Watchdog counter */
 #define	MCFSIM_WER		(MCF_MBAR + 0x28c)	/* Watchdog event */
 
-#define	MCFSIM_CSBR0		0x40		/* CS0 Base Address (r/w) */
-#define	MCFSIM_CSOR0		0x44		/* CS0 Option (r/w) */
-#define	MCFSIM_CSBR1		0x48		/* CS1 Base Address (r/w) */
-#define	MCFSIM_CSOR1		0x4c		/* CS1 Option (r/w) */
-#define	MCFSIM_CSBR2		0x50		/* CS2 Base Address (r/w) */
-#define	MCFSIM_CSOR2		0x54		/* CS2 Option (r/w) */
-#define	MCFSIM_CSBR3		0x58		/* CS3 Base Address (r/w) */
-#define	MCFSIM_CSOR3		0x5c		/* CS3 Option (r/w) */
-#define	MCFSIM_CSBR4		0x60		/* CS4 Base Address (r/w) */
-#define	MCFSIM_CSOR4		0x64		/* CS4 Option (r/w) */
-#define	MCFSIM_CSBR5		0x68		/* CS5 Base Address (r/w) */
-#define	MCFSIM_CSOR5		0x6c		/* CS5 Option (r/w) */
-#define	MCFSIM_CSBR6		0x70		/* CS6 Base Address (r/w) */
-#define	MCFSIM_CSOR6		0x74		/* CS6 Option (r/w) */
-#define	MCFSIM_CSBR7		0x78		/* CS7 Base Address (r/w) */
-#define	MCFSIM_CSOR7		0x7c		/* CS7 Option (r/w) */
+#define	MCFSIM_CSBR0		(MCF_MBAR + 0x40)	/* CS0 Base Address */
+#define	MCFSIM_CSOR0		(MCF_MBAR + 0x44)	/* CS0 Option */
+#define	MCFSIM_CSBR1		(MCF_MBAR + 0x48)	/* CS1 Base Address */
+#define	MCFSIM_CSOR1		(MCF_MBAR + 0x4c)	/* CS1 Option */
+#define	MCFSIM_CSBR2		(MCF_MBAR + 0x50)	/* CS2 Base Address */
+#define	MCFSIM_CSOR2		(MCF_MBAR + 0x54)	/* CS2 Option */
+#define	MCFSIM_CSBR3		(MCF_MBAR + 0x58)	/* CS3 Base Address */
+#define	MCFSIM_CSOR3		(MCF_MBAR + 0x5c)	/* CS3 Option */
+#define	MCFSIM_CSBR4		(MCF_MBAR + 0x60)	/* CS4 Base Address */
+#define	MCFSIM_CSOR4		(MCF_MBAR + 0x64)	/* CS4 Option */
+#define	MCFSIM_CSBR5		(MCF_MBAR + 0x68)	/* CS5 Base Address */
+#define	MCFSIM_CSOR5		(MCF_MBAR + 0x6c)	/* CS5 Option */
+#define	MCFSIM_CSBR6		(MCF_MBAR + 0x70)	/* CS6 Base Address */
+#define	MCFSIM_CSOR6		(MCF_MBAR + 0x74)	/* CS6 Option */
+#define	MCFSIM_CSBR7		(MCF_MBAR + 0x78)	/* CS7 Base Address */
+#define	MCFSIM_CSOR7		(MCF_MBAR + 0x7c)	/* CS7 Option */
 
 #define	MCFSIM_SDCR		0x180		/* SDRAM Configuration (r/w) */
 #define	MCFSIM_SDTR		0x184		/* SDRAM Timing (r/w) */
diff --git a/arch/m68k/include/asm/m5307sim.h b/arch/m68k/include/asm/m5307sim.h
index 3f88547..a020718 100644
--- a/arch/m68k/include/asm/m5307sim.h
+++ b/arch/m68k/include/asm/m5307sim.h
@@ -47,47 +47,47 @@
 #define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
 #define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
-#define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
-#define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
-#define MCFSIM_CSCR0		0x8a		/* CS 0 Control reg (r/w) */
-#define MCFSIM_CSAR1		0x8c		/* CS 1 Address reg (r/w) */
-#define MCFSIM_CSMR1		0x90		/* CS 1 Mask reg (r/w) */
-#define MCFSIM_CSCR1		0x96		/* CS 1 Control reg (r/w) */
+#define MCFSIM_CSAR0		(MCF_MBAR + 0x80)	/* CS 0 Address reg */
+#define MCFSIM_CSMR0		(MCF_MBAR + 0x84)	/* CS 0 Mask reg */
+#define MCFSIM_CSCR0		(MCF_MBAR + 0x8a)	/* CS 0 Control reg */
+#define MCFSIM_CSAR1		(MCF_MBAR + 0x8c)	/* CS 1 Address reg */
+#define MCFSIM_CSMR1		(MCF_MBAR + 0x90)	/* CS 1 Mask reg */
+#define MCFSIM_CSCR1		(MCF_MBAR + 0x96)	/* CS 1 Control reg */
 
 #ifdef CONFIG_OLDMASK
-#define MCFSIM_CSBAR		0x98		/* CS Base Address reg (r/w) */
-#define MCFSIM_CSBAMR		0x9c		/* CS Base Mask reg (r/w) */
-#define MCFSIM_CSMR2		0x9e		/* CS 2 Mask reg (r/w) */
-#define MCFSIM_CSCR2		0xa2		/* CS 2 Control reg (r/w) */
-#define MCFSIM_CSMR3		0xaa		/* CS 3 Mask reg (r/w) */
-#define MCFSIM_CSCR3		0xae		/* CS 3 Control reg (r/w) */
-#define MCFSIM_CSMR4		0xb6		/* CS 4 Mask reg (r/w) */
-#define MCFSIM_CSCR4		0xba		/* CS 4 Control reg (r/w) */
-#define MCFSIM_CSMR5		0xc2		/* CS 5 Mask reg (r/w) */
-#define MCFSIM_CSCR5		0xc6		/* CS 5 Control reg (r/w) */
-#define MCFSIM_CSMR6		0xce		/* CS 6 Mask reg (r/w) */
-#define MCFSIM_CSCR6		0xd2		/* CS 6 Control reg (r/w) */
-#define MCFSIM_CSMR7		0xda		/* CS 7 Mask reg (r/w) */
-#define MCFSIM_CSCR7		0xde		/* CS 7 Control reg (r/w) */
+#define MCFSIM_CSBAR		(MCF_MBAR + 0x98)	/* CS Base Address */
+#define MCFSIM_CSBAMR		(MCF_MBAR + 0x9c)	/* CS Base Mask */
+#define MCFSIM_CSMR2		(MCF_MBAR + 0x9e)	/* CS 2 Mask reg */
+#define MCFSIM_CSCR2		(MCF_MBAR + 0xa2)	/* CS 2 Control reg */
+#define MCFSIM_CSMR3		(MCF_MBAR + 0xaa)	/* CS 3 Mask reg */
+#define MCFSIM_CSCR3		(MCF_MBAR + 0xae)	/* CS 3 Control reg */
+#define MCFSIM_CSMR4		(MCF_MBAR + 0xb6)	/* CS 4 Mask reg */
+#define MCFSIM_CSCR4		(MCF_MBAR + 0xba)	/* CS 4 Control reg */
+#define MCFSIM_CSMR5		(MCF_MBAR + 0xc2)	/* CS 5 Mask reg */
+#define MCFSIM_CSCR5		(MCF_MBAR + 0xc6)	/* CS 5 Control reg */
+#define MCFSIM_CSMR6		(MCF_MBAR + 0xce)	/* CS 6 Mask reg */
+#define MCFSIM_CSCR6		(MCF_MBAR + 0xd2)	/* CS 6 Control reg */
+#define MCFSIM_CSMR7		(MCF_MBAR + 0xda)	/* CS 7 Mask reg */
+#define MCFSIM_CSCR7		(MCF_MBAR + 0xde)	/* CS 7 Control reg */
 #else
-#define MCFSIM_CSAR2		0x98		/* CS 2 Address reg (r/w) */
-#define MCFSIM_CSMR2		0x9c		/* CS 2 Mask reg (r/w) */
-#define MCFSIM_CSCR2		0xa2		/* CS 2 Control reg (r/w) */
-#define MCFSIM_CSAR3		0xa4		/* CS 3 Address reg (r/w) */
-#define MCFSIM_CSMR3		0xa8		/* CS 3 Mask reg (r/w) */
-#define MCFSIM_CSCR3		0xae		/* CS 3 Control reg (r/w) */
-#define MCFSIM_CSAR4		0xb0		/* CS 4 Address reg (r/w) */
-#define MCFSIM_CSMR4		0xb4		/* CS 4 Mask reg (r/w) */
-#define MCFSIM_CSCR4		0xba		/* CS 4 Control reg (r/w) */
-#define MCFSIM_CSAR5		0xbc		/* CS 5 Address reg (r/w) */
-#define MCFSIM_CSMR5		0xc0		/* CS 5 Mask reg (r/w) */
-#define MCFSIM_CSCR5		0xc6		/* CS 5 Control reg (r/w) */
-#define MCFSIM_CSAR6		0xc8		/* CS 6 Address reg (r/w) */
-#define MCFSIM_CSMR6		0xcc		/* CS 6 Mask reg (r/w) */
-#define MCFSIM_CSCR6		0xd2		/* CS 6 Control reg (r/w) */
-#define MCFSIM_CSAR7		0xd4		/* CS 7 Address reg (r/w) */
-#define MCFSIM_CSMR7		0xd8		/* CS 7 Mask reg (r/w) */
-#define MCFSIM_CSCR7		0xde		/* CS 7 Control reg (r/w) */
+#define MCFSIM_CSAR2		(MCF_MBAR + 0x98)	/* CS 2 Address reg */
+#define MCFSIM_CSMR2		(MCF_MBAR + 0x9c)	/* CS 2 Mask reg */
+#define MCFSIM_CSCR2		(MCF_MBAR + 0xa2)	/* CS 2 Control reg */
+#define MCFSIM_CSAR3		(MCF_MBAR + 0xa4)	/* CS 3 Address reg */
+#define MCFSIM_CSMR3		(MCF_MBAR + 0xa8)	/* CS 3 Mask reg */
+#define MCFSIM_CSCR3		(MCF_MBAR + 0xae)	/* CS 3 Control reg */
+#define MCFSIM_CSAR4		(MCF_MBAR + 0xb0)	/* CS 4 Address reg */
+#define MCFSIM_CSMR4		(MCF_MBAR + 0xb4)	/* CS 4 Mask reg */
+#define MCFSIM_CSCR4		(MCF_MBAR + 0xba)	/* CS 4 Control reg */
+#define MCFSIM_CSAR5		(MCF_MBAR + 0xbc)	/* CS 5 Address reg */
+#define MCFSIM_CSMR5		(MCF_MBAR + 0xc0)	/* CS 5 Mask reg */
+#define MCFSIM_CSCR5		(MCF_MBAR + 0xc6)	/* CS 5 Control reg */
+#define MCFSIM_CSAR6		(MCF_MBAR + 0xc8)	/* CS 6 Address reg */
+#define MCFSIM_CSMR6		(MCF_MBAR + 0xcc)	/* CS 6 Mask reg */
+#define MCFSIM_CSCR6		(MCF_MBAR + 0xd2)	/* CS 6 Control reg */
+#define MCFSIM_CSAR7		(MCF_MBAR + 0xd4)	/* CS 7 Address reg */
+#define MCFSIM_CSMR7		(MCF_MBAR + 0xd8)	/* CS 7 Mask reg */
+#define MCFSIM_CSCR7		(MCF_MBAR + 0xde)	/* CS 7 Control reg */
 #endif /* CONFIG_OLDMASK */
 
 #define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
diff --git a/arch/m68k/include/asm/m5407sim.h b/arch/m68k/include/asm/m5407sim.h
index 65227bb..e6e48c1 100644
--- a/arch/m68k/include/asm/m5407sim.h
+++ b/arch/m68k/include/asm/m5407sim.h
@@ -47,31 +47,31 @@
 #define	MCFSIM_ICR10		(MCF_MBAR + 0x56)	/* Intr Ctrl reg 10 */
 #define	MCFSIM_ICR11		(MCF_MBAR + 0x57)	/* Intr Ctrl reg 11 */
 
-#define MCFSIM_CSAR0		0x80		/* CS 0 Address 0 reg (r/w) */
-#define MCFSIM_CSMR0		0x84		/* CS 0 Mask 0 reg (r/w) */
-#define MCFSIM_CSCR0		0x8a		/* CS 0 Control reg (r/w) */
-#define MCFSIM_CSAR1		0x8c		/* CS 1 Address reg (r/w) */
-#define MCFSIM_CSMR1		0x90		/* CS 1 Mask reg (r/w) */
-#define MCFSIM_CSCR1		0x96		/* CS 1 Control reg (r/w) */
-
-#define MCFSIM_CSAR2		0x98		/* CS 2 Address reg (r/w) */
-#define MCFSIM_CSMR2		0x9c		/* CS 2 Mask reg (r/w) */
-#define MCFSIM_CSCR2		0xa2		/* CS 2 Control reg (r/w) */
-#define MCFSIM_CSAR3		0xa4		/* CS 3 Address reg (r/w) */
-#define MCFSIM_CSMR3		0xa8		/* CS 3 Mask reg (r/w) */
-#define MCFSIM_CSCR3		0xae		/* CS 3 Control reg (r/w) */
-#define MCFSIM_CSAR4		0xb0		/* CS 4 Address reg (r/w) */
-#define MCFSIM_CSMR4		0xb4		/* CS 4 Mask reg (r/w) */
-#define MCFSIM_CSCR4		0xba		/* CS 4 Control reg (r/w) */
-#define MCFSIM_CSAR5		0xbc		/* CS 5 Address reg (r/w) */
-#define MCFSIM_CSMR5		0xc0		/* CS 5 Mask reg (r/w) */
-#define MCFSIM_CSCR5		0xc6		/* CS 5 Control reg (r/w) */
-#define MCFSIM_CSAR6		0xc8		/* CS 6 Address reg (r/w) */
-#define MCFSIM_CSMR6		0xcc		/* CS 6 Mask reg (r/w) */
-#define MCFSIM_CSCR6		0xd2		/* CS 6 Control reg (r/w) */
-#define MCFSIM_CSAR7		0xd4		/* CS 7 Address reg (r/w) */
-#define MCFSIM_CSMR7		0xd8		/* CS 7 Mask reg (r/w) */
-#define MCFSIM_CSCR7		0xde		/* CS 7 Control reg (r/w) */
+#define MCFSIM_CSAR0		(MCF_MBAR + 0x80)	/* CS 0 Address reg */
+#define MCFSIM_CSMR0		(MCF_MBAR + 0x84)	/* CS 0 Mask reg */
+#define MCFSIM_CSCR0		(MCF_MBAR + 0x8a)	/* CS 0 Control reg */
+#define MCFSIM_CSAR1		(MCF_MBAR + 0x8c)	/* CS 1 Address reg */
+#define MCFSIM_CSMR1		(MCF_MBAR + 0x90)	/* CS 1 Mask reg */
+#define MCFSIM_CSCR1		(MCF_MBAR + 0x96)	/* CS 1 Control reg */
+
+#define MCFSIM_CSAR2		(MCF_MBAR + 0x98)	/* CS 2 Address reg */
+#define MCFSIM_CSMR2		(MCF_MBAR + 0x9c)	/* CS 2 Mask reg */
+#define MCFSIM_CSCR2		(MCF_MBAR + 0xa2)	/* CS 2 Control reg */
+#define MCFSIM_CSAR3		(MCF_MBAR + 0xa4)	/* CS 3 Address reg */
+#define MCFSIM_CSMR3		(MCF_MBAR + 0xa8)	/* CS 3 Mask reg */
+#define MCFSIM_CSCR3		(MCF_MBAR + 0xae)	/* CS 3 Control reg */
+#define MCFSIM_CSAR4		(MCF_MBAR + 0xb0)	/* CS 4 Address reg */
+#define MCFSIM_CSMR4		(MCF_MBAR + 0xb4)	/* CS 4 Mask reg */
+#define MCFSIM_CSCR4		(MCF_MBAR + 0xba)	/* CS 4 Control reg */
+#define MCFSIM_CSAR5		(MCF_MBAR + 0xbc)	/* CS 5 Address reg */
+#define MCFSIM_CSMR5		(MCF_MBAR + 0xc0)	/* CS 5 Mask reg */
+#define MCFSIM_CSCR5		(MCF_MBAR + 0xc6)	/* CS 5 Control reg */
+#define MCFSIM_CSAR6		(MCF_MBAR + 0xc8)	/* CS 6 Address reg */
+#define MCFSIM_CSMR6		(MCF_MBAR + 0xcc)	/* CS 6 Mask reg */
+#define MCFSIM_CSCR6		(MCF_MBAR + 0xd2)	/* CS 6 Control reg */
+#define MCFSIM_CSAR7		(MCF_MBAR + 0xd4)	/* CS 7 Address reg */
+#define MCFSIM_CSMR7		(MCF_MBAR + 0xd8)	/* CS 7 Mask reg */
+#define MCFSIM_CSCR7		(MCF_MBAR + 0xde)	/* CS 7 Control reg */
 
 #define MCFSIM_DCR		(MCF_MBAR + 0x100)	/* DRAM Control */
 #define MCFSIM_DACR0		(MCF_MBAR + 0x108)	/* DRAM 0 Addr/Ctrl */
diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
index b88f571..fa31be2 100644
--- a/arch/m68k/platform/coldfire/head.S
+++ b/arch/m68k/platform/coldfire/head.S
@@ -60,7 +60,7 @@
 
 #elif defined(CONFIG_M5272)
 .macro GET_MEM_SIZE
-	movel	MCF_MBAR+MCFSIM_CSOR7,%d0 /* get SDRAM address mask */
+	movel	MCFSIM_CSOR7,%d0	/* get SDRAM address mask */
 	andil	#0xfffff000,%d0		/* mask out chip select options */
 	negl	%d0			/* negate bits */
 .endm
diff --git a/arch/m68k/platform/coldfire/nettel.c b/arch/m68k/platform/coldfire/nettel.c
index e925ea4..ddc48ec 100644
--- a/arch/m68k/platform/coldfire/nettel.c
+++ b/arch/m68k/platform/coldfire/nettel.c
@@ -121,14 +121,14 @@ static void __init nettel_smc91x_setmac(unsigned int ioaddr, unsigned int flasha
 
 static void __init nettel_smc91x_init(void)
 {
-	writew(0x00ec, MCF_MBAR + MCFSIM_PADDR);
+	writew(0x00ec, MCFSIM_PADDR);
 	mcf_setppdata(0, 0x0080);
 	writew(1, NETTEL_SMC0_ADDR + SMC91xx_BANKSELECT);
 	writew(0x0067, NETTEL_SMC0_ADDR + SMC91xx_BASEADDR);
 	mcf_setppdata(0x0080, 0);
 
 	/* Set correct chip select timing for SMC9196 accesses */
-	writew(0x1180, MCF_MBAR + MCFSIM_CSCR3);
+	writew(0x1180, MCFSIM_CSCR3);
 
 	/* Set the SMC interrupts to be auto-vectored */
 	mcf_autovector(NETTEL_SMC0_IRQ);
-- 
1.7.0.4
