From: gerg@uclinux.org
Subject: [PATCH] romfs: fix nommu map length to keep inside filesystem
Date: Tue,  2 Apr 2013 15:44:47 +1000
Message-ID: <1364881487-30761-1-git-send-email-gerg@uclinux.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, artem.bityutskiy@linux.intel.com
Cc: lliubbo@gmail.com, dhowells@redhat.com, lethal@linux-sh.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

From: Greg Ungerer <gerg@uclinux.org>

Checks introduced in commit 4991e7251 ("romfs: do not use
mtd->get_unmapped_area directly") re-introduce problems fixed in the earlier
commit 2b4b2482e ("romfs: fix romfs_get_unmapped_area() argument check").

If a flat binary app is located at the end of a romfs, its page aligned
length may be outside of the romfs filesystem. The flat binary loader, via
nommu do_mmap_pgoff(), page aligns the length it is mmaping. So simple
offset+size checks will fail - returning EINVAL.

We can truncate the length to keep it inside the romfs filesystem, and that
also keeps the call to mtd_get_unmapped_area() happy.

Are there any side effects to truncating the size here though?

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 fs/romfs/mmap-nommu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/romfs/mmap-nommu.c b/fs/romfs/mmap-nommu.c
index e1a7779..f373bde 100644
--- a/fs/romfs/mmap-nommu.c
+++ b/fs/romfs/mmap-nommu.c
@@ -49,8 +49,11 @@ static unsigned long romfs_get_unmapped_area(struct file *file,
 		return (unsigned long) -EINVAL;
 
 	offset += ROMFS_I(inode)->i_dataoffset;
-	if (offset > mtd->size - len)
+	if (offset >= mtd->size)
 		return (unsigned long) -EINVAL;
+	/* the mapping mustn't extend beyond the EOF */
+	if ((offset + len) > mtd->size)
+		len = mtd->size - offset;
 
 	ret = mtd_get_unmapped_area(mtd, len, offset, flags);
 	if (ret == -EOPNOTSUPP)
-- 
1.8.1.4
