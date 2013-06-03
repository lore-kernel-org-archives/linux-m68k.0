From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] M68K: Vector ints need a valid interrupt handler
Date: Mon,  3 Jun 2013 12:53:01 +0200 (CEST)
Message-ID: <20130603105301.30F8E1D018@solo.franken.de>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: geert@linux-m68k.org

To get vectored interrupts working we need to switch from the default
handler handle_bad_irq() to something more sensible. Tested on a MVME177
board.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---

 arch/m68k/kernel/ints.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/ints.c b/arch/m68k/kernel/ints.c
index 6b32b64..4d7da38 100644
--- a/arch/m68k/kernel/ints.c
+++ b/arch/m68k/kernel/ints.c
@@ -101,7 +101,7 @@ void __init m68k_setup_user_interrupt(unsigned int vec, unsigned int cnt)
 	BUG_ON(IRQ_USER + cnt > NR_IRQS);
 	m68k_first_user_vec = vec;
 	for (i = 0; i < cnt; i++)
-		irq_set_chip(IRQ_USER + i, &user_irq_chip);
+		irq_set_chip_and_handler(i, &user_irq_chip, handle_simple_irq);
 	*user_irqvec_fixup = vec - IRQ_USER;
 	flush_icache();
 }
