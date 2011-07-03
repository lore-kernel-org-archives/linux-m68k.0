From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: Move forward declaration of do_IRQ() from
 machdep.h to irq.h
Date: Sun, 3 Jul 2011 11:09:57 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1107031108390.6100@ayla.of.borg>
References: <alpine.DEB.2.00.1107031054470.5931@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1107031054470.5931@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: uClinux list <uclinux-dev@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Oops, there's also an asmlinkage missing. Corrected patch below.

>From 63dab1c663875083f095819431bbc6560c2a8dfb Mon Sep 17 00:00:00 2001
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 3 Jul 2011 10:49:58 +0200
Subject: [PATCH] m68knommu: Move forward declaration of do_IRQ() from machdep.h to irq.h

It is not machine-specific, but common irq infrastructure.
Also add the missing asmlinkage, to match its definition.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
I will need this for m68k genirq soon.

 arch/m68k/include/asm/irq.h     |    2 ++
 arch/m68k/include/asm/machdep.h |    1 -
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index ddc5958..abde607 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -160,4 +160,6 @@ extern unsigned int irq_canonicalize(unsigned int irq);
 #define irq_canonicalize(irq)  (irq)
 #endif /* CONFIG_MMU */
 
+asmlinkage void do_IRQ(int irq, struct pt_regs *regs);
+
 #endif /* _M68K_IRQ_H_ */
diff --git a/arch/m68k/include/asm/machdep.h b/arch/m68k/include/asm/machdep.h
index 415d548..789f3b2 100644
--- a/arch/m68k/include/asm/machdep.h
+++ b/arch/m68k/include/asm/machdep.h
@@ -40,6 +40,5 @@ extern unsigned long hw_timer_offset(void);
 extern irqreturn_t arch_timer_interrupt(int irq, void *dummy);
 
 extern void config_BSP(char *command, int len);
-extern void do_IRQ(int irq, struct pt_regs *fp);
 
 #endif /* _M68K_MACHDEP_H */
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
