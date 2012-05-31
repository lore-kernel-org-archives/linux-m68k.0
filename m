From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] m68k: Use asm-generic version of <asm/types.h>
Date: Thu, 31 May 2012 22:15:38 +0200
Message-ID: <1338495338-1962-2-git-send-email-geert__284.888110081916$1338495384$gmane$org@linux-m68k.org>
References: <1338495338-1962-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1338495338-1962-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The extra definition for BITS_PER_LONG we had is also indirectly provided
by <asm-generic/types.h>, via <asm-generic/int-ll64.h> and
<asm/bitsperlong.h>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/Kbuild  |    1 +
 arch/m68k/include/asm/types.h |   22 ----------------------
 2 files changed, 1 insertions(+), 22 deletions(-)
 delete mode 100644 arch/m68k/include/asm/types.h

diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
index 4d1f8fa..064f867 100644
--- a/arch/m68k/include/asm/Kbuild
+++ b/arch/m68k/include/asm/Kbuild
@@ -23,5 +23,6 @@ generic-y += scatterlist.h
 generic-y += siginfo.h
 generic-y += statfs.h
 generic-y += topology.h
+generic-y += types.h
 generic-y += word-at-a-time.h
 generic-y += xor.h
diff --git a/arch/m68k/include/asm/types.h b/arch/m68k/include/asm/types.h
deleted file mode 100644
index 89705ad..0000000
--- a/arch/m68k/include/asm/types.h
+++ /dev/null
@@ -1,22 +0,0 @@
-#ifndef _M68K_TYPES_H
-#define _M68K_TYPES_H
-
-/*
- * This file is never included by application software unless
- * explicitly requested (e.g., via linux/types.h) in which case the
- * application is Linux specific so (user-) name space pollution is
- * not a major issue.  However, for interoperability, libraries still
- * need to be careful to avoid a name clashes.
- */
-#include <asm-generic/int-ll64.h>
-
-/*
- * These aren't exported outside the kernel to avoid name space clashes
- */
-#ifdef __KERNEL__
-
-#define BITS_PER_LONG 32
-
-#endif /* __KERNEL__ */
-
-#endif /* _M68K_TYPES_H */
-- 
1.7.0.4
