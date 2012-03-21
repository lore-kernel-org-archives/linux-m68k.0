From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 01/11] m68k: Remove unused MAX_NOINT_IPL definition
Date: Wed, 21 Mar 2012 10:51:45 +0100
Message-ID: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/entry.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/entry.h b/arch/m68k/include/asm/entry.h
index 622138d..5d8b21c 100644
--- a/arch/m68k/include/asm/entry.h
+++ b/arch/m68k/include/asm/entry.h
@@ -35,11 +35,9 @@
 #if defined(MACH_ATARI_ONLY)
 	/* block out HSYNC on the atari */
 #define ALLOWINT	(~0x400)
-#define	MAX_NOINT_IPL	3
 #else
 	/* portable version */
 #define ALLOWINT	(~0x700)
-#define	MAX_NOINT_IPL	0
 #endif /* machine compilation types */
 
 #ifdef __ASSEMBLY__
-- 
1.7.0.4
