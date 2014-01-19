From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] net: smc91x: Remove accidentally introduced casts
Date: Sun, 19 Jan 2014 11:10:52 +0100
Message-ID: <1390126252-14672-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from baptiste.telenet-ops.be ([195.130.132.51]:33575 "EHLO
	baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbaASKP7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 19 Jan 2014 05:15:59 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@debian.org>, linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

arm/lpd270_defconfig:

    drivers/net/ethernet/smsc/smc91x.c: In function 'smc_rcv':
    drivers/net/ethernet/smsc/smc91x.c:490:3: warning: passing argument 5 of 'smc_pxa_dma_insw' from incompatible pointer type [enabled by default]
    drivers/net/ethernet/smsc/smc91x.h:423:1: note: expected 'u_char *' but argument is of type 'u16 *'

Introduced by commit afb3df11f1c8925811a1087f2351b0738a3146a2 ("m68k: Atari
EtherNAT warning fixes").

Remove two casts to fix this:
  - The first cast was in the !CONFIG_ATARI case, so it didn't matter for
    us anyway,
  - The second cast is for a pointer parameter we don't do arithmetic
    operations on, so it's also not needed.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/ethernet/smsc/smc91x.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 68ad0769ad9c..27a5fdf5b250 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -1179,7 +1179,7 @@ static const char * chip_ids[ 16 ] =  {
 				SMC_outsw(ioaddr, DATA_REG(lp), __ptr, 1); \
 			}						\
 		} else if (SMC_16BIT(lp))				\
-			SMC_outsw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1);	\
+			SMC_outsw(ioaddr, DATA_REG(lp), p, (l) >> 1);	\
 		else if (SMC_8BIT(lp))				\
 			SMC_outsb(ioaddr, DATA_REG(lp), p, l);	\
 	} while (0)
@@ -1215,7 +1215,7 @@ static const char * chip_ids[ 16 ] =  {
 			__len += 2;					\
 			SMC_insl(__ioaddr, DATA_REG(lp), __ptr, __len>>2); \
 		} else if (SMC_16BIT(lp))				\
-			SMC_insw(ioaddr, DATA_REG(lp), (u16 *) p, (l) >> 1);	\
+			SMC_insw(ioaddr, DATA_REG(lp), p, (l) >> 1);	\
 		else if (SMC_8BIT(lp))				\
 			SMC_insb(ioaddr, DATA_REG(lp), p, l);		\
 	} while (0)
-- 
1.7.9.5
