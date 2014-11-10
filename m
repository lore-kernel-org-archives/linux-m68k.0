From: gerg@uclinux.org
Subject: [PATCH] m68knommu: fix irq handler types in 68360/commproc.c
Date: Mon, 10 Nov 2014 11:58:40 +1000
Message-ID: <1415584720-21704-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas03p.mx.bigpond.com ([61.9.168.143]:59131 "EHLO
	nskntmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751942AbaKJB7A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Nov 2014 20:59:00 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

=46rom: Greg Ungerer <gerg@uclinux.org>

Compilation of arch/m68k/68360/commproc.c fails with the following erro=
rs:

arch/m68k/68360/commproc.c:75:1: error: function declaration isn=E2=80=99=
t a prototype
arch/m68k/68360/commproc.c:211:1: error: function declaration isn=E2=80=
=99t a prototype
arch/m68k/68360/commproc.c: In function =E2=80=98cpm_install_handler=E2=
=80=99:
arch/m68k/68360/commproc.c:214:2: warning: passing argument 2 of =E2=80=
=98request_irq=E2=80=99 from incompatible pointer type
include/linux/interrupt.h:128:1: note: expected =E2=80=98irq_handler_t=E2=
=80=99 but argument is of type =E2=80=98void (*)()=E2=80=99

It should be using the proper irq hander type, irq_handler_t. Modify it
to use that.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/68360/commproc.c       | 8 ++++----
 arch/m68k/include/asm/commproc.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/68360/commproc.c b/arch/m68k/68360/commproc.c
index 315727b..14d7f35 100644
--- a/arch/m68k/68360/commproc.c
+++ b/arch/m68k/68360/commproc.c
@@ -64,15 +64,15 @@ QUICC  *pquicc;
=20
 /* CPM interrupt vector functions. */
 struct	cpm_action {
-	void	(*handler)(void *);
-	void	*dev_id;
+	irq_handler_t	handler;
+	void		*dev_id;
 };
 static	struct	cpm_action cpm_vecs[CPMVEC_NR];
 static	void	cpm_interrupt(int irq, void * dev, struct pt_regs * regs);
 static	void	cpm_error_interrupt(void *);
=20
 /* prototypes: */
-void cpm_install_handler(int vec, void (*handler)(), void *dev_id);
+void cpm_install_handler(int vec, irq_handler_t handler, void *dev_id)=
;
 void m360_cpm_reset(void);
=20
=20
@@ -208,7 +208,7 @@ cpm_error_interrupt(void *dev)
 /* Install a CPM interrupt handler.
 */
 void
-cpm_install_handler(int vec, void (*handler)(), void *dev_id)
+cpm_install_handler(int vec, irq_handler_t handler, void *dev_id)
 {
=20
 	request_irq(vec, handler, 0, "timer", dev_id);
diff --git a/arch/m68k/include/asm/commproc.h b/arch/m68k/include/asm/c=
ommproc.h
index c67e092..f41c968 100644
--- a/arch/m68k/include/asm/commproc.h
+++ b/arch/m68k/include/asm/commproc.h
@@ -649,7 +649,7 @@ typedef struct scc_trans {
 /* #define	CPMVEC_PIO_PC4		((ushort)0x01) */
 /* #define	CPMVEC_ERROR		((ushort)0x00) */
=20
-extern void cpm_install_handler(int vec, void (*handler)(void *), void=
 *dev_id);
+extern void cpm_install_handler(int vec, irq_handler_t handler, void *=
dev_id);
=20
 /* CPM interrupt configuration vector.
 */
--=20
1.9.1
