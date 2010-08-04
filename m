From: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
Subject: [PATCH 2/9] arch/m68k: Removing dead BSEIP config option
Date: Wed, 4 Aug 2010 14:41:39 +0200
Message-ID: <6772b843f8f9eb72f8c457056a51663ef50adb60.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
References: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Cc: vamos-dev@i4.informatik.uni-erlangen.de

CONFIG_BSEIP doesn't exist in Kconfig, therefore removing
all references to it from the source.

Signed-off-by: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
---
 arch/m68k/include/asm/commproc.h |   22 ----------------------
 1 files changed, 0 insertions(+), 22 deletions(-)

diff --git a/arch/m68k/include/asm/commproc.h b/arch/m68k/include/asm/commproc.h
index edf5eb6..b4f1d54 100644
--- a/arch/m68k/include/asm/commproc.h
+++ b/arch/m68k/include/asm/commproc.h
@@ -497,28 +497,6 @@ typedef struct scc_enet {
 #define SICR_ENET_CLKRT	((uint)0x00003d00)
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
1.7.0.4
