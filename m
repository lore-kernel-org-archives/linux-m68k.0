From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0165/1529] Fix typo
Date: Sat, 21 May 2016 13:57:47 +0200
Message-ID: <20160521115747.8380-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/include/asm/dma.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 429fe26..208b4da 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -18,7 +18,7 @@
  * AUG/22/2000 : added support for 32-bit Dual-Address-Mode (K) 2000
  *               Oliver Kamphenkel (O.Kamphenkel@tu-bs.de)
  *
- * AUG/25/2000 : addad support for 8, 16 and 32-bit Single-Address-Mode (K)2000
+ * AUG/25/2000 : added support for 8, 16 and 32-bit Single-Address-Mode (K)2000
  *               Oliver Kamphenkel (O.Kamphenkel@tu-bs.de)
  *
  * APR/18/2002 : added proper support for MCF5272 DMA controller.
-- 
2.8.2.534.g1f66975
