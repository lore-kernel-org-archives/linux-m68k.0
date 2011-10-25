From: <gerg@snapgear.com>
Subject: [PATCH 06/36] m68k: modify user space access functions to support ColdFire CPUs
Date: Tue, 25 Oct 2011 17:18:58 +1000
Message-ID: <1319527168-11166-7-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25108 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753226Ab1JYHTV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:21 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Modify the user space access functions to support the ColdFire V4e cores
running with MMU enabled.

The ColdFire processors do not support the "moves" instruction used by
the traditional 680x0 processors for moving data into and out of another
address space. They only support the notion of a single address space,
and you use the usual "move" instruction to access that.

I am interrested in what others think if this approach. It is a little
ugly, but it does mean that the same code is used, not a complete
duplicate that is almost the same except for the "moves" instructions.
It does also mean in this form that it is an either/or compile. It
can't support both ColdFire and 680x0 in the same binary as it is.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/uaccess_mm.h |   42 ++++++++++++++++++++++++-----------
 arch/m68k/lib/uaccess.c            |   22 +++++++++---------
 2 files changed, 40 insertions(+), 24 deletions(-)

diff --git a/arch/m68k/include/asm/uaccess_mm.h b/arch/m68k/include/asm/uaccess_mm.h
index 7107f3f..34e0a30 100644
--- a/arch/m68k/include/asm/uaccess_mm.h
+++ b/arch/m68k/include/asm/uaccess_mm.h
@@ -20,6 +20,22 @@ static inline int access_ok(int type, const void __user *addr,
 	return 1;
 }
 
+#ifdef CONFIG_COLDFIRE
+/*
+ * The ColdFire processors do not support the moves instruction used by
+ * the traditional 680x0 processors for moving data into and out of
+ * another address space. They only support the notion of a single address
+ * space, and you use the usual move instruction to access that.
+ *
+ * All the user space access functions are otherwise the same on ColdFire
+ * as the other 680x0 processors. So lets keep the code simple and just
+ * define in what we need to use.
+ */
+#define	MOVES	"move"
+#else
+#define	MOVES	"moves"
+#endif /* CONFIG_COLDFIRE */
+
 /*
  * The exception table consists of pairs of addresses: the first is the
  * address of an instruction that is allowed to fault, and the second is
@@ -43,7 +59,7 @@ extern int __get_user_bad(void);
 
 #define __put_user_asm(res, x, ptr, bwl, reg, err)	\
 asm volatile ("\n"					\
-	"1:	moves."#bwl"	%2,%1\n"		\
+	"1:	"MOVES"."#bwl"	%2,%1\n"		\
 	"2:\n"						\
 	"	.section .fixup,\"ax\"\n"		\
 	"	.even\n"				\
@@ -83,8 +99,8 @@ asm volatile ("\n"					\
  	    {								\
  		const void __user *__pu_ptr = (ptr);			\
 		asm volatile ("\n"					\
-			"1:	moves.l	%2,(%1)+\n"			\
-			"2:	moves.l	%R2,(%1)\n"			\
+			"1:	"MOVES".l	%2,(%1)+\n"		\
+			"2:	"MOVES".l	%R2,(%1)\n"		\
 			"3:\n"						\
 			"	.section .fixup,\"ax\"\n"		\
 			"	.even\n"				\
@@ -115,12 +131,12 @@ asm volatile ("\n"					\
 #define __get_user_asm(res, x, ptr, type, bwl, reg, err) ({	\
 	type __gu_val;						\
 	asm volatile ("\n"					\
-		"1:	moves."#bwl"	%2,%1\n"		\
+		"1:	"MOVES"."#bwl"	%2,%1\n"		\
 		"2:\n"						\
 		"	.section .fixup,\"ax\"\n"		\
 		"	.even\n"				\
 		"10:	move.l	%3,%0\n"			\
-		"	sub."#bwl"	%1,%1\n"		\
+		"	sub.l	%1,%1\n"			\
 		"	jra	2b\n"				\
 		"	.previous\n"				\
 		"\n"						\
@@ -152,8 +168,8 @@ asm volatile ("\n"					\
  		const void *__gu_ptr = (ptr);				\
  		u64 __gu_val;						\
 		asm volatile ("\n"					\
-			"1:	moves.l	(%2)+,%1\n"			\
-			"2:	moves.l	(%2),%R1\n"			\
+			"1:	"MOVES".l	(%2)+,%1\n"		\
+			"2:	"MOVES".l	(%2),%R1\n"		\
 			"3:\n"						\
 			"	.section .fixup,\"ax\"\n"		\
 			"	.even\n"				\
@@ -188,12 +204,12 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from, unsigned
 
 #define __constant_copy_from_user_asm(res, to, from, tmp, n, s1, s2, s3)\
 	asm volatile ("\n"						\
-		"1:	moves."#s1"	(%2)+,%3\n"			\
+		"1:	"MOVES"."#s1"	(%2)+,%3\n"			\
 		"	move."#s1"	%3,(%1)+\n"			\
-		"2:	moves."#s2"	(%2)+,%3\n"			\
+		"2:	"MOVES"."#s2"	(%2)+,%3\n"			\
 		"	move."#s2"	%3,(%1)+\n"			\
 		"	.ifnc	\""#s3"\",\"\"\n"			\
-		"3:	moves."#s3"	(%2)+,%3\n"			\
+		"3:	"MOVES"."#s3"	(%2)+,%3\n"			\
 		"	move."#s3"	%3,(%1)+\n"			\
 		"	.endif\n"					\
 		"4:\n"							\
@@ -269,13 +285,13 @@ __constant_copy_from_user(void *to, const void __user *from, unsigned long n)
 #define __constant_copy_to_user_asm(res, to, from, tmp, n, s1, s2, s3)	\
 	asm volatile ("\n"						\
 		"	move."#s1"	(%2)+,%3\n"			\
-		"11:	moves."#s1"	%3,(%1)+\n"			\
+		"11:	"MOVES"."#s1"	%3,(%1)+\n"			\
 		"12:	move."#s2"	(%2)+,%3\n"			\
-		"21:	moves."#s2"	%3,(%1)+\n"			\
+		"21:	"MOVES"."#s2"	%3,(%1)+\n"			\
 		"22:\n"							\
 		"	.ifnc	\""#s3"\",\"\"\n"			\
 		"	move."#s3"	(%2)+,%3\n"			\
-		"31:	moves."#s3"	%3,(%1)+\n"			\
+		"31:	"MOVES"."#s3"	%3,(%1)+\n"			\
 		"32:\n"							\
 		"	.endif\n"					\
 		"4:\n"							\
diff --git a/arch/m68k/lib/uaccess.c b/arch/m68k/lib/uaccess.c
index 13854ed..5664386 100644
--- a/arch/m68k/lib/uaccess.c
+++ b/arch/m68k/lib/uaccess.c
@@ -15,17 +15,17 @@ unsigned long __generic_copy_from_user(void *to, const void __user *from,
 	asm volatile ("\n"
 		"	tst.l	%0\n"
 		"	jeq	2f\n"
-		"1:	moves.l	(%1)+,%3\n"
+		"1:	"MOVES".l	(%1)+,%3\n"
 		"	move.l	%3,(%2)+\n"
 		"	subq.l	#1,%0\n"
 		"	jne	1b\n"
 		"2:	btst	#1,%5\n"
 		"	jeq	4f\n"
-		"3:	moves.w	(%1)+,%3\n"
+		"3:	"MOVES".w	(%1)+,%3\n"
 		"	move.w	%3,(%2)+\n"
 		"4:	btst	#0,%5\n"
 		"	jeq	6f\n"
-		"5:	moves.b	(%1)+,%3\n"
+		"5:	"MOVES".b	(%1)+,%3\n"
 		"	move.b  %3,(%2)+\n"
 		"6:\n"
 		"	.section .fixup,\"ax\"\n"
@@ -68,17 +68,17 @@ unsigned long __generic_copy_to_user(void __user *to, const void *from,
 		"	tst.l	%0\n"
 		"	jeq	4f\n"
 		"1:	move.l	(%1)+,%3\n"
-		"2:	moves.l	%3,(%2)+\n"
+		"2:	"MOVES".l	%3,(%2)+\n"
 		"3:	subq.l	#1,%0\n"
 		"	jne	1b\n"
 		"4:	btst	#1,%5\n"
 		"	jeq	6f\n"
 		"	move.w	(%1)+,%3\n"
-		"5:	moves.w	%3,(%2)+\n"
+		"5:	"MOVES".w	%3,(%2)+\n"
 		"6:	btst	#0,%5\n"
 		"	jeq	8f\n"
 		"	move.b	(%1)+,%3\n"
-		"7:	moves.b  %3,(%2)+\n"
+		"7:	"MOVES".b  %3,(%2)+\n"
 		"8:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
@@ -115,7 +115,7 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 		return count;
 
 	asm volatile ("\n"
-		"1:	moves.b	(%2)+,%4\n"
+		"1:	"MOVES".b	(%2)+,%4\n"
 		"	move.b	%4,(%1)+\n"
 		"	jeq	2f\n"
 		"	subq.l	#1,%3\n"
@@ -152,7 +152,7 @@ long strnlen_user(const char __user *src, long n)
 	asm volatile ("\n"
 		"1:	subq.l	#1,%1\n"
 		"	jmi	3f\n"
-		"2:	moves.b	(%0)+,%2\n"
+		"2:	"MOVES".b	(%0)+,%2\n"
 		"	tst.b	%2\n"
 		"	jne	1b\n"
 		"	jra	4f\n"
@@ -188,15 +188,15 @@ unsigned long __clear_user(void __user *to, unsigned long n)
 	asm volatile ("\n"
 		"	tst.l	%0\n"
 		"	jeq	3f\n"
-		"1:	moves.l	%2,(%1)+\n"
+		"1:	"MOVES".l	%2,(%1)+\n"
 		"2:	subq.l	#1,%0\n"
 		"	jne	1b\n"
 		"3:	btst	#1,%4\n"
 		"	jeq	5f\n"
-		"4:	moves.w	%2,(%1)+\n"
+		"4:	"MOVES".w	%2,(%1)+\n"
 		"5:	btst	#0,%4\n"
 		"	jeq	7f\n"
-		"6:	moves.b	%2,(%1)\n"
+		"6:	"MOVES".b	%2,(%1)\n"
 		"7:\n"
 		"	.section .fixup,\"ax\"\n"
 		"	.even\n"
-- 
1.7.0.4
