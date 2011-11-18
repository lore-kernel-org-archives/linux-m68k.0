From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix ColdFire slice timer to handle clock counter wrapping
Date: Fri, 18 Nov 2011 16:32:27 +1000
Message-ID: <1321597947-23758-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:15342 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756701Ab1KRGcE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Nov 2011 01:32:04 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The read function for the ColdFire slice timer doesn't deal with the 
hardware timer count register wrapping while we are reading it to get an
accurate snapshot of the time.

Re-read the timer a second time and see if it has wrapped, adjust the
total count as required.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/sltimers.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/platform/coldfire/sltimers.c b/arch/m68k/platform/coldfire/sltimers.c
index b7f822b..1249367 100644
--- a/arch/m68k/platform/coldfire/sltimers.c
+++ b/arch/m68k/platform/coldfire/sltimers.c
@@ -98,16 +98,17 @@ static struct irqaction mcfslt_timer_irq = {
 static cycle_t mcfslt_read_clk(struct clocksource *cs)
 {
 	unsigned long flags;
-	u32 cycles;
-	u16 scnt;
+	u32 cycles, scnt;
 
 	local_irq_save(flags);
 	scnt = __raw_readl(TA(MCFSLT_SCNT));
 	cycles = mcfslt_cnt;
+	if (scnt < __raw_readl(TA(MCFSLT_SCNT)))
+		cycles += mcfslt_cycles_per_jiffy;
 	local_irq_restore(flags);
 
 	/* subtract because slice timers count down */
-	return cycles - scnt;
+	return cycles + ((mcfslt_cycles_per_jiffy - 1) - scnt);
 }
 
 static struct clocksource mcfslt_clk = {
-- 
1.7.0.4
