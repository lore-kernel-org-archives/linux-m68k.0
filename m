From: "George Spelvin" <linux@horizon.com>
Subject: [PATCH v2 08/10] m68k: Add <asm/hash.h>
Date: 26 May 2016 13:19:29 -0400
Message-ID: <20160526171929.24497.qmail@ns.sciencehorizons.net>
References: <20160525073455.5709.qmail@ns.sciencehorizons.net>
Reply-To: linux@sciencehorizons.net
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:19637 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1750914AbcE0PGK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 May 2016 11:06:10 -0400
In-Reply-To: <20160525073455.5709.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org, gerg@linux-m68k.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux@sciencehorizons.net
Cc: alistair.francis@xilinx.com, michal.simek@xilinx.com, phdm@macq.eu, schwab@linux-m68k.org, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp

This provides a multiply by constant GOLDEN_RATIO_32 = 0x61C88647
for the original mc68000, which lacks a 32x32-bit multiply instruction.

Yes, the amount of optimization effort put in is excessive. :-)

Shift-add chain found by Yevgen Voronenko's Hcub algorithm at
http://spiral.ece.cmu.edu/mcm/gen.html

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>
Cc: Philippe De Muyter <phdm@macq.eu>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/Kconfig.cpu        |  1 +
 arch/m68k/include/asm/hash.h | 59 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 arch/m68k/include/asm/hash.h

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 0dfcf128..bf3de464 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -40,6 +40,7 @@ config M68000
 	select CPU_HAS_NO_MULDIV64
 	select CPU_HAS_NO_UNALIGNED
 	select GENERIC_CSUM
+	select HAVE_ARCH_HASH
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
diff --git a/arch/m68k/include/asm/hash.h b/arch/m68k/include/asm/hash.h
new file mode 100644
index 00000000..6407af84
--- /dev/null
+++ b/arch/m68k/include/asm/hash.h
@@ -0,0 +1,59 @@
+#ifndef _ASM_HASH_H
+#define _ASM_HASH_H
+
+/*
+ * If CONFIG_M68000=y (original mc68000/010), this file is #included
+ * to work around the lack of a MULU.L instruction.
+ */
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
+ * Despite every attempt to spoon-feed it simple operations, GCC
+ * 6.1.1 doggedly insists on doing annoying things like converting
+ * "lsl.l #2,<reg>" (12 cycles) to two adds (8+8 cycles).
+ *
+ * It also likes to notice two shifts in a row, like "a = x << 2" and
+ * "a <<= 7", and convert that to "a = x << 9".  But shifts longer
+ * than 8 bits are extra-slow on m68k, so that's a lose.
+ *
+ * Since the 68000 is a very simple in-order processor with no
+ * instruction scheduling effects on execution time, we can safely
+ * take it out of GCC's hands and write one big asm() block.
+ *
+ * Without calling overhead, this operation is 30 bytes (14 instructions
+ * plus one immediate constant) and 166 cycles.
+ *
+ * (Because %2 is fetched twice, it can't be postincrement, and thus it
+ * can't be a fully general "g" or "m".  Register is preferred, but
+ * offsettable memory or immediate will work.)
+ */
+static inline u32 __attribute_const__ __hash_32(u32 x)
+{
+	u32 a, b;
+
+	asm(   "move.l %2,%0"	/* a = x * 0x0001 */
+	"\n	lsl.l #2,%0"	/* a = x * 0x0004 */
+	"\n	move.l %0,%1"
+	"\n	lsl.l #7,%0"	/* a = x * 0x0200 */
+	"\n	add.l %2,%0"	/* a = x * 0x0201 */
+	"\n	add.l %0,%1"	/* b = x * 0x0205 */
+	"\n	add.l %0,%0"	/* a = x * 0x0402 */
+	"\n	add.l %0,%1"	/* b = x * 0x0607 */
+	"\n	lsl.l #5,%0"	/* a = x * 0x8040 */
+	: "=&d,d" (a), "=&r,r" (b)
+	: "r,roi?" (x));	/* a+b = x*0x8647 */
+
+	return ((u16)(x*0x61c8) << 16) + a + b;
+}
+
+#endif	/* _ASM_HASH_H */
-- 
2.8.1
