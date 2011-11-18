From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: disable cache early in startup for ColdFire
Date: Fri, 18 Nov 2011 16:32:12 +1000
Message-ID: <1321597932-23734-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:31289 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756701Ab1KRGaJ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 18 Nov 2011 01:30:09 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>, Alexander Stein <alexander.stein@systec-electronic.com>

From: Greg Ungerer <gerg@uclinux.org>

Disbale the CPU cache really early in the ColdFire startup code. We set
up some variables for RAM sizing and we want to make they stick in RAM.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/head.S |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
index c334838..49666b4 100644
--- a/arch/m68k/platform/coldfire/head.S
+++ b/arch/m68k/platform/coldfire/head.S
@@ -143,6 +143,9 @@ __HEAD
 _start:
 	nop					/* filler */
 	movew	#0x2700, %sr			/* no interrupts */
+	movel	#CACHE_INIT,%d0			/* disable cache */
+	movec	%d0,%CACR
+	nop
 #if defined(CONFIG_UBOOT)
 	movel	%sp,_init_sp			/* save initial stack pointer */
 #endif
@@ -176,9 +179,6 @@ _start:
 	 *	it is very similar. Define the exact settings in the headers
 	 *	then the code here is the same for all.
 	 */
-	movel	#CACHE_INIT,%d0			/* invalidate whole cache */
-	movec	%d0,%CACR
-	nop
 	movel	#ACR0_MODE,%d0			/* set RAM region for caching */
 	movec	%d0,%ACR0
 	movel	#ACR1_MODE,%d0			/* anything else to cache? */
-- 
1.7.0.4
