From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: The bootinfo is located right after the kernel
Date: Sun, 15 Sep 2013 11:44:44 +0200
Message-ID: <1379238284-3451-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Since the introduction of init sections (which are located after BSS), the
bootinfo is no longer located right after the BSS, but after all kernel
sections.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/setup_mm.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 1e9e803..55d718a 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -242,7 +242,7 @@ void __init setup_arch(char **cmdline_p)
 	int i;
 #endif
 
-	/* The bootinfo is located right after the kernel bss */
+	/* The bootinfo is located right after the kernel */
 	if (!CPU_IS_COLDFIRE)
 		m68k_parse_bootinfo((const struct bi_record *)_end);
 
-- 
1.7.9.5
