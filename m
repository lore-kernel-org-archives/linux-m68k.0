From: <gerg@snapgear.com>
Subject: [PATCH 29/35] m68k: ColdFire with MMU enabled uses same clocking code as non-MMU
Date: Fri, 25 Nov 2011 13:41:14 +1000
Message-ID: <1322192480-22822-30-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53479 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752840Ab1KYDjn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:43 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
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
