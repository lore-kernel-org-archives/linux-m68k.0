From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [PATCH 1/8] m68k: move CONFIG_FPU set to per-CPU configuration
Date: Mon, 29 Aug 2016 21:43:17 +1000
Message-ID: <1472471004-4580-2-git-send-email-gerg@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:49458
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932628AbcH2LmQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 29 Aug 2016 07:42:16 -0400
In-Reply-To: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@linux-m68k.org>

Move the selection of CONFIG_FPU to each CPU type configuration.

Currently for m68k we have a global set of CONFIG_FPU based on if CONFIG_MMU
is enabled or not. There is at least one CPU family we support (m5441x)
that has an MMU but has no FPU hardware. So we need to be able to have
CONFIG_MMU set and CONFIG_FPU not set.

Whether we build for a CPU with MMU enabled or not doesn't change the
fact that it has FPU hardware support. Our current non-MMU builds have
never had CONIG_FPU enabled - and in fact the kernel will not compile
with that set and CONFIG_MMU not set at the moment. It is easy enough
to fix this - but it would involve a structure change to sigcontext.h,
and that is a user space exported header (so ABI change).

This change makes no configuration visible changes, and all configs
end up with the same configuration settings as before.

This change based on changes and discussion from Yannick Gicquel
<yannick.gicquel@open.eurogiciel.org>.

Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
---
 arch/m68k/Kconfig     | 1 -
 arch/m68k/Kconfig.cpu | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 498b567..d140206 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -14,7 +14,6 @@ config M68K
 	select GENERIC_IOMAP
 	select GENERIC_STRNCPY_FROM_USER if MMU
 	select GENERIC_STRNLEN_USER if MMU
-	select FPU if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
 	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 967260f..d2219f30 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -62,6 +62,7 @@ config MCPU32
 config M68020
 	bool "68020 support"
 	depends on MMU
+	select FPU
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68020
@@ -72,6 +73,7 @@ config M68020
 config M68030
 	bool "68030 support"
 	depends on MMU && !MMU_SUN3
+	select FPU
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68030
@@ -81,6 +83,7 @@ config M68030
 config M68040
 	bool "68040 support"
 	depends on MMU && !MMU_SUN3
+	select FPU
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68LC040
@@ -91,6 +94,7 @@ config M68040
 config M68060
 	bool "68060 support"
 	depends on MMU && !MMU_SUN3
+	select FPU
 	select CPU_HAS_ADDRESS_SPACES
 	help
 	  If you anticipate running this kernel on a computer with a MC68060
@@ -259,6 +263,7 @@ config M547x
 	bool "MCF547x"
 	select M54xx
 	select MMU_COLDFIRE if MMU
+	select FPU if MMU
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
 	select CPU_NO_EFFICIENT_FFS
@@ -268,6 +273,7 @@ config M547x
 config M548x
 	bool "MCF548x"
 	select MMU_COLDFIRE if MMU
+	select FPU if MMU
 	select M54xx
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
-- 
1.9.1
