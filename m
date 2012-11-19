From: <gerg@snapgear.com>
Subject: [PATCH 3/4] m68knommu: add support for the ColdFire 537x family of CPUs
Date: Mon, 19 Nov 2012 15:14:07 +1000
Message-ID: <1353302048-924-4-git-send-email-gerg@snapgear.com>
References: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mivwsmailout1.mcafee.com ([161.69.47.167]:27401 "EHLO
	MIVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395Ab2KSFOv (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 19 Nov 2012 00:14:51 -0500
In-Reply-To: <1353302048-924-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 537x family is very similar internally to the ColdFire 532x
family. So with just a little extra configuration we can configure and
target them as well.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu |    8 ++++++++
 arch/m68k/Makefile    |    1 +
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 3610229..bf4e083 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -234,6 +234,14 @@ config M532x
 	help
 	  Freescale (Motorola) ColdFire 532x processor support.
 
+config M537x
+	bool "MCF537x"
+	depends on !MMU
+	select M53xx
+	select HAVE_CACHE_CB
+	help
+	  Freescale ColdFire 537x processor support.
+
 config M5407
 	bool "MCF5407"
 	depends on !MMU
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index 7636751..af4d82a 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -45,6 +45,7 @@ cpuflags-$(CONFIG_M5441x)	:= $(call cc-option,-mcpu=54455,-mcfv4e)
 cpuflags-$(CONFIG_M54xx)	:= $(call cc-option,-mcpu=5475,-m5200)
 cpuflags-$(CONFIG_M5407)	:= $(call cc-option,-mcpu=5407,-m5200)
 cpuflags-$(CONFIG_M532x)	:= $(call cc-option,-mcpu=532x,-m5307)
+cpuflags-$(CONFIG_M537x)	:= $(call cc-option,-mcpu=537x,-m5307)
 cpuflags-$(CONFIG_M5307)	:= $(call cc-option,-mcpu=5307,-m5200)
 cpuflags-$(CONFIG_M528x)	:= $(call cc-option,-mcpu=528x,-m5307)
 cpuflags-$(CONFIG_M5275)	:= $(call cc-option,-mcpu=5275,-m5307)
-- 
1.7.0.4
