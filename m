From: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: [RFC/PATCH] m68k: fix compiler warning by properly inlining flat_set_persistent()
Date: Mon, 23 Apr 2012 10:50:10 -0300
Message-ID: <1335189010-8875-1-git-send-email-elezegarcia@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, Ezequiel Garcia <elezegarcia@gmail.com>

Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
---
To define or to inline that is the question:
The current definition of flat_set_persistent produces a compiler 
warning; arch/sh/ does it in a different way defining it to 
a macro that uses persistent var. IMHO, an inline is easier to read.
---
 arch/m68k/include/asm/flat.h |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/flat.h b/arch/m68k/include/asm/flat.h
index a0e2907..f9454b8 100644
--- a/arch/m68k/include/asm/flat.h
+++ b/arch/m68k/include/asm/flat.h
@@ -11,6 +11,11 @@
 #define	flat_get_addr_from_rp(rp, relval, flags, p)	get_unaligned(rp)
 #define	flat_put_addr_at_rp(rp, val, relval)	put_unaligned(val,rp)
 #define	flat_get_relocate_addr(rel)		(rel)
-#define	flat_set_persistent(relval, p)		0
+
+static inline int flat_set_persistent(unsigned long relval,
+				      unsigned long *persistent)
+{
+	return 0;
+}
 
 #endif /* __M68KNOMMU_FLAT_H__ */
-- 
1.7.3.4
