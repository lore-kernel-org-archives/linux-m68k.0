From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/6] ata: SATA_HIGHBANK should depend on HAS_DMA
Date: Tue,  3 Jan 2017 19:09:45 +0100
Message-ID: <1483466989-9091-3-git-send-email-geert@linux-m68k.org>
References: <1483466989-9091-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:42656 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753071AbdACSKa (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Jan 2017 13:10:30 -0500
In-Reply-To: <1483466989-9091-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-ide@vger.kernel.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

If NO_DMA=y:

    ERROR: "bad_dma_ops" [drivers/ata/sata_highbank.ko] undefined!

Add a dependency on HAS_DMA to fix this.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/ata/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 7b36b791078a4806..275dbbded6dbe03b 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -344,6 +344,7 @@ config SATA_DWC_VDEBUG
 
 config SATA_HIGHBANK
 	tristate "Calxeda Highbank SATA support"
+	depends on HAS_DMA
 	depends on ARCH_HIGHBANK || COMPILE_TEST
 	help
 	  This option enables support for the Calxeda Highbank SoC's
-- 
1.9.1
