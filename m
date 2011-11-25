From: <gerg@snapgear.com>
Subject: [PATCH 23/35] m68k: use ColdFire MMU read/write bit flags when ioremapping
Date: Fri, 25 Nov 2011 13:41:08 +1000
Message-ID: <1322192480-22822-24-git-send-email-gerg@snapgear.com>
References: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:53468 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752792Ab1KYDji (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:39:38 -0500
In-Reply-To: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire MMU has separate read and write bits, unlike the m68k
MMU's which have a single read-only bit.

We need to make sure we have the read and write bits in the page
table entry for ioremapped pages for ColdFire targets.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/mm/kmap.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
index 6934584..4d08f98 100644
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -172,6 +172,10 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
 		}
 	} else {
 		physaddr |= (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY);
+#ifdef CONFIG_COLDFIRE
+		/* ColdFire has separate read/write bits, not on by default */
+		physaddr |= _PAGE_READWRITE;
+#endif
 		switch (cacheflag) {
 		case IOMAP_NOCACHE_SER:
 		case IOMAP_NOCACHE_NONSER:
-- 
1.7.0.4
