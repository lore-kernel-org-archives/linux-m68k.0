From: <gerg@snapgear.com>
Subject: [PATCH 23/35] m68k: use ColdFire MMU read/write bit flags when ioremapping
Date: Fri, 16 Dec 2011 22:36:20 +1000
Message-ID: <1324038992-31222-24-git-send-email-gerg@snapgear.com>
References: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:49408 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756946Ab1LPMhC (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Dec 2011 07:37:02 -0500
In-Reply-To: <1324038992-31222-1-git-send-email-gerg@snapgear.com>
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
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
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
