From: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Subject: [RFC 1/8] m68k: coldfire: unlink FPU presence from MMU activation
Date: Wed,  8 Jul 2015 11:51:25 +0200
Message-ID: <1436349092-2214-2-git-send-email-yannick.gicquel@gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:37694 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933271AbbGHJvu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 05:51:50 -0400
Received: by wiclp1 with SMTP id lp1so74957520wic.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 02:51:49 -0700 (PDT)
Received: from PCL140005.eurogiciel.fr (130.167.26.109.rev.sfr.net. [109.26.167.130])
        by smtp.gmail.com with ESMTPSA id k16sm2551260wjr.7.2015.07.08.02.51.48
        for <linux-m68k@vger.kernel.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 08 Jul 2015 02:51:48 -0700 (PDT)
In-Reply-To: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

m5441x coldfire chips contains a MMU and no FPU.
This patch allow building this chip with MMU activated.

Signed-off-by: Yannick GICQUEL <yannick.gicquel@gmail.com>
---
 arch/m68k/Kconfig     | 2 +-
 arch/m68k/Kconfig.cpu | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 2dd8f63..d704c16 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -14,7 +14,7 @@ config M68K
 	select GENERIC_IOMAP
 	select GENERIC_STRNCPY_FROM_USER if MMU
 	select GENERIC_STRNLEN_USER if MMU
-	select FPU if MMU
+	select FPU if MMU && !COLDFIRE
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
 	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 33013df..3661eb4 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -257,6 +257,7 @@ config M54xx
 config M547x
 	bool "MCF547x"
 	select M54xx
+	select FPU
 	select MMU_COLDFIRE if MMU
 	select HAVE_CACHE_CB
 	select HAVE_MBAR
@@ -265,6 +266,7 @@ config M547x
 
 config M548x
 	bool "MCF548x"
+	select FPU
 	select MMU_COLDFIRE if MMU
 	select M54xx
 	select HAVE_CACHE_CB
@@ -274,7 +276,7 @@ config M548x
 
 config M5441x
 	bool "MCF5441x"
-	depends on !MMU
+	select MMU_COLDFIRE if MMU
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CACHE_CB
 	help
-- 
1.9.1.286.g5172cb3
