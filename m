From: <gerg@snapgear.com>
Subject: [PATCH] m68k: select CONFIG_GENERIC_ATOMIC64 for all m68k CPU types
Date: Tue, 14 Aug 2012 14:45:33 +1000
Message-ID: <1344919533-9357-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:58518 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851Ab2HNEtH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Aug 2012 00:49:07 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, geert@linux-m68k.org, fengguang.wu@intel.com, ebiederm@xmission.com, Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There is no specific atomic64 support code for any m68k CPUs, so we should
select CONFIG_GENERIC_ATOMC64 for all. Remove the existing per CPU selection
of this and select it for all m68k.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig     |    1 +
 arch/m68k/Kconfig.cpu |    4 ----
 2 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 0b0f8b8..26bfa46 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -5,6 +5,7 @@ config M68K
 	select HAVE_AOUT if MMU
 	select HAVE_GENERIC_HARDIRQS
 	select GENERIC_IRQ_SHOW
+	select GENERIC_ATOMIC64
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select GENERIC_CPU_DEVICES
 	select GENERIC_STRNCPY_FROM_USER if MMU
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 43a9f8f..765e375 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -56,7 +56,6 @@ config MCPU32
 config M68020
 	bool "68020 support"
 	depends on MMU
-	select GENERIC_ATOMIC64
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68020
@@ -67,7 +66,6 @@ config M68020
 config M68030
 	bool "68030 support"
 	depends on MMU && !MMU_SUN3
-	select GENERIC_ATOMIC64
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68030
@@ -77,7 +75,6 @@ config M68030
 config M68040
 	bool "68040 support"
 	depends on MMU && !MMU_SUN3
-	select GENERIC_ATOMIC64
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68LC040
@@ -88,7 +85,6 @@ config M68040
 config M68060
 	bool "68060 support"
 	depends on MMU && !MMU_SUN3
-	select GENERIC_ATOMIC64
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68060
-- 
1.7.0.4
