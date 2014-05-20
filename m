From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] m68k: remove check for CONFIG_BSEIP
Date: Tue, 20 May 2014 09:56:11 +0200
Message-ID: <1400572571.4912.7.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

There used to be a Kconfig symbol BSEIP. It was PPC specific and was
removed in v2.6.27. So the check for CONFIG_BSEIP can be removed. This
means a few defines will be removed. None of the macros involved are
used, so no one should care.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested.

 arch/m68k/include/asm/commproc.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/arch/m68k/include/asm/commproc.h b/arch/m68k/include/asm/commproc.h
index 66a36bd51aa1..c67e09279ea9 100644
--- a/arch/m68k/include/asm/commproc.h
+++ b/arch/m68k/include/asm/commproc.h
@@ -480,28 +480,6 @@ typedef struct scc_enet {
 #define SICR_ENET_CLKRT	((uint)0x0000003d)
 #endif
 
-#ifdef CONFIG_BSEIP
-/* This ENET stuff is for the MPC823 with ethernet on SCC2.
- * This is unique to the BSE ip-Engine board.
- */
-#define PA_ENET_RXD	((ushort)0x0004)
-#define PA_ENET_TXD	((ushort)0x0008)
-#define PA_ENET_TCLK	((ushort)0x0100)
-#define PA_ENET_RCLK	((ushort)0x0200)
-#define PB_ENET_TENA	((uint)0x00002000)
-#define PC_ENET_CLSN	((ushort)0x0040)
-#define PC_ENET_RENA	((ushort)0x0080)
-
-/* BSE uses port B and C bits for PHY control also.
-*/
-#define PB_BSE_POWERUP	((uint)0x00000004)
-#define PB_BSE_FDXDIS	((uint)0x00008000)
-#define PC_BSE_LOOPBACK	((ushort)0x0800)
-
-#define SICR_ENET_MASK	((uint)0x0000ff00)
-#define SICR_ENET_CLKRT	((uint)0x00002c00)
-#endif
-
 /* SCC Event register as used by Ethernet.
 */
 #define SCCE_ENET_GRA	((ushort)0x0080)	/* Graceful stop complete */
-- 
1.9.0
