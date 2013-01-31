From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 03/17] [m68k] Atari: use CONFIG_ATARI in smc91x.h
Date: Thu, 31 Jan 2013 13:17:12 +1300 (NZDT)
Message-ID: <20130131001712.C1B1A360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:64972 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753243Ab3AaARS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:17:18 -0500
Received: by mail-pa0-f51.google.com with SMTP id hz1so464925pad.38
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:17:18 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 03/17] [m68k] Atari: use CONFIG_ATARI in smc91x.h


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
