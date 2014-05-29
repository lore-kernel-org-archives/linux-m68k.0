From: gerg@uclinux.org
Subject: [PATCH] m68knommu: enable clock when using PIT
	hardware module
Date: Thu, 29 May 2014 10:58:25 +1000
Message-ID: <1401325105-29742-1-git-send-email-gerg@uclinux.org>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/options/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
 <mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Errors-To: uclinux-dev-bounces@uclinux.org
Sender: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

Acquire the SoC clock when using the PIT timer hardware module. It seems
to be powered up and enabled by default on most ColdFire SoC, but this
just makes sure that is true.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/pit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/m68k/platform/coldfire/pit.c b/arch/m68k/platform/coldfire/pit.c
index 493b311..4b122e3 100644
--- a/arch/m68k/platform/coldfire/pit.c
+++ b/arch/m68k/platform/coldfire/pit.c
@@ -17,6 +17,7 @@
 #include <linux/param.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/clockchips.h>
 #include <asm/machdep.h>
@@ -151,6 +152,12 @@ static struct clocksource pit_clk = {
 
 void hw_timer_init(irq_handler_t handler)
 {
+	struct clk *clk;
+
+	clk = clk_get(NULL, "mcfpit.0");
+	if (clk)
+		clk_enable(clk);
+
 	cf_pit_clockevent.cpumask = cpumask_of(smp_processor_id());
 	cf_pit_clockevent.mult = div_sc(FREQ, NSEC_PER_SEC, 32);
 	cf_pit_clockevent.max_delta_ns =
-- 
1.8.1.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
