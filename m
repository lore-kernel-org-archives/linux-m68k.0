From: Daniel Palmer <danieruru@gmail.com>
Subject: [PATCH 1/2] m68k: fix some compiler warnings when building for DragonBall
Date: Sat,  5 Apr 2014 14:39:57 +0900
Message-ID: <1396676398-31175-1-git-send-email-danieruru@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Daniel Palmer <danieruru@gmail.com>

Signed-off-by: Daniel Palmer <danieruru@gmail.com>
---
 arch/m68k/kernel/setup_no.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
index 5b16f5d..88c27d9 100644
--- a/arch/m68k/kernel/setup_no.c
+++ b/arch/m68k/kernel/setup_no.c
@@ -58,17 +58,16 @@ void (*mach_halt)(void);
 void (*mach_power_off)(void);
 
 #ifdef CONFIG_M68000
-#define CPU_NAME	"MC68000"
-#endif
-#ifdef CONFIG_M68328
+#if defined(CONFIG_M68328)
 #define CPU_NAME	"MC68328"
-#endif
-#ifdef CONFIG_M68EZ328
+#elif defined(CONFIG_M68EZ328)
 #define CPU_NAME	"MC68EZ328"
-#endif
-#ifdef CONFIG_M68VZ328
+#elif defined(CONFIG_M68VZ328)
 #define CPU_NAME	"MC68VZ328"
+#else
+#define CPU_NAME	"MC68000"
 #endif
+#endif /* CONFIG_M68000 */
 #ifdef CONFIG_M68360
 #define CPU_NAME	"MC68360"
 #endif
-- 
1.9.1
