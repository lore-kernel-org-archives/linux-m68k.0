From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 5/8] m68k: generalize io memory region setup for ColdFire ACR registers
Date: Mon, 29 Aug 2016 21:43:21 +1000
Message-ID: <1472471004-4580-6-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49463
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932808AbcH2LmT (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:19 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The ACR registers of the ColdFire define at a macro level what regions
of the addresses space should have caching or other attribute types applied.

Currently for the MMU enabled setups we map the interal IO peripheral addres
space as uncachable based on the define for the MBAR address (CONFIG_MBAR).
Not all ColdFire SoC use a programmable MBAR register address. Some parts
have fixed addressing for their internal peripheral registers.

Generalize the way we get the internal peripheral base address so all types
can be accomodated in the ACR definitions. Each ColdFire SoC type now sets
its IO memory base and size definitions (which may be based on MBAR) which
are then used in the ACR definitions.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/m5441xsim.h | 2 ++
 arch/m68k/include/asm/m54xxacr.h  | 2 +-
 arch/m68k/include/asm/m54xxsim.h  | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/m5441xsim.h b/arch/m68k/include/asm/m5441xsim.h
index 4279c0d..64f60be 100644
--- a/arch/m68k/include/asm/m5441xsim.h
+++ b/arch/m68k/include/asm/m5441xsim.h
@@ -12,6 +12,8 @@
 #define MCF_BUSCLK		(MCF_CLK / 2)
 #define MACHINE			MACH_M5441X
 #define FPUTYPE			0
+#define IOMEMBASE		0xe0000000
+#define IOMEMSIZE		0x20000000
 
 #include <asm/m54xxacr.h>
 
diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
index 59e1710..c6ac05c 100644
--- a/arch/m68k/include/asm/m54xxacr.h
+++ b/arch/m68k/include/asm/m54xxacr.h
@@ -94,7 +94,7 @@
  *	register region as non-cacheable. And then we map all our RAM as
  *	cacheable and supervisor access only.
  */
-#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+ \
+#define ACR0_MODE	(ACR_BA(IOMEMBASE)+ACR_ADMSK(IOMEMSIZE)+ \
 			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
 #if defined(CONFIG_CACHE_COPYBACK)
 #define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
diff --git a/arch/m68k/include/asm/m54xxsim.h b/arch/m68k/include/asm/m54xxsim.h
index 7dd6cc4..73d937f 100644
--- a/arch/m68k/include/asm/m54xxsim.h
+++ b/arch/m68k/include/asm/m54xxsim.h
@@ -10,6 +10,8 @@
 #define	MCF_BUSCLK		(MCF_CLK / 2)
 #define	MACHINE			MACH_M54XX
 #define	FPUTYPE			FPU_COLDFIRE
+#define	IOMEMBASE		MCF_MBAR
+#define	IOMEMSIZE		0x01000000
 
 #include <asm/m54xxacr.h>
 
-- 
1.9.1
