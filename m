From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 01/12] m68knommu: move ColdFire 5249 MBAR2 definition
Date: Tue, 8 Mar 2011 23:03:58 +1000
Message-ID: <1299589449-24974-2-git-send-email-gerg@uclinux.org>
References: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:51479 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754051Ab1CHNIZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:08:25 -0500
In-Reply-To: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

The MBAR2 register is only used on the ColdFire 5249 part, so move its
definition out of the common coldfire.h and into the 5249 support header.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/coldfire.h |    1 -
 arch/m68k/include/asm/m5249sim.h |    5 +++++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/coldfire.h b/arch/m68k/include/asm/coldfire.h
index 213028c..d70cf0f 100644
--- a/arch/m68k/include/asm/coldfire.h
+++ b/arch/m68k/include/asm/coldfire.h
@@ -31,7 +31,6 @@
  *	This is generally setup by the boards start up code.
  */
 #define	MCF_MBAR	0x10000000
-#define	MCF_MBAR2	0x80000000
 #if defined(CONFIG_M54xx)
 #define	MCF_IPSBAR	MCF_MBAR
 #elif defined(CONFIG_M520x)
diff --git a/arch/m68k/include/asm/m5249sim.h b/arch/m68k/include/asm/m5249sim.h
index 4908b11..6698b05 100644
--- a/arch/m68k/include/asm/m5249sim.h
+++ b/arch/m68k/include/asm/m5249sim.h
@@ -17,6 +17,11 @@
 #include <asm/m52xxacr.h>
 
 /*
+ *	The 5249 has a second MBAR region, define its address.
+ */
+#define	MCF_MBAR2		0x80000000
+
+/*
  *	Define the 5249 SIM register set addresses.
  */
 #define	MCFSIM_RSR		0x00		/* Reset Status reg (r/w) */
-- 
1.7.0.4
