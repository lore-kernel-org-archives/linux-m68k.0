From: Nicholas Krause <xerofoify@gmail.com>
Subject: [PATCH] m68k: Remove FIXME comment in file sun3_pgalloc.h
Date: Wed,  2 Jul 2014 21:41:33 -0400
Message-ID: <1404351693-5588-1-git-send-email-xerofoify__32977.7759420269$1404351729$gmane$org@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sammy@sammy.net
Cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Removes a FIXME comment in this file due to it not compiling
as it now compiles.

Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
---
 arch/m68k/include/asm/sun3_pgalloc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/m68k/include/asm/sun3_pgalloc.h b/arch/m68k/include/asm/sun3_pgalloc.h
index f868506..1798f25 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -12,7 +12,6 @@
 
 #include <asm/tlb.h>
 
-/* FIXME - when we get this compiling */
 /* erm, now that it's compiling, what do we do with it? */
 #define _KERNPG_TABLE 0
 
-- 
1.9.1
