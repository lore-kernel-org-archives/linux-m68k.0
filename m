From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] m68k/bitops: Correct signature of test_bit()
Date: Tue,  3 Jan 2017 18:52:50 +0100
Message-ID: <1483465970-11728-2-git-send-email-geert__29246.0053381093$1483466128$gmane$org@linux-m68k.org>
References: <1483465970-11728-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1483465970-11728-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

mm/filemap.c: In function ‘clear_bit_unlock_is_negative_byte’:
mm/filemap.c:933: warning: passing argument 2 of ‘test_bit’ discards qualifiers from pointer target type

Make the bitmask pointed to by the "vaddr" parameter volatile to fix
this, like is done on other architectures.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Exposed by commit 98473f9f3f9bd404 ("mm/filemap: fix parameters to
test_bit()").
---
 arch/m68k/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index b4a9b0d5928dfb33..dda58cfe8c22a3ec 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -148,7 +148,7 @@ static inline void bfchg_mem_change_bit(int nr, volatile unsigned long *vaddr)
 #define __change_bit(nr, vaddr)	change_bit(nr, vaddr)
 
 
-static inline int test_bit(int nr, const unsigned long *vaddr)
+static inline int test_bit(int nr, const volatile unsigned long *vaddr)
 {
 	return (vaddr[nr >> 5] & (1UL << (nr & 31))) != 0;
 }
-- 
1.9.1
