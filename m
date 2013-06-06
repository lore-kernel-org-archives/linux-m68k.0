From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 1/2] m68k/amiga - Zorro ESP SCSI Makefile/Kconfig support
Date: Fri,  7 Jun 2013 08:56:38 +1200
Message-ID: <1370552199-15048-2-git-send-email-schmitz@debian.org>
References: <1370552199-15048-1-git-send-email-schmitz@debian.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:33836 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754831Ab3FFU5A (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Jun 2013 16:57:00 -0400
Received: by mail-pd0-f175.google.com with SMTP id 4so3872220pdd.34
        for <linux-m68k@vger.kernel.org>; Thu, 06 Jun 2013 13:56:59 -0700 (PDT)
In-Reply-To: <1370552199-15048-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: geert@linux-m68k.org
Cc: linux-m68k@vger.kernel.org, Michael Schmitz <schmitz@debian.org>

---
 drivers/scsi/Kconfig  |   16 ++++++++++++++++
 drivers/scsi/Makefile |    1 +
 2 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/drivers/scsi/Kconfig b/drivers/scsi/Kconfig
index db95c54..8a08ee6 100644
--- a/drivers/scsi/Kconfig
+++ b/drivers/scsi/Kconfig
@@ -1644,6 +1644,22 @@ config SCSI_ZORRO7XX
 	      accelerator card for the Amiga 1200,
 	    - the SCSI controller on the GVP Turbo 040/060 accelerator.
 
+config SCSI_ZORRO_ESP
+	tristate "Zorro ESP SCSI support"
+	depends on ZORRO && SCSI
+	select SCSI_SPI_ATTRS
+	help
+	  Support for various ESP-based SCSI controllers on Zorro
+	  expansion boards for the Amiga.
+	  This includes:
+	    - the Amiga 4091 Zorro III SCSI-2 controller,
+	    - the MacroSystem Development's WarpEngine Amiga SCSI-2 controller
+	      (info at
+	      <http://www.lysator.liu.se/amiga/ar/guide/ar310.guide?FEATURE5>),
+	    - the SCSI controller on the Phase5 Blizzard PowerUP 603e+
+	      accelerator card for the Amiga 1200,
+	    - the SCSI controller on the GVP Turbo 040/060 accelerator.
+
 config ATARI_SCSI
 	tristate "Atari native SCSI support"
 	depends on ATARI && SCSI
diff --git a/drivers/scsi/Makefile b/drivers/scsi/Makefile
index b607ba4..487b8c5 100644
--- a/drivers/scsi/Makefile
+++ b/drivers/scsi/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_INFINIBAND_ISER) 	+= libiscsi.o
 obj-$(CONFIG_ISCSI_BOOT_SYSFS)	+= iscsi_boot_sysfs.o
 obj-$(CONFIG_SCSI_A4000T)	+= 53c700.o	a4000t.o
 obj-$(CONFIG_SCSI_ZORRO7XX)	+= 53c700.o	zorro7xx.o
+obj-$(CONFIG_SCSI_ZORRO_ESP)	+= esp_scsi.o	zorro_esp.o
 obj-$(CONFIG_A3000_SCSI)	+= a3000.o	wd33c93.o
 obj-$(CONFIG_A2091_SCSI)	+= a2091.o	wd33c93.o
 obj-$(CONFIG_GVP11_SCSI)	+= gvp11.o	wd33c93.o
-- 
1.7.0.4
