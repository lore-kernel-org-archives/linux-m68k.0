From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] zorro: Fix reading of proc/bus/zorro/* in small chunks
Date: Wed, 9 Jun 2010 11:31:31 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006091129240.8858@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

proc_bus_zorro_read() didn't take into account the current file position,
hence it always read from the start of the ConfigDev.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

diff --git a/drivers/zorro/proc.c b/drivers/zorro/proc.c
index aaf8abb..108096f 100644
--- a/drivers/zorro/proc.c
+++ b/drivers/zorro/proc.c
@@ -73,7 +73,7 @@ proc_bus_zorro_read(struct file *file, char __user *buf, size_t nbytes, loff_t *
 	cd.cd_BoardAddr = (void *)zorro_resource_start(z);
 	cd.cd_BoardSize = zorro_resource_len(z);
 
-	if (copy_to_user(buf, &cd, nbytes))
+	if (copy_to_user(buf, (void *)&cd + pos, nbytes))
 		return -EFAULT;
 	*ppos += nbytes;
 
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
