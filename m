From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Atari EtherNAT - let smc91x work well under netpoll
Date: Wed, 23 Dec 2009 20:15:46 +0100
Message-ID: <1261595749-23531-3-git-send-email-geert@linux-m68k.org>
References: <1261595749-23531-1-git-send-email-geert@linux-m68k.org>
 <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1261595749-23531-2-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Cfr. commit 8ff499e43c537648399fca8ba39d24c0768b3fab ("smc91x: let smc91x work
well under netpoll")

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/net/atari_91C111.c |   40 ++++++++++++++++++++++------------------
 1 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/atari_91C111.c b/drivers/net/atari_91C111.c
index 86dbe19..1da485f 100644
--- a/drivers/net/atari_91C111.c
+++ b/drivers/net/atari_91C111.c
@@ -228,21 +228,23 @@ static void PRINT_PKT(u_char *buf, int length)
 /* this enables an interrupt in the interrupt mask register */
 #define SMC_ENABLE_INT(lp, x) do {					\
 	unsigned char mask;						\
-	spin_lock_irq(&lp->lock);					\
+	unsigned long smc_enable_flags;					\
+	spin_lock_irqsave(&lp->lock, smc_enable_flags);			\
 	mask = SMC_GET_INT_MASK(lp);					\
 	mask |= (x);							\
 	SMC_SET_INT_MASK(lp, mask);					\
-	spin_unlock_irq(&lp->lock);					\
+	spin_unlock_irqrestore(&lp->lock, smc_enable_flags);		\
 } while (0)
 
 /* this disables an interrupt from the interrupt mask register */
 #define SMC_DISABLE_INT(lp, x) do {					\
 	unsigned char mask;						\
-	spin_lock_irq(&lp->lock);					\
+	unsigned long smc_disable_flags;				\
+	spin_lock_irqsave(&lp->lock, smc_disable_flags);		\
 	mask = SMC_GET_INT_MASK(lp);					\
 	mask &= ~(x);							\
 	SMC_SET_INT_MASK(lp, mask);					\
-	spin_unlock_irq(&lp->lock);					\
+	spin_unlock_irqrestore(&lp->lock, smc_disable_flags);		\
 } while (0)
 
 /*
@@ -572,21 +574,21 @@ static inline void  smc_rcv(struct net_device *dev)
  * any other concurrent access and C would always interrupt B. But life
  * isn't that easy in a SMP world...
  */
-#define smc_special_trylock(lock)					\
+#define smc_special_trylock(lock, flags)				\
 ({									\
 	int __ret;							\
-	local_irq_disable();						\
+	local_irq_save(flags);						\
 	__ret = spin_trylock(lock);					\
 	if (!__ret)							\
-		local_irq_enable();					\
+		local_irq_restore(flags);				\
 	__ret;								\
 })
-#define smc_special_lock(lock)		spin_lock_irq(lock)
-#define smc_special_unlock(lock)	spin_unlock_irq(lock)
+#define smc_special_lock(lock, flags)		spin_lock_irq(lock, flags)
+#define smc_special_unlock(lock, flags) 	spin_unlock_irqrestore(lock, flags)
 #else
-#define smc_special_trylock(lock)	(1)
-#define smc_special_lock(lock)		do { } while (0)
-#define smc_special_unlock(lock)	do { } while (0)
+#define smc_special_trylock(lock, flags)	(1)
+#define smc_special_lock(lock, flags)   	do { } while (0)
+#define smc_special_unlock(lock, flags)	do { } while (0)
 #endif
 
 /*
@@ -604,10 +606,11 @@ static void smc_hardware_send_pkt(unsigned long data)
 	struct sk_buff *skb;
 	unsigned int packet_no, len;
 	unsigned char *buf;
+	unsigned long flags;
 
 	DBG(3, "%s: %s\n", dev->name, __func__);
 
-	if (!smc_special_trylock(&lp->lock)) {
+	if (!smc_special_trylock(&lp->lock, flags)) {
 		netif_stop_queue(dev);
 		tasklet_schedule(&lp->tx_task);
 		return;
@@ -615,7 +618,7 @@ static void smc_hardware_send_pkt(unsigned long data)
 
 	skb = lp->pending_tx_skb;
 	if (unlikely(!skb)) {
-		smc_special_unlock(&lp->lock);
+		smc_special_unlock(&lp->lock, flags);
 		return;
 	}
 	lp->pending_tx_skb = NULL;
@@ -625,7 +628,7 @@ static void smc_hardware_send_pkt(unsigned long data)
 		printk("%s: Memory allocation failed.\n", dev->name);
 		dev->stats.tx_errors++;
 		dev->stats.tx_fifo_errors++;
-		smc_special_unlock(&lp->lock);
+		smc_special_unlock(&lp->lock, flags);
 		goto done;
 	}
 
@@ -664,7 +667,7 @@ static void smc_hardware_send_pkt(unsigned long data)
 
 	/* queue the packet for TX */
 	SMC_SET_MMU_CMD(lp, MC_ENQUEUE);
-	smc_special_unlock(&lp->lock);
+	smc_special_unlock(&lp->lock, flags);
 
 	dev->trans_start = jiffies;
 	dev->stats.tx_packets++;
@@ -689,6 +692,7 @@ static int smc_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct smc_local *lp = netdev_priv(dev);
 	void __iomem *ioaddr = lp->base;
 	unsigned int numPages, poll_count, status;
+	unsigned long flags;
 
 	DBG(3, "%s: %s\n", dev->name, __func__);
 
@@ -714,7 +718,7 @@ static int smc_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		return NETDEV_TX_OK;
 	}
 
-	smc_special_lock(&lp->lock);
+	smc_special_lock(&lp->lock, flags);
 
 	/* now, try to allocate the memory */
 	SMC_SET_MMU_CMD(lp, MC_ALLOC | numPages);
@@ -732,7 +736,7 @@ static int smc_hard_start_xmit(struct sk_buff *skb, struct net_device *dev)
 		}
    	} while (--poll_count);
 
-	smc_special_unlock(&lp->lock);
+	smc_special_unlock(&lp->lock, flags);
 
 	lp->pending_tx_skb = skb;
    	if (!poll_count) {
-- 
1.6.0.4
