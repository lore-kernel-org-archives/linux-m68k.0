From: Krzysztof Helt <krzysztof.h1@poczta.fm>
Subject: Re: cirrusfb: Picasso 4 card
Date: Thu, 5 Mar 2009 21:14:25 +0100
Message-ID: <20090305211425.2b6f7895.krzysztof.h1@poczta.fm>
References: <20090224223702.86f7e129.krzysztof.h1@poczta.fm>
	<10f740e80902250048j31a9a2c5n5c39066ba156c10d@mail.gmail.com>
	<20090225093729.GA18736@chumley.debian.net>
	<20090304212348.7d1e7df3.krzysztof.h1@poczta.fm>
	<10f740e80903041346g66852195t6ba370f0d7c7a65a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <10f740e80903041346g66852195t6ba370f0d7c7a65a@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Christian T. Steigies" <cts@debian.org>, linux-m68k@lists.linux-m68k.org

Thank you Geert for all information about Zorro and Picasso4 card.

I assume I do not understand half of at (at least) so my patch may be not correct yet.

I mapped only the first 2MB of RAM (I can add another 2MB in next patch if the patch works).

The patch to add a preliminary support for Zorro II and Picasso4 card is below.

Christian, please test it if you can. This patch must be applied after -mm tree patches
or I can send you final version of the cirrusfb.c file (it is about 70KB text).

Regards,
Krzysztof

>From 7961de35767aff0014cb222f6794fc3fe5c2a7a1 Mon Sep 17 00:00:00 2001
From: Krzysztof Helt <krzysztof.h1@wp.pl>
Date: Thu, 5 Mar 2009 18:39:15 +0100
Subject: [PATCH] cirrusfb: Picasso4 with Zorro II support

---
 drivers/video/cirrusfb.c |   28 +++++++++++++++++++---------
 1 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/video/cirrusfb.c b/drivers/video/cirrusfb.c
index 0ef7ccc..7d5e069 100644
--- a/drivers/video/cirrusfb.c
+++ b/drivers/video/cirrusfb.c
@@ -104,6 +104,7 @@ enum cirrus_board {
 	BT_GD5480,
 	BT_LAGUNA,	/* GD5462/64 */
 	BT_LAGUNAB,	/* GD5465 */
+	BT_PICASSO4_Z2,	/* GD5446 for Zorro II bus*/
 };
 
 /*
@@ -295,6 +296,9 @@ static const struct zorro_device_id cirrusfb_zorro_table[] = {
 	}, {
 		.id		= ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z3,
 		.driver_data	= BT_PICASSO4,
+	}, {
+		.id		= ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_MEM1,
+		.driver_data	= BT_PICASSO4_Z2,
 	},
 	{ 0 }
 };
@@ -322,6 +326,10 @@ static const struct {
 	[BT_PICASSO4] = {
 		.id2	= 0,
 		.size	= 0x400000
+	},
+	[BT_PICASSO4_Z2] = {
+		.id2	= ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_REG,
+		.size	= 0x200000
 	}
 };
 #endif /* CONFIG_ZORRO */
@@ -1968,7 +1976,7 @@ static void cirrusfb_pci_unmap(struct fb_info *info)
 	struct pci_dev *pdev = to_pci_dev(info->device);
 	struct cirrusfb_info *cinfo = info->par;
 
-	if (cinfo->laguna_mmio == NULL)
+	if (cinfo->laguna_mmio != NULL)
 		iounmap(cinfo->laguna_mmio);
 	iounmap(info->screen_base);
 #if 0 /* if system didn't claim this region, we would... */
@@ -2268,11 +2276,11 @@ static int __devinit cirrusfb_zorro_register(struct zorro_dev *z,
 		goto err_out;
 	}
 
-	dev_info(info->device, "%s board detected\n",
-		 cirrusfb_board_info[btype].name);
-
 	cinfo = info->par;
-	cinfo->btype = btype;
+	cinfo->btype = (btype == BT_PICASSO4_Z2) ? BT_PICASSO4 : btype;
+
+	dev_info(info->device, "%s board detected\n",
+		 cirrusfb_board_info[cinfo->btype].name);
 
 	assert(z);
 	assert(btype != BT_NONE);
@@ -2311,9 +2319,6 @@ static int __devinit cirrusfb_zorro_register(struct zorro_dev *z,
 		if (!info->screen_base)
 			goto err_unmap_regbase;
 	} else {
-		dev_info(info->device, " REG at $%lx\n",
-			 (unsigned long) z2->resource.start);
-
 		info->fix.smem_start = board_addr;
 		if (board_addr > 0x01000000)
 			info->screen_base = ioremap(board_addr, board_size);
@@ -2324,7 +2329,12 @@ static int __devinit cirrusfb_zorro_register(struct zorro_dev *z,
 
 		/* set address for REG area of board */
 		cinfo->regbase = (caddr_t) ZTWO_VADDR(z2->resource.start);
-		info->fix.mmio_start = z2->resource.start;
+		if (btype == BT_PICASSO4_Z2)
+			cinfo->regbase += 0x10000;
+		info->fix.mmio_start = (unsigned long)cinfo->regbase;
+
+		dev_info(info->device, " REG at $%lx\n",
+			 (unsigned long) info->fix.mmio_start);
 
 		dev_dbg(info->device, "Virtual address for board set to: $%p\n",
 			cinfo->regbase);
-- 
1.5.2.2




----------------------------------------------------------------------
"Teraz gry" - program dla prawdziwych graczy! >>> http://link.interia.pl/f2080

