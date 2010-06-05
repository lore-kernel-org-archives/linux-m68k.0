From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] zorro: BKL removal
Date: Sat, 5 Jun 2010 21:23:01 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1006052121550.12934@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linux/m68k <linux-m68k@lists.linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>

Remove BKL use from proc_bus_zorro_lseek(), like was done for
proc_bus_pci_lseek() a long time ago.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/zorro/proc.c |   15 ++++++++-------
 1 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/zorro/proc.c b/drivers/zorro/proc.c
index 3c7046d..4f4ea88 100644
--- a/drivers/zorro/proc.c
+++ b/drivers/zorro/proc.c
@@ -22,8 +22,9 @@ static loff_t
 proc_bus_zorro_lseek(struct file *file, loff_t off, int whence)
 {
 	loff_t new = -1;
+	struct inode *inode = file->f_path.dentry->d_inode;
 
-	lock_kernel();
+	mutex_lock(&inode->i_mutex);
 	switch (whence) {
 	case 0:
 		new = off;
@@ -35,12 +36,12 @@ proc_bus_zorro_lseek(struct file *file, loff_t off, int whence)
 		new = sizeof(struct ConfigDev) + off;
 		break;
 	}
-	if (new < 0 || new > sizeof(struct ConfigDev)) {
-		unlock_kernel();
-		return -EINVAL;
-	}
-	unlock_kernel();
-	return (file->f_pos = new);
+	if (new < 0 || new > sizeof(struct ConfigDev))
+		new = -EINVAL;
+	else
+		file->f_pos = new;
+	mutex_unlock(&inode->i_mutex);
+	return new;
 }
 
 static ssize_t
-- 
1.7.0.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
