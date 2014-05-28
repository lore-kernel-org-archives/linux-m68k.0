From: gerg@uclinux.org
Subject: [PATCH 5/9] m68knommu: add DMA timer base address definitions for ColdFire 528x
Date: Wed, 28 May 2014 10:49:45 +1000
Message-ID: <1401238189-4402-6-git-send-email-gerg@uclinux.org>
References: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas03p.mx.bigpond.com ([61.9.168.143]:24872 "EHLO
	nskntmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752666AbaE1At4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Tue, 27 May 2014 20:49:56 -0400
In-Reply-To: <1401238189-4402-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The Coldfire 528x CPU family also contains the ColdFire DMA Timer hardware
unit. Add address definitions for it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m528xsim.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index cf68ca0..561b6f5 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -194,6 +194,14 @@
 #define	MCFPIT_BASE4		(MCF_IPSBAR + 0x00180000)
 
 /*
+ * DMA timer base addresses.
+ */
+#define MCFDTIM_BASE0		(MCF_IPSBAR + 0x000400)
+#define MCFDTIM_BASE1		(MCF_IPSBAR + 0x000440)
+#define MCFDTIM_BASE2		(MCF_IPSBAR + 0x000480)
+#define MCFDTIM_BASE3		(MCF_IPSBAR + 0x0004C0)
+
+/*
  * 	Edge Port registers
  */
 #define MCFEPORT_EPPAR		(MCF_IPSBAR + 0x00130000)
-- 
1.8.1.4
