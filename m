From: <gerg@snapgear.com>
Subject: [PATCH 4/5] m68knommu: remove un-needed exporting of COLDFIRE symbols
Date: Thu, 21 Apr 2011 10:48:09 +1000
Message-ID: <1303346890-28249-5-git-send-email-gerg@snapgear.com>
References: <1303346890-28249-1-git-send-email-gerg@snapgear.com>
 <1303346890-28249-2-git-send-email-gerg@snapgear.com>
 <1303346890-28249-3-git-send-email-gerg@snapgear.com>
 <1303346890-28249-4-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:19440 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751971Ab1DUAu6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 20 Apr 2011 20:50:58 -0400
In-Reply-To: <1303346890-28249-4-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is no reason most of the symbols enclosed in a conditional
on CONFIG_COLDFIRE need to be exported. And they sure don't need to
be doing it in m68k_ksyms_no.c. Move the dma symbols export (which
are currently needed) to the definitions of those, and remove the
rest of the exporting here.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/kernel/m68k_ksyms_no.c  |   12 ------------
 arch/m68k/platform/coldfire/dma.c |    3 +++
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/kernel/m68k_ksyms_no.c b/arch/m68k/kernel/m68k_ksyms_no.c
index 11effaa..db6f87a 100644
--- a/arch/m68k/kernel/m68k_ksyms_no.c
+++ b/arch/m68k/kernel/m68k_ksyms_no.c
@@ -42,15 +42,3 @@ EXPORT_SYMBOL(__mulsi3);
 EXPORT_SYMBOL(__udivsi3);
 EXPORT_SYMBOL(__umodsi3);
 
-#ifdef CONFIG_COLDFIRE
-extern unsigned int *dma_device_address;
-extern unsigned long dma_base_addr, _ramend;
-EXPORT_SYMBOL(dma_base_addr);
-EXPORT_SYMBOL(dma_device_address);
-EXPORT_SYMBOL(_ramend);
-
-extern asmlinkage void trap(void);
-extern void	*_ramvec;
-EXPORT_SYMBOL(trap);
-EXPORT_SYMBOL(_ramvec);
-#endif /* CONFIG_COLDFIRE */
diff --git a/arch/m68k/platform/coldfire/dma.c b/arch/m68k/platform/coldfire/dma.c
index e88b95e..df5ce20 100644
--- a/arch/m68k/platform/coldfire/dma.c
+++ b/arch/m68k/platform/coldfire/dma.c
@@ -9,6 +9,7 @@
 /***************************************************************************/
 
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <asm/dma.h>
 #include <asm/coldfire.h>
 #include <asm/mcfsim.h>
@@ -33,7 +34,9 @@ unsigned int dma_base_addr[MAX_M68K_DMA_CHANNELS] = {
 	MCFDMA_BASE3,
 #endif
 };
+EXPORT_SYMBOL(dma_base_addr);
 
 unsigned int dma_device_address[MAX_M68K_DMA_CHANNELS];
+EXPORT_SYMBOL(dma_device_address);
 
 /***************************************************************************/
-- 
1.7.0.4
