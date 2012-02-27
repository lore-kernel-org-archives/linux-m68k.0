From: <gerg@snapgear.com>
Subject: [PATCH 3/3] m68knommu: clean up init code in ColdFire 532x startup
Date: Mon, 27 Feb 2012 11:43:49 +1000
Message-ID: <1330307029-26451-3-git-send-email-gerg@snapgear.com>
References: <1330307029-26451-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28126 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753192Ab2B0Bmt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 26 Feb 2012 20:42:49 -0500
In-Reply-To: <1330307029-26451-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We can move all the init calls in the initcall code into the more general
arch setup code (which is config_BSP() here). That makes the 532x consistent
with other ColdFire CPUs setup code. It means we can get rid of the initcall
setup here all together. Also make sure we set the arch mach_reset function
pointer to get the local arch reset code called on reset.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/532x/config.c |   21 +++++++--------------
 1 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/m68k/platform/532x/config.c b/arch/m68k/platform/532x/config.c
index ff20d3e..99c9e4a 100644
--- a/arch/m68k/platform/532x/config.c
+++ b/arch/m68k/platform/532x/config.c
@@ -82,6 +82,13 @@ void __init config_BSP(char *commandp, int size)
 	}
 #endif
 
+	mach_reset = m532x_cpu_reset;
+	m532x_uarts_init();
+	m532x_fec_init();
+#ifdef CONFIG_SPI_COLDFIRE_QSPI
+	m532x_qspi_init();
+#endif
+
 #ifdef CONFIG_BDM_DISABLE
 	/*
 	 * Disable the BDM clocking.  This also turns off most of the rest of
@@ -93,20 +100,6 @@ void __init config_BSP(char *commandp, int size)
 }
 
 /***************************************************************************/
-
-static int __init init_BSP(void)
-{
-	m532x_uarts_init();
-	m532x_fec_init();
-#ifdef CONFIG_SPI_COLDFIRE_QSPI
-	m532x_qspi_init();
-#endif
-	return 0;
-}
-
-arch_initcall(init_BSP);
-
-/***************************************************************************/
 /* Board initialization */
 /***************************************************************************/
 /* 
-- 
1.7.0.4
