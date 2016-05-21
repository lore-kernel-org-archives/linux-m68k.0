From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0169/1529] Fix typo
Date: Sat, 21 May 2016 13:58:14 +0200
Message-ID: <20160521115814.8586-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, funaho@jurai.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/mac/iop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mac/iop.c b/arch/m68k/mac/iop.c
index 4d2adfb..7990b6f 100644
--- a/arch/m68k/mac/iop.c
+++ b/arch/m68k/mac/iop.c
@@ -60,7 +60,7 @@
  *
  * The host talks to the IOPs using a rather simple message-passing scheme via
  * a shared memory area in the IOP RAM. Each IOP has seven "channels"; each
- * channel is conneced to a specific software driver on the IOP. For example
+ * channel is connected to a specific software driver on the IOP. For example
  * on the SCC IOP there is one channel for each serial port. Each channel has
  * an incoming and and outgoing message queue with a depth of one.
  *
-- 
2.8.2.534.g1f66975
