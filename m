From: <gerg@snapgear.com>
Subject: [PATCH v2 5/5] m68k: allow PCI bus to be enabled for ColdFire m54xx CPUs
Date: Mon, 16 Jul 2012 22:27:26 +1000
Message-ID: <1342441646-5645-6-git-send-email-gerg@snapgear.com>
References: <1342441646-5645-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:36815 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671Ab2GPMZf (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Jul 2012 08:25:35 -0400
In-Reply-To: <1342441646-5645-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

All support code for the PCI bus hardware on the ColdFire 547x and 548x
CPUs is now in. Allow enabling of CONFIG_PCI for them.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.bus |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.bus b/arch/m68k/Kconfig.bus
index 3adb499..ffc0601 100644
--- a/arch/m68k/Kconfig.bus
+++ b/arch/m68k/Kconfig.bus
@@ -48,6 +48,13 @@ config ISA
 config GENERIC_ISA_DMA
 	def_bool ISA
 
+config PCI
+	bool "PCI support"
+	depends on M54xx
+	help
+	  Enable the PCI bus. Support for the PCI bus hardware built into the
+	  ColdFire 547x and 548x processors.
+
 source "drivers/pci/Kconfig"
 
 source "drivers/zorro/Kconfig"
-- 
1.7.0.4
