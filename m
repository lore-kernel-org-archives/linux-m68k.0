From: Akinobu Mita <akinobu.mita@gmail.com>
Subject: [PATCH] m68k: fix find_next bitops
Date: Tue,  8 Feb 2011 23:52:27 +0900
Message-ID: <1297176747-1147-1-git-send-email-akinobu.mita@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Akinobu Mita <akinobu.mita@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, Andreas Schwab <schwab@linux-m68k.org>, Michael Schmitz <schmitzmic@googlemail.com>

find_next bitops on m68k (find_next_zero_bit, find_next_bit, and
ext2_find_next_bit) may cause out of bounds memory access
when the bitmap size in bits % 32 != 0 and offset (the bitnumber
to start searching at) is very close to the bitmap size.

For example,

       unsigned long bitmap[2] = { 0, 0 };
       find_next_bit(bitmap, 63, 62)

1. find_next_bit() tries to find any set bits in bitmap[1],
   but no bits set.

2. Then find_first_bit(bimap + 2, -1)

3. Unfortunately find_fist_bit() takes unsigned int as the size argument.

4. find_first_bit will access bitmap[2~] until it find any set bits.

This switches find_next bitops to use generic implementation of
find bitops to fix the problem.
(Please feel free to suggest alternative way to fix)

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Roman Zippel <zippel@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: Andreas Schwab <schwab@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@googlemail.com>
---
 arch/m68k/Kconfig                 |    4 +
 arch/m68k/include/asm/bitops_mm.h |  188 ++-----------------------------------
 2 files changed, 13 insertions(+), 179 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index bc9271b..c11e029 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -28,6 +28,10 @@ config GENERIC_HWEIGHT
 	bool
 	default y
 
+config GENERIC_FIND_NEXT_BIT
+	bool
+	default y
+
 config GENERIC_CALIBRATE_DELAY
 	bool
 	default y
diff --git a/arch/m68k/include/asm/bitops_mm.h b/arch/m68k/include/asm/bitops_mm.h
index b4ecdaa..c03f400 100644
--- a/arch/m68k/include/asm/bitops_mm.h
+++ b/arch/m68k/include/asm/bitops_mm.h
@@ -176,100 +176,7 @@ static inline int test_bit(int nr, const unsigned long *vaddr)
 	return (vaddr[nr >> 5] & (1UL << (nr & 31))) != 0;
 }
 
-static inline int find_first_zero_bit(const unsigned long *vaddr,
-				      unsigned size)
-{
-	const unsigned long *p = vaddr;
-	int res = 32;
-	unsigned long num;
-
-	if (!size)
-		return 0;
-
-	size = (size + 31) >> 5;
-	while (!(num = ~*p++)) {
-		if (!--size)
-			goto out;
-	}
-
-	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-			      : "=d" (res) : "d" (num & -num));
-	res ^= 31;
-out:
-	return ((long)p - (long)vaddr - 4) * 8 + res;
-}
-
-static inline int find_next_zero_bit(const unsigned long *vaddr, int size,
-				     int offset)
-{
-	const unsigned long *p = vaddr + (offset >> 5);
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	if (bit) {
-		unsigned long num = ~*p++ & (~0UL << bit);
-		offset -= bit;
-
-		/* Look for zero in first longword */
-		__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-				      : "=d" (res) : "d" (num & -num));
-		if (res < 32)
-			return offset + (res ^ 31);
-		offset += 32;
-	}
-	/* No zero yet, search remaining full bytes for a zero */
-	res = find_first_zero_bit(p, size - ((long)p - (long)vaddr) * 8);
-	return offset + res;
-}
-
-static inline int find_first_bit(const unsigned long *vaddr, unsigned size)
-{
-	const unsigned long *p = vaddr;
-	int res = 32;
-	unsigned long num;
-
-	if (!size)
-		return 0;
-
-	size = (size + 31) >> 5;
-	while (!(num = *p++)) {
-		if (!--size)
-			goto out;
-	}
-
-	__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-			      : "=d" (res) : "d" (num & -num));
-	res ^= 31;
-out:
-	return ((long)p - (long)vaddr - 4) * 8 + res;
-}
-
-static inline int find_next_bit(const unsigned long *vaddr, int size,
-				int offset)
-{
-	const unsigned long *p = vaddr + (offset >> 5);
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	if (bit) {
-		unsigned long num = *p++ & (~0UL << bit);
-		offset -= bit;
-
-		/* Look for one in first longword */
-		__asm__ __volatile__ ("bfffo %1{#0,#0},%0"
-				      : "=d" (res) : "d" (num & -num));
-		if (res < 32)
-			return offset + (res ^ 31);
-		offset += 32;
-	}
-	/* No one yet, search remaining full bytes for a one */
-	res = find_first_bit(p, size - ((long)p - (long)vaddr) * 8);
-	return offset + res;
-}
+#include <asm-generic/bitops/find.h>
 
 /*
  * ffz = Find First Zero in word. Undefined if no zero exists,
@@ -365,10 +272,18 @@ static inline int minix_test_bit(int nr, const void *vaddr)
 #define ext2_set_bit_atomic(lock, nr, addr)	test_and_set_bit((nr) ^ 24, (unsigned long *)(addr))
 #define ext2_clear_bit(nr, addr)		__test_and_clear_bit((nr) ^ 24, (unsigned long *)(addr))
 #define ext2_clear_bit_atomic(lock, nr, addr)	test_and_clear_bit((nr) ^ 24, (unsigned long *)(addr))
+
+extern unsigned long generic_find_next_zero_le_bit(const unsigned long *addr,
+		unsigned long size, unsigned long offset);
+extern unsigned long generic_find_next_le_bit(const unsigned long *addr,
+		unsigned long size, unsigned long offset);
+
 #define ext2_find_next_zero_bit(addr, size, offset) \
 	generic_find_next_zero_le_bit((unsigned long *)addr, size, offset)
 #define ext2_find_next_bit(addr, size, offset) \
 	generic_find_next_le_bit((unsigned long *)addr, size, offset)
+#define ext2_find_first_zero_bit(addr, size) \
+	ext2_find_next_zero_bit(addr, size, 0)
 
 static inline int ext2_test_bit(int nr, const void *vaddr)
 {
@@ -376,91 +291,6 @@ static inline int ext2_test_bit(int nr, const void *vaddr)
 	return (p[nr >> 3] & (1U << (nr & 7))) != 0;
 }
 
-static inline int ext2_find_first_zero_bit(const void *vaddr, unsigned size)
-{
-	const unsigned long *p = vaddr, *addr = vaddr;
-	int res;
-
-	if (!size)
-		return 0;
-
-	size = (size >> 5) + ((size & 31) > 0);
-	while (*p++ == ~0UL)
-	{
-		if (--size == 0)
-			return (p - addr) << 5;
-	}
-
-	--p;
-	for (res = 0; res < 32; res++)
-		if (!ext2_test_bit (res, p))
-			break;
-	return (p - addr) * 32 + res;
-}
-
-static inline unsigned long generic_find_next_zero_le_bit(const unsigned long *addr,
-		unsigned long size, unsigned long offset)
-{
-	const unsigned long *p = addr + (offset >> 5);
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	if (bit) {
-		/* Look for zero in first longword */
-		for (res = bit; res < 32; res++)
-			if (!ext2_test_bit (res, p))
-				return (p - addr) * 32 + res;
-		p++;
-	}
-	/* No zero yet, search remaining full bytes for a zero */
-	res = ext2_find_first_zero_bit (p, size - 32 * (p - addr));
-	return (p - addr) * 32 + res;
-}
-
-static inline int ext2_find_first_bit(const void *vaddr, unsigned size)
-{
-	const unsigned long *p = vaddr, *addr = vaddr;
-	int res;
-
-	if (!size)
-		return 0;
-
-	size = (size >> 5) + ((size & 31) > 0);
-	while (*p++ == 0UL) {
-		if (--size == 0)
-			return (p - addr) << 5;
-	}
-
-	--p;
-	for (res = 0; res < 32; res++)
-		if (ext2_test_bit(res, p))
-			break;
-	return (p - addr) * 32 + res;
-}
-
-static inline unsigned long generic_find_next_le_bit(const unsigned long *addr,
-		unsigned long size, unsigned long offset)
-{
-	const unsigned long *p = addr + (offset >> 5);
-	int bit = offset & 31UL, res;
-
-	if (offset >= size)
-		return size;
-
-	if (bit) {
-		/* Look for one in first longword */
-		for (res = bit; res < 32; res++)
-			if (ext2_test_bit(res, p))
-				return (p - addr) * 32 + res;
-		p++;
-	}
-	/* No set bit yet, search remaining full bytes for a set bit */
-	res = ext2_find_first_bit(p, size - 32 * (p - addr));
-	return (p - addr) * 32 + res;
-}
-
 #endif /* __KERNEL__ */
 
 #endif /* _M68K_BITOPS_H */
-- 
1.7.4
