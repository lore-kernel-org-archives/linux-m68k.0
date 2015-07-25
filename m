From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v5 02/26] char/nvram: Use bitwise OR to obtain Atari video mode data
Date: Sat, 25 Jul 2015 17:46:01 +1000
Message-ID: <20150725074600.033410118@telegraphics.com.au>
References: <20150725074559.543547894@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42363 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754877AbbGYH4s (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 Jul 2015 03:56:48 -0400
Content-Disposition: inline; filename=atari-proc-driver-nvram
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Christian T. Steigies <cts@debian.org>

---
 drivers/char/nvram.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/char/nvram.c
===================================================================
--- linux.orig/drivers/char/nvram.c	2015-07-25 17:42:34.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-07-25 17:45:25.000000000 +1000
@@ -702,7 +702,7 @@ static void atari_proc_infos(unsigned ch
 		seq_printf(seq, "%ds%s\n", nvram[10],
 		    nvram[10] < 8 ? ", no memory test" : "");
 
-	vmode = (nvram[14] << 8) || nvram[15];
+	vmode = (nvram[14] << 8) | nvram[15];
 	seq_printf(seq,
 	    "Video mode       : %s colors, %d columns, %s %s monitor\n",
 	    colors[vmode & 7],
