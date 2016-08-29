From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 2/8] m68k: set appropriate machine type for m5411x SoC platforms
Date: Mon, 29 Aug 2016 21:43:18 +1000
Message-ID: <1472471004-4580-3-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49463
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932808AbcH2LmR (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:17 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Create a new machine type for platforms based around the ColdFire 5441x
SoC family. Set that machine type on startup when building for this
platform type.

Currently the ColdFire head.S hard codes a M54xx machine type at startup -
since that is the only platform type currently supported with MMU enabled.
The m5441x has an MMU and this change forms part of the support required
to run it with the MMU enabled.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/head.S             | 4 ++--
 arch/m68k/include/asm/m5441xsim.h     | 1 +
 arch/m68k/include/asm/m54xxsim.h      | 1 +
 arch/m68k/include/uapi/asm/bootinfo.h | 1 +
 arch/m68k/kernel/setup_mm.c           | 1 +
 5 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
index 73d92ea..4ba5d562 100644
--- a/arch/m68k/coldfire/head.S
+++ b/arch/m68k/coldfire/head.S
@@ -282,8 +282,8 @@ _clear_bss:
 	movel	%d0,m68k_mmutype
 	movel	#FPU_COLDFIRE,%d0
 	movel	%d0,m68k_fputype
-	movel	#MACH_M54XX,%d0
-	movel	%d0,m68k_machtype		/* Mark us as a 54xx machine */
+	movel	#MACHINE,%d0
+	movel	%d0,m68k_machtype		/* Mark machine type */
 	lea	init_task,%a2			/* Set "current" init task */
 #endif
 
diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index cc798ab..60768b5 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -10,6 +10,7 @@
 #define CPU_NAME		"COLDFIRE(m5441x)"
 #define CPU_INSTR_PER_JIFFY	2
 #define MCF_BUSCLK		(MCF_CLK / 2)
+#define MACHINE			MACH_M5441X
 
 #include <asm/m54xxacr.h>
 
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index a5fbd17..cde0390 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -8,6 +8,7 @@
 #define	CPU_NAME		"COLDFIRE(m54xx)"
 #define	CPU_INSTR_PER_JIFFY	2
 #define	MCF_BUSCLK		(MCF_CLK / 2)
+#define	MACHINE			MACH_M54XX
 
 #include <asm/m54xxacr.h>
 
diff --git a/arch/m68k/include/uapi/asm/bootinfo.h b/arch/m68k/include/uapi/asm/bootinfo.h
index cdeb26a0..a48cf54 100644
--- a/arch/m68k/include/uapi/asm/bootinfo.h
+++ b/arch/m68k/include/uapi/asm/bootinfo.h
@@ -81,6 +81,7 @@ struct mem_info {
 #define MACH_Q40		10
 #define MACH_SUN3X		11
 #define MACH_M54XX		12
+#define MACH_M5441X		13
 
 
     /*
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 5b8ec4d..13f4640 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -341,6 +341,7 @@ void __init setup_arch(char **cmdline_p)
 #endif
 #ifdef CONFIG_COLDFIRE
 	case MACH_M54XX:
+	case MACH_M5441X:
 		config_BSP(NULL, 0);
 		break;
 #endif
-- 
1.9.1
