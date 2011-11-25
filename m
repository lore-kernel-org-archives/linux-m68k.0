From: <gerg@snapgear.com>
Subject: [PATCH] m68knommu: hard set the ColdFire MBAR register on startup
Date: Fri, 25 Nov 2011 11:36:46 +1000
Message-ID: <1322185006-21546-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:53519 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755163Ab1KYBeZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 20:34:25 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>, Alexander Stein <alexander.stein@systec-electronic.com>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire MBAR register that holds the mapping of the peripheral region
on some ColdFire CPUs is configurable. It can be configured at some address
different to that of the bootloader that loaded the kernel. So hard set
the MBAR register mapping at kernel startup time.

Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/platform/coldfire/head.S |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/platform/coldfire/head.S b/arch/m68k/platform/coldfire/head.S
index 49666b4..0ed41ed 100644
--- a/arch/m68k/platform/coldfire/head.S
+++ b/arch/m68k/platform/coldfire/head.S
@@ -149,6 +149,10 @@ _start:
 #if defined(CONFIG_UBOOT)
 	movel	%sp,_init_sp			/* save initial stack pointer */
 #endif
+#ifdef CONFIG_MBAR
+	movel	#CONFIG_MBAR+1,%d0		/* configured MBAR address */
+	movec	%d0,%MBAR			/* set it */
+#endif
 
 	/*
 	 *	Do any platform or board specific setup now. Most boards
-- 
1.7.0.4
