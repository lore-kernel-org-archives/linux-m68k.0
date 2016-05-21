From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0162/1529] Fix typo
Date: Sat, 21 May 2016 13:57:25 +0200
Message-ID: <20160521115725.8220-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, gerg@uclinux.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/coldfire/m5272.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/m5272.c b/arch/m68k/coldfire/m5272.c
index c525e4c..9abb1a4 100644
--- a/arch/m68k/coldfire/m5272.c
+++ b/arch/m68k/coldfire/m5272.c
@@ -111,7 +111,7 @@ void __init config_BSP(char *commandp, int size)
 /***************************************************************************/
 
 /*
- * Some 5272 based boards have the FEC ethernet diectly connected to
+ * Some 5272 based boards have the FEC ethernet directly connected to
  * an ethernet switch. In this case we need to use the fixed phy type,
  * and we need to declare it early in boot.
  */
-- 
2.8.2.534.g1f66975
