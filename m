From: "George Spelvin" <linux@horizon.com>
Subject: [PATCH v2 07/10] <linux/hash.h>: Add support for architecture-specific functions
Date: 26 May 2016 13:16:36 -0400
Message-ID: <20160526171636.24317.qmail@ns.sciencehorizons.net>
References: <20160525073311.5600.qmail@ns.sciencehorizons.net>
Reply-To: linux@sciencehorizons.net
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:24637 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1751250AbcE0PDS (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 27 May 2016 11:03:18 -0400
In-Reply-To: <20160525073311.5600.qmail@ns.sciencehorizons.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux@sciencehorizons.net
Cc: alistair.francis@xilinx.com, bfields@fieldses.org, geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, michal.simek@xilinx.com, phdm@macq.eu, schwab@linux-m68k.org, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp

This is just the infrastructure; there are no users yet.

This is modelled on CONFIG_ARCH_RANDOM; a CONFIG_ symbol declares
the existence of <asm/hash.h>.

That file may define its own versions of various functions, and define
HAVE_* symbols (no CONFIG_ prefix!) to suppress the generic ones.

Included is a self-test (in lib/test_hash.c) that verifies the basics.
It is NOT in general required that the arch-specific functions compute
the same thing as the generic, but if a HAVE_* symbol is defined with
the value 1, then equality is tested.

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>
Cc: Philippe De Muyter <phdm@macq.eu>
Cc: linux-m68k@lists.linux-m68k.org
Cc: Alistair Francis <alistai@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: uclinux-h8-devel@lists.sourceforge.jp
---
 arch/Kconfig         |   8 ++
 fs/namei.c           |   6 +-
 include/linux/hash.h |  24 ++++-
 lib/Kconfig.debug    |  11 +++
 lib/Makefile         |   1 +
 lib/test_hash.c      | 250 +++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 296 insertions(+), 4 deletions(-)
 create mode 100644 lib/test_hash.c

diff --git a/arch/Kconfig b/arch/Kconfig
index 81869a5e..96406e4d 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -589,6 +589,14 @@ config HAVE_STACK_VALIDATION
 	  Architecture supports the 'objtool check' host tool command, which
 	  performs compile-time stack metadata validation.
 
+config HAVE_ARCH_HASH
+	bool
+	default n
+	help
+	  If this is set, the architecture provides an <asm/hash.h>
+	  file which provides platform-specific implementations of some
+	  functions in <linux/hash.h> or fs/namei.c.
+
 #
 # ABI hall of shame
 #
diff --git a/fs/namei.c b/fs/namei.c
index 2b8d0650..cb438b84 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1788,7 +1788,11 @@ static int walk_component(struct nameidata *nd, int flags)
 
 #include <asm/word-at-a-time.h>
 
-#ifdef CONFIG_64BIT
+#ifdef HASH_MIX
+
+/* Architecture provides HASH_MIX and fold_hash() in <asm/hash.h> */
+
+#elif defined(CONFIG_64BIT)
 /*
  * Register pressure in the mixing function is an issue, particularly
  * on 32-bit x86, but almost any function requires one state value and
diff --git a/include/linux/hash.h b/include/linux/hash.h
index 8926f369..ab62a9a4 100644
--- a/include/linux/hash.h
+++ b/include/linux/hash.h
@@ -41,18 +41,36 @@
 #define GOLDEN_RATIO_32 0x61C88647
 #define GOLDEN_RATIO_64 0x61C8864680B583EBull
 
-static inline u32 __hash_32(u32 val)
+#ifdef CONFIG_HAVE_ARCH_HASH
+/* This header may use the GOLDEN_RATIO_xx constants */
+#include <asm/hash.h>
+#endif
+
+/*
+ * The _generic versions exist only so lib/test_hash.c can
+ * compare the arch-optimized versions with the generic.
+ */
+#ifndef HAVE_ARCH__HASH_32
+#define __hash_32 __hash_32_generic
+#endif
+static inline u32 __hash_32_generic(u32 val)
 {
 	return val * GOLDEN_RATIO_32;
 }
 
-static inline u32 hash_32(u32 val, unsigned int bits)
+#ifndef HAVE_ARCH_HASH_32
+#define hash_32 hash_32_generic
+#endif
+static inline u32 hash_32_generic(u32 val, unsigned int bits)
 {
 	/* High bits are more random, so use them. */
 	return __hash_32(val) >> (32 - bits);
 }
 
-static __always_inline u32 hash_64(u64 val, unsigned int bits)
+#ifndef HAVE_ARCH_HASH_64
+#define hash_64 hash_64_generic
+#endif
+static __always_inline u32 hash_64_generic(u64 val, unsigned int bits)
 {
 	if (__builtin_constant_p(bits > 32 || bits == 0)) {
 		BUILD_BUG_ON(bits > 32 || bits == 0);
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1e9a6075..18ec69ba 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1815,6 +1815,17 @@ config TEST_RHASHTABLE
 
 	  If unsure, say N.
 
+config TEST_HASH
+	tristate "Perform selftest on hash functions"
+	default n
+	help
+	  Enable this option to test the kernel's integer (<linux/hash,h>)
+	  and string (<linux/stringhash.h>) hash functions on boot
+	  (or module load).
+
+	  This is intended to help people writing architecture-specific
+	  optimized versions.  If unsure, say N.
+
 endmenu # runtime tests
 
 config PROVIDE_OHCI1394_DMA_INIT
diff --git a/lib/Makefile b/lib/Makefile
index 9d9804e5..16c3bda5 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -48,6 +48,7 @@ obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
 obj-y += kstrtox.o
 obj-$(CONFIG_TEST_BPF) += test_bpf.o
 obj-$(CONFIG_TEST_FIRMWARE) += test_firmware.o
+obj-$(CONFIG_TEST_HASH) += test_hash.o
 obj-$(CONFIG_TEST_KASAN) += test_kasan.o
 obj-$(CONFIG_TEST_KSTRTOX) += test-kstrtox.o
 obj-$(CONFIG_TEST_LKM) += test_module.o
diff --git a/lib/test_hash.c b/lib/test_hash.c
new file mode 100644
index 00000000..bb43dac1
--- /dev/null
+++ b/lib/test_hash.c
@@ -0,0 +1,250 @@
+/*
+ * Test cases for <linux/hash.h> and <linux/stringhash.h>
+ * This just verifies that various ways of computing a hash
+ * produce the same thing and, for cases where a k-bit hash
+ * value is requested, is of the requested size.
+ *
+ * We fill a buffer with a 255-byte null-terminated string,
+ * and use both full_name_hash() and hash_string() to hash the
+ * substrings from i to j, where 0 <= i < j < 256.
+ *
+ * The returned values are used to check that __hash_32() and
+ * __hash_32_generic() compute the same thing.  Likewise hash_32()
+ * and hash_64().
+ * */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt "\n"
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/hash.h>
+#include <linux/stringhash.h>
+#include <linux/printk.h>
+
+/* 32-bit XORSHIFT generator.  Seed must not be zero. */
+static u32 __init __attribute_const__
+xorshift(u32 seed)
+{
+	seed ^= seed << 13;
+	seed ^= seed >> 17;
+	seed ^= seed << 5;
+	return seed;
+}
+
+/* Given a non-zero x, returns a non-zero byte. */
+static u8 __init __attribute_const__
+mod255(u32 x)
+{
+	x = (x & 0xffff) + (x >> 16);	/* 1 <= x <= 0x1fffe */
+	x = (x & 0xff) + (x >> 8);	/* 1 <= x <= 0x2fd */
+	x = (x & 0xff) + (x >> 8);	/* 1 <= x <= 0x100 */
+	x = (x & 0xff) + (x >> 8);	/* 1 <= x <= 0xff */
+	return x;
+}
+
+/* Fill the buffer with non-zero bytes. */
+static void __init
+fill_buf(char *buf, size_t len, u32 seed)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		seed = xorshift(seed);
+		buf[i] = mod255(seed);
+	}
+}
+
+/*
+ * Test the various integer hash functions.  h64 (or its low-order bits)
+ * is the integer to hash.  hash_or accumulates the OR of the hash values,
+ * which are later checked to see that they cover all the requested bits.
+ *
+ * Because these functions (as opposed to the string hashes) are all
+ * inline, the code being tested is actually in the module, and you can
+ * recompile and re-test the module without rebooting.
+ */
+static bool __init
+test_int_hash(unsigned long long h64, u32 hash_or[2][33])
+{
+	int k;
+	u32 h0 = (u32)h64, h1, h2;
+
+	/* Test __hash32 */
+	hash_or[0][0] |= h1 = __hash_32(h0);
+#ifdef HAVE_ARCH__HASH_32
+	hash_or[1][0] |= h2 = __hash_32_generic(h0);
+#if HAVE_ARCH__HASH_32 == 1
+	if (h1 != h2) {
+		pr_err("__hash_32(%#x) = %#x != __hash_32_generic() = %#x",
+			h0, h1, h2);
+		return false;
+	}
+#endif
+#endif
+
+	/* Test k = 1..32 bits */
+	for (k = 1; k <= 32; k++) {
+		u32 const m = ((u32)2 << (k-1)) - 1;	/* Low k bits set */
+
+		/* Test hash_32 */
+		hash_or[0][k] |= h1 = hash_32(h0, k);
+		if (h1 > m) {
+			pr_err("hash_32(%#x, %d) = %#x > %#x", h0, k, h1, m);
+			return false;
+		}
+#ifdef HAVE_ARCH_HASH_32
+		h2 = hash_32_generic(h0, k);
+#if HAVE_ARCH_HASH_32 == 1
+		if (h1 != h2) {
+			pr_err("hash_32(%#x, %d) = %#x != hash_32_generic() "
+				" = %#x", h0, k, h1, h2);
+			return false;
+		}
+#else
+		if (h2 > m) {
+			pr_err("hash_32_generic(%#x, %d) = %#x > %#x",
+				h0, k, h1, m);
+			return false;
+		}
+#endif
+#endif
+		/* Test hash_64 */
+		hash_or[1][k] |= h1 = hash_64(h64, k);
+		if (h1 > m) {
+			pr_err("hash_64(%#llx, %d) = %#x > %#x", h64, k, h1, m);
+			return false;
+		}
+#ifdef HAVE_ARCH_HASH_64
+		h2 = hash_64_generic(h64, k);
+#if HAVE_ARCH_HASH_64 == 1
+		if (h1 != h2) {
+			pr_err("hash_64(%#llx, %d) = %#x != hash_64_generic() "
+				"= %#x", h64, k, h1, h2);
+			return false;
+		}
+#else
+		if (h2 > m) {
+			pr_err("hash_64_generic(%#llx, %d) = %#x > %#x",
+				h64, k, h1, m);
+			return false;
+		}
+#endif
+#endif
+	}
+
+	(void)h2;	/* Suppress unused variable warning */
+	return true;
+}
+
+#define SIZE 256	/* Run time is cubic in SIZE */
+
+static int __init
+test_hash_init(void)
+{
+	char buf[SIZE];
+	u32 string_or = 0, hash_or[2][33] = { 0 };
+	unsigned tests = 0;
+	unsigned long long h64 = 0;
+	int i, j;
+
+	fill_buf(buf, SIZE-1, 1);
+
+	/* Test every possible non-empty substring in the buffer. */
+	for (j = SIZE; j > 0; --j) {
+		buf[j-1] = '\0';
+
+		for (i = 0; i < j; i++) {
+			u32 h0 = full_name_hash(buf+i, j-i);
+			u64 hashlen = hash_string(buf+i);
+
+			/* Check that hash_string gets the length right */
+			if (hashlen_len(hashlen) != j-i-1) {
+				pr_err("hash_string(%d..%d) returned length "
+					"%u, expected %d",
+					i, j, hashlen_len(hashlen), j-i-1);
+				return -EINVAL;
+			}
+			/* Check that the hashes match */
+			if (hashlen_hash(hashlen) != h0) {
+				pr_err("hash_string(%d..%d) = %08x != "
+					"full_name_hash() = %08x",
+					i, j, hashlen_hash(hashlen), h0);
+				return -EINVAL;
+			}
+
+			string_or |= h0;
+			h64 = h64 << 32 | h0;	/* For use with hash_64 */
+			if (!test_int_hash(h64, hash_or))
+				return -EINVAL;
+			tests++;
+		} /* i */
+	} /* j */
+
+	/* The OR of all the hash values should cover all the bits */
+	if (~string_or) {
+		pr_err("OR of all string hash results = %#x != %#x",
+			string_or, -1u);
+		return -EINVAL;
+	}
+	if (~hash_or[0][0]) {
+		pr_err("OR of all __hash_32 results = %#x != %#x",
+			hash_or[0][0], -1u);
+		return -EINVAL;
+	}
+#ifdef HAVE_ARCH__HASH_32
+#if HAVE_ARCH__HASH_32 != 1	/* Test is pointless if results match */
+	if (~hash_or[1][0]) {
+		pr_err("OR of all __hash_32_generic results = %#x != %#x",
+			hash_or[1][0], -1u);
+		return -EINVAL;
+	}
+#endif
+#endif
+
+	/* Likewise for all the i-bit hash values */
+	for (i = 1; i <= 32; i++) {
+		u32 const m = ((u32)2 << (i-1)) - 1;	/* Low i bits set */
+
+		if (hash_or[0][i] != m) {
+			pr_err("OR of all hash_32(%d) results = %#x "
+				"(%#x expected)", i, hash_or[0][i], m);
+			return -EINVAL;
+		}
+		if (hash_or[1][i] != m) {
+			pr_err("OR of all hash_64(%d) results = %#x "
+				"(%#x expected)", i, hash_or[1][i], m);
+			return -EINVAL;
+		}
+	}
+
+	/* Issue notices about skipped tests. */
+#ifndef HAVE_ARCH__HASH_32
+	pr_info("__hash_32() has no arch implementation to test.");
+#elif HAVE_ARCH__HASH_32 != 1
+	pr_info("__hash_32() is arch-specific; not compared to generic.");
+#endif
+#ifndef HAVE_ARCH_HASH_32
+	pr_info("hash_32() has no arch implementation to test.");
+#elif HAVE_ARCH_HASH_32 != 1
+	pr_info("hash_32() is arch-specific; not compared to generic.");
+#endif
+#ifndef HAVE_ARCH_HASH_64
+	pr_info("hash_64() has no arch implementation to test.");
+#elif HAVE_ARCH_HASH_64 != 1
+	pr_info("hash_64() is arch-specific; not compared to generic.");
+#endif
+
+	pr_notice("%u tests passed.", tests);
+
+	return 0;
+}
+
+static void __exit test_hash_exit(void)
+{
+}
+
+module_init(test_hash_init);	/* Does everything */
+module_exit(test_hash_exit);	/* Does nothing */
+
+MODULE_LICENSE("GPL");
-- 
2.8.1
