From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] m68k: Remove printk statement and add return statement in q40ints.c
Date: Wed, 23 Jul 2014 00:08:35 -0400
Message-ID: <1406088515-4026-1-git-send-email-xerofoify__44968.8558270738$1406088545$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

This removes the printk statement for irqs not defined by the hardware in
function q40_irq_startup and instead returns -ENXIO as stated by the fix
me message.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/m68k/q40/q40ints.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 513f9bb..86f05c0 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -48,8 +48,7 @@ static unsigned int q40_irq_startup(struct irq_data *data)
 	switch (irq) {
 	case 1: case 2: case 8: case 9:
 	case 11: case 12: case 13:
-		printk("%s: ISA IRQ %d not implemented by HW\n", __func__, irq);
-		/* FIXME return -ENXIO; */
+		return -ENXIO;
 	}
 	return 0;
 }
-- 
1.9.1
