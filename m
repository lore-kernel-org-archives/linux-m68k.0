From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: irq_node.handler() should return irqreturn_t
Date: Thu, 26 Mar 2009 09:54:37 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0903260953180.21047@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Sender: linux-next-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

commit b5dc7840b3ebe9c7967dd8ba73db957767009ff9 ("m68k: introduce irq
controller") reverted the return type of struct irq_node.handler() from
irqreturn_t to int. Change it back to irqreturn_t, else it will give a
compiler warning when irqreturn_t is turned into an enum in the near future:

| arch/m68k/kernel/ints.c:231: warning: assignment from incompatible pointer type

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
We already hit the warning in linux-next, which has commit
bedd30d986a05e32dc3eab874e4b9ed8a38058bb ("genirq: make irqreturn_t an enum")

 arch/m68k/include/asm/irq_mm.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/irq_mm.h b/arch/m68k/include/asm/irq_mm.h
index 226bfc0..0cab42c 100644
--- a/arch/m68k/include/asm/irq_mm.h
+++ b/arch/m68k/include/asm/irq_mm.h
@@ -3,6 +3,7 @@
 
 #include <linux/linkage.h>
 #include <linux/hardirq.h>
+#include <linux/irqreturn.h>
 #include <linux/spinlock_types.h>
 
 /*
@@ -80,7 +81,7 @@ struct pt_regs;
  * interrupt source (if it supports chaining).
  */
 typedef struct irq_node {
-	int		(*handler)(int, void *);
+	irqreturn_t	(*handler)(int, void *);
 	void		*dev_id;
 	struct irq_node *next;
 	unsigned long	flags;
-- 
1.6.2


Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
