From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 03/10] m68knommu: make ColdFire SoC selection a choice
Date: Tue,  7 Jul 2015 16:55:17 +1000
Message-ID: <1436252124-23051-4-git-send-email-gerg@uclinux.org>
References: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas03p.mx.bigpond.com ([61.9.168.143]:29824 "EHLO
	nskntmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755502AbbGGGyN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Jul 2015 02:54:13 -0400
In-Reply-To: <1436252124-23051-1-git-send-email-gerg@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Greg Ungerer <gerg@uclinux.org>

It would be nice if we could support multiple ColdFire SoC types in a
single binary - but currently the code simply does not support it.
Change the SoC selection config options to be a choice instead of
individual selectable entries.

This fixes problems with building allnoconfig, and means that a sane
linux kernel is generated for a single ColdFire SoC type.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 62f590e..c496d48 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -125,6 +125,13 @@ endif # M68KCLASSIC
 
 if COLDFIRE
 
+choice
+	prompt "ColdFire SoC type"
+	default M520x
+	help
+	  Select the type of ColdFire System-on-Chip (SoC) that you want
+	  to build for.
+
 config M5206
 	bool "MCF5206"
 	depends on !MMU
@@ -174,9 +181,6 @@ config M525x
 	help
 	  Freescale (Motorola) Coldfire 5251/5253 processor support.
 
-config M527x
-	bool
-
 config M5271
 	bool "MCF5271"
 	depends on !MMU
@@ -223,9 +227,6 @@ config M5307
 	help
 	  Motorola ColdFire 5307 processor support.
 
-config M53xx
-	bool
-
 config M532x
 	bool "MCF532x"
 	depends on !MMU
@@ -251,9 +252,6 @@ config M5407
 	help
 	  Motorola ColdFire 5407 processor support.
 
-config M54xx
-	bool
-
 config M547x
 	bool "MCF547x"
 	select M54xx
@@ -280,6 +278,17 @@ config M5441x
 	help
 	  Freescale Coldfire 54410/54415/54416/54417/54418 processor support.
 
+endchoice
+
+config M527x
+	bool
+
+config M53xx
+	bool
+
+config M54xx
+	bool
+
 endif # COLDFIRE
 
 
-- 
1.9.1
