From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68knommu: Use generic show_interrupts()
Date: Sat, 30 Apr 2011 23:15:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104302312320.24942@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>

Apart from whitespace differences, /proc/interrupts doesn't change by
enabling GENERIC_IRQ_SHOW.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
_not_ tested on m68knommu.
Observations done on work-in-progress Atari genirq.

 arch/m68k/Kconfig      |    1 +
 arch/m68k/kernel/irq.c |   28 ----------------------------
 2 files changed, 1 insertions(+), 28 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index dee2796..c23af0a 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -5,6 +5,7 @@ config M68K
 	select HAVE_AOUT if MMU
 	select GENERIC_ATOMIC64 if MMU
 	select HAVE_GENERIC_HARDIRQS if !MMU
+	select GENERIC_IRQ_SHOW if !MMU
 
 config RWSEM_GENERIC_SPINLOCK
 	bool
diff --git a/arch/m68k/kernel/irq.c b/arch/m68k/kernel/irq.c
index 15dbc3e..544b871 100644
--- a/arch/m68k/kernel/irq.c
+++ b/arch/m68k/kernel/irq.c
@@ -28,31 +28,3 @@ asmlinkage void do_IRQ(int irq, struct pt_regs *regs)
 
 	set_irq_regs(oldregs);
 }
-
-int show_interrupts(struct seq_file *p, void *v)
-{
-	struct irqaction *ap;
-	int irq = *((loff_t *) v);
-
-	if (irq == 0)
-		seq_puts(p, "           CPU0\n");
-
-	if (irq < NR_IRQS) {
-		struct irq_desc *desc = irq_to_desc(irq);
-
-		ap = desc->action;
-		if (ap) {
-			seq_printf(p, "%3d: ", irq);
-			seq_printf(p, "%10u ", kstat_irqs(irq));
-			seq_printf(p, "%14s  ", irq_desc_get_chip(desc)->name);
-
-			seq_printf(p, "%s", ap->name);
-			for (ap = ap->next; ap; ap = ap->next)
-				seq_printf(p, ", %s", ap->name);
-			seq_putc(p, '\n');
-		}
-	}
-
-	return 0;
-}
-
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
