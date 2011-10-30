From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 22/27] m68k/sun3: Use the kstat_irqs_cpu() wrapper
Date: Sun, 30 Oct 2011 13:48:30 +0100
Message-ID: <1319978915-10933-23-git-send-email-geert@linux-m68k.org>
References: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1319978915-10933-1-git-send-email-geert@linux-m68k.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Ungerer <gerg@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Sam Creasey <sammy@sammy.net>
---
 arch/m68k/sun3/sun3ints.c |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/sun3/sun3ints.c b/arch/m68k/sun3/sun3ints.c
index 20ffee7..1273eb8 100644
--- a/arch/m68k/sun3/sun3ints.c
+++ b/arch/m68k/sun3/sun3ints.c
@@ -51,14 +51,19 @@ void sun3_disable_irq(unsigned int irq)
 
 static irqreturn_t sun3_int7(int irq, void *dev_id)
 {
+	unsigned int cnt;
+
 	*sun3_intreg |=  (1 << irq);
-	if (!(kstat_cpu(0).irqs[irq] % 2000))
-		sun3_leds(led_pattern[(kstat_cpu(0).irqs[irq] % 16000) / 2000]);
+	cnt = kstat_irqs_cpu(irq, 0);
+	if (!(cnt % 2000))
+		sun3_leds(led_pattern[cnt % 16000 / 2000]);
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t sun3_int5(int irq, void *dev_id)
 {
+	unsigned int cnt;
+
 #ifdef CONFIG_SUN3
 	intersil_clear();
 #endif
@@ -68,8 +73,9 @@ static irqreturn_t sun3_int5(int irq, void *dev_id)
 #endif
 	xtime_update(1);
 	update_process_times(user_mode(get_irq_regs()));
-        if (!(kstat_cpu(0).irqs[irq] % 20))
-                sun3_leds(led_pattern[(kstat_cpu(0).irqs[irq] % 160) / 20]);
+	cnt = kstat_irqs_cpu(irq, 0);
+	if (!(cnt % 20))
+		sun3_leds(led_pattern[cnt % 160 / 20]);
 	return IRQ_HANDLED;
 }
 
-- 
1.7.0.4
