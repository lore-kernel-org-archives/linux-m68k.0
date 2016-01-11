From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH] m68knommu: fix FEC platform device registration when driver is modular
Date: Mon, 11 Jan 2016 11:21:56 +1000
Message-ID: <1452475316-20008-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out5.external.iinet.net.au ([203.59.1.221]:7092
	"EHLO icp-osb-irony-out5.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757663AbcAKBVi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 Jan 2016 20:21:38 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

The FEC (Fast Ethernet Crontroller) module on many ColdFire parts can
be compiled into the kernel, or as a module. Therefore the platform device
support for it is required whenever the driver is enabled - not just when
built into the kernel. Use IS_ENABLED(CONFIG_FEC) instead of a conditional
check on only the driver being built into the kernel.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/coldfire/device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/coldfire/device.c b/arch/m68k/coldfire/device.c
index 71ea4c0..a0fc0c1 100644
--- a/arch/m68k/coldfire/device.c
+++ b/arch/m68k/coldfire/device.c
@@ -89,7 +89,7 @@ static struct platform_device mcf_uart = {
 	.dev.platform_data	= mcf_uart_platform_data,
 };
 
-#ifdef CONFIG_FEC
+#if IS_ENABLED(CONFIG_FEC)
 
 #ifdef CONFIG_M5441x
 #define FEC_NAME	"enet-fec"
@@ -329,7 +329,7 @@ static struct platform_device mcf_qspi = {
 
 static struct platform_device *mcf_devices[] __initdata = {
 	&mcf_uart,
-#ifdef CONFIG_FEC
+#if IS_ENABLED(CONFIG_FEC)
 	&mcf_fec0,
 #ifdef MCFFEC_BASE1
 	&mcf_fec1,
-- 
1.9.1
