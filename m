From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 5/8] m68k: m5441x: fix ACR0 base address when MBAR is not present
Date: Wed,  8 Jul 2015 11:51:29 +0200
Message-ID: <1436349092-2214-6-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:33197 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934232AbbGHJvx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:53 -0400
Received: by wiwl6 with SMTP id l6so339206223wiw.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:52 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.51
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:51 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/include/asm/m54xxacr.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
index 6d13cae..e79f48e 100644
--- a/arch/m68k/include/asm/m54xxacr.h
+++ b/arch/m68k/include/asm/m54xxacr.h
@@ -94,8 +94,20 @@
  *	register region as non-cacheable. And then we map all our RAM as
  *	cacheable and supervisor access only.
  */
+#ifdef CONFIG_M5441x
+/*
+ * MBAR register is not present in this serie
+ *  Periph #0 in 0xe0000000--0x0xefffffff
+ *  Periph #1 in 0xf0000000--0x0xffffffff
+ *
+ * Let's hardcode these values for ACR0
+ */
+#define ACR0_MODE	(ACR_BA(0xE0000000)+ACR_ADMSK(0x20000000)+ \
+			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
+#else
 #define ACR0_MODE	(ACR_BA(CONFIG_MBAR)+ACR_ADMSK(0x1000000)+ \
 			 ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
+#endif
 #if defined(CONFIG_CACHE_COPYBACK)
 #define ACR1_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
 			 ACR_ENABLE+ACR_SUPER+ACR_SP+ACR_CM_CP)
@@ -106,7 +118,6 @@
 #define ACR2_MODE	0
 #define ACR3_MODE	(ACR_BA(CONFIG_RAMBASE)+ACR_ADMSK(CONFIG_RAMSIZE)+ \
 			 ACR_ENABLE+ACR_SUPER+ACR_SP)
-
 #else
 
 /*
-- 
1.9.1.286.g5172cb3
