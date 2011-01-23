From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/4] m68k/atari: ARAnyM - Prepare nfblock for submission
Date: Sun, 23 Jan 2011 17:31:32 +0100
Message-ID: <1295800294-13216-2-git-send-email-geert@linux-m68k.org>
References: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1295800294-13216-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Petr Stehlik <pstehlik@sophics.cz>

  - Make needlessly global functions static,
  - Make struct block_device_operations const,
  - Use pr_*(),
  - Propagate error code from register_blkdev().

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Petr Stehlik <pstehlik@sophics.cz>
---
 arch/m68k/emu/nfblock.c |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index fed2883..48e50f8 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -79,7 +79,7 @@ static int nfhd_make_request(struct request_queue *queue, struct bio *bio)
 	return 0;
 }
 
-int nfhd_getgeo(struct block_device *bdev, struct hd_geometry *geo)
+static int nfhd_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 {
 	struct nfhd_device *dev = bdev->bd_disk->private_data;
 
@@ -90,7 +90,7 @@ int nfhd_getgeo(struct block_device *bdev, struct hd_geometry *geo)
 	return 0;
 }
 
-static struct block_device_operations nfhd_ops = {
+static const struct block_device_operations nfhd_ops = {
 	.owner	= THIS_MODULE,
 	.getgeo	= nfhd_getgeo,
 };
@@ -100,11 +100,11 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 	struct nfhd_device *dev;
 	int dev_id = id - NFHD_DEV_OFFSET;
 
-	printk(KERN_INFO "nfhd%u: found device with %u blocks (%u bytes)\n",
-		dev_id, blocks, bsize);
+	pr_info("nfhd%u: found device with %u blocks (%u bytes)\n", dev_id,
+		blocks, bsize);
 
 	if (bsize < 512 || (bsize & (bsize - 1))) {
-		printk(KERN_WARNING "nfhd%u: invalid block size\n", dev_id);
+		pr_warn("nfhd%u: invalid block size\n", dev_id);
 		return -EINVAL;
 	}
 
@@ -162,8 +162,8 @@ static int __init nfhd_init(void)
 
 	major_num = register_blkdev(major_num, "nfhd");
 	if (major_num <= 0) {
-		printk(KERN_WARNING "nfhd: unable to get major number\n");
-		return -ENODEV;
+		pr_warn("nfhd: unable to get major number\n");
+		return major_num;
 	}
 
 	for (i = NFHD_DEV_OFFSET; i < 24; i++) {
-- 
1.7.0.4
