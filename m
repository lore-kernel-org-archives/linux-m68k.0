From: gerg@uclinux.org
Subject: [PATCH 3/9] m68knommu: add DMA timer base address definitions for ColdFire 523x
Date: Wed, 28 May 2014 10:49:43 +1000
Message-ID: <1401238189-4402-4-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas04p.mx.bigpond.com ([61.9.168.146]:47274 "EHLO
	nskntmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752068AbaE1Atz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:55 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The Coldfire 523x CPU family also contains the ColdFire DMA Timer hardware
unit. Add address definitions for it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m523xsim.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/m68k/include/asm/m523xsim.h b/arch/m68k/include/asm/m523xsim.h
index 5e06b4e..2d06b1e 100644
--- a/arch/m68k/include/asm/m523xsim.h
+++ b/arch/m68k/include/asm/m523xsim.h
@@ -164,6 +164,14 @@
 #define	MCFPIT_BASE4		(MCF_IPSBAR + 0x180000)
 
 /*
+ * DMA timer base addresses.
+ */
+#define MCFDTIM_BASE0		(MCF_IPSBAR + 0x000400)
+#define MCFDTIM_BASE1		(MCF_IPSBAR + 0x000440)
+#define MCFDTIM_BASE2		(MCF_IPSBAR + 0x000480)
+#define MCFDTIM_BASE3		(MCF_IPSBAR + 0x0004C0)
+
+/*
  * EPort
  */
 #define MCFEPORT_EPPAR		(MCF_IPSBAR + 0x130000)
-- 
1.8.1.4
