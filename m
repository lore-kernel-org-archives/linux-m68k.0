From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/bitops: Always include <asm-generic/bitops/find.h>
Date: Wed,  6 Dec 2017 11:40:16 +0100
Message-ID: <1512556816-28627-1-git-send-email-geert__26958.4153699272$1512561796$gmane$org@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Clement Courbet <courbet@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Currently <asm/bitops.h> only includes <asm-generic/bitops/find.h> if
CONFIG_CPU_HAS_NO_BITFIELDS=y.  This used to be fine, as the code for
CONFIG_CPU_HAS_NO_BITFIELDS=n implemented everything provided by
<asm-generic/bitops/find.h>.

However, commit e49c614e6b37254b ("lib: optimize cpumask_next_and()")
added find_next_and_bit(), which is now not available if
CONFIG_CPU_HAS_NO_BITFIELDS=y:

    lib/find_bit_benchmark.c: In function ‘test_find_next_and_bit’:
    lib/find_bit_benchmark.c:115: error: implicit declaration of function ‘find_next_and_bit’

Move the inclusion of <asm-generic/bitops/find.h> outside the #ifdef to
fix this.

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/bitops.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index dda58cfe8c22a3ec..93b47b1f6fb420a1 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -311,7 +311,6 @@ static inline int bfchg_mem_test_and_change_bit(int nr,
  *	functions.
  */
 #if defined(CONFIG_CPU_HAS_NO_BITFIELDS)
-#include <asm-generic/bitops/find.h>
 #include <asm-generic/bitops/ffz.h>
 #else
 
@@ -441,6 +440,8 @@ static inline unsigned long ffz(unsigned long word)
 
 #endif
 
+#include <asm-generic/bitops/find.h>
+
 #ifdef __KERNEL__
 
 #if defined(CONFIG_CPU_HAS_NO_BITFIELDS)
-- 
2.7.4
