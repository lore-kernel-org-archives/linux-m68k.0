Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A94C64ED8
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 20:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjB0UOg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 15:14:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229985AbjB0UOf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 27 Feb 2023 15:14:35 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90178E383
        for <linux-m68k@lists.linux-m68k.org>; Mon, 27 Feb 2023 12:14:19 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:9202:974e:f0e0:414c])
        by xavier.telenet-ops.be with bizsmtp
        id SLEG290011hKVeJ01LEG2f; Mon, 27 Feb 2023 21:14:17 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pWjsZ-00AKCt-U9;
        Mon, 27 Feb 2023 21:14:15 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pWjt1-007c5R-R2;
        Mon, 27 Feb 2023 21:14:15 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Finn Thain <fthain@linux-m68k.org>, Mike Rapoport <rppt@kernel.org>
Cc:     linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Walsh <vk3heg@vk3heg.net>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH] m68k: mm: Move initrd phys_to_virt handling after paging_init()
Date:   Mon, 27 Feb 2023 21:14:13 +0100
Message-Id: <dff216da09ab7a60217c3fc2147e671ae07d636f.1677528627.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

When booting with an initial ramdisk on platforms where physical memory
does not start at address zero (e.g. on Amiga):

    initrd: 0ef0602c - 0f800000
    Zone ranges:
      DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
      Normal   empty
    Movable zone start for each node
    Early memory node ranges
      node   0: [mem 0x0000000008000000-0x000000000f7fffff]
    Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
    Unable to handle kernel access at virtual address (ptrval)
    Oops: 00000000
    Modules linked in:
    PC: [<00201d3c>] memcmp+0x28/0x56

As phys_to_virt() relies on m68k_memoffset and module_fixup(), it must
not be called before paging_init().  Hence postpone the phys_to_virt
handling for the initial ramdisk until after calling paging_init().

While at it, reduce #ifdef clutter by using IS_ENABLED() instead.

Fixes: 376e3fdecb0dcae2 ("m68k: Enable memtest functionality")
Reported-by: Stephen Walsh <vk3heg@vk3heg.net>
Link: https://lists.debian.org/debian-68k/2022/09/msg00007.html
Reported-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Link: https://lore.kernel.org/r/4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued as a fix for v6.3.

 arch/m68k/kernel/setup_mm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 3a2bb2e8fdad47b4..fbff1cea62caac23 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -326,16 +326,16 @@ void __init setup_arch(char **cmdline_p)
 		panic("No configuration setup");
 	}
 
-#ifdef CONFIG_BLK_DEV_INITRD
-	if (m68k_ramdisk.size) {
+	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && m68k_ramdisk.size)
 		memblock_reserve(m68k_ramdisk.addr, m68k_ramdisk.size);
+
+	paging_init();
+
+	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && m68k_ramdisk.size) {
 		initrd_start = (unsigned long)phys_to_virt(m68k_ramdisk.addr);
 		initrd_end = initrd_start + m68k_ramdisk.size;
 		pr_info("initrd: %08lx - %08lx\n", initrd_start, initrd_end);
 	}
-#endif
-
-	paging_init();
 
 #ifdef CONFIG_NATFEAT
 	nf_init();
-- 
2.34.1

