From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 02/17] [m68k] Atari: declare original EtherNAT driver obsolete
Date: Thu, 31 Jan 2013 13:15:59 +1300 (NZDT)
Message-ID: <20130131001559.AFEFE360095@xplor.waratah.dyndns.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-da0-f43.google.com ([209.85.210.43]:40897 "EHLO
	mail-da0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753761Ab3AaAQG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Jan 2013 19:16:06 -0500
Received: by mail-da0-f43.google.com with SMTP id u36so1015434dak.16
        for <linux-m68k@vger.kernel.org>; Wed, 30 Jan 2013 16:16:05 -0800 (PST)
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: geert@linux-m68k.org

[PATCH 02/17] [m68k] Atari: declare original EtherNAT driver obsolete


Signed-off-by: Michael Schmitz <schmitz@debian.org>
---
 drivers/net/ethernet/smsc/Kconfig  |    4 ++--
 drivers/net/ethernet/smsc/Makefile |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/smsc/Kconfig b/drivers/net/ethernet/smsc/Kconfig
index 01893aa..c273eac 100644
--- a/drivers/net/ethernet/smsc/Kconfig
+++ b/drivers/net/ethernet/smsc/Kconfig
@@ -19,8 +19,8 @@ config NET_VENDOR_SMSC
 
 if NET_VENDOR_SMSC
 
-config ATARI_ETHERNAT
-	tristate "Atari EtherNAT Ethernet support"
+config ATARI_ETHERNAT_OLD
+	tristate "Atari EtherNAT Ethernet support - obsolete driver"
 	select CRC32
 	select MII
 	depends on ATARI
diff --git a/drivers/net/ethernet/smsc/Makefile b/drivers/net/ethernet/smsc/Makefile
index ef228db..a1992fa 100644
--- a/drivers/net/ethernet/smsc/Makefile
+++ b/drivers/net/ethernet/smsc/Makefile
@@ -2,7 +2,7 @@
 # Makefile for the SMSC network device drivers.
 #
 
-obj-$(CONFIG_ATARI_ETHERNAT) += atari_91C111.o
+obj-$(CONFIG_ATARI_ETHERNAT_OLD) += atari_91C111.o
 obj-$(CONFIG_SMC9194) += smc9194.o
 obj-$(CONFIG_SMC91X) += smc91x.o
 obj-$(CONFIG_PCMCIA_SMC91C92) += smc91c92_cs.o
-- 
1.7.0.4
