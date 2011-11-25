From: <gerg@snapgear.com>
Subject: [PATCH 18/35] m68k: set ColdFire MMU page size
Date: Fri, 25 Nov 2011 13:41:03 +1000
Message-ID: <1322192480-22822-19-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53445 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752262Ab1KYDj0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:26 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

We use the ColdFire V4e MMU page size of 8KiB. Define PAGE_SHIFT
appropriately.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/include/asm/page.h |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/page.h
index dfebb7c..e8aef81 100644
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
