From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/3] m68k: move coldfire MMU initialization code
Date: Fri,  8 Sep 2017 17:00:59 +1000
Message-ID: <1504854061-12830-2-git-send-email-gerg@linux-m68k.org>
References: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:28539
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754358AbdIHHKr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 8 Sep 2017 03:10:47 -0400
In-Reply-To: <1504854061-12830-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org, Greg Ungerer <gerg@linux-m68k.org>

The M54[78]x ColdFire parts are not the only members of the ColdFire family
that have an MMU. But currently some of the early MMU initialization code
is inside the startup code specific to only the ColdFire M54[78]x parts.
Move that early ColdFire MMU init code so that it is run for other ColdFire
parts running with MMU enabled.

Specifically this means that the MMU initialization code will now also be
run for the ColdFire M5441x parts when running with MMU enabled.

The code move meant that the extern definition for the mmu_context_init()
function had to be moved as well. To make it clear that is ColdFire specific
I have renamed that with a "cf_" in front of it and put its extern definition
in the mcfmmu.h (which is already included by the setup code).

Reported-by: Angelo Dureghello <angelo@sysam.it>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m54xx.c          | 4 ----
 arch/m68k/include/asm/mcfmmu.h      | 1 +
 arch/m68k/include/asm/mmu_context.h | 1 -
 arch/m68k/kernel/setup_mm.c         | 2 ++
 arch/m68k/mm/mcfmmu.c               | 2 +-
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/coldfire/m54xx.c b/arch/m68k/coldfire/m54xx.c
index c552851..704efea 100644
--- a/arch/m68k/coldfire/m54xx.c
+++ b/arch/m68k/coldfire/m54xx.c
@@ -95,10 +95,6 @@ static void mcf54xx_reset(void)
 
 void __init config_BSP(char *commandp, int size)
 {
-#ifdef CONFIG_MMU
-	cf_bootmem_alloc();
-	mmu_context_init();
-#endif
 	mach_reset = mcf54xx_reset;
 	mach_sched_init = hw_timer_init;
 	m54xx_uarts_init();
diff --git a/arch/m68k/include/asm/mcfmmu.h b/arch/m68k/include/asm/mcfmmu.h
index 10f9930..283352a 100644
--- a/arch/m68k/include/asm/mcfmmu.h
+++ b/arch/m68k/include/asm/mcfmmu.h
@@ -106,6 +106,7 @@ static inline void mmu_write(u32 a, u32 v)
 }
 
 void cf_bootmem_alloc(void);
+void cf_mmu_context_init(void);
 int cf_tlb_miss(struct pt_regs *regs, int write, int dtlb, int extension_word);
 
 #endif
diff --git a/arch/m68k/include/asm/mmu_context.h b/arch/m68k/include/asm/mmu_context.h
index 4a6ae6d..00c28b1 100644
--- a/arch/m68k/include/asm/mmu_context.h
+++ b/arch/m68k/include/asm/mmu_context.h
@@ -91,7 +91,6 @@ static inline void activate_mm(struct mm_struct *active_mm,
 
 #define deactivate_mm(tsk, mm) do { } while (0)
 
-extern void mmu_context_init(void);
 #define prepare_arch_switch(next) load_ksp_mmu(next)
 
 static inline void load_ksp_mmu(struct task_struct *task)
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 7a2c212..e79b068 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -343,6 +343,8 @@ void __init setup_arch(char **cmdline_p)
 #ifdef CONFIG_COLDFIRE
 	case MACH_M54XX:
 	case MACH_M5441X:
+		cf_bootmem_alloc();
+		cf_mmu_context_init();
 		config_BSP(NULL, 0);
 		break;
 #endif
diff --git a/arch/m68k/mm/mcfmmu.c b/arch/m68k/mm/mcfmmu.c
index 87131cd..12fe55b 100644
--- a/arch/m68k/mm/mcfmmu.c
+++ b/arch/m68k/mm/mcfmmu.c
@@ -183,7 +183,7 @@ void __init cf_bootmem_alloc(void)
  * Initialize the context management stuff.
  * The following was taken from arch/ppc/mmu_context.c
  */
-void __init mmu_context_init(void)
+void __init cf_mmu_context_init(void)
 {
 	/*
 	 * Some processors have too few contexts to reserve one for
-- 
1.9.1
