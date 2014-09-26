From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] [TRIVIAL] m68k: Fix typo 'COFNIG_MBAR'
Date: Fri, 26 Sep 2014 19:40:16 +0200
Message-ID: <1411753216.7866.65.camel__11439.0690614984$1411753987$gmane$org@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Jiri Kosina <trivial@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Untested!

Geert, PASR is obviously unused. Is it needed?

 arch/m68k/include/asm/m54xxpci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/m54xxpci.h b/arch/m68k/include/asm/m54xxpci.h
index 6fbf54f72f2e..4687f5aa3741 100644
--- a/arch/m68k/include/asm/m54xxpci.h
+++ b/arch/m68k/include/asm/m54xxpci.h
@@ -72,7 +72,7 @@
 #define	PCIRFWPR	(CONFIG_MBAR + 0x84d4)	/* RX FIFO write pointer */
 
 #define	PACR		(CONFIG_MBAR + 0xc00)	/* PCI arbiter control */
-#define	PASR		(COFNIG_MBAR + 0xc04)	/* PCI arbiter status */
+#define	PASR		(CONFIG_MBAR + 0xc04)	/* PCI arbiter status */
 
 /*
  *	Definitions for the Global status and control register.
-- 
1.9.3
