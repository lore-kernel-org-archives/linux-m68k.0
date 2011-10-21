From: <gerg@snapgear.com>
Subject: [PATCH] m68k: selection of GENERIC_IRQ_SHOW is not MMU specific
Date: Fri, 21 Oct 2011 17:04:23 +1000
Message-ID: <1319180663-11010-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:37828 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025Ab1JUHKH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:10:07 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The selection of the CONFIG_GENERIC_IRQ_SHOW option is not specific
to the MMU being present and enabled. It is dependant on what CPU we are
compiling for. The non-MMU 68000 and ColdFire family CPUs use generic
interrupts, and can use the generic irq show code.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig     |    1 -
 arch/m68k/Kconfig.cpu |    3 +++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 9829235..663d1f4 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -3,7 +3,6 @@ config M68K
 	default y
 	select HAVE_IDE
 	select HAVE_AOUT if MMU
-	select GENERIC_IRQ_SHOW if !MMU
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 
 config RWSEM_GENERIC_SPINLOCK
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 383c508..5b67ae9 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -4,6 +4,7 @@ config M68000
 	bool
 	select CPU_HAS_NO_BITFIELDS
 	select HAVE_GENERIC_HARDIRQS
+	select GENERIC_IRQ_SHOW
 	help
 	  The Freescale (was Motorola) 68000 CPU is the first generation of
 	  the well known M68K family of processors. The CPU core as well as
@@ -15,6 +16,7 @@ config MCPU32
 	bool
 	select CPU_HAS_NO_BITFIELDS
 	select HAVE_GENERIC_HARDIRQS
+	select GENERIC_IRQ_SHOW
 	help
 	  The Freescale (was then Motorola) CPU32 is a CPU core that is
 	  based on the 68020 processor. For the most part it is used in
@@ -26,6 +28,7 @@ config COLDFIRE
 	select ARCH_REQUIRE_GPIOLIB
 	select CPU_HAS_NO_BITFIELDS
 	select HAVE_GENERIC_HARDIRQS
+	select GENERIC_IRQ_SHOW
 	help
 	  The Freescale ColdFire family of processors is a modern derivitive
 	  of the 68000 processor family. They are mainly targeted at embedded
-- 
1.7.0.4
