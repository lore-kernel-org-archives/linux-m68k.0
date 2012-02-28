From: <gerg@snapgear.com>
Subject: [PATCH 4/5] m68knommu: make 528x CPU reset register addressing consistent
Date: Tue, 28 Feb 2012 13:58:21 +1000
Message-ID: <1330401502-26250-4-git-send-email-gerg@snapgear.com>
References: <1330401502-26250-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:41213 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754398Ab2B1D4W (ORCPT
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
 arch/m68k/include/asm/m528xsim.h |    4 ++--
 arch/m68k/platform/528x/config.c |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/m528xsim.h b/arch/m68k/include/asm/m528xsim.h
index e4581a4..569476f 100644
--- a/arch/m68k/include/asm/m528xsim.h
+++ b/arch/m68k/include/asm/m528xsim.h
@@ -272,8 +272,8 @@
 /*
  *  Reset Control Unit (relative to IPSBAR).
  */
-#define	MCF_RCR			0x110000
-#define	MCF_RSR			0x110001
+#define	MCF_RCR			(MCF_IPSBAR + 0x110000)
+#define	MCF_RSR			(MCF_IPSBAR + 0x110001)
 
 #define	MCF_RCR_SWRESET		0x80		/* Software reset bit */
 #define	MCF_RCR_FRCSTOUT	0x40		/* Force external reset */
diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 038d13f..957b5c0 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -63,7 +63,7 @@ static void __init m528x_fec_init(void)
 static void m528x_cpu_reset(void)
 {
 	local_irq_disable();
-	__raw_writeb(MCF_RCR_SWRESET, MCF_IPSBAR + MCF_RCR);
+	__raw_writeb(MCF_RCR_SWRESET, MCF_RCR);
 }
 
 /***************************************************************************/
-- 
1.7.0.4
