From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: [PATCH 1/5] m68k/atari: EtherNAT - change number of Atari interrupts
 to make room for EtherNAT interrupts
Date: Sun, 01 Apr 2012 14:49:41 +1200
Message-ID: <4F77C245.5090002@gmail.com>
References: <1327085843-6980-1-git-send-email-geert@linux-m68k.org> <4F4B2BB6.900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:41357 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754123Ab2DACty (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Mar 2012 22:49:54 -0400
Received: by pbcun15 with SMTP id un15so3254652pbc.19
        for <linux-m68k@vger.kernel.org>; Sat, 31 Mar 2012 19:49:53 -0700 (PDT)
In-Reply-To: <4F4B2BB6.900@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Hi All,

The following patch is one in a series of patches in relation to getting 
interrupt-driven Ethernet and USB drivers supported on the Atari Falcon 
EtherNAT board. Whoever does have a Falcon with EtherNAT (and CT60, 
preferably) running Linux please try out this patch series to help 
testing these drivers. For convenience of testing, build the Ethernet 
and USB drivers as modules please.

Patches are relative to Geert's v3.3.0 (commit 
29c8d8820b6eba2fb6cb2702fd06095a48083595).

Part 1 (this): make room for the EtherNAT interrupts - they appear at 
vectors 0xc3 (USB ISP1160) and 0xc4 (SMC91C111)
Part 2: add platform data for the ISP1160 driver, fix the 91C111 
interrupt source number (the 91C111 platform data had been added quite 
some time ago)
Part 3: make sure the platform devices are added only if the EtherNAT 
card is actually present
Part 4: add usb/isp116x.h header to fix compile errors introduced in 2)
Part 5: add Kconfig flag necessary to enable compilation of the ISP1160 
driver

Both functions of the EtherNAT are correctly detected with this patch 
series. Some mysterious hardware fault in my Falcon does prevent the 
card to function properly, however (though at least the 91C111 part with 
timer polling did use to work in thee past).

The card interrupts are not being enabled by these patches yet. I need 
to discuss with Geert the best way of enabling them as close to the 
module loading time as possible.

Cheers,

  Michael

Signed-off-by: Michael Schmitz <schmitz@debian.org>

--
 arch/m68k/include/asm/atariints.h |    2 +-
 arch/m68k/include/asm/irq.h       |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/atariints.h 
b/arch/m68k/include/asm/atariints.h
index 656bbbf..4e82683 100644
--- a/arch/m68k/include/asm/atariints.h
+++ b/arch/m68k/include/asm/atariints.h
@@ -30,7 +30,7 @@
 #define TTMFP_SOURCE_BASE  24
 #define SCC_SOURCE_BASE    40
 #define VME_SOURCE_BASE    56
-#define VME_MAX_SOURCES    16
+#define VME_MAX_SOURCES    152
 
 #define NUM_ATARI_SOURCES   
(VME_SOURCE_BASE+VME_MAX_SOURCES-STMFP_SOURCE_BASE)
 
diff --git a/arch/m68k/include/asm/irq.h b/arch/m68k/include/asm/irq.h
index c1155f0..e905b3f 100644
--- a/arch/m68k/include/asm/irq.h
+++ b/arch/m68k/include/asm/irq.h
@@ -9,9 +9,9 @@
  */
 #if defined(CONFIG_COLDFIRE)
 #define NR_IRQS 256
-#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || defined(CONFIG_SUN3X)
+#elif defined(CONFIG_VME) || defined(CONFIG_SUN3) || 
defined(CONFIG_SUN3X) || defined(CONFIG_ATARI)
 #define NR_IRQS 200
-#elif defined(CONFIG_ATARI) || defined(CONFIG_MAC)
+#elif defined(CONFIG_MAC)
 #define NR_IRQS 72
 #elif defined(CONFIG_Q40)
 #define NR_IRQS        43
