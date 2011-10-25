From: <gerg@snapgear.com>
Subject: [PATCH 14/36] m68k: modify ColdFire 54xx cache support for MMU enabled
Date: Tue, 25 Oct 2011 17:19:06 +1000
Message-ID: <1319527168-11166-15-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25117 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753406Ab1JYHT2 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:19:28 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Modify the cache setup for the ColdFire 54xx parts when running with
the MMU enabled.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/include/asm/m54xxacr.h |   26 +++++++++++++++++++++++++-
 1 files changed, 25 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/m54xxacr.h b/arch/m68k/include/asm/m54xxacr.h
index 16a1835..c8b21b6 100644
--- a/arch/m68k/include/asm/m54xxacr.h
+++ b/arch/m68k/include/asm/m54xxacr.h
@@ -39,6 +39,7 @@
 #define ACR_CM_OFF_PRE	0x00000040	/* No cache, precise */
 #define ACR_CM_OFF_IMP	0x00000060	/* No cache, imprecise */
 #define ACR_CM		0x00000060	/* Cache mode mask */
+#define ACR_SP		0x00000008	/* Supervisor protect */
 #define ACR_WPROTECT	0x00000004	/* Write protect */
 
 #if defined(CONFIG_M5407)
@@ -56,6 +57,11 @@
 #define CACHE_LINE_SIZE 0x0010	/* 16 bytes */
 #define CACHE_WAYS 4		/* 4 ways */
 
+#define ICACHE_SET_MASK	((ICACHE_SIZE / 64 - 1) << CACHE_WAYS)
+#define DCACHE_SET_MASK	((DCACHE_SIZE / 64 - 1) << CACHE_WAYS)
+#define ICACHE_MAX_ADDR	ICACHE_SET_MASK
+#define DCACHE_MAX_ADDR	DCACHE_SET_MASK
+
 /*
  *	Version 4 cores have a true harvard style separate instruction
  *	and data cache. Enable data and instruction caches, also enable write
@@ -73,6 +79,24 @@
 #else
 #define CACHE_MODE (CACR_DEC+CACR_DESB+CACR_DDCM_P+CACR_BEC+CACR_IEC+CACR_EUSP)
 #endif
+#define CACHE_INIT (CACR_DCINVA+CACR_BCINVA+CACR_ICINVA)
+
+#if defined(CONFIG_MMU)
+/*
+ *	If running with the MMU enabled then we need to map the internal
+ *	register region as non-cacheable. And then we map all or RAM as
+ *	cacheable and supervisor access only.
+ */
+#define ACR0_MODE	(0xf00f0000+ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
+#define ACR1_MODE	(0x000f0000+ACR_ENABLE+ACR_SUPER+ACR_CM_OFF_PRE+ACR_SP)
+#define ACR2_MODE	0
+#define ACR3_MODE	(0x000f0000+ACR_ENABLE+ACR_SUPER+ACR_SP)
+
+#else
+
+/*
+ *	For the non-MMU enabled case we map all of RAM as cacheable.
+ */
 #if defined(CONFIG_CACHE_COPYBACK)
 #define DATA_CACHE_MODE (ACR_ENABLE+ACR_ANY+ACR_CM_CP)
 #else
@@ -80,7 +104,6 @@
 #endif
 #define INSN_CACHE_MODE (ACR_ENABLE+ACR_ANY)
 
-#define CACHE_INIT	(CACR_DCINVA+CACR_BCINVA+CACR_ICINVA)
 #define CACHE_INVALIDATE  (CACHE_MODE+CACR_DCINVA+CACR_BCINVA+CACR_ICINVA)
 #define CACHE_INVALIDATEI (CACHE_MODE+CACR_BCINVA+CACR_ICINVA)
 #define CACHE_INVALIDATED (CACHE_MODE+CACR_DCINVA)
@@ -94,4 +117,5 @@
 #define	CACHE_PUSH
 #endif
 
+#endif /* CONFIG_MMU */
 #endif	/* m54xxacr_h */
-- 
1.7.0.4
