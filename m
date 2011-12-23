From: <gerg@snapgear.com>
Subject: [PATCH 18/35] m68k: set ColdFire MMU page size
Date: Fri, 23 Dec 2011 13:15:31 +1000
Message-ID: <1324610148-20666-19-git-send-email-gerg@snapgear.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:39263 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756371Ab1LWDO4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 22:14:56 -0500
In-Reply-To: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We use the ColdFire V4e MMU page size of 8KiB. Define PAGE_SHIFT
appropriately.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---
 arch/m68k/include/asm/page.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index ba6c91d..98baa82 100644
--- a/arch/m68k/include/asm/page.h
+++ b/arch/m68k/include/asm/page.h
@@ -6,10 +6,10 @@
 #include <asm/page_offset.h>
 
 /* PAGE_SHIFT determines the page size */
-#ifndef CONFIG_SUN3
-#define PAGE_SHIFT	(12)
+#if defined(CONFIG_SUN3) || defined(CONFIG_COLDFIRE)
+#define PAGE_SHIFT	13
 #else
-#define PAGE_SHIFT	(13)
+#define PAGE_SHIFT	12
 #endif
 #define PAGE_SIZE	(_AC(1, UL) << PAGE_SHIFT)
 #define PAGE_MASK	(~(PAGE_SIZE-1))
-- 
1.7.0.4
