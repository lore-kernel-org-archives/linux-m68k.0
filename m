From: "George Spelvin" <linux@horizon.com>
Subject: [PATCH v2 10/10] h8300: Add <asm/hash.h>
Date: 26 May 2016 13:23:02 -0400
Message-ID: <20160526172302.24744.qmail@ns.sciencehorizons.net>
References: <20160525073809.5834.qmail@ns.sciencehorizons.net>
Reply-To: linux@sciencehorizons.net
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:46295 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1753706AbcE0PJw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 May 2016 11:09:52 -0400
In-Reply-To: <20160525073809.5834.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp
Cc: alistair.francis@xilinx.com, bfields@fieldses.org, geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux@sciencehorizons.net, michal.simek@xilinx.com, phdm@macq.eu, schwab@linux-m68k.org

This will improve the performance of hash_32() and hash_64(), but due
to complete lack of multi-bit shift instructions on H8, performance will
still be bad in surrounding code.

Designing H8-specific hash algorithms to work around that is a separate
project.  (But if the maintainers would like to get in touch...)

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: uclinux-h8-devel@lists.sourceforge.jp
---
 arch/h8300/Kconfig            |  1 +
 arch/h8300/include/asm/hash.h | 53 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/h8300/include/asm/hash.h

diff --git a/arch/h8300/Kconfig b/arch/h8300/Kconfig
index 986ea84c..6c583dbb 100644
--- a/arch/h8300/Kconfig
+++ b/arch/h8300/Kconfig
@@ -20,6 +20,7 @@ config H8300
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZO
 	select HAVE_ARCH_KGDB
+	select HAVE_ARCH_HASH
 
 config RWSEM_GENERIC_SPINLOCK
 	def_bool y
diff --git a/arch/h8300/include/asm/hash.h b/arch/h8300/include/asm/hash.h
new file mode 100644
index 00000000..04cfbd2b
--- /dev/null
+++ b/arch/h8300/include/asm/hash.h
@@ -0,0 +1,53 @@
+#ifndef _ASM_HASH_H
+#define _ASM_HASH_H
+
+/*
+ * The later H8SX models have a 32x32-bit multiply, but the H8/300H
+ * and H8S have only 16x16->32.  Since it's tolerably compact, this is
+ * basically an inlined version of the __mulsi3 code.  Since the inputs
+ * are not expected to be small, it's also simplfied by skipping the
+ * early-out checks.
+ *
+ * (Since neither CPU has any multi-bit shift instructions, a
+ * shift-and-add version is a non-starter.)
+ *
+ * TODO: come up with an arch-specific version of the hashing in fs/namei.c,
+ * since that is heavily dependent on rotates.  Which, as mentioned, suck
+ * horribly on H8.
+ */
+
+#if defined(CONFIG_CPU_H300H) || defined(CONFIG_CPU_H8S)
+
+#define HAVE_ARCH__HASH_32 1
+
+/*
+ * Multiply by k = 0x61C88647.  Fitting this into three registers requires
+ * one extra instruction, but reducing register pressure will probably
+ * make that back and then some.
+ *
+ * GCC asm note: %e1 is the high half of operand %1, while %f1 is the
+ * low half.  So if %1 is er4, then %e1 is e4 and %f1 is r4.
+ *
+ * This has been designed to modify x in place, since that's the most
+ * common usage, but preserve k, since hash_64() makes two calls in
+ * quick succession.
+ */
+static inline u32 __attribute_const__ __hash_32(u32 x)
+{
+	u32 temp;
+
+	asm(   "mov.w	%e1,%f0"
+	"\n	mulxu.w	%f2,%0"		/* klow * xhigh */
+	"\n	mov.w	%f0,%e1"	/* The extra instruction */
+	"\n	mov.w	%f1,%f0"
+	"\n	mulxu.w	%e2,%0"		/* khigh * xlow */
+	"\n	add.w	%e1,%f0"
+	"\n	mulxu.w	%f2,%1"		/* klow * xlow */
+	"\n	add.w	%f0,%e1"
+	: "=&r" (temp), "=r" (x)
+	: "%r" (GOLDEN_RATIO_32), "1" (x));
+	return x;
+}
+
+#endif
+#endif /* _ASM_HASH_H */
-- 
2.8.1
