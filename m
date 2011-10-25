From: <gerg@snapgear.com>
Subject: [PATCH 36/36] m68k: allow ColdFire 547x and 548x CPUs to be built with MMU enabled
Date: Tue, 25 Oct 2011 17:19:28 +1000
Message-ID: <1319527168-11166-37-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25154 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754342Ab1JYHTr (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:47 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire 547x and 548x CPUs have internal MMU hardware. All code
to support this is now in, so we can build kernels with it enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig.cpu |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 5b67ae9..6bad6b5 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -224,7 +224,6 @@ config M54xx
 
 config M547x
 	bool "MCF547x"
-	depends on !MMU
 	select COLDFIRE
 	select M54xx
 	select HAVE_CACHE_CB
@@ -234,7 +233,6 @@ config M547x
 
 config M548x
 	bool "MCF548x"
-	depends on !MMU
 	select COLDFIRE
 	select M54xx
 	select HAVE_CACHE_CB
-- 
1.7.0.4
