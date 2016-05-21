From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0171/1529] Fix typo
Date: Sat, 21 May 2016 13:58:30 +0200
Message-ID: <20160521115830.8693-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/q40/q40ints.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/q40/q40ints.c b/arch/m68k/q40/q40ints.c
index 513f9bb..51991bc 100644
--- a/arch/m68k/q40/q40ints.c
+++ b/arch/m68k/q40/q40ints.c
@@ -287,7 +287,7 @@ static void q40_irq_handler(unsigned int irq, struct pt_regs *fp)
 	}
  iirq:
 	mir = master_inb(IIRQ_REG);
-	/* should test whether keyboard irq is really enabled, doing it in defhand */
+	/* should test whether keyboard irq is really enabled, doing it in defend */
 	if (mir & Q40_IRQ_KEYB_MASK)
 		do_IRQ(Q40_IRQ_KEYBOARD, fp);
 
-- 
2.8.2.534.g1f66975
