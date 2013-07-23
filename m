From: Thorsten Glaser <tg@debian.org>
Subject: [PATCH] make NatFeat drivers bool, not tristate
Date: Tue, 23 Jul 2013 22:51:45 +0000
Message-ID: <201307232255.r6NMt8Z9027017@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:42725 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756989Ab3GWXEG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 23 Jul 2013 19:04:06 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5/8.14.5) with ESMTP id r6NMt9tl030596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Tue, 23 Jul 2013 22:55:13 GMT
Received: (from tg@localhost)
	by herc.mirbsd.org (8.14.5/8.14.5/Submit) id r6NMt8Z9027017
	for linux-m68k@vger.kernel.org; Tue, 23 Jul 2013 22:55:08 GMT
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

- nfblock: doesn't create /dev/nfhd8p1 device node after modprobe
- nfcon: is totally useless as module, almost only used during boot
- nfeth: says "No such device" upon insmod

Signed-off-by: Thorsten Glaser <tg@debian.org>
---
 arch/m68k/Kconfig.devices |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index d163991..a306c50 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -32,7 +32,7 @@ config NATFEAT
 	  access to a disk image as /dev/hda.
 
 config NFBLOCK
-	tristate "NatFeat block device support"
+	bool "NatFeat block device support"
 	depends on BLOCK && NATFEAT
 	help
 	  Say Y to include support for the ARAnyM NatFeat block device
@@ -40,7 +40,7 @@ config NFBLOCK
 	  the hardware emulation.
 
 config NFCON
-	tristate "NatFeat console driver"
+	bool "NatFeat console driver"
 	depends on TTY && NATFEAT
 	help
 	  Say Y to include support for the ARAnyM NatFeat console driver
@@ -48,7 +48,7 @@ config NFCON
 	  output of ARAnyM.
 
 config NFETH
-	tristate "NatFeat Ethernet support"
+	bool "NatFeat Ethernet support"
 	depends on ETHERNET && NATFEAT
 	help
 	  Say Y to include support for the ARAnyM NatFeat network device
-- 
1.7.9
