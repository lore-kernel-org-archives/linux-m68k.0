From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 06/10] m68k: remove rpxlite stuff
Date: Tue, 12 Mar 2013 13:00:33 +0200
Message-ID: <1363086037-1420-7-git-send-email-dedekind1@gmail.com>
References: <1363086037-1420-1-git-send-email-dedekind1@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1363086037-1420-1-git-send-email-dedekind1@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, linux-pcmcia@lists.infradead.org, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

The CONFIG_RPXLITE is not defined anywhere, which means that this board is not
supported anyway, and we can clean-up commproc.h a little.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Cc: linux-pcmcia@lists.infradead.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org
---
 arch/m68k/include/asm/commproc.h |   17 -----------------
 1 file changed, 17 deletions(-)

NOTE: this commit is independent, and I can merge it via the MTD tree with the
rest of the patches of this series. Of course, an ACK would be great to have.
And of course, if m68k people wish to merge it via their tree, it is also
nice, just let me know.

diff --git a/arch/m68k/include/asm/commproc.h b/arch/m68k/include/asm/commproc.h
index a739985..66a36bd 100644
--- a/arch/m68k/include/asm/commproc.h
+++ b/arch/m68k/include/asm/commproc.h
@@ -480,23 +480,6 @@ typedef struct scc_enet {
 #define SICR_ENET_CLKRT	((uint)0x0000003d)
 #endif
 
-#ifdef CONFIG_RPXLITE
-/* This ENET stuff is for the MPC850 with ethernet on SCC2.  Some of
- * this may be unique to the RPX-Lite configuration.
- * Note TENA is on Port B.
- */
-#define PA_ENET_RXD	((ushort)0x0004)
-#define PA_ENET_TXD	((ushort)0x0008)
-#define PA_ENET_TCLK	((ushort)0x0200)
-#define PA_ENET_RCLK	((ushort)0x0800)
-#define PB_ENET_TENA	((uint)0x00002000)
-#define PC_ENET_CLSN	((ushort)0x0040)
-#define PC_ENET_RENA	((ushort)0x0080)
-
-#define SICR_ENET_MASK	((uint)0x0000ff00)
-#define SICR_ENET_CLKRT	((uint)0x00003d00)
-#endif
-
 #ifdef CONFIG_BSEIP
 /* This ENET stuff is for the MPC823 with ethernet on SCC2.
  * This is unique to the BSE ip-Engine board.
-- 
1.7.10.4
