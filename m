From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH] m68k/atari - smc91x: remove Atari special case handling for SMC_PUSH_DATA
Date: Mon,  1 Dec 2014 07:58:02 +1300
Message-ID: <1417373882-22011-1-git-send-email-schmitzmic@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f51.google.com ([209.85.220.51]:63292 "EHLO
	mail-pa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751830AbaK3S6M (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Nov 2014 13:58:12 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so9545103pad.24
        for <linux-m68k@vger.kernel.org>; Sun, 30 Nov 2014 10:58:12 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, debian-68k@lists.debian.org, Michael Schmitz <schmitzmic@gmail.com>, Michael Schmitz <schmitz@debian.org>

Use of string accessors for unaligned writes (see mainstream commit
e9e4ea74f06635f2ffc1dffe5ef40c854faa0a90) have fixed the swapped
first unaligned byte problem for the Atari EtherNAT. Drop the
redundant special case code now.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
Tested-by: Christian Steigies <cts@debian.org>
---
 drivers/net/ethernet/smsc/smc91x.h |   37 ------------------------------------
 1 files changed, 0 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 3a8069f..14c5325 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -223,8 +223,6 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define SMC_CAN_USE_32BIT       1
 #define SMC_NOWAIT              1
 
-#define writew_be(val, addr) out_be16((addr), (val))
-
 #define SMC_inb(a, r)           readb((a) + (r))
 #define SMC_inw(a, r)           readw((a) + (r))
 #define SMC_inl(a, r)           readl((a) + (r))
@@ -1128,40 +1126,6 @@ static const char * chip_ids[ 16 ] =  {
 		}							\
 	} while (0)
 
-#if defined(CONFIG_ATARI)
-/*
- * MSch: EtherNAT is 32 bit, so the misaligned data buffer hack applies.
- * This appears to hurt quite a lot ... we actually need to byte swap the
- * misaligned write because the data end up in the packet buffer swapped
- * otherwise (resulting in the first two bytes of the target MAC address
- * being swapped)
- */
-#define SMC_PUSH_DATA(lp, p, l)					\
-	do {								\
-		if (SMC_32BIT(lp)) {				\
-			void *__ptr = (p);				\
-			int __len = (l);				\
-			void __iomem *__ioaddr = ioaddr;		\
-			if (__len >= 2 && (unsigned long)__ptr & 2) {	\
-				__len -= 2;				\
-				SMC_outw_be(*(u16 *)__ptr, ioaddr,	\
-					DATA_REG(lp));		\
-				__ptr += 2;				\
-			}						\
-			if (SMC_CAN_USE_DATACS && lp->datacs)		\
-				__ioaddr = lp->datacs;			\
-			SMC_outsl(__ioaddr, DATA_REG(lp), __ptr, __len>>2); \
-			if (__len & 2) {				\
-				__ptr += (__len & ~3);			\
-				SMC_outw_be(*((u16 *)__ptr), ioaddr,	\
-					 DATA_REG(lp));		\
-			}						\
-		} else if (SMC_16BIT(lp))				\
-			SMC_outsw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1); \
-		else if (SMC_8BIT(lp))				\
-			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
-	} while (0)
-#else
 #define SMC_PUSH_DATA(lp, p, l)					\
 	do {								\
 		if (SMC_32BIT(lp)) {				\
@@ -1185,7 +1149,6 @@ static const char * chip_ids[ 16 ] =  {
 		else if (SMC_8BIT(lp))				\
 			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
 	} while (0)
-#endif
 
 #define SMC_PULL_DATA(lp, p, l)					\
 	do {								\
-- 
1.7.0.4
