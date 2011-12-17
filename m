From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: [PATCH] m68k/irq: don't use pr_crit in an header
Date: Sat, 17 Dec 2011 21:09:52 +0100
Message-ID: <1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, debian-kernel@lists.debian.org, linux-m68k@vger.kernel.org, Thorsten Glaser <tg@debian.org>

Using pr_crit in an header results in funny messages. Consider

	#define pr_fmt(fmt) "mydriver: " fmt
	#include <linux/hardirq.h>

which makes the message from ack_bad_irq

	mydriver: unexpected IRQ trap...

so better use plain printk with KERN_CRIT directly.

This fixes a build problem on m68k with aufs3 en passant because the
latter builds with

	ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__=
func__,__LINE__,current->comm,current->pid'

without providing AUFS_NAME early enough for ack_bad_irq (which is the
problem of aufs).

Cc: Thorsten Glaser <tg@debian.org>
Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
---
 arch/m68k/include/asm/hardirq.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/hardirq.h b/arch/m68k/include/asm/ha=
rdirq.h
index db30ed2..1f652e0 100644
--- a/arch/m68k/include/asm/hardirq.h
+++ b/arch/m68k/include/asm/hardirq.h
@@ -20,7 +20,7 @@
=20
 static inline void ack_bad_irq(unsigned int irq)
 {
-	pr_crit("unexpected IRQ trap at vector %02x\n", irq);
+	printk(KERN_CRIT "unexpected IRQ trap at vector %02x\n", irq);
 }
=20
 /* entry.S is sensitive to the offsets of these fields */
--=20
1.7.7.3
