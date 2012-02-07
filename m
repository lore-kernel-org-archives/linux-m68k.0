From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: remove reduntant definitions of _ramvec
Date: Tue, 7 Feb 2012 12:06:56 +1000
Message-ID: <1328580416-12386-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:33077 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754537Ab2BGCIL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Feb 2012 21:08:11 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The base of the real RAM resident hardware vectors, _ramvec, is declared in
our asm/traps.h. No need to have local declarations spread around in other
files that use this. So remove them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/68328/ints.c       |    2 --
 arch/m68k/platform/68360/ints.c       |    2 --
 arch/m68k/platform/coldfire/vectors.c |    2 --
 3 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/platform/68328/ints.c b/arch/m68k/platform/68328/ints.c
index 4bd4565..b3810fe 100644
--- a/arch/m68k/platform/68328/ints.c
+++ b/arch/m68k/platform/68328/ints.c
@@ -68,8 +68,6 @@ asmlinkage irqreturn_t inthandler5(void);
 asmlinkage irqreturn_t inthandler6(void);
 asmlinkage irqreturn_t inthandler7(void);
 
-extern e_vector *_ramvec;
-
 /* The 68k family did not have a good way to determine the source
  * of interrupts until later in the family.  The EC000 core does
  * not provide the vector number on the stack, we vector everything
diff --git a/arch/m68k/platform/68360/ints.c b/arch/m68k/platform/68360/ints.c
index 7b40202..8cd4269 100644
--- a/arch/m68k/platform/68360/ints.c
+++ b/arch/m68k/platform/68360/ints.c
@@ -32,8 +32,6 @@ asmlinkage void trap(void);
 asmlinkage void bad_interrupt(void);
 asmlinkage void inthandler(void);
 
-extern void *_ramvec[];
-
 static void intc_irq_unmask(struct irq_data *d)
 {
 	pquicc->intr_cimr |= (1 << d->irq);
diff --git a/arch/m68k/platform/coldfire/vectors.c b/arch/m68k/platform/coldfire/vectors.c
index 3a7cc52..a4dbdec 100644
--- a/arch/m68k/platform/coldfire/vectors.c
+++ b/arch/m68k/platform/coldfire/vectors.c
@@ -33,8 +33,6 @@ asmlinkage void dbginterrupt_c(struct frame *fp)
 
 /***************************************************************************/
 
-extern e_vector	*_ramvec;
-
 /* Assembler routines */
 asmlinkage void buserr(void);
 asmlinkage void trap(void);
-- 
1.7.0.4
