From: <gerg@snapgear.com>
Subject: [PATCH 22/36] m68k: use ColdFire V4e MMU flags when ioremapping()
Date: Tue, 25 Oct 2011 17:19:14 +1000
Message-ID: <1319527168-11166-23-git-send-email-gerg@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:25221 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754817Ab1JYHVM (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 25 Oct 2011 03:21:12 -0400
In-Reply-To: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

Different flags needed when mapping pages for the ColdFire V4e MMU case.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/mm/kmap.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
index 6934584..eed39e6 100644
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -50,7 +50,11 @@ static inline void free_io_area(void *addr)
 
 #else
 
+#ifdef CONFIG_COLDFIRE
+#define IO_SIZE		PAGE_SIZE
+#else
 #define IO_SIZE		(256*1024)
+#endif
 
 static struct vm_struct *iolist;
 
@@ -171,7 +175,12 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
 			break;
 		}
 	} else {
+#ifdef CONFIG_COLDFIRE
+		physaddr |= (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY |
+			_PAGE_READWRITE);
+#else
 		physaddr |= (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY);
+#endif
 		switch (cacheflag) {
 		case IOMAP_NOCACHE_SER:
 		case IOMAP_NOCACHE_NONSER:
-- 
1.7.0.4
