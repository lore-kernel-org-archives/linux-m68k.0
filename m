From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68knommu: Fix typos in Coldfire 5272 DMA debug code
Date: Thu,  9 Feb 2017 13:44:29 +0100
Message-ID: <1486644269-7571-1-git-send-email-geert__30321.2901963436$1486657379$gmane$org@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: uclinux-dev@uclinux.org, linux-m68k@lists.linux-m68k.org, Geert Uytterhoeven <geert@linux-m68k.org>

If DEBUG_DMA is defined:

    include/asm/dma.h: In function ‘set_dma_mode’:
    include/asm/dma.h:392: error: ‘dmabp’ undeclared (first use in this function)
    include/asm/dma.h:392: error: (Each undeclared identifier is reported only once
    include/asm/dma.h:392: error: for each function it appears in.)
    include/asm/dma.h: In function ‘set_dma_addr’:
    include/asm/dma.h:423: error: ‘dmawp’ undeclared (first use in this function)

Reported-by: kbuild test robot <fengguang.wu@intel.com>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/dma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/dma.h b/arch/m68k/include/asm/dma.h
index 208b4daa14b334f4..e74b55a690f44eb1 100644
--- a/arch/m68k/include/asm/dma.h
+++ b/arch/m68k/include/asm/dma.h
@@ -389,7 +389,7 @@ static __inline__ void set_dma_mode(unsigned int dmanr, char mode)
 
 #ifdef DEBUG_DMA
   printk("%s(%d): dmanr=%d DMR[%x]=%x DIR[%x]=%x\n", __FILE__, __LINE__,
-         dmanr, (int) &dmalp[MCFDMA_DMR], dmabp[MCFDMA_DMR],
+	 dmanr, (int) &dmalp[MCFDMA_DMR], dmalp[MCFDMA_DMR],
 	 (int) &dmawp[MCFDMA_DIR], dmawp[MCFDMA_DIR]);
 #endif
 }
@@ -420,7 +420,7 @@ static __inline__ void set_dma_addr(unsigned int dmanr, unsigned int a)
 
 #ifdef DEBUG_DMA
   printk("%s(%d): dmanr=%d DMR[%x]=%x SAR[%x]=%08x DAR[%x]=%08x\n",
-	__FILE__, __LINE__, dmanr, (int) &dmawp[MCFDMA_DMR], dmawp[MCFDMA_DMR],
+	__FILE__, __LINE__, dmanr, (int) &dmalp[MCFDMA_DMR], dmalp[MCFDMA_DMR],
 	(int) &dmalp[MCFDMA_DSAR], dmalp[MCFDMA_DSAR],
 	(int) &dmalp[MCFDMA_DDAR], dmalp[MCFDMA_DDAR]);
 #endif
-- 
1.9.1
