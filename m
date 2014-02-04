From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] m68k: Switch to asm-generic/barrier.h
Date: Tue,  4 Feb 2014 21:15:53 +0100
Message-ID: <1391544954-7422-2-git-send-email-geert__49511.7052611478$1391545273$gmane$org@linux-m68k.org>
References: <1391544954-7422-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1391544954-7422-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

The generic nop() implementation is fine for m68k.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/Kbuild    |    1 +
 arch/m68k/include/asm/barrier.h |    8 --------
 2 files changed, 1 insertion(+), 8 deletions(-)
 delete mode 100644 arch/m68k/include/asm/barrier.h

diff --git a/arch/m68k/include/asm/Kbuild b/arch/m68k/include/asm/Kbuild
index df4d46fc321b..6fb9e813a910 100644
--- a/arch/m68k/include/asm/Kbuild
+++ b/arch/m68k/include/asm/Kbuild
@@ -1,3 +1,4 @@
+generic-y += barrier.h
 generic-y += bitsperlong.h
 generic-y += clkdev.h
 generic-y += cputime.h
diff --git a/arch/m68k/include/asm/barrier.h b/arch/m68k/include/asm/barrier.h
deleted file mode 100644
index 15c5f77c1614..000000000000
--- a/arch/m68k/include/asm/barrier.h
+++ /dev/null
@@ -1,8 +0,0 @@
-#ifndef _M68K_BARRIER_H
-#define _M68K_BARRIER_H
-
-#define nop()		do { asm volatile ("nop"); barrier(); } while (0)
-
-#include <asm-generic/barrier.h>
-
-#endif /* _M68K_BARRIER_H */
-- 
1.7.9.5
