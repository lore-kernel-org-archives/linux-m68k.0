From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: fix 68328 local setting of timer interrupt handler
Date: Fri, 8 Jun 2012 15:26:32 +1000
Message-ID: <1339133192-13094-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:59182 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933493Ab2FHF2G convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Jun 2012 01:28:06 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Compiling for 68328 based targets fails with:

    arch/m68k/platform/68328/timers.c: In function =E2=80=98hw_tick=E2=80=
=99:
    arch/m68k/platform/68328/timers.c:65:2: error: implicit declaration=
 of function =E2=80=98arch_timer_interrupt=E2=80=99
    arch/m68k/platform/68328/timers.c: At top level:
    arch/m68k/platform/68328/timers.c:102:6: error: conflicting types f=
or =E2=80=98hw_timer_init=E2=80=99
    arch/m68k/include/asm/machdep.h:36:13: note: previous declaration o=
f =E2=80=98hw_timer_init=E2=80=99 was here

Changes made to hw_timer_init() didn't get updated in the 68328 timer c=
ode.
So process and call the "handler" arg that is now passed into that
hw_timer_init() function.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/68328/timers.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/platform/68328/timers.c b/arch/m68k/platform/683=
28/timers.c
index c801c17..f4dc9b2 100644
--- a/arch/m68k/platform/68328/timers.c
+++ b/arch/m68k/platform/68328/timers.c
@@ -53,6 +53,7 @@
 #endif
=20
 static u32 m68328_tick_cnt;
+static irq_handler_t timer_interrupt;
=20
 /*********************************************************************=
******/
=20
@@ -62,7 +63,7 @@ static irqreturn_t hw_tick(int irq, void *dummy)
 	TSTAT &=3D 0;
=20
 	m68328_tick_cnt +=3D TICKS_PER_JIFFY;
-	return arch_timer_interrupt(irq, dummy);
+	return timer_interrupt(irq, dummy);
 }
=20
 /*********************************************************************=
******/
@@ -99,7 +100,7 @@ static struct clocksource m68328_clk =3D {
=20
 /*********************************************************************=
******/
=20
-void hw_timer_init(void)
+void hw_timer_init(irq_handler_t handler)
 {
 	/* disable timer 1 */
 	TCTL =3D 0;
@@ -115,6 +116,7 @@ void hw_timer_init(void)
 	/* Enable timer 1 */
 	TCTL |=3D TCTL_TEN;
 	clocksource_register_hz(&m68328_clk, TICKS_PER_JIFFY*HZ);
+	timer_interrupt =3D handler;
 }
=20
 /*********************************************************************=
******/
--=20
1.7.0.4
