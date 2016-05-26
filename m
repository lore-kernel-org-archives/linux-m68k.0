From: "George Spelvin" <linux@horizon.com>
Subject: [PATCH v2 09/10] microblaze: Add <asm/hash.h>
Date: 26 May 2016 13:21:01 -0400
Message-ID: <20160526172101.24571.qmail__49766.7109048509$1464361690$gmane$org@ns.sciencehorizons.net>
References: <20160525073705.5792.qmail@ns.sciencehorizons.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:11508 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1753676AbcE0PHo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 May 2016 11:07:44 -0400
In-Reply-To: <20160525073705.5792.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: alistair.francis@xilinx.com, linux-kernel@vger.kernel.org, linux@sciencehorizons.net, michal.simek@xilinx.com
Cc: geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, phdm@macq.eu, schwab@linux-m68k.org, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp

Microblaze is an FPGA soft core that can be configured various ways.

If it is configured without a multiplier, the standard __hash_32()
will require a call to __mulsi3, which is a slow software loop.

Instead, use a shift-and-add sequence for the constant multiply.
GCC knows how to do this, but it's not as clever as some.

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Alistair Francis <alistair.francis@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>
---
 arch/microblaze/Kconfig            |  1 +
 arch/microblaze/include/asm/hash.h | 81 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)
 create mode 100644 arch/microblaze/include/asm/hash.h

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 3d793b55..ce3e5125 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -16,6 +16,7 @@ config MICROBLAZE
 	select GENERIC_IRQ_SHOW
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
+	select HAVE_ARCH_HASH
 	select HAVE_ARCH_KGDB
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DMA_API_DEBUG
diff --git a/arch/microblaze/include/asm/hash.h b/arch/microblaze/include/asm/hash.h
new file mode 100644
index 00000000..2f0c2a69
--- /dev/null
+++ b/arch/microblaze/include/asm/hash.h
@@ -0,0 +1,81 @@
+#ifndef _ASM_HASH_H
+#define _ASM_HASH_H
+
+/*
+ * Fortunately, most people who want to run Linux on Microblaze enable
+ * both multiplier and barrel shifter, but omitting them is technically
+ * a supported configuration.
+ *
+ * With just a barrel shifter, we can implement an efficient constant
+ * multiply using shifts and adds.  GCC can find a 9-step solution, but
+ * this 6-step solution was found by Yevgen Voronenko's implementation
+ * of the Hcub algorithm at http://spiral.ece.cmu.edu/mcm/gen.html.
+ *
+ * That software is really not designed for a single multiplier this large,
+ * but if you run it enough times with different seeds, it'll find several
+ * 6-shift, 6-add sequences for computing x * 0x61C88647.  They are all
+ *	c = (x << 19) + x;
+ *	a = (x <<  9) + c;
+ *	b = (x << 23) + a;
+ *	return (a<<11) + (b<<6) + (c<<3) - b;
+ * with variations on the order of the final add.
+ *
+ * Without even a shifter, it's hopless; any hash function will suck.
+ */
+
+#if CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL == 0
+
+#define HAVE_ARCH__HASH_32 1
+
+/* Multiply by GOLDEN_RATIO_32 = 0x61C88647 */
+static inline u32 __attribute_const__ __hash_32(u32 a)
+{
+#if CONFIG_XILINX_MICROBLAZE0_USE_BARREL
+	unsigned b, c;
+
+	/* Phase 1: Compute three intermediate values */
+	b =  a << 23;
+	c = (a << 19) + a;
+	a = (a <<  9) + c;
+	b += a;
+
+	/* Phase 2: Compute (a << 11) + (b << 6) + (c << 3) - b */
+	a <<= 5;
+	a += b;		/* (a << 5) + b */
+	a <<= 3;
+	a += c;		/* (a << 8) + (b << 3) + c */
+	a <<= 3;
+	return a - b;	/* (a << 11) + (b << 6) + (c << 3) - b */
+#else
+	/*
+	 * "This is really going to hurt."
+	 *
+	 * Without a barrel shifter, left shifts are implemented as
+	 * repeated additions, and the best we can do is an optimal
+	 * addition-subtraction chain.  This one is not known to be
+	 * optimal, but at 37 steps, it's decent for a 31-bit multiplier.
+	 *
+	 * Question: given its size (37*4 = 148 bytes per instance),
+	 * and slowness, is this worth having inline?
+	 */
+	unsigned b, c, d;
+
+	b = a << 4;	/* 4    */
+	c = b << 1;	/* 1  5 */
+	b += a;		/* 1  6 */
+	c += b;		/* 1  7 */
+	c <<= 3;	/* 3 10 */
+	c -= a;		/* 1 11 */
+	d = c << 7;	/* 7 18 */
+	d += b;		/* 1 19 */
+	d <<= 8;	/* 8 27 */
+	d += a;		/* 1 28 */
+	d <<= 1;	/* 1 29 */
+	d += b;		/* 1 30 */
+	d <<= 6;	/* 6 36 */
+	return d + c;	/* 1 37 total instructions*/
+#endif
+}
+
+#endif /* !CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL */
+#endif /* _ASM_HASH_H */
-- 
2.8.1
