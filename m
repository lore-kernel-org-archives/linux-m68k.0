From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: correctly use trap_init
Date: Mon, 27 Jun 2011 12:03:49 +1000
Message-ID: <1309140229-20253-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <uclinux-dev-bounces@uclinux.org>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

Currently trap_init() is an empty function for m68knommu. Instead
the vectors are being setup as part of the IRQ initialization.
This is inconsistent with m68k and other architectures.

Change the local init_vectors() to be trap_init(), and init the
vectors at the correct time during startup. This will help merge of
m68k and m68knommu trap code in the furture.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/traps.h           |    1 -
 arch/m68k/kernel/traps_no.c             |    4 ----
 arch/m68k/platform/5272/intc.c          |    2 --
 arch/m68k/platform/68328/ints.c         |    7 ++++++-
 arch/m68k/platform/68360/ints.c         |    8 ++++++--
 arch/m68k/platform/coldfire/intc-2.c    |    2 --
 arch/m68k/platform/coldfire/intc-simr.c |    2 --
 arch/m68k/platform/coldfire/intc.c      |    1 -
 arch/m68k/platform/coldfire/vectors.c   |   10 +---------
 9 files changed, 13 insertions(+), 24 deletions(-)

diff --git a/arch/m68k/include/asm/traps.h b/arch/m68k/include/asm/traps.h
index 0bffb17..151068f 100644
--- a/arch/m68k/include/asm/traps.h
+++ b/arch/m68k/include/asm/traps.h
@@ -22,7 +22,6 @@ extern e_vector vectors[];
 asmlinkage void auto_inthandler(void);
 asmlinkage void user_inthandler(void);
 asmlinkage void bad_inthandler(void);
-extern void init_vectors(void);
 
 #endif
 
diff --git a/arch/m68k/kernel/traps_no.c b/arch/m68k/kernel/traps_no.c
index a768008..e67b8c8 100644
--- a/arch/m68k/kernel/traps_no.c
+++ b/arch/m68k/kernel/traps_no.c
@@ -60,10 +60,6 @@ static char const * const vec_names[] = {
 	"MMU CONFIGURATION ERROR"
 };
 
-void __init trap_init(void)
-{
-}
-
 void die_if_kernel(char *str, struct pt_regs *fp, int nr)
 {
 	if (!(fp->sr & PS_S))
diff --git a/arch/m68k/platform/5272/intc.c b/arch/m68k/platform/5272/intc.c
index 7e715df..7160e61 100644
--- a/arch/m68k/platform/5272/intc.c
+++ b/arch/m68k/platform/5272/intc.c
@@ -162,8 +162,6 @@ void __init init_IRQ(void)
 {
 	int irq, edge;
 
-	init_vectors();
-
 	/* Mask all interrupt sources */
 	writel(0x88888888, MCF_MBAR + MCFSIM_ICR1);
 	writel(0x88888888, MCF_MBAR + MCFSIM_ICR2);
diff --git a/arch/m68k/platform/68328/ints.c b/arch/m68k/platform/68328/ints.c
index a90288c..22acb60 100644
--- a/arch/m68k/platform/68328/ints.c
+++ b/arch/m68k/platform/68328/ints.c
@@ -155,7 +155,7 @@ static struct irq_chip intc_irq_chip = {
  * This function should be called during kernel startup to initialize
  * the machine vector table.
  */
-void __init init_IRQ(void)
+void __init trap_init(void)
 {
 	int i;
 
@@ -172,6 +172,11 @@ void __init init_IRQ(void)
 	_ramvec[69] = (e_vector) inthandler5;
 	_ramvec[70] = (e_vector) inthandler6;
 	_ramvec[71] = (e_vector) inthandler7;
+}
+
+void __init init_IRQ(void)
+{
+	int i;
 
 	IVR = 0x40; /* Set DragonBall IVR (interrupt base) to 64 */
 
diff --git a/arch/m68k/platform/68360/ints.c b/arch/m68k/platform/68360/ints.c
index 4af0f4e..4444382 100644
--- a/arch/m68k/platform/68360/ints.c
+++ b/arch/m68k/platform/68360/ints.c
@@ -63,9 +63,8 @@ static struct irq_chip intc_irq_chip = {
  * This function should be called during kernel startup to initialize
  * the vector table.
  */
-void init_IRQ(void)
+void __init trap_init(void)
 {
-	int i;
 	int vba = (CPM_VECTOR_BASE<<4);
 
 	/* set up the vectors */
@@ -130,6 +129,11 @@ void init_IRQ(void)
 
 	/* turn off all CPM interrupts */
 	pquicc->intr_cimr = 0x00000000;
+}
+
+void init_IRQ(void)
+{
+	int i;
 
 	for (i = 0; (i < NR_IRQS); i++) {
 		irq_set_chip(i, &intc_irq_chip);
diff --git a/arch/m68k/platform/coldfire/intc-2.c b/arch/m68k/platform/coldfire/intc-2.c
index 74b55cf..9950933 100644
--- a/arch/m68k/platform/coldfire/intc-2.c
+++ b/arch/m68k/platform/coldfire/intc-2.c
@@ -194,8 +194,6 @@ void __init init_IRQ(void)
 {
 	int irq;
 
-	init_vectors();
-
 	/* Mask all interrupt sources */
 	__raw_writel(0x1, MCFICM_INTC0 + MCFINTC_IMRL);
 #ifdef MCFICM_INTC1
diff --git a/arch/m68k/platform/coldfire/intc-simr.c b/arch/m68k/platform/coldfire/intc-simr.c
index d6a4d9d..650d52e 100644
--- a/arch/m68k/platform/coldfire/intc-simr.c
+++ b/arch/m68k/platform/coldfire/intc-simr.c
@@ -171,8 +171,6 @@ void __init init_IRQ(void)
 {
 	int irq, eirq;
 
-	init_vectors();
-
 	/* Mask all interrupt sources */
 	__raw_writeb(0xff, MCFINTC0_SIMR);
 	if (MCFINTC1_SIMR)
diff --git a/arch/m68k/platform/coldfire/intc.c b/arch/m68k/platform/coldfire/intc.c
index 0bbb414..5c0c150 100644
--- a/arch/m68k/platform/coldfire/intc.c
+++ b/arch/m68k/platform/coldfire/intc.c
@@ -139,7 +139,6 @@ void __init init_IRQ(void)
 {
 	int irq;
 
-	init_vectors();
 	mcf_maskimr(0xffffffff);
 
 	for (irq = 0; (irq < NR_IRQS); irq++) {
diff --git a/arch/m68k/platform/coldfire/vectors.c b/arch/m68k/platform/coldfire/vectors.c
index a21d3f8..3a7cc52 100644
--- a/arch/m68k/platform/coldfire/vectors.c
+++ b/arch/m68k/platform/coldfire/vectors.c
@@ -35,21 +35,13 @@ asmlinkage void dbginterrupt_c(struct frame *fp)
 
 extern e_vector	*_ramvec;
 
-void set_evector(int vecnum, void (*handler)(void))
-{
-	if (vecnum >= 0 && vecnum <= 255)
-		_ramvec[vecnum] = handler;
-}
-
-/***************************************************************************/
-
 /* Assembler routines */
 asmlinkage void buserr(void);
 asmlinkage void trap(void);
 asmlinkage void system_call(void);
 asmlinkage void inthandler(void);
 
-void __init init_vectors(void)
+void __init trap_init(void)
 {
 	int i;
 
-- 
1.7.0.4

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
