From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0167/1529] Fix typo
Date: Sat, 21 May 2016 13:58:01 +0200
Message-ID: <20160521115801.8483-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/include/asm/mcfmmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/mcfmmu.h b/arch/m68k/include/asm/mcfmmu.h
index 26cc3d5..8824236 100644
--- a/arch/m68k/include/asm/mcfmmu.h
+++ b/arch/m68k/include/asm/mcfmmu.h
@@ -38,7 +38,7 @@
 /*
  *	MMU Operation register.
  */
-#define	MMUOR_UAA	0x00000001		/* Update allocatiom address */
+#define	MMUOR_UAA	0x00000001		/* Update allocation address */
 #define	MMUOR_ACC	0x00000002		/* TLB access */
 #define	MMUOR_RD	0x00000004		/* TLB access read */
 #define	MMUOR_WR	0x00000000		/* TLB access write */
-- 
2.8.2.534.g1f66975
