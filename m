From: sfking@fdwdc.com
Subject: [RFC 03/31] proof of concept merge of m68k and m68knommu
Date: Sun,  6 Sep 2009 22:39:53 -0700
Message-ID: <44c52df23985288bc2f4a819b73b3cc6da0826b9.1252222133.git.sfking__11741.5477325723$1252302441$gmane$org@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
 <cfdcab7374087d5279ec9a1269831e8159d98f2b.1252222133.git.sfking@fdwdc.com>
 <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from smtp109.biz.mail.mud.yahoo.com ([68.142.201.178]:34385 "HELO
	smtp109.biz.mail.mud.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1753308AbZIGFrE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Sep 2009 01:47:04 -0400
In-Reply-To: <8cb57205150fb96915e9d12c936be301a5e1e1e1.1252222133.git.sfking@fdwdc.com>
In-Reply-To: <cover.1252222129.git.sfking@fdwdc.com>
References: <cover.1252222129.git.sfking@fdwdc.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: uclinux-dev@uclinux.org
Cc: gerg@snapgear.com, linux-m68k@lists.linux-m68k.org

---
 arch/m68k/Kconfig.debug |   33 +++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/Kconfig.debug b/arch/m68k/Kconfig.debug
index f53b6d5..e1b452c 100644
--- a/arch/m68k/Kconfig.debug
+++ b/arch/m68k/Kconfig.debug
@@ -2,4 +2,37 @@ menu "Kernel hacking"
 
 source "lib/Kconfig.debug"
 
+if !MMU
+
+config FULLDEBUG
+	bool "Full Symbolic/Source Debugging support"
+	help
+	  Enable debugging symbols on kernel build.
+
+config HIGHPROFILE
+	bool "Use fast second timer for profiling"
+	depends on COLDFIRE
+	help
+	  Use a fast secondary clock to produce profiling information.
+
+config BOOTPARAM
+	bool 'Compiled-in Kernel Boot Parameter'
+
+config BOOTPARAM_STRING
+	string 'Kernel Boot Parameter'
+	default 'console=ttyS0,19200'
+	depends on BOOTPARAM
+
+config NO_KERNEL_MSG
+	bool "Suppress Kernel BUG Messages"
+	help
+	  Do not output any debug BUG messages within the kernel.
+
+config BDM_DISABLE
+	bool "Disable BDM signals"
+	depends on (EXPERIMENTAL && COLDFIRE)
+	help
+	  Disable the ColdFire CPU's BDM signals.
+
+endif
 endmenu
-- 
1.5.6.5

