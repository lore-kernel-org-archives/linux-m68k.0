From: Michael Schmitz <schmitzmic@gmail.com>
Subject: (unknown)
Date: Sun,  1 Jul 2012 16:21:07 +1200 (NZST)
Message-ID: <20120701042107.7E9DC3600FE@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:40175 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727Ab2GAEVM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jul 2012 00:21:12 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so6169091pbb.19
        for <linux-m68k@vger.kernel.org>; Sat, 30 Jun 2012 21:21:12 -0700 (PDT)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org

>From 49748d8106827ed5480dbca37221d5b2e0da8194 Mon Sep 17 00:00:00 2001
From: Michael Schmitz <schmitz@debian.org>
Date: Sat, 30 Jun 2012 15:19:28 +1200
Subject: [PATCH 3/6] [m68k] Atari: add machine specific register access macros in smc91x.h


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/net/ethernet/smsc/smc91x.h |   59 ++++++++++++++++++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index f0256b3..a98ef6d 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -231,6 +231,30 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 
 #include <unit/smc91111.h>
 
+#elif defined(CONFIG_ATARI)
+
+#define SMC_CAN_USE_8BIT        1
+#define SMC_CAN_USE_16BIT       1
+#define SMC_CAN_USE_32BIT       1
+#define SMC_NOWAIT              1
+
+#define writew_be(val, addr)	out_be16((addr), (val))
+
+#define SMC_inb(a, r)           readb((a) + (r))
+#define SMC_inw(a, r)           readw((a) + (r))
+#define SMC_inl(a, r)           readl((a) + (r))
+#define SMC_outb(v, a, r)       writeb(v, (a) + (r))
+#define SMC_outw(v, a, r)       writew(v, (a) + (r))
+#define SMC_outw_be(v, a, r)    writew_be(v, (a) + (r))
+#define SMC_outl(v, a, r)       writel(v, (a) + (r))
+#define SMC_insw(a, r, p, l)    readsw((a) + (r), p, l)
+#define SMC_outsw(a, r, p, l)   writesw((a) + (r), p, l)
+#define SMC_insl(a, r, p, l)    readsl((a) + (r), p, l)
+#define SMC_outsl(a, r, p, l)   writesl((a) + (r), p, l)
+
+#define RPC_LSA_DEFAULT         RPC_LED_100_10
+#define RPC_LSB_DEFAULT         RPC_LED_TX_RX
+
 #elif defined(CONFIG_ARCH_MSM)
 
 #define SMC_CAN_USE_8BIT	0
@@ -1116,6 +1140,40 @@ static const char * chip_ids[ 16 ] =  {
 		}							\
 	} while (0)
 
+#if defined(CONFIG_ATARI)
+/*
+ * MSch: EtherNAT is 32 bit, so the misaligned data buffer hack applies.
+ * This appears to hurt quite a lot ... we actually need to byte swap the
+ * misaligned write because the data end up in the packet buffer swapped
+ * otherwise (resulting in the first two bytes of the target MAC address
+ * being swapped)
+ */
+#define SMC_PUSH_DATA(lp, p, l)					\
+	do {								\
+		if (SMC_32BIT(lp)) {				\
+			void *__ptr = (p);				\
+			int __len = (l);				\
+			void __iomem *__ioaddr = ioaddr;		\
+			if (__len >= 2 && (unsigned long)__ptr & 2) {	\
+				__len -= 2;				\
+				SMC_outw_be(*(u16 *)__ptr, ioaddr,	\
+					DATA_REG(lp));		\
+				__ptr += 2;				\
+			}						\
+			if (SMC_CAN_USE_DATACS && lp->datacs)		\
+				__ioaddr = lp->datacs;			\
+			SMC_outsl(__ioaddr, DATA_REG(lp), __ptr, __len>>2); \
+			if (__len & 2) {				\
+				__ptr += (__len & ~3);			\
+				SMC_outw_be(*((u16 *)__ptr), ioaddr,	\
+					 DATA_REG(lp));		\
+			}						\
+		} else if (SMC_16BIT(lp))				\
+			SMC_outsw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1); \
+		else if (SMC_8BIT(lp))				\
+			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
+	} while (0)
+#else
 #define SMC_PUSH_DATA(lp, p, l)					\
 	do {								\
 		if (SMC_32BIT(lp)) {				\
@@ -1141,6 +1199,7 @@ static const char * chip_ids[ 16 ] =  {
 		else if (SMC_8BIT(lp))				\
 			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
 	} while (0)
+#endif
 
 #define SMC_PULL_DATA(lp, p, l)					\
 	do {								\
-- 
1.7.0.4
