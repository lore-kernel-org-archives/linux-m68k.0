From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k/mac: Make CONFIG_HEARTBEAT unavailable on Mac
Date: Thu, 29 Dec 2011 20:03:03 +0100
Message-ID: <1325185383-19449-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:56009 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752299Ab1L2TDI (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 29 Dec 2011 14:03:08 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

mac_heartbeat() was never really implemented.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/Kconfig.devices |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.devices b/arch/m68k/Kconfig.devices
index c3bd7e2..a8eff5a 100644
--- a/arch/m68k/Kconfig.devices
+++ b/arch/m68k/Kconfig.devices
@@ -8,8 +8,8 @@ config ARCH_MAY_HAVE_PC_FDC
 menu "Platform devices"
 
 config HEARTBEAT
-	bool "Use power LED as a heartbeat" if AMIGA || APOLLO || ATARI || MAC ||Q40
-	default y if !AMIGA && !APOLLO && !ATARI && !MAC && !Q40 && HP300
+	bool "Use power LED as a heartbeat" if AMIGA || APOLLO || ATARI || Q40
+	default y if !AMIGA && !APOLLO && !ATARI && !Q40 && HP300
 	help
 	  Use the power-on LED on your machine as a load meter.  The exact
 	  behavior is platform-dependent, but normally the flash frequency is
-- 
1.7.0.4
