From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/3] m68k: Use base_trap_init() to initialize vectors
Date: Fri,  7 Jan 2011 17:22:04 +0100
Message-ID: <1294417325-6109-3-git-send-email-geert@linux-m68k.org>
References: <1294417325-6109-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1294417325-6109-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Roman Zippel <zippel@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>

From: Roman Zippel <zippel@linux-m68k.org>

So basic initialization is all in one place.

Signed-off-by: Roman Zippel <zippel@linux-m68k.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/kernel/traps.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
index ada4f4c..cd802d4 100644
--- a/arch/m68k/kernel/traps.c
+++ b/arch/m68k/kernel/traps.c
@@ -48,10 +48,7 @@ asmlinkage void nmihandler(void);
 asmlinkage void fpu_emu(void);
 #endif
 
-e_vector vectors[256] = {
-	[VEC_BUSERR]	= buserr,
-	[VEC_SYS]	= system_call,
-};
+e_vector vectors[256];
 
 /* nmi handler for the Amiga */
 asm(".text\n"
@@ -64,7 +61,7 @@ asm(".text\n"
  */
 void __init base_trap_init(void)
 {
-	if(MACH_IS_SUN3X) {
+	if (MACH_IS_SUN3X) {
 		extern e_vector *sun3x_prom_vbr;
 
 		__asm__ volatile ("movec %%vbr, %0" : "=r" (sun3x_prom_vbr));
@@ -79,6 +76,9 @@ void __init base_trap_init(void)
 
 		vectors[VEC_UNIMPII] = unimp_vec;
 	}
+
+	vectors[VEC_BUSERR] = buserr;
+	vectors[VEC_SYS] = system_call;
 }
 
 void __init trap_init (void)
-- 
1.7.0.4
