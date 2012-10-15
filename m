From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: [PATCH 4/4] Set ACR1 cache mode depending on kernel configuration.
Date: Mon, 15 Oct 2012 14:54:40 +0200
Message-ID: <1350305680-5441-4-git-send-email-stany.marcel@novasys-ingenierie.com>
References: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:37148 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab2JOMzP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 08:55:15 -0400
Received: by mail-we0-f174.google.com with SMTP id t9so3032046wey.19
        for <linux-m68k@vger.kernel.org>; Mon, 15 Oct 2012 05:55:14 -0700 (PDT)
In-Reply-To: <1350305680-5441-1-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, Stany MARCEL <stany.marcel@novasys-ingenierie.com>

For coldfire with MMU enabled, data cache did not follow the configuration but
was configured in writethrough mode.

Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
---
 arch/m68k/include/asm/m54xxacr.h |   21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
index cac5bcd..8f932be 100644
--- a/arch/m68k/include/asm/m54xxacr.h
+++ b/arch/m68k/include/asm/m54xxacr.h
@@ -94,25 +94,18 @@
  *	register region as non-cacheable. And then we map all our RAM as
  *	cacheable and supervisor access only.
  */
-#ifndef CONFIG_M54xx_DMA_ZONE
-
-#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+ \
+#define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+	\
 			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
+#if defined(CONFIG_CACHE_COPYBACK)
 #define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
-			 ACR_ENABLE+ACR_SUPER+ACR_SP)
+			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_CP)
+#else
+#define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
+			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_WT)
+#endif
 #define ACR2_MODE	0
 #define ACR3_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
 			 ACR_ENABLE+ACR_SUPER+ACR_SP)
-
-#else
-
-#define ACR0_MODE	0xF00FA048
-#define ACR1_MODE	0x000FA028
-#define ACR2_MODE	0x00000000
-#define ACR3_MODE	0x000FA028
-
-#endif /* CONFIG_M54xx_DMA_ZONE */
-
 #else
 
 /*
-- 
1.7.9.5
