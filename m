From: gerg@uclinux.org
Subject: [PATCH] m68knommu: fix size of address field for 5272 interrupt controller
Date: Fri, 29 Aug 2014 13:23:32 +1000
Message-ID: <1409282612-5181-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv01p.mx.bigpond.com ([61.9.168.231]:40472 "EHLO
	nskntqsrv01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751578AbaH2DdF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 28 Aug 2014 23:33:05 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Picked up by the 0-day buidler:

All warnings:
>> arch/m68k/coldfire/intc-5272.c:46:20: warning: large integer implicitly truncated to unsigned type [-Woverflow]
     /*MCF_IRQ_EINT1*/ { .icr = MCFSIM_ICR1, .index = 28, .ack = 1, },
...

The problem stems from the changes to make all ColdFire register addresses
absolute, in commit d72a5abb ("make remaining ColdFire 5272 register
definitions absolute"). That change did not take into account that the
addresses were stored as offsets in the irqmap of the intc-5272.c code.
Make the field that now stores register addresses big enough to hold
addresses.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/coldfire/intc-5272.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/intc-5272.c b/arch/m68k/coldfire/intc-5272.c
index d7b6956..d1e2fba 100644
--- a/arch/m68k/coldfire/intc-5272.c
+++ b/arch/m68k/coldfire/intc-5272.c
@@ -36,7 +36,7 @@
  * they also need acknowledging via acknowledge bits.
  */
 struct irqmap {
-	unsigned char	icr;
+	unsigned int	icr;
 	unsigned char	index;
 	unsigned char	ack;
 };
-- 
1.9.1
