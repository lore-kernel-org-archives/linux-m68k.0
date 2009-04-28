From: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: [PATCH] m68k: Atari - leave out spurious request_irq for Falcon IDE
Date: Tue, 28 Apr 2009 07:41:20 +0200 (CEST)
Message-ID: <alpine.DEB.1.00.0904280735550.18935@zirkon.biophys.uni-duesseldorf.de>
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
 <alpine.DEB.1.00.0904170314220.18855@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0904190308310.8939@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0904260751590.30061@zirkon.biophys.uni-duesseldorf.de>
 <alpine.DEB.1.00.0904260909510.32441@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <alpine.DEB.1.00.0904260909510.32441@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen R Marenka <stephen@marenka.net>, debian-68k@lists.debian.org, linux-m68k@lists.linux-m68k.org

Hi Geert,

I found I need to have this patch in order to avoid doubly registering the 
ST-DMA interrupt for IDE on Falcon.

The interrupt is registered in stdma_init and the current user of the interrupt 
is set by stdma_get_lock. Without the lock held, no interrupt should be 
delivered anyway, so this patch will make it easier to debug locking problems.

Signed-off-by: Michael Schmitz <schmitz@debian.org>

---
 drivers/ide/ide-probe.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/ide/ide-probe.c b/drivers/ide/ide-probe.c
index 7f264ed..f8a86b7 100644
--- a/drivers/ide/ide-probe.c
+++ b/drivers/ide/ide-probe.c
@@ -843,6 +843,9 @@ static int init_irq (ide_hwif_t *hwif)
 	if (io_ports->ctl_addr)
 		hwif->tp_ops->write_devctl(hwif, ATA_DEVCTL_OBS);
 
+#if defined(__mc68000__) && defined (CONFIG_BLK_DEV_FALCON_IDE)
+	if (!MACH_IS_ATARI)
+#endif
 	if (request_irq(hwif->irq, irq_handler, sa, hwif->name, hwif))
 		goto out_up;
 
-- 
1.5.6.5

