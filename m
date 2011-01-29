From: Thorsten Glaser <tg@mirbsd.org>
Subject: [PATCH] fix m68k support
Date: Sat, 29 Jan 2011 17:19:10 +0000
Message-ID: <201201290049.q0T0nKsw030673@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:21911 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752024Ab2A2AuY (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 28 Jan 2012 19:50:24 -0500
In-Reply-To: <Pine.BSM.4.64L.1201290042440.31292@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: klibc@zytor.com
Cc: linux-m68k@vger.kernel.org

- fix syscall API and vfork
- support 6-argument syscalls
- add open/openat special handling for non-regparm arches

Signed-off-by: Thorsten Glaser <tg@mirbsd.org>
---
 usr/klibc/README.klibc        |    2 +-
 usr/klibc/SYSCALLS.def        |    4 +-
 usr/klibc/arch/m68k/Kbuild    |    1 +
 usr/klibc/arch/m68k/open.S    |   22 +++++++++++++++++++++
 usr/klibc/arch/m68k/openat.S  |   26 +++++++++++++++++++++++++
 usr/klibc/arch/m68k/syscall.S |   42 +++++++++++++++++++++++++++++++++-------
 usr/klibc/arch/m68k/vfork.S   |   13 +++--------
 usr/klibc/open.c              |    2 +-
 usr/klibc/openat.c            |    2 +-
 9 files changed, 92 insertions(+), 22 deletions(-)
 create mode 100644 usr/klibc/arch/m68k/open.S
 create mode 100644 usr/klibc/arch/m68k/openat.S

diff --git a/usr/klibc/README.klibc b/usr/klibc/README.klibc
index b4135cb..5417049 100644
--- a/usr/klibc/README.klibc
+++ b/usr/klibc/README.klibc
@@ -44,7 +44,7 @@ b) If you're cross-compiling, you need to set KLIBCARCH to the
    i386:	 Working
    ia64:	 Working static, shared untested
    m32r:	 Untested
-   m68k:	 Untested
+   m68k:	 Working
    m68knommu:	 Not yet ported
    mips:	 Working
    mips64:	 Not yet ported
diff --git a/usr/klibc/SYSCALLS.def b/usr/klibc/SYSCALLS.def
index 6ed6bdf..12aef49 100644
--- a/usr/klibc/SYSCALLS.def
+++ b/usr/klibc/SYSCALLS.def
@@ -154,8 +154,8 @@ int getcwd::__getcwd(char *, size_t);
 /*
  * I/O operations
  */
-<!i386,64> int open::__open(const char *, int, mode_t);
-<?!i386,64> int openat::__openat(int, const char *, int, mode_t);
+<!i386,m68k,64> int open::__open(const char *, int, mode_t);
+<?!i386,m68k,64> int openat::__openat(int, const char *, int, mode_t);
 <64> int open(const char *, int, mode_t);
 ssize_t read(int, void *, size_t);
 ssize_t write(int, const void *, size_t);
diff --git a/usr/klibc/arch/m68k/Kbuild b/usr/klibc/arch/m68k/Kbuild
index 8d6137c..d56ae0e 100644
--- a/usr/klibc/arch/m68k/Kbuild
+++ b/usr/klibc/arch/m68k/Kbuild
@@ -3,6 +3,7 @@
 #
 
 klib-y := setjmp.o syscall.o vfork.o
+klib-y += open.o openat.o
 
 always  := crt0.o
 targets := crt0.o
diff --git a/usr/klibc/arch/m68k/open.S b/usr/klibc/arch/m68k/open.S
new file mode 100644
index 0000000..c9a7ee3
--- /dev/null
+++ b/usr/klibc/arch/m68k/open.S
@@ -0,0 +1,22 @@
+/*
+ * arch/m68k/open.S
+ *
+ * Handle the open() system call - oddball due to the varadic
+ * prototype, which forces the use of the cdecl calling convention,
+ * and the need for O_LARGEFILE.
+ */
+
+#include <asm/unistd.h>
+
+/* <asm/fcntl.h>, despite the name, isn't assembly-safe */
+#define O_LARGEFILE	0400000
+
+	.globl	open
+	.type	open,@function
+
+open:
+	or.l	# O_LARGEFILE, 8(%sp)
+	move.l	# __NR_open, %d0
+	br	__syscall_common
+
+	.size	open,.-open
diff --git a/usr/klibc/arch/m68k/openat.S b/usr/klibc/arch/m68k/openat.S
new file mode 100644
index 0000000..25d8a1a
--- /dev/null
+++ b/usr/klibc/arch/m68k/openat.S
@@ -0,0 +1,26 @@
+/*
+ * arch/m68k/openat.S
+ *
+ * Handle the openat() system call - oddball due to the varadic
+ * prototype, which forces the use of the cdecl calling convention,
+ * and the need for O_LARGEFILE.
+ */
+
+#include <asm/unistd.h>
+
+/* <asm/fcntl.h>, despite the name, isn't assembly-safe */
+#define O_LARGEFILE	0400000
+
+#ifdef __NR_openat		/* Don't build if kernel headers too old */
+
+	.globl	openat
+	.type	openat,@function
+
+openat:
+	or.l	# O_LARGEFILE, 12(%sp)
+	move.l	# __NR_openat, %d0
+	br	__syscall_common
+
+	.size	openat,.-openat
+
+#endif
diff --git a/usr/klibc/arch/m68k/syscall.S b/usr/klibc/arch/m68k/syscall.S
index 966c92d..c909e2a 100644
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
+	bcs.l	1f			/* jump if _not_ error */
+
+	/* prepare for error return */
 	neg.l	%d0
 	move.l	%d0, (errno)
-	moveq	#-1, %d0
-1:
-	movea.l	%d0, %a0	/* Redundant return */
-	movem.l (%sp)+, %d2-%d6 /* Restore registers */
+	move.l	#-1, %d0
+	/* fallthrough into common return path */
+
+1:	/* copy return value to %a0 for syscalls returning pointers */
+	move.l	%d0, %a0
 	rts
 
 	.size	__syscall_common,.-__syscall_common
diff --git a/usr/klibc/arch/m68k/vfork.S b/usr/klibc/arch/m68k/vfork.S
index a3a7e44..98170a6 100644
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
+	/* fallthrough into common code from syscall.S */
+	bra	__syscall_checkandout
 
 	.size	vfork, .-vfork
diff --git a/usr/klibc/open.c b/usr/klibc/open.c
index 9b0897a..126f6db 100644
--- a/usr/klibc/open.c
+++ b/usr/klibc/open.c
@@ -10,7 +10,7 @@
 #include <fcntl.h>
 #include <bitsize.h>
 
-#if _BITSIZE == 32 && !defined(__i386__)
+#if _BITSIZE == 32 && !defined(__i386__) && !defined(__m68k__)
 
 extern int __open(const char *, int, mode_t);
 
diff --git a/usr/klibc/openat.c b/usr/klibc/openat.c
index 83c87cd..8e5baa0 100644
--- a/usr/klibc/openat.c
+++ b/usr/klibc/openat.c
@@ -10,7 +10,7 @@
 #include <fcntl.h>
 #include <bitsize.h>
 
-#if _BITSIZE == 32 && !defined(__i386__) && defined(__NR_openat)
+#if _BITSIZE == 32 && !defined(__i386__) && !defined(__m68k__) && defined(__NR_openat)
 
 extern int __openat(int, const char *, int, mode_t);
 
-- 
1.7.8.3
