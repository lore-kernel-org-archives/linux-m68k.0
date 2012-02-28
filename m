From: <gerg@snapgear.com>
Subject: [PATCH 3/5] m68knommu: make 527x CPU reset register addressing consistent
Date: Tue, 28 Feb 2012 13:58:20 +1000
Message-ID: <1330401502-26250-3-git-send-email-gerg@snapgear.com>
References: <1330401502-26250-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:41212 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519Ab2B1D4W (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2012 22:56:22 -0500
In-Reply-To: <1330401502-26250-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

If we make all MCF_RCR (CPU reset register) addressing consistent across all
ColdFire CPU family members that use it then we will be able to remove the
duplicated copies of the code that use it.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m527xsim.h |    4 ++--
 arch/m68k/platform/527x/config.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/m527xsim.h b/arch/m68k/include/asm/m527xsim.h
index f1c5b2c..83db810 100644
--- a/arch/m68k/include/asm/m527xsim.h
+++ b/arch/m68k/include/asm/m527xsim.h
@@ -328,8 +328,8 @@
 /*
  *  Reset Control Unit (relative to IPSBAR).
  */
-#define	MCF_RCR			0x110000
-#define	MCF_RSR			0x110001
+#define	MCF_RCR			(MCF_IPSBAR + 0x110000)
+#define	MCF_RSR			(MCF_IPSBAR + 0x110001)
 
 #define	MCF_RCR_SWRESET		0x80		/* Software reset bit */
 #define	MCF_RCR_FRCSTOUT	0x40		/* Force external reset */
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 00f77ba..51a3095 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -90,7 +90,7 @@ static void __init m527x_fec_init(void)
 static void m527x_cpu_reset(void)
 {
 	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_IPSBAR + MCF_RCR);
+	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
