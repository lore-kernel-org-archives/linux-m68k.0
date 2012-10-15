From: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
Subject: [PATCH 4/4 V2] Set ACR1 cache mode depending on kernel configuration.
Date: Mon, 15 Oct 2012 15:22:57 +0200
Message-ID: <1350307377-7459-1-git-send-email-stany.marcel@novasys-ingenierie.com>
References: <1350305680-5441-4-git-send-email-stany.marcel@novasys-ingenierie.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:57732 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753325Ab2JONXH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 15 Oct 2012 09:23:07 -0400
Received: by mail-wg0-f42.google.com with SMTP id fm10so184354wgb.1
        for <linux-m68k@vger.kernel.org>; Mon, 15 Oct 2012 06:23:06 -0700 (PDT)
In-Reply-To: <1350305680-5441-4-git-send-email-stany.marcel@novasys-ingenierie.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: gerg@uclinux.org, Stany MARCEL <stany.marcel@novasys-ingenierie.com>

For coldfire with MMU enabled, data cache did not follow the configuration but
was configured in writethrough mode.

Signed-off-by: Stany MARCEL <stany.marcel@novasys-ingenierie.com>
---

Changes:
  V2: This patch is now independant from the previous one

 arch/m68k/include/asm/m54xxacr.h |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
index 192bbfe..8f932be 100644
--- a/arch/m68k/include/asm/m54xxacr.h
+++ b/arch/m68k/include/asm/m54xxacr.h
@@ -94,14 +94,18 @@
  *	register region as non-cacheable. And then we map all our RAM as
  *	cacheable and supervisor access only.
  */
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
 #else

 /*
--
1.7.9.5
