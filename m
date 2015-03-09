From: Yannick Guerrini <yguerrini@tomshardware.fr>
Subject: [PATCH] m68k: Fix trivial typos in comments
Date: Mon, 9 Mar 2015 22:29:24 +0100
Message-ID: <1425936564-9680-1-git-send-email-yguerrini__9493.40818119726$1425938524$gmane$org@tomshardware.fr>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: trivial@kernel.org, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Yannick Guerrini <yguerrini@tomshardware.fr>

Change 'Reaceive' to 'Receive'
Change 'alighnment' to 'alignment'

Signed-off-by: Yannick Guerrini <yguerrini@tomshardware.fr>
---
 arch/m68k/include/asm/m68360_pram.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/include/asm/m68360_pram.h b/arch/m68k/include/asm/m68360_pram.h
index e6088bb..c0cbd96 100644
--- a/arch/m68k/include/asm/m68360_pram.h
+++ b/arch/m68k/include/asm/m68360_pram.h
@@ -170,7 +170,7 @@ struct uart_pram {
     unsigned short  frmer;          /* Rx framing error counter */
     unsigned short  nosec;          /* Rx noise counter */
     unsigned short  brkec;          /* Rx break character counter */
-    unsigned short  brkln;          /* Reaceive break length */
+    unsigned short  brkln;          /* Receive break length */
                    
     unsigned short  uaddr1;         /* address character 1 */
     unsigned short  uaddr2;         /* address character 2 */
@@ -338,7 +338,7 @@ struct ethernet_pram {
     unsigned long   c_pres;         /* preset CRC */
     unsigned long   c_mask;         /* constant mask for CRC */
     unsigned long   crcec;          /* CRC error counter */
-    unsigned long   alec;           /* alighnment error counter */
+    unsigned long   alec;           /* alignment error counter */
     unsigned long   disfc;          /* discard frame counter */
     unsigned short  pads;           /* short frame PAD characters */
     unsigned short  ret_lim;        /* retry limit threshold */
-- 
1.9.5.msysgit.0
