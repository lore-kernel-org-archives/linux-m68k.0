From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 03/31] arch/m68k/bootinfo: use kmemdup rather than duplicating
 its implementation
Date: Fri, 07 Aug 2015 09:59:09 +0200
Message-ID: <1438934377-4922-4-git-send-email-a.hajda__5024.27944816208$1438935401$gmane$org@samsung.com>
References: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-reply-to: <1438934377-4922-1-git-send-email-a.hajda@samsung.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org

The patch was generated using fixed coccinelle semantic patch
scripts/coccinelle/api/memdup.cocci [1].

[1]: http://permalink.gmane.org/gmane.linux.kernel/2014320

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/m68k/kernel/bootinfo_proc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/m68k/kernel/bootinfo_proc.c b/arch/m68k/kernel/bootinfo_proc.c
index 7ee853e..2a33a96 100644
--- a/arch/m68k/kernel/bootinfo_proc.c
+++ b/arch/m68k/kernel/bootinfo_proc.c
@@ -62,12 +62,10 @@ static int __init init_bootinfo_procfs(void)
 	if (!bootinfo_size)
 		return -EINVAL;
 
-	bootinfo_copy = kmalloc(bootinfo_size, GFP_KERNEL);
+	bootinfo_copy = kmemdup(bootinfo_tmp, bootinfo_size, GFP_KERNEL);
 	if (!bootinfo_copy)
 		return -ENOMEM;
 
-	memcpy(bootinfo_copy, bootinfo_tmp, bootinfo_size);
-
 	pde = proc_create_data("bootinfo", 0400, NULL, &bootinfo_fops, NULL);
 	if (!pde) {
 		kfree(bootinfo_copy);
-- 
1.9.1
