From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH] m68knommu: fix early setup to not access variables
Date: Wed, 24 Aug 2016 15:50:03 +1000
Message-ID: <1472017803-9159-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:1181
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750971AbcHXFte (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 24 Aug 2016 01:49:34 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

The early setup code for the ColdFire 53xx platform accesses variables
before the RAM and other system initialization steps may have taken place.
Currently it has 2 global variables that will end up in the bss section
that are accessed during this early setup. There is a special static RAM
stack setup at this time, but not necessarily the RAM where kernel data
sections will end up.

Even on system setups where RAM is setup by a boot loader the access
to the early setup variables is before the BSS section has been initialized.
This can potentially corrupt a ram loaded root filesystem that sits in that
memory area before it has been moved.

These 2 variables are not used at all after being set, and can just be
removed.

Reported-by: Christian Gieseler <christiangieseler@yahoo.de>
Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/coldfire/m53xx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/coldfire/m53xx.c b/arch/m68k/coldfire/m53xx.c
index 80879a7..2502f63 100644
--- a/arch/m68k/coldfire/m53xx.c
+++ b/arch/m68k/coldfire/m53xx.c
@@ -271,9 +271,6 @@ void __init config_BSP(char *commandp, int size)
 
 #define NAND_FLASH_ADDRESS	(0xD0000000)
 
-int sys_clk_khz = 0;
-int sys_clk_mhz = 0;
-
 void wtm_init(void);
 void scm_init(void);
 void gpio_init(void);
@@ -286,9 +283,8 @@ int  get_sys_clock (void);
 
 asmlinkage void __init sysinit(void)
 {
-	sys_clk_khz = clock_pll(0, 0);
-	sys_clk_mhz = sys_clk_khz/1000;
-	
+	clock_pll(0, 0);
+
 	wtm_init();
 	scm_init();
 	gpio_init();
-- 
1.9.1
