From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 03/14] m68k/atari: use CONFIG_ATARI in smc91x.h
Date: Mon, 25 Mar 2013 14:16:21 +1300
Message-ID: <1364174192-25406-4-git-send-email-schmitz@debian.org>
References: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f42.google.com ([209.85.210.42]:55234 "EHLO
	mail-da0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756496Ab3CYBQy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Mar 2013 21:16:54 -0400
Received: by mail-da0-f42.google.com with SMTP id n15so2974150dad.1
        for <linux-m68k@vger.kernel.org>; Sun, 24 Mar 2013 18:16:53 -0700 (PDT)
In-Reply-To: <1364174192-25406-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org, Michael Schmitz <schmitz@debian.org>

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/net/ethernet/smsc/smc91x.h |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index f0f950c..528f7ba 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -231,7 +231,7 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 
 #include <unit/smc91111.h>
 
-#elif defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_MODULE)
+#elif defined(CONFIG_ATARI)
 
 #define SMC_CAN_USE_8BIT        1
 #define SMC_CAN_USE_16BIT       1
@@ -255,8 +255,6 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define RPC_LSA_DEFAULT         RPC_LED_100_10
 #define RPC_LSB_DEFAULT         RPC_LED_TX_RX
 
-#define SMC_DYNAMIC_BUS_CONFIG
-
 #elif defined(CONFIG_ARCH_MSM)
 
 #define SMC_CAN_USE_8BIT	0
@@ -1142,7 +1140,7 @@ static const char * chip_ids[ 16 ] =  {
 		}							\
 	} while (0)
 
-#if defined(CONFIG_ATARI_ETHERNAT) || defined(CONFIG_ATARI_ETHERNAT_MODULE)
+#if defined(CONFIG_ATARI)
 /*
  * MSch: EtherNAT is 32 bit, so the misaligned data buffer hack applies.
  * This appears to hurt quite a lot ... we actually need to byte swap the
-- 
1.7.0.4
