From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] aranym: Update for v2.6.31 block layer changes
Date: Fri, 21 Aug 2009 22:29:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0908212227420.18894@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Petr Stehlik <pstehlik@sophics.cz>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/m68k/emu/nfblock.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index c131121..3d584f1 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -122,7 +122,7 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 
 	dev->queue->queuedata = dev;
 	blk_queue_make_request(dev->queue, nfhd_make_request);
-	blk_queue_hardsect_size(dev->queue, bsize);
+	blk_queue_logical_block_size(dev->queue, bsize);
 
 	dev->disk = alloc_disk(16);
 	if (!dev->disk)
-- 
1.6.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
