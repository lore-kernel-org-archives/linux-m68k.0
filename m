From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 1/2] h8300: Correct signature of test_bit()
Date: Tue,  3 Jan 2017 18:52:49 +0100
Message-ID: <1483465970-11728-1-git-send-email-geert__32535.7649861418$1483466129$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

mm/filemap.c: In function 'clear_bit_unlock_is_negative_byte':
mm/filemap.c:933:9: warning: passing argument 2 of 'test_bit' discards 'volatile' qualifier from pointer target type
  return test_bit(PG_waiters, mem);
         ^
In file included from include/linux/bitops.h:36:0,
                 from include/linux/kernel.h:10,
                 from include/linux/list.h:8,
                 from include/linux/wait.h:6,
                 from include/linux/fs.h:5,
                 from include/linux/dax.h:4,
                 from mm/filemap.c:14:
arch/h8300/include/asm/bitops.h:68:90: note: expected 'const long unsigned int *' but argument is of type 'volatile void *'
 static inline int test_bit(int nr, const unsigned long *addr)

Make the bitmask pointed to by the "addr" parameter volatile to fix
this, like is done on other architectures.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Exposed by commit 98473f9f3f9bd404 ("mm/filemap: fix parameters to
test_bit()").
---
 arch/h8300/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/h8300/include/asm/bitops.h b/arch/h8300/include/asm/bitops.h
index 05999aba1d6ab364..30eaf5b9bf7319ad 100644
--- a/arch/h8300/include/asm/bitops.h
+++ b/arch/h8300/include/asm/bitops.h
@@ -65,7 +65,7 @@ static inline void FNAME(int nr, volatile unsigned long *addr)	\
 
 #undef H8300_GEN_BITOP
 
-static inline int test_bit(int nr, const unsigned long *addr)
+static inline int test_bit(int nr, const volatile unsigned long *addr)
 {
 	int ret = 0;
 	unsigned char *b_addr;
-- 
1.9.1
