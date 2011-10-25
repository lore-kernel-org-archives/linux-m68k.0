From: <gerg@snapgear.com>
Subject: [PATCH 35/36] m68k: config option adjustments for configuring ColdFire with MMU
Date: Tue, 25 Oct 2011 17:19:27 +1000
Message-ID: <1319527168-11166-36-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25228 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754723Ab1JYHVR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:17 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We want to reuse as much of the exitsing ColdFire code as we can for
running it with the MMU enabled. So we need to disable CONFIG_GENERIC_IOMAP
and CONFIG_ARCH_USES_GETTIMEOFFSET for the case where we are building for
ColdFire CPU with MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 663d1f4..5e7145f 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -36,14 +36,14 @@ config GENERIC_CALIBRATE_DELAY
 	default y
 
 config GENERIC_IOMAP
-	def_bool MMU
+	def_bool MMU && !COLDFIRE
 
 config TIME_LOW_RES
 	bool
 	default y
 
 config ARCH_USES_GETTIMEOFFSET
-	def_bool MMU
+	def_bool MMU && !COLDFIRE
 
 config NO_IOPORT
 	def_bool y
-- 
1.7.0.4
