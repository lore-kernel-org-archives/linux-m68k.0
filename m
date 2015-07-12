From: Finn Thain <fthain@telegraphics.com.au>
Subject: [RFC v4 02/25] char/nvram: Use bitwise OR to obtain Atari video mode data
Date: Sun, 12 Jul 2015 20:25:29 +1000
Message-ID: <20150712102527.865918129@telegraphics.com.au>
References: <20150712102527.356151908@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline; filename=atari-proc-driver-nvram
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

---
 drivers/char/nvram.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux/drivers/char/nvram.c
===================================================================
--- linux.orig/drivers/char/nvram.c	2015-07-12 20:24:54.000000000 +1000
+++ linux/drivers/char/nvram.c	2015-07-12 20:24:55.000000000 +1000
@@ -702,7 +702,7 @@ static void atari_proc_infos(unsigned ch
 		seq_printf(seq, "%ds%s\n", nvram[10],
 		    nvram[10] < 8 ? ", no memory test" : "");
 
-	vmode = (nvram[14] << 8) || nvram[15];
+	vmode = (nvram[14] << 8) | nvram[15];
 	seq_printf(seq,
 	    "Video mode       : %s colors, %d columns, %s %s monitor\n",
 	    colors[vmode & 7],
