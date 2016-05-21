From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0166/1529] Fix typo
Date: Sat, 21 May 2016 13:57:54 +0200
Message-ID: <20160521115754.8432-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/include/asm/m525xsim.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/m525xsim.h b/arch/m68k/include/asm/m525xsim.h
index f186459..699f20c 100644
--- a/arch/m68k/include/asm/m525xsim.h
+++ b/arch/m68k/include/asm/m525xsim.h
@@ -123,10 +123,10 @@
 /*
  *	I2C module.
  */
-#define MCFI2C_BASE0		(MCF_MBAR + 0x280)	/* Base addreess I2C0 */
+#define MCFI2C_BASE0		(MCF_MBAR + 0x280)	/* Base address I2C0 */
 #define MCFI2C_SIZE0		0x20			/* Register set size */
 
-#define MCFI2C_BASE1		(MCF_MBAR2 + 0x440)	/* Base addreess I2C1 */
+#define MCFI2C_BASE1		(MCF_MBAR2 + 0x440)	/* Base address I2C1 */
 #define MCFI2C_SIZE1		0x20			/* Register set size */
 
 /*
-- 
2.8.2.534.g1f66975
