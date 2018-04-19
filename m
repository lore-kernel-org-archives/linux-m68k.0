From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 2/9] net-next: ax88796: Fix MAC address reading
Date: Thu, 19 Apr 2018 14:05:19 +1200
Message-ID: <1524103526-12240-3-git-send-email-schmitzmic@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>

To read the MAC address from the (virtual) SAprom, the remote DMA
unit needs to be set up like for every other process access to card-local
memory.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index da61cf3..ae39375 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -669,10 +669,16 @@ static int ax_init_dev(struct net_device *dev)
 	if (ax->plat->flags & AXFLG_HAS_EEPROM) {
 		unsigned char SA_prom[32];
 
+		ei_outb(6, ioaddr + EN0_RCNTLO);
+		ei_outb(0, ioaddr + EN0_RCNTHI);
+		ei_outb(0, ioaddr + EN0_RSARLO);
+		ei_outb(0, ioaddr + EN0_RSARHI);
+		ei_outb(E8390_RREAD + E8390_START, ioaddr + NE_CMD);
 		for (i = 0; i < sizeof(SA_prom); i += 2) {
 			SA_prom[i] = ei_inb(ioaddr + NE_DATAPORT);
 			SA_prom[i + 1] = ei_inb(ioaddr + NE_DATAPORT);
 		}
+		ei_outb(ENISR_RDC, ioaddr + EN0_ISR);	/* Ack intr. */
 
 		if (ax->plat->wordlength == 2)
 			for (i = 0; i < 16; i++)
-- 
1.7.0.4
