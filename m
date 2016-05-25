From: "George Spelvin" <linux@sciencehorizons.net>
Subject: [PATCH 07/10] <linux/hash.h>: Add support for architecture-specific functions
Date: 25 May 2016 03:33:11 -0400
Message-ID: <20160525073311.5600.qmail@ns.sciencehorizons.net>
References: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from science.sciencehorizons.net ([71.41.210.147]:15825 "HELO
	ns.sciencehorizons.net" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
	with SMTP id S1752329AbcEYHdM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 25 May 2016 03:33:12 -0400
In-Reply-To: <CA+55aFxPSW+84KfQ1N_WmND-wtvgj2zQm8nFPkRcc+gyU=uing@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, torvalds@linux-foundation.org
Cc: alistair.francis@xilinx.com, geert@linux-m68k.org, gerg@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux@sciencehorizons.net, michal.simek@xilinx.com, tglx@linutronix.de, uclinux-h8-devel@lists.sourceforge.jp, ysato@users.sourceforge.jp

This is just the infrastructure; there are no users yet.

This is modelled on CONFIG_ARCH_RANDOM; a CONFIG_ symbol declares
the existence of <asm/archhash.h>.

That file may define its own versions of various functions, and define
HAVE_* symbols (no CONFIG_ prefix!) to suppress the generic ones.

Signed-off-by: George Spelvin <linux@sciencehorizons.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: Alistair Francis <alistai@xilinx.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: uclinux-h8-devel@lists.sourceforge.jp
---
 arch/Kconfig         |  8 ++++++++
 fs/namei.c           |  6 +++++-
 include/linux/hash.h | 11 +++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 81869a5e..33e8d7b1 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -589,6 +589,14 @@ config HAVE_STACK_VALIDATION
 	  Architecture supports the 'objtool check' host tool command, which
 	  performs compile-time stack metadata validation.
 
+config HAVE_ARCH_HASH
+	bool
+	default n
+	help
+	  If this is set, the architecture provides an <asm/archhash.h>
+	  file which provides platform-specific implementations of some
+	  functions in <linux/hash.h> or fs/namei.c.
+
 #
 # ABI hall of shame
 #
diff --git a/fs/namei.c b/fs/namei.c
index 2b8d0650..380e8057 100644
--- a/fs/namei.c
+++ b/fs/namei.c
@@ -1788,7 +1788,11 @@ static int walk_component(struct nameidata *nd, int flags)
 
 #include <asm/word-at-a-time.h>
 
-#ifdef CONFIG_64BIT
+#ifdef HASH_MIX
+
+/* Architecture provides HASH_MIX and fold_hash() in <linux/hash.h> */
+
+#elif defined(CONFIG_64BIT)
 /*
  * Register pressure in the mixing function is an issue, particularly
  * on 32-bit x86, but almost any function requires one state value and
diff --git a/include/linux/hash.h b/include/linux/hash.h
index 8926f369..838bc84b 100644
--- a/include/linux/hash.h
+++ b/include/linux/hash.h
@@ -41,17 +41,27 @@
 #define GOLDEN_RATIO_32 0x61C88647
 #define GOLDEN_RATIO_64 0x61C8864680B583EBull
 
+#ifdef CONFIG_HAVE_ARCH_HASH
+/* This header may use the GOLDEN_RATIO_xx constants */
+#include <asm/archhash.h>
+#endif
+
+#ifndef HAVE_ARCH__HASH_32
 static inline u32 __hash_32(u32 val)
 {
 	return val * GOLDEN_RATIO_32;
 }
+#endif
 
+#ifndef HAVE_ARCH_HASH_32
 static inline u32 hash_32(u32 val, unsigned int bits)
 {
 	/* High bits are more random, so use them. */
 	return __hash_32(val) >> (32 - bits);
 }
+#endif
 
+#ifndef HAVE_ARCH_HASH_64
 static __always_inline u32 hash_64(u64 val, unsigned int bits)
 {
 	if (__builtin_constant_p(bits > 32 || bits == 0)) {
@@ -74,6 +84,7 @@ static __always_inline u32 hash_64(u64 val, unsigned int bits)
 	return hash_32((u32)val - __hash_32(val >> 32), bits);
 #endif
 }
+#endif
 
 static inline u32 hash_ptr(const void *ptr, unsigned int bits)
 {
-- 
2.8.1
