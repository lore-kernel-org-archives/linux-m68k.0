From: "George Spelvin" <linux@sciencehorizons.net>
Subject: [PATCH 08/10] m68k: Add <asm/archhash.h>
Date: 25 May 2016 03:34:55 -0400
Message-ID: <20160525073455.5709.qmail@ns.sciencehorizons.net>
References: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:56018 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1751853AbcEYHe4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 May 2016 03:34:56 -0400
In-Reply-To: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, torvalds@linux-foundation.org
Cc: linux@sciencehorizons.net, tglx@linutronix.de

This provides a multiply by constant GOLDEN_RATIO_32 = 0x61C88647
for the original mc68000, which lacks a 32x32-bit multiply instruction.

Yes, the amount of optimization effort put in is excessive. :-)

Addition chains found by Yevgen Voronenko's Hcub algorithm at
http://spiral.ece.cmu.edu/mcm/gen.html

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/Kconfig                |  1 +
 arch/m68k/include/asm/archhash.h | 67 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 arch/m68k/include/asm/archhash.h

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 498b567f..95197d5e 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -23,6 +23,7 @@ config M68K
 	select MODULES_USE_ELF_RELA
 	select OLD_SIGSUSPEND3
 	select OLD_SIGACTION
+	select HAVE_ARCH_HASH
 
 config RWSEM_GENERIC_SPINLOCK
 	bool
diff --git a/arch/m68k/include/asm/archhash.h b/arch/m68k/include/asm/archhash.h
new file mode 100644
index 00000000..c2bb2fc5
--- /dev/null
+++ b/arch/m68k/include/asm/archhash.h
@@ -0,0 +1,67 @@
+#ifndef _ASM_ARCHHASH_H
+#define _ASM_ARCHHASH_H
+
+/*
+ * The only 68k processors that lack MULU.L and so need this workaround
+ * are the original 68000 and 68010.
+ *
+ * Annoyingly, GCC defines __mc68000 for all processors in the family;
+ * the only way to identify an mc68000 is by the *absence* of other
+ * symbols; __mcpu32, __mcoldfire__, __mc68020, etc.
+ */
+#if ! (defined(__mc68020) || \
+	defined(__mc68030) || \
+	defined(__mc68040) || \
+	defined(__mc68060) || \
+	defined(__mcpu32)  || \
+	defined(__mcoldfire))
+
+#define HAVE_ARCH__HASH_32 1
+/*
+ * While it would be legal to substitute a different hash operation
+ * entirely, let's keep it simple and just use an optimized multiply
+ * by GOLDEN_RATIO_32 = 0x61C88647.
+ *
+ * The best way to do that appears to be to multiply by 0x8647 with
+ * shifts and adds, and use mulu.w to multiply the high half by 0x61C8.
+ *
+ * Because the 68000 has multi-cycle shifts, this addition chain is
+ * chosen to minimise the shift distances.
+ *
+ * Despite every attempt to spoon-feed GCC simple operations, GCC 6.1.1
+ * doggedly insists on doing annoying things like converting "lsl.l #2,<reg>"
+ * (12 cycles) to two adds (8+8 cycles).
+ *
+ * It also likes to notice two shifts in a row, like "a = x << 2" and
+ * "a <<= 7", and convert that to "a = x << 9".  But shifts longer than
+ * 8 bits are extra-slow on m68k, so that's a lose.
+ *
+ * Since the 68000 is a very simple in-order processor with no instruction
+ * scheduling effects on execution time, we can safely take it out of GCC's
+ * hands and write one big asm() block.
+ *
+ * Without calling overhead, this operation is 30 bytes (14 instructions
+ * plus one immediate constant) and 166 cycles.
+ */
+static inline u32 __attribute_const__ __hash_32(u32 x)
+{
+	u32 a, b;
+
+	asm(   "move.l %2,%0"	/* 0x0001 */
+	"\n	lsl.l #2,%0"	/* 0x0004 */
+	"\n	move.l %0,%1"
+	"\n	lsl.l #7,%0"	/* 0x0200 */
+	"\n	add.l %2,%0"	/* 0x0201 */
+	"\n	add.l %0,%1"	/* 0x0205 */
+	"\n	add.l %0,%0"	/* 0x0402 */
+	"\n	add.l %0,%1"	/* 0x0607 */
+	"\n	lsl.l #5,%0"	/* 0x8040 */
+				/* 0x8647 */
+	: "=&d" (a), "=&r" (b)
+	: "g" (x));
+
+	return ((u16)(x*0x61c8) << 16) + a + b;
+}
+#endif	/* HAVE_ARCH__HASH_32 */
+
+#endif	/* _ASM_ARCHHASH_H */
-- 
2.8.1
