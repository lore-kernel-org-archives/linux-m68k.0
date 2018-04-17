From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v2 1/8] net: ax88796: Fix MAC address reading
Date: Tue, 17 Apr 2018 14:08:08 +1200
Message-ID: <1523930895-6973-2-git-send-email-schmitzmic@gmail.com>
References: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de, Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, Michael Schmitz <schmitzmic@gmail.com>
List-Id: linux-m68k@vger.kernel.org

From: Michael Karcher <debian@mkarcher.dialup.fu-berlin.de>

To read the MAC address from the (virtual) SAprom, the remote DMA
unit needs to be set up like for every other process access to card-local
memory.

Signed-off-by: Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
---
 drivers/net/ethernet/8390/ax88796.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 2455547..2a256aa 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -671,10 +671,16 @@ static int ax_init_dev(struct net_device *dev)
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
