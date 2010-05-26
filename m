From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/11] m68k: Atari EtherNAT - fix unused flags warnings on UP systems
Date: Wed, 26 May 2010 19:48:46 +0200
Message-ID: <1274896133-19590-5-git-send-email-geert@linux-m68k.org>
References: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:53283 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754822Ab0EZRtS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 26 May 2010 13:49:18 -0400
In-Reply-To: <1274896133-19590-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit fd0775bfc9feb036e6efb669133d644ae29e12b8 ("smc91x: fix unused flags
warnings on UP systems")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 7cfb9d3..40b251c 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -586,9 +586,9 @@ static inline void  smc_rcv(struct net_device *dev)
 #define smc_special_lock(lock, flags)		spin_lock_irqsave(lock, flags)
 #define smc_special_unlock(lock, flags) 	spin_unlock_irqrestore(lock, flags)
 #else
-#define smc_special_trylock(lock, flags)	(1)
-#define smc_special_lock(lock, flags)   	do { } while (0)
-#define smc_special_unlock(lock, flags)	do { } while (0)
+#define smc_special_trylock(lock, flags)	(flags == flags)
+#define smc_special_lock(lock, flags)   	do { flags = 0; } while (0)
+#define smc_special_unlock(lock, flags)	do { flags = 0; } while (0)
 #endif
 
 /*
-- 
1.7.0.4
