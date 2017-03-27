From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68k: fix warnings on use of test_bit()
Date: Mon, 27 Mar 2017 13:10:57 +1000
Message-ID: <1490584257-15959-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:10762
        "EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751832AbdC0DLJ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Sun, 26 Mar 2017 23:11:09 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>

Compiling for m68k targets will give the following warning:

mm/filemap.c: In function ‘clear_bit_unlock_is_negative_byte’:
mm/filemap.c:940:30: warning: passing argument 2 of ‘test_bit’ discards ‘volatile’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  return test_bit(PG_waiters, mem);
                              ^
In file included from ./include/linux/bitops.h:36:0,
                 from ./include/linux/kernel.h:10,
                 from ./include/linux/list.h:8,
                 from ./include/linux/wait.h:6,
                 from ./include/linux/fs.h:5,
                 from ./include/linux/dax.h:4,
                 from mm/filemap.c:14:
./arch/m68k/include/asm/bitops.h:151:19: note: expected ‘const long unsigned int *’ but argument is of type ‘volatile void *’
 static inline int test_bit(int nr, const unsigned long *vaddr)
                   ^

(This is true at least for a gcc-5.4.0 based toolchain).

The problem is that the m68k test_bit() arguments do not match the
Documemtation/core-api/atomic_ops.rst defined one. (Most other
architectures define it with "const volatile unsigned long *addr" too).

Change the m68k test_bit() definition to more closely match the documented
definition. This cleans up the warning.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/include/asm/bitops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index b4a9b0d..dda58cf 100644
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
