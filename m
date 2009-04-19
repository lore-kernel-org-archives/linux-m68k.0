From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH] m68k: Atari SCC verbosity fix
Date: Sun, 19 Apr 2009 03:24:40 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904190321350.8939__46422.1468348571$1240108015$gmane$org@zirkon.biophys.uni-duesseldorf.de>
References: <20090326123822.GD8081@marenka.net>
 <10f740e80903260610k29f73c4ci76594f46881e17a5@mail.gmail.com>
 <10f740e80903290607y743bada9w829754722e9f7d9f@mail.gmail.com>
 <alpine.DEB.1.00.0904140556250.22987@zirkon.biophys.uni-duesseldorf.de>
 <1239696787.2049.8.camel@petr>
 <alpine.DEB.1.00.0904141017160.30084@zirkon.biophys.uni-duesseldorf.de>
 <1239698381.2049.25.camel@petr>
 <alpine.DEB.1.00.0904150319350.29525@zirkon.biophys.uni-duesseldorf.de>
 <1239774966.20245.4.camel@petr>
 <alpine.DEB.1.00.0904160107540.4339@zirkon.biophys.uni-duesseldorf.de>
 <1239862075.12777.14.camel@petr>
 <alpine.DEB.1.00.0904160934480.19859@zirkon.biophys.uni-duesseldorf.de>
 <1239868903.12777.25.camel@petr>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1239868903.12777.25.camel@petr>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Fix verbosity level of SCC driver (leftover 'info' message) as reported by 
Patrice Mandin.

Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/char/atari_scc.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/atari_scc.c b/drivers/char/atari_scc.c
index 2bbd44c..7d7abe5 100644
--- a/drivers/char/atari_scc.c
+++ b/drivers/char/atari_scc.c
@@ -1351,7 +1351,7 @@ static int scc_open(struct tty_struct *tty, struct file *filp)
 	pr_debug(KERN_WARNING "SCC: enable rx ints ...\n");
 	scc_enable_rx_interrupts(port);
 	pr_debug(KERN_WARNING "SCC: enable rx ints done!\n");
-	pr_info("SCC: open port done!\n");
+	pr_debug("SCC: open port done!\n");
 	return 0;
 }
 
-- 
1.5.6.5

