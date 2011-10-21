From: <gerg@snapgear.com>
Subject: [PATCH] m68k: selection of HAVE_GENERIC_HARDIRQS is not MMU specific
Date: Fri, 21 Oct 2011 17:04:08 +1000
Message-ID: <1319180648-10990-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:10451 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124Ab1JUHDu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:03:50 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The selection of the CONFIG_HAVE_GENERIC_HARDIRQS option is not specific
to the MMU being present and enabled. It is dependant on what CPU we are
compiling for. The non-MMU 68000 and ColdFire family CPUs use generic
interrupts, so enable it for them only.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig     |    1 -
 arch/m68k/Kconfig.cpu |    3 +++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 26ed01b..9829235 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,7 +3,6 @@ config M68K
 	default y
 	select HAVE_IDE
 	select HAVE_AOUT if MMU
-	select HAVE_GENERIC_HARDIRQS if !MMU
 	select GENERIC_IRQ_SHOW if !MMU
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 9af9e68..383c508 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -3,6 +3,7 @@ comment "Processor Type"
 config M68000
 	bool
 	select CPU_HAS_NO_BITFIELDS
+	select HAVE_GENERIC_HARDIRQS
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
@@ -13,6 +14,7 @@ config M68000
 config MCPU32
 	bool
 	select CPU_HAS_NO_BITFIELDS
+	select HAVE_GENERIC_HARDIRQS
 	help
 	  The Freescale (was then Motorola) CPU32 is a CPU core that is
 	  based on the 68020 processor. For the most part it is used in
@@ -23,6 +25,7 @@ config COLDFIRE
 	select GENERIC_GPIO
 	select ARCH_REQUIRE_GPIOLIB
 	select CPU_HAS_NO_BITFIELDS
+	select HAVE_GENERIC_HARDIRQS
 	help
 	  The Freescale ColdFire family of processors is a modern derivitive
 	  of the 68000 processor family. They are mainly targeted at embedded
-- 
1.7.0.4
