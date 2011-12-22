From: <gerg@snapgear.com>
Subject: [PATCH 23/35 v4] m68k: use ColdFire MMU read/write bit flags when ioremapping
Date: Thu, 22 Dec 2011 22:26:52 +1000
Message-ID: <1324556812-12568-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:13983 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752616Ab1LVMZ5 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 07:25:57 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
Cc: Greg Ungerer <gerg@uclinux.org>

From: Greg Ungerer <gerg@uclinux.org>

The ColdFire MMU has separate read and write bits, unlike the Motorola
m68k MMU which has a single read-only bit.

Define a _PAGE_READWRITE value for the Motorola MMU, which is 0, so we
can unconditionaly include that in the page table entry bits when setting
up ioremapped pages.

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
Acked-by: Matt Waddel <mwaddel@yahoo.com>
Acked-by: Kurt Mahan <kmahan@xmission.com>
---

This is a re-working to avoid using a #ifdef. Seems much nice this way.

 arch/m68k/include/asm/motorola_pgtable.h |    1 +
 arch/m68k/mm/kmap.c                      |    3 ++-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 45bd3f5..e0fdd4d 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -8,6 +8,7 @@
 #define _PAGE_PRESENT	0x001
 #define _PAGE_SHORT	0x002
 #define _PAGE_RONLY	0x004
+#define _PAGE_READWRITE	0x000
 #define _PAGE_ACCESSED	0x008
 #define _PAGE_DIRTY	0x010
 #define _PAGE_SUPER	0x080	/* 68040 supervisor only */
diff --git a/arch/m68k/mm/kmap.c b/arch/m68k/mm/kmap.c
index 6934584..1cc2bed 100644
--- a/arch/m68k/mm/kmap.c
+++ b/arch/m68k/mm/kmap.c
@@ -171,7 +171,8 @@ void __iomem *__ioremap(unsigned long physaddr, unsigned long size, int cachefla
 			break;
 		}
 	} else {
-		physaddr |= (_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_DIRTY);
+		physaddr |= (_PAGE_PRESENT | _PAGE_ACCESSED |
+			     _PAGE_DIRTY | _PAGE_READWRITE);
 		switch (cacheflag) {
 		case IOMAP_NOCACHE_SER:
 		case IOMAP_NOCACHE_NONSER:
-- 
1.7.0.4
