From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH] char/nvram: Use bitwise OR to obtain Atari video mode data
Date: Fri, 3 Jul 2015 13:35:36 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1507031320240.953@nippy.intranet>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:46313 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754536AbbGCDgD (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Jul 2015 23:36:03 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org


Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Index: linux/drivers/char/nvram.c
===================================================================
--- linux.orig/drivers/char/nvram.c	2015-07-02 13:50:40.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-07-02 14:00:05.000000000 +1000
@@ -702,7 +702,7 @@ static void atari_proc_infos(unsigned ch
 		seq_printf(seq, "%ds%s\n", nvram[10],
 		    nvram[10] < 8 ? ", no memory test" : "");
 
-	vmode = (nvram[14] << 8) || nvram[15];
+	vmode = (nvram[14] << 8) | nvram[15];
 	seq_printf(seq,
 	    "Video mode       : %s colors, %d columns, %s %s monitor\n",
 	    colors[vmode & 7],
