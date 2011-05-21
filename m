From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 5/5] m68k/amiga: Chip RAM - Use resource_size() to fix off-by-one error
Date: Sat, 21 May 2011 21:18:20 +0200
Message-ID: <1306005500-29259-5-git-send-email-geert@linux-m68k.org>
References: <1306005500-29259-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1306005500-29259-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/amiga/chipram.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/amiga/chipram.c b/arch/m68k/amiga/chipram.c
index c3fe451..cfd3b7a 100644
--- a/arch/m68k/amiga/chipram.c
+++ b/arch/m68k/amiga/chipram.c
@@ -100,7 +100,7 @@ void amiga_chip_free(void *ptr)
 		if (res->start != start)
 			continue;
 		*p = res->sibling;
-		size = res->end-start;
+		size = resource_size(res);
 		pr_debug("amiga_chip_free: free %lu bytes at %p\n", size, ptr);
 		atomic_add(size, &chipavail);
 		kfree(res);
-- 
1.7.0.4
