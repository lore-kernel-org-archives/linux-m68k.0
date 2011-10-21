From: <gerg@snapgear.com>
Subject: [PATCH] m68k: support configure time command line for MMU m68k
Date: Fri, 21 Oct 2011 17:07:50 +1000
Message-ID: <1319180870-11125-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53431 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751124Ab1JUHI7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 21 Oct 2011 03:08:59 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The non-MMU builds of m68k allow a fixed kernel boot command line to
be configured at configure time. Allow this MMU builds as well.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.debug     |   16 ++++++++--------
 arch/m68k/kernel/setup_mm.c |    4 ++++
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index 2bdb1b0..af4fd5f 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -2,6 +2,14 @@ menu "Kernel hacking"
 
 source "lib/Kconfig.debug"
 
+config BOOTPARAM
+	bool 'Compiled-in Kernel Boot Parameter'
+
+config BOOTPARAM_STRING
+	string 'Kernel Boot Parameter'
+	default 'console=ttyS0,19200'
+	depends on BOOTPARAM
+
 if !MMU
 
 config FULLDEBUG
@@ -15,14 +23,6 @@ config HIGHPROFILE
 	help
 	  Use a fast secondary clock to produce profiling information.
 
-config BOOTPARAM
-	bool 'Compiled-in Kernel Boot Parameter'
-
-config BOOTPARAM_STRING
-	string 'Kernel Boot Parameter'
-	default 'console=ttyS0,19200'
-	depends on BOOTPARAM
-
 config NO_KERNEL_MSG
 	bool "Suppress Kernel BUG Messages"
 	help
diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index c3b4506..55f8f50 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -258,6 +258,10 @@ void __init setup_arch(char **cmdline_p)
 	init_mm.end_data = (unsigned long)_edata;
 	init_mm.brk = (unsigned long)_end;
 
+#if defined(CONFIG_BOOTPARAM)
+	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
+	m68k_command_line[CL_SIZE - 1] = 0;
+#endif /* CONFIG_BOOTPARAM */
 	*cmdline_p = m68k_command_line;
 	memcpy(boot_command_line, *cmdline_p, CL_SIZE);
 
-- 
1.7.0.4
