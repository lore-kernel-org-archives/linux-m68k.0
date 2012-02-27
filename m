From: <gerg@snapgear.com>
Subject: [PATCH 1/3] m68knommu: clean up init code in ColdFire 523x startup
Date: Mon, 27 Feb 2012 11:43:47 +1000
Message-ID: <1330307029-26451-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:26618 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753192Ab2B0Bmr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 26 Feb 2012 20:42:47 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We can move the QSPI init call to the more general config_BSP() code on
the 523x platorm setup code. Then we can remove the initcall code all
together.

We can also remove the un-needed include of mcfuart.h while we are
cleaning up here too.

Also I noticed that we are not calling the fec_init() code here, and we
should be doing that. Put that back in too.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/523x/config.c |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/arch/m68k/platform/523x/config.c b/arch/m68k/platform/523x/config.c
index 518c27b..7e39c69 100644
--- a/arch/m68k/platform/523x/config.c
+++ b/arch/m68k/platform/523x/config.c
@@ -19,7 +19,6 @@
 #include <asm/machdep.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
-#include <asm/mcfuart.h>
 
 /***************************************************************************/
 
@@ -66,18 +65,10 @@ static void m523x_cpu_reset(void)
 void __init config_BSP(char *commandp, int size)
 {
 	mach_reset = m523x_cpu_reset;
-}
-
-/***************************************************************************/
-
-static int __init init_BSP(void)
-{
+	m523x_fec_init();
 #ifdef CONFIG_SPI_COLDFIRE_QSPI
 	m523x_qspi_init();
 #endif
-	return 0;
 }
 
-arch_initcall(init_BSP);
-
 /***************************************************************************/
-- 
1.7.0.4
