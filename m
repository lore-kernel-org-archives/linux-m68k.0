From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] net: smc91x: Remove unused definition of SMC_outw_be()
Date: Sun, 11 Jan 2015 23:39:14 +0100
Message-ID: <1421015954-6743-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:44065 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750774AbbAKWjO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Jan 2015 17:39:14 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

As of commit b7e10fc9c1205fc2 ("net: smc91x: Remove Atari special case
handling for SMC_PUSH_DATA") SMC_outw_be() is unused. Remove it.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/smsc/smc91x.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 14c53252a73363c0..be67baf5f6778d08 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -228,7 +228,6 @@ SMC_outw(u16 val, void __iomem *ioaddr, int reg)
 #define SMC_inl(a, r)           readl((a) + (r))
 #define SMC_outb(v, a, r)       writeb(v, (a) + (r))
 #define SMC_outw(v, a, r)       writew(v, (a) + (r))
-#define SMC_outw_be(v, a, r)    writew_be(v, (a) + (r))
 #define SMC_outl(v, a, r)       writel(v, (a) + (r))
 #define SMC_insw(a, r, p, l)    readsw((a) + (r), p, l)
 #define SMC_outsw(a, r, p, l)   writesw((a) + (r), p, l)
-- 
1.9.1
