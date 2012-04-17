From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: make sure 2nd FEC eth interface pins are enabled on 5275 ColdFire
Date: Tue, 17 Apr 2012 23:23:13 +1000
Message-ID: <1334668993-30818-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:59609 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932175Ab2DQNZu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Apr 2012 09:25:50 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The CONFIG_FEC2 define was removed from the kernel many versions ago.
But it is still being used to set the multi-function pins when compiling
for a ColdFire 527[45] SoC that has 2 ethernet interfaces. Remove the
last remaining uses of this define, and so fix the setting of the pins
for the 2nd ethernet interface.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/configs/m5275evb_defconfig |    1 -
 arch/m68k/platform/527x/config.c     |    2 --
 2 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/configs/m5275evb_defconfig b/arch/m68k/configs/m5275evb_defconfig
index 33c32ae..a1230e8 100644
--- a/arch/m68k/configs/m5275evb_defconfig
+++ b/arch/m68k/configs/m5275evb_defconfig
@@ -49,7 +49,6 @@ CONFIG_BLK_DEV_RAM=y
 CONFIG_NETDEVICES=y
 CONFIG_NET_ETHERNET=y
 CONFIG_FEC=y
-CONFIG_FEC2=y
 # CONFIG_NETDEV_1000 is not set
 # CONFIG_NETDEV_10000 is not set
 CONFIG_PPP=y
diff --git a/arch/m68k/platform/527x/config.c b/arch/m68k/platform/527x/config.c
index 7ed848c..f91a532 100644
--- a/arch/m68k/platform/527x/config.c
+++ b/arch/m68k/platform/527x/config.c
@@ -74,9 +74,7 @@ static void __init m527x_fec_init(void)
 	writew(par | 0xf00, MCF_IPSBAR + 0x100082);
 	v = readb(MCF_IPSBAR + 0x100078);
 	writeb(v | 0xc0, MCF_IPSBAR + 0x100078);
-#endif
 
-#ifdef CONFIG_FEC2
 	/* Set multi-function pins to ethernet mode for fec1 */
 	par = readw(MCF_IPSBAR + 0x100082);
 	writew(par | 0xa0, MCF_IPSBAR + 0x100082);
-- 
1.7.0.4
