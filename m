From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68k: enable PCI support for m5475evb defconfig
Date: Wed,  8 Jul 2015 23:12:32 +1000
Message-ID: <1436361152-13945-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas01p.mx.bigpond.com ([61.9.168.137]:61254 "EHLO
	nskntmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753999AbbGHNLA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 09:11:00 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The ColdFire M5475 on the m5475evb board supports a PCI bus, lets
enable it for the defconfig to get better build and test coverage.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/configs/m5475evb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/m68k/configs/m5475evb_defconfig b/arch/m68k/configs/m5475evb_defconfig
index 78665b5..4f4ccd13 100644
--- a/arch/m68k/configs/m5475evb_defconfig
+++ b/arch/m68k/configs/m5475evb_defconfig
@@ -22,6 +22,7 @@ CONFIG_RAMSIZE=0x2000000
 CONFIG_VECTORBASE=0x0
 CONFIG_MBAR=0xff000000
 CONFIG_KERNELBASE=0x20000
+CONFIG_PCI=y
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
-- 
1.9.1
