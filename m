From: <gerg@snapgear.com>
Subject: [PATCH 1/2] m68knommu: create config options for CPU classes
Date: Fri, 3 Jun 2011 16:43:16 +1000
Message-ID: <1307083397-9994-3-git-send-email-gerg@snapgear.com>
References: <1307083397-9994-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:10980 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751565Ab1FCGm4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Jun 2011 02:42:56 -0400
In-Reply-To: <1307083397-9994-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

There are 3 families of CPU core types that we support in the m68knommu
architecture branch. They are

. traditional 68000
. CPU32 (which is a 68020 core derivitive without MMU)
. ColdFire

It will be useful going forward to have a CONFIG_ option defined for
each type. We already have one for ColdFire (CONFIG_COLDFIRE), so add
for the other 2 families, CONFIG_M68000 and CONFIG_MCPU32.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.nommu |   52 ++++++++++++++++++++++++++++++++++++++++------
 1 files changed, 45 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/Kconfig.nommu b/arch/m68k/Kconfig.nommu
index fc98f9b..b004dc1 100644
--- a/arch/m68k/Kconfig.nommu
+++ b/arch/m68k/Kconfig.nommu
@@ -14,6 +14,33 @@ config GENERIC_CLOCKEVENTS
 	bool
 	default n
 
+config M68000
+	bool
+	help
+	  The Freescale (was Motorola) 68000 CPU is the first generation of
+	  the well known M68K family of processors. The CPU core as well as
+	  being available as a stand alone CPU was also used in many
+	  System-On-Chip devices (eg 68328, 68302, etc). It does not contain
+	  a paging MMU.
+
+config MCPU32
+	bool
+	help
+	  The Freescale (was then Motorola) CPU32 is a CPU core that is
+	  based on the 68020 processor. For the most part it is used in
+	  System-On-Chip parts, and does not contain a paging MMU.
+
+config COLDFIRE
+	bool
+	select GENERIC_GPIO
+	select ARCH_REQUIRE_GPIOLIB
+	help
+	  The Freescale ColdFire family of processors is a modern derivitive
+	  of the 68000 processor family. They are mainly targeted at embedded
+	  applications, and are all System-On-Chip (SOC) devices, as opposed
+	  to stand alone CPUs. They implement a subset of the original 68000
+	  processor instruction set.
+
 config COLDFIRE_SW_A7
 	bool
 	default n
@@ -36,26 +63,31 @@ choice
 
 config M68328
 	bool "MC68328"
+	select M68000
 	help
 	  Motorola 68328 processor support.
 
 config M68EZ328
 	bool "MC68EZ328"
+	select M68000
 	help
 	  Motorola 68EX328 processor support.
 
 config M68VZ328
 	bool "MC68VZ328"
+	select M68000
 	help
 	  Motorola 68VZ328 processor support.
 
 config M68360
 	bool "MC68360"
+	select MCPU32
 	help
 	  Motorola 68360 processor support.
 
 config M5206
 	bool "MCF5206"
+	select COLDFIRE
 	select COLDFIRE_SW_A7
 	select HAVE_MBAR
 	help
@@ -63,6 +95,7 @@ config M5206
 
 config M5206e
 	bool "MCF5206e"
+	select COLDFIRE
 	select COLDFIRE_SW_A7
 	select HAVE_MBAR
 	help
@@ -70,6 +103,7 @@ config M5206e
 
 config M520x
 	bool "MCF520x"
+	select COLDFIRE
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_SPLIT
 	help
@@ -77,6 +111,7 @@ config M520x
 
 config M523x
 	bool "MCF523x"
+	select COLDFIRE
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
@@ -85,6 +120,7 @@ config M523x
 
 config M5249
 	bool "MCF5249"
+	select COLDFIRE
 	select COLDFIRE_SW_A7
 	select HAVE_MBAR
 	help
@@ -92,6 +128,7 @@ config M5249
 
 config M5271
 	bool "MCF5271"
+	select COLDFIRE
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
 	help
@@ -99,6 +136,7 @@ config M5271
 
 config M5272
 	bool "MCF5272"
+	select COLDFIRE
 	select COLDFIRE_SW_A7
 	select HAVE_MBAR
 	help
@@ -106,6 +144,7 @@ config M5272
 
 config M5275
 	bool "MCF5275"
+	select COLDFIRE
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
 	help
@@ -113,6 +152,7 @@ config M5275
 
 config M528x
 	bool "MCF528x"
+	select COLDFIRE
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_SPLIT
 	select HAVE_IPSBAR
@@ -121,6 +161,7 @@ config M528x
 
 config M5307
 	bool "MCF5307"
+	select COLDFIRE
 	select COLDFIRE_SW_A7
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
@@ -129,12 +170,14 @@ config M5307
 
 config M532x
 	bool "MCF532x"
+	select COLDFIRE
 	select HAVE_CACHE_CB
 	help
 	  Freescale (Motorola) ColdFire 532x processor support.
 
 config M5407
 	bool "MCF5407"
+	select COLDFIRE
 	select COLDFIRE_SW_A7
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
@@ -143,6 +186,7 @@ config M5407
 
 config M547x
 	bool "MCF547x"
+	select COLDFIRE
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
 	help
@@ -150,6 +194,7 @@ config M547x
 
 config M548x
 	bool "MCF548x"
+	select COLDFIRE
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
 	help
@@ -168,13 +213,6 @@ config M54xx
 	depends on (M548x || M547x)
 	default y
 
-config COLDFIRE
-	bool
-	depends on (M5206 || M5206e || M520x || M523x || M5249 || M527x || M5272 || M528x || M5307 || M532x || M5407 || M54xx)
-	select GENERIC_GPIO
-	select ARCH_REQUIRE_GPIOLIB
-	default y
-
 config CLOCK_SET
 	bool "Enable setting the CPU clock frequency"
 	default n
-- 
1.7.0.4
