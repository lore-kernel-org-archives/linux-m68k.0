From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/5] parport: parport_atari: Remove obsolete IRQ_TYPE_SLOW
Date: Mon, 12 Jan 2015 09:40:18 +0100
Message-ID: <1421052021-12560-3-git-send-email-geert__46600.2861423933$1421052115$gmane$org@linux-m68k.org>
References: <1421052021-12560-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1421052021-12560-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-parport@lists.infradead.org

IRQ_TYPE_SLOW is no longer used by the Atari platform interrupt code
since commit 734085651c9b80aa ("[PATCH] m68k: convert atari irq code")
in v2.6.18-rc1, so drop it.

Note that its value has been reused for a different purpose
(IRQ_TYPE_NONE) since commit 6a6de9ef5850d063 ("[PATCH] genirq: core")
in v2.6.18-rc1.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-parport@lists.infradead.org
---
 drivers/parport/parport_atari.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/parport/parport_atari.c b/drivers/parport/parport_atari.c
index 7ad59ac68cf69eab..a81cd2a2747f71a1 100644
--- a/drivers/parport/parport_atari.c
+++ b/drivers/parport/parport_atari.c
@@ -192,8 +192,8 @@ static int __init parport_atari_init(void)
 					  &parport_atari_ops);
 		if (!p)
 			return -ENODEV;
-		if (request_irq(IRQ_MFP_BUSY, parport_irq_handler,
-				IRQ_TYPE_SLOW, p->name, p)) {
+		if (request_irq(IRQ_MFP_BUSY, parport_irq_handler, 0, p->name,
+				p)) {
 			parport_put_port (p);
 			return -ENODEV;
 		}
-- 
1.9.1
