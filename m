From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/mac: Fix comment about iop_*_present flags setup timing
Date: Sun, 30 Jun 2013 11:59:22 +0200
Message-ID: <1372586362-1206-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mac/iop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 7d8d461..8a4c446 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -118,9 +118,9 @@
 
 /*#define DEBUG_IOP*/
 
-/* Set to non-zero if the IOPs are present. Set by iop_init() */
+/* Set to non-zero if the IOPs are present. Set by iop_preinit() */
 
-int iop_scc_present,iop_ism_present;
+int iop_scc_present, iop_ism_present;
 
 /* structure for tracking channel listeners */
 
-- 
1.7.9.5
