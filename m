From: <gerg@snapgear.com>
Subject: [PATCH 2/3] m68knommu: clean up init code in ColdFire 528x startup
Date: Mon, 27 Feb 2012 11:43:48 +1000
Message-ID: <1330307029-26451-2-git-send-email-gerg@snapgear.com>
References: <1330307029-26451-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:30066 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753192Ab2B0Bmw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 26 Feb 2012 20:42:52 -0500
In-Reply-To: <1330307029-26451-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We can move all the init calls in the initcall code into the more general
arch setup code (which is config_BSP() here). That makes the 528x consistent
with other ColdFire CPUs setup cod. It means we can get rif of the initcall
setup here all together.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/528x/config.c |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/platform/528x/config.c b/arch/m68k/platform/528x/config.c
index 7829123..038d13f 100644
--- a/arch/m68k/platform/528x/config.c
+++ b/arch/m68k/platform/528x/config.c
@@ -103,21 +103,12 @@ void __init config_BSP(char *commandp, int size)
 #ifdef CONFIG_WILDFIREMOD
 	mach_halt = wildfiremod_halt;
 #endif
-}
-
-/***************************************************************************/
-
-static int __init init_BSP(void)
-{
 	mach_reset = m528x_cpu_reset;
 	m528x_uarts_init();
 	m528x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m528x_qspi_init();
 #endif
-	return 0;
 }
 
-arch_initcall(init_BSP);
-
 /***************************************************************************/
-- 
1.7.0.4
