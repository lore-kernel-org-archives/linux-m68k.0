From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0161/1529] Fix typo
Date: Sat, 21 May 2016 13:57:20 +0200
Message-ID: <20160521115720.8131-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, gerg@uclinux.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/coldfire/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/head.S b/arch/m68k/coldfire/head.S
index fa31be2..73d92ea 100644
--- a/arch/m68k/coldfire/head.S
+++ b/arch/m68k/coldfire/head.S
@@ -288,7 +288,7 @@ _clear_bss:
 #endif
 
 	/*
-	 *	Assember start up done, start code proper.
+	 *	Assembler start up done, start code proper.
 	 */
 	jsr	start_kernel			/* start Linux kernel */
 
-- 
2.8.2.534.g1f66975
