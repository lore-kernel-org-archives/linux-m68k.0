From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: Fix boot regression on machines with RAM at non-zero
Date: Tue,  8 Jul 2014 09:25:58 +0200
Message-ID: <1404804358-30299-1-git-send-email-geert__12920.5042765991$1404804400$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Andreas Schwab <schwab@linux-m68k.org>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

My enhancement to store the initial mapping size for later reuse in commit
486df8bc4627bdfc032d11bedcd056cc5343ee62 ("m68k: Increase initial mapping
to 8 or 16 MiB if possible") broke booting on machines where RAM doesn't
start at address zero.

Use pc-relative addressing to fix this.

Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Andreas Schwab <schwab@linux-m68k.org>
---
 arch/m68k/kernel/head.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
index dbb118e1a4e0..a54788458ca3 100644
--- a/arch/m68k/kernel/head.S
+++ b/arch/m68k/kernel/head.S
@@ -921,7 +921,8 @@ L(nocon):
 	jls	1f
 	lsrl	#1,%d1
 1:
-	movel	%d1,m68k_init_mapped_size
+	lea	%pc@(m68k_init_mapped_size),%a0
+	movel	%d1,%a0@
 	mmu_map	#PAGE_OFFSET,%pc@(L(phys_kernel_start)),%d1,\
 		%pc@(m68k_supervisor_cachemode)
 
-- 
1.9.1
