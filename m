From: <gerg@snapgear.com>
Subject: [PATCH 29/35] m68k: ColdFire with MMU enabled uses same clocking code as non-MMU
Date: Fri, 16 Dec 2011 22:36:26 +1000
Message-ID: <1324038992-31222-30-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49432 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759098Ab1LPMhK (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:37:10 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We want to use the same timer support code for ColdFire CPU's when
running with MMU enabled or not. So use the same time_no.c code even
when the MMU is enabled for ColdFire. This also means we do not want
CONFIG_ARCH_USES_GETTIMEOFFSET set, since that code is only in time_mm.c.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/Kconfig       |    2 +-
 arch/m68k/kernel/time.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 330eb88..81fdaa7 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -48,7 +48,7 @@ config TIME_LOW_RES
 	default y
 
 config ARCH_USES_GETTIMEOFFSET
-	def_bool MMU
+	def_bool MMU && !COLDFIRE
 
 config NO_IOPORT
 	def_bool y
diff --git a/arch/m68k/kernel/time.c b/arch/m68k/kernel/time.c
index a5cf40c..75ab79b 100644
--- a/arch/m68k/kernel/time.c
+++ b/arch/m68k/kernel/time.c
@@ -1,4 +1,4 @@
-#ifdef CONFIG_MMU
+#if defined(CONFIG_MMU) && !defined(CONFIG_COLDFIRE)
 #include "time_mm.c"
 #else
 #include "time_no.c"
-- 
1.7.0.4
