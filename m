From: Daniel Palmer <danieruru@gmail.com>
Subject: [PATCH 2/2] Fix mach_sched_init for EZ and VZ DragonBall chips.
Date: Wed,  2 Apr 2014 23:43:12 +0900
Message-ID: <1396449792-5121-2-git-send-email-danieruru@gmail.com>
References: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1396449792-5121-1-git-send-email-danieruru@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Daniel Palmer <danieruru@gmail.com>

Signed-off-by: Daniel Palmer <danieruru@gmail.com>
---
 arch/m68k/platform/68000/m68EZ328.c | 3 ++-
 arch/m68k/platform/68000/m68VZ328.c | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/platform/68000/m68EZ328.c b/arch/m68k/platform/68000/m68EZ328.c
index 332b5e8..2195290 100644
--- a/arch/m68k/platform/68000/m68EZ328.c
+++ b/arch/m68k/platform/68000/m68EZ328.c
@@ -69,7 +69,8 @@ void __init config_BSP(char *command, int len)
   if (p) strcpy(p,command);
   else command[0] = 0;
 #endif
- 
+
+  mach_sched_init = hw_timer_init;
   mach_hwclk = m68328_hwclk;
   mach_reset = m68ez328_reset;
 }
diff --git a/arch/m68k/platform/68000/m68VZ328.c b/arch/m68k/platform/68000/m68VZ328.c
index fd66583..0e5e5a1 100644
--- a/arch/m68k/platform/68000/m68VZ328.c
+++ b/arch/m68k/platform/68000/m68VZ328.c
@@ -182,6 +182,7 @@ void __init config_BSP(char *command, int size)
 
 	init_hardware(command, size);
 
+	mach_sched_init = hw_timer_init;
 	mach_hwclk = m68328_hwclk;
 	mach_reset = m68vz328_reset;
 }
-- 
1.9.1
