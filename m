From: <gerg@snapgear.com>
Subject: [PATCH 33/36] m68k: define a ack_bad_irq() function for ColdFire with MMU
Date: Tue, 25 Oct 2011 17:19:25 +1000
Message-ID: <1319527168-11166-34-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25227 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754817Ab1JYHVR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:17 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

With the generic interrupt code we need an ack_bad_irq() function.
Otherwise you get:

  CC      kernel/irq/handle.o
kernel/irq/handle.c: In function =E2=80=98handle_bad_irq=E2=80=99:
kernel/irq/handle.c:34:2: error: implicit declaration of function =E2=80=
=98ack_bad_irq=E2=80=99
make[3]: *** [kernel/irq/handle.o] Error 1

The standard m68k MMU targets don't use generic interrupts yet, so didn=
't
need this.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/hardirq.h |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/include/asm/hardirq.h b/arch/m68k/include/asm/ha=
rdirq.h
index 870e534..f3d175c 100644
--- a/arch/m68k/include/asm/hardirq.h
+++ b/arch/m68k/include/asm/hardirq.h
@@ -25,6 +25,13 @@ typedef struct {
=20
 #include <linux/irq_cpustat.h>	/* Standard mappings for irq_cpustat_t =
above */
=20
+#ifndef ack_bad_irq
+static inline void ack_bad_irq(unsigned int irq)
+{
+	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
+}
+#endif
+
 #else
=20
 #include <asm-generic/hardirq.h>
--=20
1.7.0.4
