From: Andrea Gelmini <andrea.gelmini@gelma.net>
Subject: [PATCH 0163/1529] Fix typo
Date: Sat, 21 May 2016 13:57:31 +0200
Message-ID: <20160521115731.8272-1-andrea.gelmini@gelma.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org, gerg@uclinux.org, geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 arch/m68k/coldfire/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/coldfire/pci.c b/arch/m68k/coldfire/pci.c
index 821de92..6a640be 100644
--- a/arch/m68k/coldfire/pci.c
+++ b/arch/m68k/coldfire/pci.c
@@ -42,7 +42,7 @@ static unsigned long iospace;
 
 /*
  * We need to be carefull probing on bus 0 (directly connected to host
- * bridge). We should only acccess the well defined possible devices in
+ * bridge). We should only access the well defined possible devices in
  * use, ignore aliases and the like.
  */
 static unsigned char mcf_host_slot2sid[32] = {
-- 
2.8.2.534.g1f66975
