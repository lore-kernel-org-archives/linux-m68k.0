From: <gerg@snapgear.com>
Subject: [PATCH 1/2] m68k: make support for FPU hardware configurable
Date: Fri, 10 Feb 2012 16:14:16 +1000
Message-ID: <1328854457-24859-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:50549 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751452Ab2BJGPl (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 10 Feb 2012 01:15:41 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The classic m68k code has always supported an FPU (although it may have
been a software emulated one). The non-MMU m68k code has never supported FPU
hardware. To help in merging common code create a configation setting that
signifies if we are builing in FPU support or not.

This switch, CONFIG_FPU, is set as per the current use cases. So it is
always enabled if CONFIG_MMU is set, and disabled otherwise. With a little
extra code it will be possible to disable it on the classic m68k platforms
as well, and to enable it on non-MMU platforms that do have hardware FPU.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index ae413d4..57bf848 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -7,6 +7,7 @@ config M68K
 	select GENERIC_IRQ_SHOW
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select GENERIC_CPU_DEVICES
+	select FPU if MMU
 
 config RWSEM_GENERIC_SPINLOCK
 	bool
@@ -67,6 +68,9 @@ config CPU_HAS_NO_MULDIV64
 config CPU_HAS_ADDRESS_SPACES
 	bool
 
+config FPU
+	bool
+
 config HZ
 	int
 	default 1000 if CLEOPATRA
-- 
1.7.0.4
