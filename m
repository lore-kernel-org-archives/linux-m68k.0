From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0170/1529] Fix typo
Date: Sat, 21 May 2016 13:58:22 +0200
Message-ID: <20160521115822.8640-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/math-emu/fp_decode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/math-emu/fp_decode.h b/arch/m68k/math-emu/fp_decode.h
index 759679d..6d1e760 100644
--- a/arch/m68k/math-emu/fp_decode.h
+++ b/arch/m68k/math-emu/fp_decode.h
@@ -130,7 +130,7 @@ do_fscc=0
 	bfextu	%d2{#13,#3},%d0
 .endm
 
-| decode the 8bit diplacement from the brief extension word
+| decode the 8bit displacement from the brief extension word
 .macro	fp_decode_disp8
 	move.b	%d2,%d0
 	ext.w	%d0
-- 
2.8.2.534.g1f66975
