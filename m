From: <gerg@snapgear.com>
Subject: [PATCH] m68k: simpler m68k and ColdFire CPU's can use generic csum code
Date: Fri, 18 Nov 2011 16:32:50 +1000
Message-ID: <1321597970-23806-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:15357 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756701Ab1KRGcV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Nov 2011 01:32:21 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We have two implementations of the IP checksuming code for the m68k arch.
One uses the more advanced instructions available in 68020 and above
processors, the other uses the simpler instructions available on the
original 68000 processors and the modern ColdFire processors.

This simpler code is pretty much the same as the generic lib implementation
of the IP csum functions. So lets just switch over to using that. That
means we can completely remove the checksum_no.c file, and only have the
local fast code used for the more complex 68k CPU family members.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig                |    3 +
 arch/m68k/Kconfig.cpu            |    2 +
 arch/m68k/include/asm/checksum.h |   31 +---
 arch/m68k/lib/Makefile           |    8 +-
 arch/m68k/lib/checksum.c         |  425 ++++++++++++++++++++++++++++++++++++++
 arch/m68k/lib/checksum_mm.c      |  425 --------------------------------------
 arch/m68k/lib/checksum_no.c      |  156 --------------
 7 files changed, 441 insertions(+), 609 deletions(-)
 create mode 100644 arch/m68k/lib/checksum.c
 delete mode 100644 arch/m68k/lib/checksum_mm.c
 delete mode 100644 arch/m68k/lib/checksum_no.c

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 2914b03..2fe2d63 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -40,6 +40,9 @@ config GENERIC_CALIBRATE_DELAY
 config GENERIC_IOMAP
 	def_bool MMU
 
+config GENERIC_CSUM
+	bool
+
 config TIME_LOW_RES
 	bool
 	default y
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 9af9e68..17d37ed 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -3,6 +3,7 @@ comment "Processor Type"
 config M68000
 	bool
 	select CPU_HAS_NO_BITFIELDS
+	select GENERIC_CSUM
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
@@ -23,6 +24,7 @@ config COLDFIRE
 	select GENERIC_GPIO
 	select ARCH_REQUIRE_GPIOLIB
 	select CPU_HAS_NO_BITFIELDS
+	select GENERIC_CSUM
 	help
 	  The Freescale ColdFire family of processors is a modern derivitive
 	  of the 68000 processor family. They are mainly targeted at embedded
diff --git a/arch/m68k/include/asm/checksum.h b/arch/m68k/include/asm/checksum.h
index ec51448..2f88d86 100644
--- a/arch/m68k/include/asm/checksum.h
+++ b/arch/m68k/include/asm/checksum.h
@@ -3,6 +3,10 @@
 
 #include <linux/in6.h>
 
+#ifdef CONFIG_GENERIC_CSUM
+#include <asm-generic/checksum.h>
+#else
+
 /*
  * computes the checksum of a memory block at buff, length len,
  * and adds in "sum" (32-bit)
@@ -34,30 +38,6 @@ extern __wsum csum_partial_copy_nocheck(const void *src,
 					      void *dst, int len,
 					      __wsum sum);
 
-
-#ifdef CONFIG_COLDFIRE
-
-/*
- *	The ColdFire cores don't support all the 68k instructions used
- *	in the optimized checksum code below. So it reverts back to using
- *	more standard C coded checksums. The fast checksum code is
- *	significantly larger than the optimized version, so it is not
- *	inlined here.
- */
-__sum16 ip_fast_csum(const void *iph, unsigned int ihl);
-
-static inline __sum16 csum_fold(__wsum sum)
-{
-	unsigned int tmp = (__force u32)sum;
-
-	tmp = (tmp & 0xffff) + (tmp >> 16);
-	tmp = (tmp & 0xffff) + (tmp >> 16);
-
-	return (__force __sum16)~tmp;
-}
-
-#else
-
 /*
  *	This is a version of ip_fast_csum() optimized for IP headers,
  *	which always checksum on 4 octet boundaries.
@@ -97,8 +77,6 @@ static inline __sum16 csum_fold(__wsum sum)
 	return (__force __sum16)~sum;
 }
 
-#endif /* CONFIG_COLDFIRE */
-
 static inline __wsum
 csum_tcpudp_nofold(__be32 saddr, __be32 daddr, unsigned short len,
 		  unsigned short proto, __wsum sum)
@@ -167,4 +145,5 @@ csum_ipv6_magic(const struct in6_addr *saddr, const struct in6_addr *daddr,
 	return csum_fold(sum);
 }
 
+#endif /* CONFIG_GENERIC_CSUM */
 #endif /* _M68K_CHECKSUM_H */
diff --git a/arch/m68k/lib/Makefile b/arch/m68k/lib/Makefile
index 1a1bd90..b3b40e4 100644
--- a/arch/m68k/lib/Makefile
+++ b/arch/m68k/lib/Makefile
@@ -7,8 +7,12 @@ lib-y	:= ashldi3.o ashrdi3.o lshrdi3.o muldi3.o \
 	   memcpy.o memset.o memmove.o
 
 ifdef CONFIG_MMU
-lib-y	+= string.o uaccess.o checksum_mm.o
+lib-y	+= string.o uaccess.o
 else
-lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o checksum_no.o
+lib-y	+= mulsi3.o divsi3.o udivsi3.o modsi3.o umodsi3.o
+endif
+
+ifndef CONFIG_GENERIC_CSUM
+lib-y	+= checksum.o
 endif
 
diff --git a/arch/m68k/lib/checksum.c b/arch/m68k/lib/checksum.c
new file mode 100644
index 0000000..6216f12
--- /dev/null
+++ b/arch/m68k/lib/checksum.c
@@ -0,0 +1,425 @@
+/*
+ * INET		An implementation of the TCP/IP protocol suite for the LINUX
+ *		operating system.  INET is implemented using the  BSD Socket
+ *		interface as the means of communication with the user level.
+ *
+ *		IP/TCP/UDP checksumming routines
+ *
+ * Authors:	Jorge Cwik, <jorge@laser.satlink.net>
+ *		Arnt Gulbrandsen, <agulbra@nvg.unit.no>
+ *		Tom May, <ftom@netcom.com>
+ *		Andreas Schwab, <schwab@issan.informatik.uni-dortmund.de>
+ *		Lots of code moved from tcp.c and ip.c; see those files
+ *		for more names.
+ *
+ * 03/02/96	Jes Sorensen, Andreas Schwab, Roman Hodek:
+ *		Fixed some nasty bugs, causing some horrible crashes.
+ *		A: At some points, the sum (%0) was used as
+ *		length-counter instead of the length counter
+ *		(%1). Thanks to Roman Hodek for pointing this out.
+ *		B: GCC seems to mess up if one uses too many
+ *		data-registers to hold input values and one tries to
+ *		specify d0 and d1 as scratch registers. Letting gcc
+ *		choose these registers itself solves the problem.
+ *
+ *		This program is free software; you can redistribute it and/or
+ *		modify it under the terms of the GNU General Public License
+ *		as published by the Free Software Foundation; either version
+ *		2 of the License, or (at your option) any later version.
+ *
+ * 1998/8/31	Andreas Schwab:
+ *		Zero out rest of buffer on exception in
+ *		csum_partial_copy_from_user.
+ */
+
+#include <linux/module.h>
+#include <net/checksum.h>
+
+/*
+ * computes a partial checksum, e.g. for TCP/UDP fragments
+ */
+
+__wsum csum_partial(const void *buff, int len, __wsum sum)
+{
+	unsigned long tmp1, tmp2;
+	  /*
+	   * Experiments with ethernet and slip connections show that buff
+	   * is aligned on either a 2-byte or 4-byte boundary.
+	   */
+	__asm__("movel %2,%3\n\t"
+		"btst #1,%3\n\t"	/* Check alignment */
+		"jeq 2f\n\t"
+		"subql #2,%1\n\t"	/* buff%4==2: treat first word */
+		"jgt 1f\n\t"
+		"addql #2,%1\n\t"	/* len was == 2, treat only rest */
+		"jra 4f\n"
+	     "1:\t"
+		"addw %2@+,%0\n\t"	/* add first word to sum */
+		"clrl %3\n\t"
+		"addxl %3,%0\n"		/* add X bit */
+	     "2:\t"
+		/* unrolled loop for the main part: do 8 longs at once */
+		"movel %1,%3\n\t"	/* save len in tmp1 */
+		"lsrl #5,%1\n\t"	/* len/32 */
+		"jeq 2f\n\t"		/* not enough... */
+		"subql #1,%1\n"
+	     "1:\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"dbra %1,1b\n\t"
+		"clrl %4\n\t"
+		"addxl %4,%0\n\t"	/* add X bit */
+		"clrw %1\n\t"
+		"subql #1,%1\n\t"
+		"jcc 1b\n"
+	     "2:\t"
+		"movel %3,%1\n\t"	/* restore len from tmp1 */
+		"andw #0x1c,%3\n\t"	/* number of rest longs */
+		"jeq 4f\n\t"
+		"lsrw #2,%3\n\t"
+		"subqw #1,%3\n"
+	     "3:\t"
+		/* loop for rest longs */
+		"movel %2@+,%4\n\t"
+		"addxl %4,%0\n\t"
+		"dbra %3,3b\n\t"
+		"clrl %4\n\t"
+		"addxl %4,%0\n"		/* add X bit */
+	     "4:\t"
+		/* now check for rest bytes that do not fit into longs */
+		"andw #3,%1\n\t"
+		"jeq 7f\n\t"
+		"clrl %4\n\t"		/* clear tmp2 for rest bytes */
+		"subqw #2,%1\n\t"
+		"jlt 5f\n\t"
+		"movew %2@+,%4\n\t"	/* have rest >= 2: get word */
+		"swap %4\n\t"		/* into bits 16..31 */
+		"tstw %1\n\t"		/* another byte? */
+		"jeq 6f\n"
+	     "5:\t"
+		"moveb %2@,%4\n\t"	/* have odd rest: get byte */
+		"lslw #8,%4\n\t"	/* into bits 8..15; 16..31 untouched */
+	     "6:\t"
+		"addl %4,%0\n\t"	/* now add rest long to sum */
+		"clrl %4\n\t"
+		"addxl %4,%0\n"		/* add X bit */
+	     "7:\t"
+		: "=d" (sum), "=d" (len), "=a" (buff),
+		  "=&d" (tmp1), "=&d" (tmp2)
+		: "0" (sum), "1" (len), "2" (buff)
+	    );
+	return(sum);
+}
+
+EXPORT_SYMBOL(csum_partial);
+
+
+/*
+ * copy from user space while checksumming, with exception handling.
+ */
+
+__wsum
+csum_partial_copy_from_user(const void __user *src, void *dst,
+			    int len, __wsum sum, int *csum_err)
+{
+	/*
+	 * GCC doesn't like more than 10 operands for the asm
+	 * statements so we have to use tmp2 for the error
+	 * code.
+	 */
+	unsigned long tmp1, tmp2;
+
+	__asm__("movel %2,%4\n\t"
+		"btst #1,%4\n\t"	/* Check alignment */
+		"jeq 2f\n\t"
+		"subql #2,%1\n\t"	/* buff%4==2: treat first word */
+		"jgt 1f\n\t"
+		"addql #2,%1\n\t"	/* len was == 2, treat only rest */
+		"jra 4f\n"
+	     "1:\n"
+	     "10:\t"
+		"movesw %2@+,%4\n\t"	/* add first word to sum */
+		"addw %4,%0\n\t"
+		"movew %4,%3@+\n\t"
+		"clrl %4\n\t"
+		"addxl %4,%0\n"		/* add X bit */
+	     "2:\t"
+		/* unrolled loop for the main part: do 8 longs at once */
+		"movel %1,%4\n\t"	/* save len in tmp1 */
+		"lsrl #5,%1\n\t"	/* len/32 */
+		"jeq 2f\n\t"		/* not enough... */
+		"subql #1,%1\n"
+	     "1:\n"
+	     "11:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "12:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "13:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "14:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "15:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "16:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "17:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+	     "18:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"dbra %1,1b\n\t"
+		"clrl %5\n\t"
+		"addxl %5,%0\n\t"	/* add X bit */
+		"clrw %1\n\t"
+		"subql #1,%1\n\t"
+		"jcc 1b\n"
+	     "2:\t"
+		"movel %4,%1\n\t"	/* restore len from tmp1 */
+		"andw #0x1c,%4\n\t"	/* number of rest longs */
+		"jeq 4f\n\t"
+		"lsrw #2,%4\n\t"
+		"subqw #1,%4\n"
+	     "3:\n"
+		/* loop for rest longs */
+	     "19:\t"
+		"movesl %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"dbra %4,3b\n\t"
+		"clrl %5\n\t"
+		"addxl %5,%0\n"		/* add X bit */
+	     "4:\t"
+		/* now check for rest bytes that do not fit into longs */
+		"andw #3,%1\n\t"
+		"jeq 7f\n\t"
+		"clrl %5\n\t"		/* clear tmp2 for rest bytes */
+		"subqw #2,%1\n\t"
+		"jlt 5f\n\t"
+	     "20:\t"
+		"movesw %2@+,%5\n\t"	/* have rest >= 2: get word */
+		"movew %5,%3@+\n\t"
+		"swap %5\n\t"		/* into bits 16..31 */
+		"tstw %1\n\t"		/* another byte? */
+		"jeq 6f\n"
+	     "5:\n"
+	     "21:\t"
+		"movesb %2@,%5\n\t"	/* have odd rest: get byte */
+		"moveb %5,%3@+\n\t"
+		"lslw #8,%5\n\t"	/* into bits 8..15; 16..31 untouched */
+	     "6:\t"
+		"addl %5,%0\n\t"	/* now add rest long to sum */
+		"clrl %5\n\t"
+		"addxl %5,%0\n\t"	/* add X bit */
+	     "7:\t"
+		"clrl %5\n"		/* no error - clear return value */
+	     "8:\n"
+		".section .fixup,\"ax\"\n"
+		".even\n"
+		/* If any exception occurs zero out the rest.
+		   Similarities with the code above are intentional :-) */
+	     "90:\t"
+		"clrw %3@+\n\t"
+		"movel %1,%4\n\t"
+		"lsrl #5,%1\n\t"
+		"jeq 1f\n\t"
+		"subql #1,%1\n"
+	     "91:\t"
+		"clrl %3@+\n"
+	     "92:\t"
+		"clrl %3@+\n"
+	     "93:\t"
+		"clrl %3@+\n"
+	     "94:\t"
+		"clrl %3@+\n"
+	     "95:\t"
+		"clrl %3@+\n"
+	     "96:\t"
+		"clrl %3@+\n"
+	     "97:\t"
+		"clrl %3@+\n"
+	     "98:\t"
+		"clrl %3@+\n\t"
+		"dbra %1,91b\n\t"
+		"clrw %1\n\t"
+		"subql #1,%1\n\t"
+		"jcc 91b\n"
+	     "1:\t"
+		"movel %4,%1\n\t"
+		"andw #0x1c,%4\n\t"
+		"jeq 1f\n\t"
+		"lsrw #2,%4\n\t"
+		"subqw #1,%4\n"
+	     "99:\t"
+		"clrl %3@+\n\t"
+		"dbra %4,99b\n\t"
+	     "1:\t"
+		"andw #3,%1\n\t"
+		"jeq 9f\n"
+	     "100:\t"
+		"clrw %3@+\n\t"
+		"tstw %1\n\t"
+		"jeq 9f\n"
+	     "101:\t"
+		"clrb %3@+\n"
+	     "9:\t"
+#define STR(X) STR1(X)
+#define STR1(X) #X
+		"moveq #-" STR(EFAULT) ",%5\n\t"
+		"jra 8b\n"
+		".previous\n"
+		".section __ex_table,\"a\"\n"
+		".long 10b,90b\n"
+		".long 11b,91b\n"
+		".long 12b,92b\n"
+		".long 13b,93b\n"
+		".long 14b,94b\n"
+		".long 15b,95b\n"
+		".long 16b,96b\n"
+		".long 17b,97b\n"
+		".long 18b,98b\n"
+		".long 19b,99b\n"
+		".long 20b,100b\n"
+		".long 21b,101b\n"
+		".previous"
+		: "=d" (sum), "=d" (len), "=a" (src), "=a" (dst),
+		  "=&d" (tmp1), "=d" (tmp2)
+		: "0" (sum), "1" (len), "2" (src), "3" (dst)
+	    );
+
+	*csum_err = tmp2;
+
+	return(sum);
+}
+
+EXPORT_SYMBOL(csum_partial_copy_from_user);
+
+
+/*
+ * copy from kernel space while checksumming, otherwise like csum_partial
+ */
+
+__wsum
+csum_partial_copy_nocheck(const void *src, void *dst, int len, __wsum sum)
+{
+	unsigned long tmp1, tmp2;
+	__asm__("movel %2,%4\n\t"
+		"btst #1,%4\n\t"	/* Check alignment */
+		"jeq 2f\n\t"
+		"subql #2,%1\n\t"	/* buff%4==2: treat first word */
+		"jgt 1f\n\t"
+		"addql #2,%1\n\t"	/* len was == 2, treat only rest */
+		"jra 4f\n"
+	     "1:\t"
+		"movew %2@+,%4\n\t"	/* add first word to sum */
+		"addw %4,%0\n\t"
+		"movew %4,%3@+\n\t"
+		"clrl %4\n\t"
+		"addxl %4,%0\n"		/* add X bit */
+	     "2:\t"
+		/* unrolled loop for the main part: do 8 longs at once */
+		"movel %1,%4\n\t"	/* save len in tmp1 */
+		"lsrl #5,%1\n\t"	/* len/32 */
+		"jeq 2f\n\t"		/* not enough... */
+		"subql #1,%1\n"
+	     "1:\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"dbra %1,1b\n\t"
+		"clrl %5\n\t"
+		"addxl %5,%0\n\t"	/* add X bit */
+		"clrw %1\n\t"
+		"subql #1,%1\n\t"
+		"jcc 1b\n"
+	     "2:\t"
+		"movel %4,%1\n\t"	/* restore len from tmp1 */
+		"andw #0x1c,%4\n\t"	/* number of rest longs */
+		"jeq 4f\n\t"
+		"lsrw #2,%4\n\t"
+		"subqw #1,%4\n"
+	     "3:\t"
+		/* loop for rest longs */
+		"movel %2@+,%5\n\t"
+		"addxl %5,%0\n\t"
+		"movel %5,%3@+\n\t"
+		"dbra %4,3b\n\t"
+		"clrl %5\n\t"
+		"addxl %5,%0\n"		/* add X bit */
+	     "4:\t"
+		/* now check for rest bytes that do not fit into longs */
+		"andw #3,%1\n\t"
+		"jeq 7f\n\t"
+		"clrl %5\n\t"		/* clear tmp2 for rest bytes */
+		"subqw #2,%1\n\t"
+		"jlt 5f\n\t"
+		"movew %2@+,%5\n\t"	/* have rest >= 2: get word */
+		"movew %5,%3@+\n\t"
+		"swap %5\n\t"		/* into bits 16..31 */
+		"tstw %1\n\t"		/* another byte? */
+		"jeq 6f\n"
+	     "5:\t"
+		"moveb %2@,%5\n\t"	/* have odd rest: get byte */
+		"moveb %5,%3@+\n\t"
+		"lslw #8,%5\n"		/* into bits 8..15; 16..31 untouched */
+	     "6:\t"
+		"addl %5,%0\n\t"	/* now add rest long to sum */
+		"clrl %5\n\t"
+		"addxl %5,%0\n"		/* add X bit */
+	     "7:\t"
+		: "=d" (sum), "=d" (len), "=a" (src), "=a" (dst),
+		  "=&d" (tmp1), "=&d" (tmp2)
+		: "0" (sum), "1" (len), "2" (src), "3" (dst)
+	    );
+    return(sum);
+}
+EXPORT_SYMBOL(csum_partial_copy_nocheck);
diff --git a/arch/m68k/lib/checksum_mm.c b/arch/m68k/lib/checksum_mm.c
deleted file mode 100644
index 6216f12..0000000
--- a/arch/m68k/lib/checksum_mm.c
+++ /dev/null
@@ -1,425 +0,0 @@
-/*
- * INET		An implementation of the TCP/IP protocol suite for the LINUX
- *		operating system.  INET is implemented using the  BSD Socket
- *		interface as the means of communication with the user level.
- *
- *		IP/TCP/UDP checksumming routines
- *
- * Authors:	Jorge Cwik, <jorge@laser.satlink.net>
- *		Arnt Gulbrandsen, <agulbra@nvg.unit.no>
- *		Tom May, <ftom@netcom.com>
- *		Andreas Schwab, <schwab@issan.informatik.uni-dortmund.de>
- *		Lots of code moved from tcp.c and ip.c; see those files
- *		for more names.
- *
- * 03/02/96	Jes Sorensen, Andreas Schwab, Roman Hodek:
- *		Fixed some nasty bugs, causing some horrible crashes.
- *		A: At some points, the sum (%0) was used as
- *		length-counter instead of the length counter
- *		(%1). Thanks to Roman Hodek for pointing this out.
- *		B: GCC seems to mess up if one uses too many
- *		data-registers to hold input values and one tries to
- *		specify d0 and d1 as scratch registers. Letting gcc
- *		choose these registers itself solves the problem.
- *
- *		This program is free software; you can redistribute it and/or
- *		modify it under the terms of the GNU General Public License
- *		as published by the Free Software Foundation; either version
- *		2 of the License, or (at your option) any later version.
- *
- * 1998/8/31	Andreas Schwab:
- *		Zero out rest of buffer on exception in
- *		csum_partial_copy_from_user.
- */
-
-#include <linux/module.h>
-#include <net/checksum.h>
-
-/*
- * computes a partial checksum, e.g. for TCP/UDP fragments
- */
-
-__wsum csum_partial(const void *buff, int len, __wsum sum)
-{
-	unsigned long tmp1, tmp2;
-	  /*
-	   * Experiments with ethernet and slip connections show that buff
-	   * is aligned on either a 2-byte or 4-byte boundary.
-	   */
-	__asm__("movel %2,%3\n\t"
-		"btst #1,%3\n\t"	/* Check alignment */
-		"jeq 2f\n\t"
-		"subql #2,%1\n\t"	/* buff%4==2: treat first word */
-		"jgt 1f\n\t"
-		"addql #2,%1\n\t"	/* len was == 2, treat only rest */
-		"jra 4f\n"
-	     "1:\t"
-		"addw %2@+,%0\n\t"	/* add first word to sum */
-		"clrl %3\n\t"
-		"addxl %3,%0\n"		/* add X bit */
-	     "2:\t"
-		/* unrolled loop for the main part: do 8 longs at once */
-		"movel %1,%3\n\t"	/* save len in tmp1 */
-		"lsrl #5,%1\n\t"	/* len/32 */
-		"jeq 2f\n\t"		/* not enough... */
-		"subql #1,%1\n"
-	     "1:\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"dbra %1,1b\n\t"
-		"clrl %4\n\t"
-		"addxl %4,%0\n\t"	/* add X bit */
-		"clrw %1\n\t"
-		"subql #1,%1\n\t"
-		"jcc 1b\n"
-	     "2:\t"
-		"movel %3,%1\n\t"	/* restore len from tmp1 */
-		"andw #0x1c,%3\n\t"	/* number of rest longs */
-		"jeq 4f\n\t"
-		"lsrw #2,%3\n\t"
-		"subqw #1,%3\n"
-	     "3:\t"
-		/* loop for rest longs */
-		"movel %2@+,%4\n\t"
-		"addxl %4,%0\n\t"
-		"dbra %3,3b\n\t"
-		"clrl %4\n\t"
-		"addxl %4,%0\n"		/* add X bit */
-	     "4:\t"
-		/* now check for rest bytes that do not fit into longs */
-		"andw #3,%1\n\t"
-		"jeq 7f\n\t"
-		"clrl %4\n\t"		/* clear tmp2 for rest bytes */
-		"subqw #2,%1\n\t"
-		"jlt 5f\n\t"
-		"movew %2@+,%4\n\t"	/* have rest >= 2: get word */
-		"swap %4\n\t"		/* into bits 16..31 */
-		"tstw %1\n\t"		/* another byte? */
-		"jeq 6f\n"
-	     "5:\t"
-		"moveb %2@,%4\n\t"	/* have odd rest: get byte */
-		"lslw #8,%4\n\t"	/* into bits 8..15; 16..31 untouched */
-	     "6:\t"
-		"addl %4,%0\n\t"	/* now add rest long to sum */
-		"clrl %4\n\t"
-		"addxl %4,%0\n"		/* add X bit */
-	     "7:\t"
-		: "=d" (sum), "=d" (len), "=a" (buff),
-		  "=&d" (tmp1), "=&d" (tmp2)
-		: "0" (sum), "1" (len), "2" (buff)
-	    );
-	return(sum);
-}
-
-EXPORT_SYMBOL(csum_partial);
-
-
-/*
- * copy from user space while checksumming, with exception handling.
- */
-
-__wsum
-csum_partial_copy_from_user(const void __user *src, void *dst,
-			    int len, __wsum sum, int *csum_err)
-{
-	/*
-	 * GCC doesn't like more than 10 operands for the asm
-	 * statements so we have to use tmp2 for the error
-	 * code.
-	 */
-	unsigned long tmp1, tmp2;
-
-	__asm__("movel %2,%4\n\t"
-		"btst #1,%4\n\t"	/* Check alignment */
-		"jeq 2f\n\t"
-		"subql #2,%1\n\t"	/* buff%4==2: treat first word */
-		"jgt 1f\n\t"
-		"addql #2,%1\n\t"	/* len was == 2, treat only rest */
-		"jra 4f\n"
-	     "1:\n"
-	     "10:\t"
-		"movesw %2@+,%4\n\t"	/* add first word to sum */
-		"addw %4,%0\n\t"
-		"movew %4,%3@+\n\t"
-		"clrl %4\n\t"
-		"addxl %4,%0\n"		/* add X bit */
-	     "2:\t"
-		/* unrolled loop for the main part: do 8 longs at once */
-		"movel %1,%4\n\t"	/* save len in tmp1 */
-		"lsrl #5,%1\n\t"	/* len/32 */
-		"jeq 2f\n\t"		/* not enough... */
-		"subql #1,%1\n"
-	     "1:\n"
-	     "11:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "12:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "13:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "14:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "15:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "16:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "17:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-	     "18:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"dbra %1,1b\n\t"
-		"clrl %5\n\t"
-		"addxl %5,%0\n\t"	/* add X bit */
-		"clrw %1\n\t"
-		"subql #1,%1\n\t"
-		"jcc 1b\n"
-	     "2:\t"
-		"movel %4,%1\n\t"	/* restore len from tmp1 */
-		"andw #0x1c,%4\n\t"	/* number of rest longs */
-		"jeq 4f\n\t"
-		"lsrw #2,%4\n\t"
-		"subqw #1,%4\n"
-	     "3:\n"
-		/* loop for rest longs */
-	     "19:\t"
-		"movesl %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"dbra %4,3b\n\t"
-		"clrl %5\n\t"
-		"addxl %5,%0\n"		/* add X bit */
-	     "4:\t"
-		/* now check for rest bytes that do not fit into longs */
-		"andw #3,%1\n\t"
-		"jeq 7f\n\t"
-		"clrl %5\n\t"		/* clear tmp2 for rest bytes */
-		"subqw #2,%1\n\t"
-		"jlt 5f\n\t"
-	     "20:\t"
-		"movesw %2@+,%5\n\t"	/* have rest >= 2: get word */
-		"movew %5,%3@+\n\t"
-		"swap %5\n\t"		/* into bits 16..31 */
-		"tstw %1\n\t"		/* another byte? */
-		"jeq 6f\n"
-	     "5:\n"
-	     "21:\t"
-		"movesb %2@,%5\n\t"	/* have odd rest: get byte */
-		"moveb %5,%3@+\n\t"
-		"lslw #8,%5\n\t"	/* into bits 8..15; 16..31 untouched */
-	     "6:\t"
-		"addl %5,%0\n\t"	/* now add rest long to sum */
-		"clrl %5\n\t"
-		"addxl %5,%0\n\t"	/* add X bit */
-	     "7:\t"
-		"clrl %5\n"		/* no error - clear return value */
-	     "8:\n"
-		".section .fixup,\"ax\"\n"
-		".even\n"
-		/* If any exception occurs zero out the rest.
-		   Similarities with the code above are intentional :-) */
-	     "90:\t"
-		"clrw %3@+\n\t"
-		"movel %1,%4\n\t"
-		"lsrl #5,%1\n\t"
-		"jeq 1f\n\t"
-		"subql #1,%1\n"
-	     "91:\t"
-		"clrl %3@+\n"
-	     "92:\t"
-		"clrl %3@+\n"
-	     "93:\t"
-		"clrl %3@+\n"
-	     "94:\t"
-		"clrl %3@+\n"
-	     "95:\t"
-		"clrl %3@+\n"
-	     "96:\t"
-		"clrl %3@+\n"
-	     "97:\t"
-		"clrl %3@+\n"
-	     "98:\t"
-		"clrl %3@+\n\t"
-		"dbra %1,91b\n\t"
-		"clrw %1\n\t"
-		"subql #1,%1\n\t"
-		"jcc 91b\n"
-	     "1:\t"
-		"movel %4,%1\n\t"
-		"andw #0x1c,%4\n\t"
-		"jeq 1f\n\t"
-		"lsrw #2,%4\n\t"
-		"subqw #1,%4\n"
-	     "99:\t"
-		"clrl %3@+\n\t"
-		"dbra %4,99b\n\t"
-	     "1:\t"
-		"andw #3,%1\n\t"
-		"jeq 9f\n"
-	     "100:\t"
-		"clrw %3@+\n\t"
-		"tstw %1\n\t"
-		"jeq 9f\n"
-	     "101:\t"
-		"clrb %3@+\n"
-	     "9:\t"
-#define STR(X) STR1(X)
-#define STR1(X) #X
-		"moveq #-" STR(EFAULT) ",%5\n\t"
-		"jra 8b\n"
-		".previous\n"
-		".section __ex_table,\"a\"\n"
-		".long 10b,90b\n"
-		".long 11b,91b\n"
-		".long 12b,92b\n"
-		".long 13b,93b\n"
-		".long 14b,94b\n"
-		".long 15b,95b\n"
-		".long 16b,96b\n"
-		".long 17b,97b\n"
-		".long 18b,98b\n"
-		".long 19b,99b\n"
-		".long 20b,100b\n"
-		".long 21b,101b\n"
-		".previous"
-		: "=d" (sum), "=d" (len), "=a" (src), "=a" (dst),
-		  "=&d" (tmp1), "=d" (tmp2)
-		: "0" (sum), "1" (len), "2" (src), "3" (dst)
-	    );
-
-	*csum_err = tmp2;
-
-	return(sum);
-}
-
-EXPORT_SYMBOL(csum_partial_copy_from_user);
-
-
-/*
- * copy from kernel space while checksumming, otherwise like csum_partial
- */
-
-__wsum
-csum_partial_copy_nocheck(const void *src, void *dst, int len, __wsum sum)
-{
-	unsigned long tmp1, tmp2;
-	__asm__("movel %2,%4\n\t"
-		"btst #1,%4\n\t"	/* Check alignment */
-		"jeq 2f\n\t"
-		"subql #2,%1\n\t"	/* buff%4==2: treat first word */
-		"jgt 1f\n\t"
-		"addql #2,%1\n\t"	/* len was == 2, treat only rest */
-		"jra 4f\n"
-	     "1:\t"
-		"movew %2@+,%4\n\t"	/* add first word to sum */
-		"addw %4,%0\n\t"
-		"movew %4,%3@+\n\t"
-		"clrl %4\n\t"
-		"addxl %4,%0\n"		/* add X bit */
-	     "2:\t"
-		/* unrolled loop for the main part: do 8 longs at once */
-		"movel %1,%4\n\t"	/* save len in tmp1 */
-		"lsrl #5,%1\n\t"	/* len/32 */
-		"jeq 2f\n\t"		/* not enough... */
-		"subql #1,%1\n"
-	     "1:\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"dbra %1,1b\n\t"
-		"clrl %5\n\t"
-		"addxl %5,%0\n\t"	/* add X bit */
-		"clrw %1\n\t"
-		"subql #1,%1\n\t"
-		"jcc 1b\n"
-	     "2:\t"
-		"movel %4,%1\n\t"	/* restore len from tmp1 */
-		"andw #0x1c,%4\n\t"	/* number of rest longs */
-		"jeq 4f\n\t"
-		"lsrw #2,%4\n\t"
-		"subqw #1,%4\n"
-	     "3:\t"
-		/* loop for rest longs */
-		"movel %2@+,%5\n\t"
-		"addxl %5,%0\n\t"
-		"movel %5,%3@+\n\t"
-		"dbra %4,3b\n\t"
-		"clrl %5\n\t"
-		"addxl %5,%0\n"		/* add X bit */
-	     "4:\t"
-		/* now check for rest bytes that do not fit into longs */
-		"andw #3,%1\n\t"
-		"jeq 7f\n\t"
-		"clrl %5\n\t"		/* clear tmp2 for rest bytes */
-		"subqw #2,%1\n\t"
-		"jlt 5f\n\t"
-		"movew %2@+,%5\n\t"	/* have rest >= 2: get word */
-		"movew %5,%3@+\n\t"
-		"swap %5\n\t"		/* into bits 16..31 */
-		"tstw %1\n\t"		/* another byte? */
-		"jeq 6f\n"
-	     "5:\t"
-		"moveb %2@,%5\n\t"	/* have odd rest: get byte */
-		"moveb %5,%3@+\n\t"
-		"lslw #8,%5\n"		/* into bits 8..15; 16..31 untouched */
-	     "6:\t"
-		"addl %5,%0\n\t"	/* now add rest long to sum */
-		"clrl %5\n\t"
-		"addxl %5,%0\n"		/* add X bit */
-	     "7:\t"
-		: "=d" (sum), "=d" (len), "=a" (src), "=a" (dst),
-		  "=&d" (tmp1), "=&d" (tmp2)
-		: "0" (sum), "1" (len), "2" (src), "3" (dst)
-	    );
-    return(sum);
-}
-EXPORT_SYMBOL(csum_partial_copy_nocheck);
diff --git a/arch/m68k/lib/checksum_no.c b/arch/m68k/lib/checksum_no.c
deleted file mode 100644
index e4c6354..0000000
--- a/arch/m68k/lib/checksum_no.c
+++ /dev/null
@@ -1,156 +0,0 @@
-/*
- * INET		An implementation of the TCP/IP protocol suite for the LINUX
- *		operating system.  INET is implemented using the  BSD Socket
- *		interface as the means of communication with the user level.
- *
- *		IP/TCP/UDP checksumming routines
- *
- * Authors:	Jorge Cwik, <jorge@laser.satlink.net>
- *		Arnt Gulbrandsen, <agulbra@nvg.unit.no>
- *		Tom May, <ftom@netcom.com>
- *		Andreas Schwab, <schwab@issan.informatik.uni-dortmund.de>
- *		Lots of code moved from tcp.c and ip.c; see those files
- *		for more names.
- *
- * 03/02/96	Jes Sorensen, Andreas Schwab, Roman Hodek:
- *		Fixed some nasty bugs, causing some horrible crashes.
- *		A: At some points, the sum (%0) was used as
- *		length-counter instead of the length counter
- *		(%1). Thanks to Roman Hodek for pointing this out.
- *		B: GCC seems to mess up if one uses too many
- *		data-registers to hold input values and one tries to
- *		specify d0 and d1 as scratch registers. Letting gcc choose these
- *      registers itself solves the problem.
- *
- *		This program is free software; you can redistribute it and/or
- *		modify it under the terms of the GNU General Public License
- *		as published by the Free Software Foundation; either version
- *		2 of the License, or (at your option) any later version.
- */
- 
-/* Revised by Kenneth Albanowski for m68knommu. Basic problem: unaligned access kills, so most
-   of the assembly has to go. */
-
-#include <linux/module.h>
-#include <net/checksum.h>
-
-static inline unsigned short from32to16(unsigned long x)
-{
-	/* add up 16-bit and 16-bit for 16+c bit */
-	x = (x & 0xffff) + (x >> 16);
-	/* add up carry.. */
-	x = (x & 0xffff) + (x >> 16);
-	return x;
-}
-
-static unsigned long do_csum(const unsigned char * buff, int len)
-{
-	int odd, count;
-	unsigned long result = 0;
-
-	if (len <= 0)
-		goto out;
-	odd = 1 & (unsigned long) buff;
-	if (odd) {
-		result = *buff;
-		len--;
-		buff++;
-	}
-	count = len >> 1;		/* nr of 16-bit words.. */
-	if (count) {
-		if (2 & (unsigned long) buff) {
-			result += *(unsigned short *) buff;
-			count--;
-			len -= 2;
-			buff += 2;
-		}
-		count >>= 1;		/* nr of 32-bit words.. */
-		if (count) {
-		        unsigned long carry = 0;
-			do {
-				unsigned long w = *(unsigned long *) buff;
-				count--;
-				buff += 4;
-				result += carry;
-				result += w;
-				carry = (w > result);
-			} while (count);
-			result += carry;
-			result = (result & 0xffff) + (result >> 16);
-		}
-		if (len & 2) {
-			result += *(unsigned short *) buff;
-			buff += 2;
-		}
-	}
-	if (len & 1)
-		result += (*buff << 8);
-	result = from32to16(result);
-	if (odd)
-		result = ((result >> 8) & 0xff) | ((result & 0xff) << 8);
-out:
-	return result;
-}
-
-#ifdef CONFIG_COLDFIRE
-/*
- *	This is a version of ip_compute_csum() optimized for IP headers,
- *	which always checksum on 4 octet boundaries.
- */
-__sum16 ip_fast_csum(const void *iph, unsigned int ihl)
-{
-	return (__force __sum16)~do_csum(iph,ihl*4);
-}
-EXPORT_SYMBOL(ip_fast_csum);
-#endif
-
-/*
- * computes the checksum of a memory block at buff, length len,
- * and adds in "sum" (32-bit)
- *
- * returns a 32-bit number suitable for feeding into itself
- * or csum_tcpudp_magic
- *
- * this function must be called with even lengths, except
- * for the last fragment, which may be odd
- *
- * it's best to have buff aligned on a 32-bit boundary
- */
-__wsum csum_partial(const void *buff, int len, __wsum sum)
-{
-	unsigned int result = do_csum(buff, len);
-
-	/* add in old sum, and carry.. */
-	result += (__force u32)sum;
-	if ((__force u32)sum > result)
-		result += 1;
-	return (__force __wsum)result;
-}
-
-EXPORT_SYMBOL(csum_partial);
-
-/*
- * copy from fs while checksumming, otherwise like csum_partial
- */
-
-__wsum
-csum_partial_copy_from_user(const void __user *src, void *dst,
-			    int len, __wsum sum, int *csum_err)
-{
-	if (csum_err) *csum_err = 0;
-	memcpy(dst, (__force const void *)src, len);
-	return csum_partial(dst, len, sum);
-}
-EXPORT_SYMBOL(csum_partial_copy_from_user);
-
-/*
- * copy from ds while checksumming, otherwise like csum_partial
- */
-
-__wsum
-csum_partial_copy_nocheck(const void *src, void *dst, int len, __wsum sum)
-{
-	memcpy(dst, src, len);
-	return csum_partial(dst, len, sum);
-}
-EXPORT_SYMBOL(csum_partial_copy_nocheck);
-- 
1.7.0.4
