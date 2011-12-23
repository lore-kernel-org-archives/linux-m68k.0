From: <gerg@snapgear.com>
Subject: [PATCH 35/35] m68k: allow ColdFire 547x and 548x CPUs to be built with MMU enabled
Date: Fri, 23 Dec 2011 13:15:48 +1000
Message-ID: <1324610148-20666-36-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39326 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756309Ab1LWDQD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:16:03 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 547x and 548x CPUs have internal MMU hardware. All code
to support this is now in, so we can build kernels with it enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/Kconfig.cpu |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 5ae1d63..a4c75ad 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -226,8 +226,8 @@ config M54xx
 
 config M547x
 	bool "MCF547x"
-	depends on !MMU
 	select COLDFIRE
+	select MMU_COLDFIRE if MMU
 	select M54xx
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
@@ -236,8 +236,8 @@ config M547x
 
 config M548x
 	bool "MCF548x"
-	depends on !MMU
 	select COLDFIRE
+	select MMU_COLDFIRE if MMU
 	select M54xx
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
-- 
1.7.0.4
