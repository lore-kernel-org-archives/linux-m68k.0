From: <gerg@snapgear.com>
Subject: [PATCH 17/35] m68k: define PAGE_OFFSET_RAW for ColdFire CPU with MMU enabled
Date: Fri, 23 Dec 2011 13:15:30 +1000
Message-ID: <1324610148-20666-18-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39252 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756357Ab1LWDOw (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:52 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire CPU configurations need PAGE_OFFSET_RAW set to the base of
their RAM. It doesn't matter if they are running with the MMU enabled or
disabled, it is always set to the base of RAM.

We can keep the choices simple here and key of CONFIG_RAMBASE. If it is
defined we are on a plaftorm (ColdFire or other non-MMU systems) which
have a configurable RAM base, just use it.

Reported-by: Alexander Stein <alexander.stein@systec-electronic.com>
Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/page_offset.h |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/include/asm/page_offset.h b/arch/m68k/include/asm/page_offset.h
index 1780152..a53d7f1 100644
--- a/arch/m68k/include/asm/page_offset.h
+++ b/arch/m68k/include/asm/page_offset.h
@@ -1,11 +1,9 @@
 /* This handles the memory map.. */
 
-#ifdef CONFIG_MMU
-#ifndef CONFIG_SUN3
+#if defined(CONFIG_RAMBASE)
+#define PAGE_OFFSET_RAW		CONFIG_RAMBASE
+#elif !defined(CONFIG_SUN3)
 #define PAGE_OFFSET_RAW		0x00000000
 #else
 #define PAGE_OFFSET_RAW		0x0E000000
 #endif
-#else
-#define	PAGE_OFFSET_RAW		CONFIG_RAMBASE
-#endif
-- 
1.7.0.4
