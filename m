From: <gerg@snapgear.com>
Subject: [PATCH] m68k: selection of GENERIC_ATOMIC64 is not MMU specific
Date: Fri, 21 Oct 2011 17:03:07 +1000
Message-ID: <1319180587-10970-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:37947 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751347Ab1JUHMq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:12:46 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The selection of the CONFIG_GENERIC_ATOMIC64 option is no specific to
the MMU being present and enabled. It is a property of certain CPU
families. So select it based on those CPU types being selected.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig     |    1 -
 arch/m68k/Kconfig.cpu |    4 ++++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 6c28582..26ed01b 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,7 +3,6 @@ config M68K
 	default y
 	select HAVE_IDE
 	select HAVE_AOUT if MMU
-	select GENERIC_ATOMIC64 if MMU
 	select HAVE_GENERIC_HARDIRQS if !MMU
 	select GENERIC_IRQ_SHOW if !MMU
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index e632b2d..9af9e68 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -33,6 +33,7 @@ config COLDFIRE
 config M68020
 	bool "68020 support"
 	depends on MMU
+	select GENERIC_ATOMIC64
 	help
 	  If you anticipate running this kernel on a computer with a MC68020
 	  processor, say Y. Otherwise, say N. Note that the 68020 requires a
@@ -42,6 +43,7 @@ config M68020
 config M68030
 	bool "68030 support"
 	depends on MMU && !MMU_SUN3
+	select GENERIC_ATOMIC64
 	help
 	  If you anticipate running this kernel on a computer with a MC68030
 	  processor, say Y. Otherwise, say N. Note that a MC68EC030 will not
@@ -50,6 +52,7 @@ config M68030
 config M68040
 	bool "68040 support"
 	depends on MMU && !MMU_SUN3
+	select GENERIC_ATOMIC64
 	help
 	  If you anticipate running this kernel on a computer with a MC68LC040
 	  or MC68040 processor, say Y. Otherwise, say N. Note that an
@@ -59,6 +62,7 @@ config M68040
 config M68060
 	bool "68060 support"
 	depends on MMU && !MMU_SUN3
+	select GENERIC_ATOMIC64
 	help
 	  If you anticipate running this kernel on a computer with a MC68060
 	  processor, say Y. Otherwise, say N.
-- 
1.7.0.4
