From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 3/8] zorro: Don't fill in dummy names in zorro_name_device()
Date: Wed, 16 Oct 2013 13:03:20 +0200
Message-ID: <1381921405-11206-4-git-send-email-geert__30901.0944715284$1381921454$gmane$org@linux-m68k.org>
References: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1381921405-11206-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

If the device is not found in the database, it's not needed to fill in
a dummy name. The caller of zorro_name_device() has already taken care
of that to support CONFIG_ZORRO_NAMES=n.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/zorro/names.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/zorro/names.c b/drivers/zorro/names.c
index e8517c3d8e82..e44e04c4f29d 100644
--- a/drivers/zorro/names.c
+++ b/drivers/zorro/names.c
@@ -69,7 +69,6 @@ void __init zorro_name_device(struct zorro_dev *dev)
 	} while (--i);
 
 	/* Couldn't find either the manufacturer nor the product */
-	sprintf(name, "Zorro device %08x", dev->id);
 	return;
 
 	match_manuf: {
-- 
1.7.9.5
