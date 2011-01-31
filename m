From: maximilian attems <max@stro.at>
Subject: (fwd) Re: [klibc] Bug#334917: [PATCH] Re: klibc barfs on m68k
 syscall interface
Date: Mon, 31 Jan 2011 11:50:18 +0100
Message-ID: <20110131105017.GC4655@stro.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, klibc@zytor.com, Thorsten Glaser <tg@mirbsd.de>

Hello,

It be cool if belows patch could be reviewed by a m68k Maintainer.
It should apply to latest klibc git, which can be found on
git clone git://git.kernel.org/pub/scm/libs/klibc/klibc.git

klibc is most easiest to compile against a linux-2.6 configured tree with
make  KLIBCKERNELSRC=`pwd`/../linux-2.6

master klibc should built fine on m68k, but is not know to work:
http://bugs.debian.org/334917

thank you.

-- 
maks

----- Forwarded message from Thorsten Glaser <tg@mirbsd.de> -----

>From 9dcefd83262364ecf00b51663f5a1c16a1f2540a Mon Sep 17 00:00:00 2001
From: Thorsten Glaser <tg@mirbsd.de>
Date: Sat, 29 Jan 2011 17:19:10 +0000
Subject: [PATCH] Fix m68k syscall API and support 6-argument syscalls.

Debian: (Closes: #334917)

Signed-off-by: Thorsten Glaser <tg@mirbsd.de>
---
 usr/klibc/arch/m68k/syscall.S |   42 +++++++++++++++++++++++++++++++++-------
 usr/klibc/arch/m68k/vfork.S   |   13 +++--------
 2 files changed, 38 insertions(+), 17 deletions(-)

diff --git a/usr/klibc/arch/m68k/syscall.S b/usr/klibc/arch/m68k/syscall.S
index 966c92d..f468678 100644
--- a/usr/klibc/arch/m68k/syscall.S
+++ b/usr/klibc/arch/m68k/syscall.S
@@ -11,17 +11,43 @@
 	.globl	__syscall_common
 	.type	__syscall_common, @function
 __syscall_common:
-	movem.l %d2-%d6, -(%sp)	/* 5 registers saved */
-	movem.l	24(%sp), %d1-%d6
+	/*
+	 * According to eglibc, separate moves are faster than movem;
+	 * speed is important and this code is not duplicated anyway,
+	 * so we do the same here. We use %a1 as scratch register for
+	 * saving; syscall arguments are to be in %d1 to %d5 and %a0.
+	 */
+	move.l	24(%sp), %a0		/* orig.sp+24: arg 6 */
+	move.l	%d5, -(%sp)		/* push d5 (callee saved) */
+	move.l	24(%sp), %d5		/* orig.sp+20: arg 5 */
+	move.l	%d4, -(%sp)		/* push d4 (callee saved) */
+	move.l	24(%sp), %d4		/* orig.sp+16: arg 4 */
+	move.l	%d3, -(%sp)		/* push d3 (callee saved) */
+	move.l	24(%sp), %d3		/* orig.sp+12: arg 3 */
+	move.l	%d2, %a1		/* save d2 (callee saved) in a1 */
+	move.l	20(%sp), %d2		/* orig.sp+8:  arg 2 */
+	move.l	16(%sp), %d1		/* orig.sp+4:  arg 1 */
 	trap	#0
-	cmpi.l	#-4095, %d0
-	blt.l	1f
+	move.l	%a1, %d2		/* restore d2 from a1 (scratch) */
+	move.l	(%sp)+, %d3		/* pop d3..d5, see above */
+	move.l	(%sp)+, %d4
+	move.l	(%sp)+, %d5
+
+	/* syscall is done, result in %d0, registers are restored */
+	.globl	__syscall_checkandout
+__syscall_checkandout:
+	/* now check for error */
+	cmp.l	#-4095, %d0
+	bcs.l	1f			/* jmp short if _not_ error */
+
+	/* prepare for error return */
 	neg.l	%d0
 	move.l	%d0, (errno)
-	moveq	#-1, %d0
-1:
-	movea.l	%d0, %a0	/* Redundant return */
-	movem.l (%sp)+, %d2-%d6 /* Restore registers */
+	move.l	#-1, %d0
+	/* fallthrough to common return path */
+
+1:	/* copy return value to %a0 for syscalls returning pointers */
+	move.l	%d0, %a0
 	rts
 
 	.size	__syscall_common,.-__syscall_common
diff --git a/usr/klibc/arch/m68k/vfork.S b/usr/klibc/arch/m68k/vfork.S
index a3a7e44..ec8baeb 100644
--- a/usr/klibc/arch/m68k/vfork.S
+++ b/usr/klibc/arch/m68k/vfork.S
@@ -15,14 +15,9 @@ vfork:
 	move.l	(%sp)+, %d1		/* Return address */
 	move.l	# __NR_vfork, %d0
 	trap	#0
-	move.l	%d1, -(%sp)
-	cmpi.l	#-4095, %d0
-	blt.l	1f
-	neg.l	%d0
-	move.l	%d0, (errno)
-	moveq	#-1, %d0
-1:
-	movea.l	%d0, %a0
-	rts
+	move.l	%d1, -(%sp)		/* restore stack */
+
+	/* common code from syscall.S */
+	bra	__syscall_checkandout
 
 	.size	vfork, .-vfork
-- 
1.7.2.3
