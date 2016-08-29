From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 3/8] m68k: report correct FPU type on ColdFire MMU platforms
Date: Mon, 29 Aug 2016 21:43:19 +1000
Message-ID: <1472471004-4580-4-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49458
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932628AbcH2LmS (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:18 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Not all ColdFire SoC parts that have an MMU also have an FPU - so set
an FPU type (via m68k_fputype) appropriate for the configured platform.

With this set correctly /proc/cpuinfo will report FPU "none" on devices
that don't have one. And kernel code paths that initialize FPU hardware
will now only execute if an FPU is actually present.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/head.S         | 4 ++--
 arch/m68k/include/asm/m5441xsim.h | 1 +
 arch/m68k/include/asm/m54xxsim.h  | 1 +
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
index 4ba5d562..bdb472c 100644
--- a/arch/m68k/coldfire/head.S
+++ b/arch/m68k/coldfire/head.S
@@ -280,8 +280,8 @@ _clear_bss:
 	movel	%d0,m68k_cputype		/* Mark us as a ColdFire */
 	movel	#MMU_COLDFIRE,%d0
 	movel	%d0,m68k_mmutype
-	movel	#FPU_COLDFIRE,%d0
-	movel	%d0,m68k_fputype
+	movel	#FPUTYPE,%d0
+	movel	%d0,m68k_fputype		/* Mark FPU type */
 	movel	#MACHINE,%d0
 	movel	%d0,m68k_machtype		/* Mark machine type */
 	lea	init_task,%a2			/* Set "current" init task */
diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 60768b5..4279c0d 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -11,6 +11,7 @@
 #define CPU_INSTR_PER_JIFFY	2
 #define MCF_BUSCLK		(MCF_CLK / 2)
 #define MACHINE			MACH_M5441X
+#define FPUTYPE			0
 
 #include <asm/m54xxacr.h>
 
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index cde0390..7dd6cc4 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -9,6 +9,7 @@
 #define	CPU_INSTR_PER_JIFFY	2
 #define	MCF_BUSCLK		(MCF_CLK / 2)
 #define	MACHINE			MACH_M54XX
+#define	FPUTYPE			FPU_COLDFIRE
 
 #include <asm/m54xxacr.h>
 
-- 
1.9.1
