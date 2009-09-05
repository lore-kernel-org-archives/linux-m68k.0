From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] z2ram: fix printk format warning
Date: Fri, 4 Sep 2009 17:20:32 -0700
Message-ID: <20090904172032.bfb76edb.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:39363 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934590AbZIEAUt (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 4 Sep 2009 20:20:49 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

m68k:
drivers/block/z2ram.c:82: warning: format '%lu' expects type 'long unsigned int', but argument 2 has type 'sector_t'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/block/z2ram.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-2.6.31-rc8-git1.orig/drivers/block/z2ram.c
+++ linux-2.6.31-rc8-git1/drivers/block/z2ram.c
@@ -78,8 +78,10 @@ static void do_z2_request(struct request
 		int err = 0;
 
 		if (start + len > z2ram_size) {
-			printk( KERN_ERR DEVICE_NAME ": bad access: block=%lu, count=%u\n",
-				blk_rq_pos(req), blk_rq_cur_sectors(req));
+			printk( KERN_ERR DEVICE_NAME
+				": bad access: block=%llu, count=%u\n",
+				(unsigned long long)blk_rq_pos(req),
+				blk_rq_cur_sectors(req));
 			err = -EIO;
 			goto done;
 		}



---
~Randy
LPC 2009, Sept. 23-25, Portland, Oregon
http://linuxplumbersconf.org/2009/
