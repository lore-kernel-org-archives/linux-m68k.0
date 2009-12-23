From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Atari EtherNAT - fix compilation on SMP
Date: Wed, 23 Dec 2009 20:15:47 +0100
Message-ID: <1261595749-23531-4-git-send-email-geert@linux-m68k.org>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 0b4f2928f14c4a9770b0866923fc81beb7f4aa57 ("smc91x: fix compilation
on SMP")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 1da485f..b71367d 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -583,7 +583,7 @@ static inline void  smc_rcv(struct net_device *dev)
 		local_irq_restore(flags);				\
 	__ret;								\
 })
-#define smc_special_lock(lock, flags)		spin_lock_irq(lock, flags)
+#define smc_special_lock(lock, flags)		spin_lock_irqsave(lock, flags)
 #define smc_special_unlock(lock, flags) 	spin_unlock_irqrestore(lock, flags)
 #else
 #define smc_special_trylock(lock, flags)	(1)
-- 
1.6.0.4
