From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] Fixes q40_irq_startup to return -ENXIO
Date: Sun, 29 Jun 2014 23:06:50 -0400
Message-ID: <1404097610-5739-1-git-send-email-xerofoify__13577.8496777222$1404097649$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Fixes q40_irq_startup to return -ENXIO for cases 11-13 in the switch
statement of this function to handle these failure cases.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/m68k/q40/q40ints.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 513f9bb..9dfa1ea 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -49,7 +49,7 @@ static unsigned int q40_irq_startup(struct irq_data *data)
 	case 1: case 2: case 8: case 9:
 	case 11: case 12: case 13:
 		printk("%s: ISA IRQ %d not implemented by HW\n", __func__, irq);
-		/* FIXME return -ENXIO; */
+		return -ENXIO;
 	}
 	return 0;
 }
-- 
1.9.1
