From: sfjro@users.sourceforge.net
Subject: [PATCH 2/2] aufs: headers 2/2, simply refined
Date: Tue,  3 Jan 2012 14:21:22 +0900
Message-ID: <1325568082-25540-3-git-send-email-sfjro@users.sourceforge.net>
References: <1325568082-25540-1-git-send-email-sfjro@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <aufs-users-bounces@lists.sourceforge.net>
In-Reply-To: <1325568082-25540-1-git-send-email-sfjro@users.sourceforge.net>
In-Reply-To: <Pine.BSM.4.64L.1201021735430.29291@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1201021735430.29291@herc.mirbsd.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/aufs-users>,
	<mailto:aufs-users-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=aufs-users>
List-Post: <mailto:aufs-users@lists.sourceforge.net>
List-Help: <mailto:aufs-users-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/aufs-users>,
	<mailto:aufs-users-request@lists.sourceforge.net?subject=subscribe>
Errors-To: aufs-users-bounces@lists.sourceforge.net
To: tg@mirbsd.de
Cc: aufs-users@lists.sourceforge.net, linux-m68k@vger.kernel.org, debian-kernel@lists.debian.org
List-Id: linux-m68k@vger.kernel.org

From: J. R. Okajima <hooanon05@yahoo.co.jp>

By the previous commit,
8dc5387 2012-01-03 aufs: bugfix, headers 1/2, where the pr_fmt macro definition
several header file inclusion in other files became unnecessary.

Signed-off-by: J. R. Okajima <hooanon05@yahoo.co.jp>
---
 fs/aufs/branch.c  |    1 -
 fs/aufs/branch.h  |    2 --
 fs/aufs/cpup.c    |    2 --
 fs/aufs/cpup.h    |    4 ----
 fs/aufs/dbgaufs.h |    3 ---
 fs/aufs/dcsub.h   |    1 -
 fs/aufs/debug.c   |    1 -
 fs/aufs/debug.h   |    8 --------
 fs/aufs/dentry.h  |    1 -
 fs/aufs/dir.c     |    1 -
 fs/aufs/dir.h     |    1 -
 fs/aufs/dynop.h   |    4 ----
 fs/aufs/export.c  |    1 -
 fs/aufs/f_op.c    |    2 --
 fs/aufs/f_op_sp.c |    1 -
 fs/aufs/file.c    |    3 ---
 fs/aufs/file.h    |    1 -
 fs/aufs/finfo.c   |    1 -
 fs/aufs/fstype.h  |    1 -
 fs/aufs/hfsplus.c |    1 -
 fs/aufs/i_op.c    |    2 --
 fs/aufs/inode.h   |    2 --
 fs/aufs/ioctl.c   |    1 -
 fs/aufs/opts.c    |    2 --
 fs/aufs/opts.h    |    3 ---
 fs/aufs/rdu.c     |    2 --
 fs/aufs/rwsem.h   |    1 -
 fs/aufs/sbinfo.c  |    1 -
 fs/aufs/spl.h     |    4 ----
 fs/aufs/super.c   |    3 +--
 fs/aufs/super.h   |    1 -
 fs/aufs/sysaufs.c |    2 --
 fs/aufs/sysaufs.h |    2 --
 fs/aufs/sysfs.c   |    3 ---
 fs/aufs/sysrq.c   |    3 ---
 fs/aufs/vdir.c    |    1 -
 fs/aufs/vfsub.c   |    2 --
 fs/aufs/whout.c   |    1 -
 fs/aufs/whout.h   |    1 -
 fs/aufs/wkq.h     |    4 ----
 fs/aufs/xino.c    |    2 --
 41 files changed, 1 insertions(+), 82 deletions(-)

diff --git a/fs/aufs/branch.c b/fs/aufs/branch.c
index 49b32de..a8bb316 100644
--- a/fs/aufs/branch.c
+++ b/fs/aufs/branch.c
@@ -21,7 +21,6 @@
  */
 
 #include <linux/compat.h>
-#include <linux/file.h>
 #include <linux/statfs.h>
 #include "aufs.h"
 
diff --git a/fs/aufs/branch.h b/fs/aufs/branch.h
index 1f39ad6..80b5084 100644
--- a/fs/aufs/branch.h
+++ b/fs/aufs/branch.h
@@ -25,9 +25,7 @@
 
 #ifdef __KERNEL__
 
-#include <linux/fs.h>
 #include <linux/mount.h>
-#include <linux/aufs_type.h>
 #include "dynop.h"
 #include "rwsem.h"
 #include "super.h"
diff --git a/fs/aufs/cpup.c b/fs/aufs/cpup.c
index 05cb4e0..70116ba 100644
--- a/fs/aufs/cpup.c
+++ b/fs/aufs/cpup.c
@@ -20,10 +20,8 @@
  * copy-up functions, see wbr_policy.c for copy-down
  */
 
-#include <linux/file.h>
 #include <linux/fs_stack.h>
 #include <linux/mm.h>
-#include <linux/uaccess.h>
 #include "aufs.h"
 
 void au_cpup_attr_flags(struct inode *dst, struct inode *src)
diff --git a/fs/aufs/cpup.h b/fs/aufs/cpup.h
index 8e0aa59..8493770 100644
--- a/fs/aufs/cpup.h
+++ b/fs/aufs/cpup.h
@@ -25,10 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/path.h>
-#include <linux/time.h>
-#include <linux/aufs_type.h>
-
 struct inode;
 struct file;
 
diff --git a/fs/aufs/dbgaufs.h b/fs/aufs/dbgaufs.h
index 2eaa3f0..a4065d1 100644
--- a/fs/aufs/dbgaufs.h
+++ b/fs/aufs/dbgaufs.h
@@ -25,9 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/init.h>
-#include <linux/aufs_type.h>
-
 struct super_block;
 struct au_sbinfo;
 
diff --git a/fs/aufs/dcsub.h b/fs/aufs/dcsub.h
index 1211304..439459c 100644
--- a/fs/aufs/dcsub.h
+++ b/fs/aufs/dcsub.h
@@ -27,7 +27,6 @@
 
 #include <linux/dcache.h>
 #include <linux/fs.h>
-#include <linux/types.h>
 
 struct dentry;
 
diff --git a/fs/aufs/debug.c b/fs/aufs/debug.c
index 9fad1c3..83e7c57 100644
--- a/fs/aufs/debug.c
+++ b/fs/aufs/debug.c
@@ -20,7 +20,6 @@
  * debug print functions
  */
 
-#include <linux/module.h>
 #include <linux/vt_kern.h>
 #include "aufs.h"
 
diff --git a/fs/aufs/debug.h b/fs/aufs/debug.h
index 7140934..1bcc88c 100644
--- a/fs/aufs/debug.h
+++ b/fs/aufs/debug.h
@@ -26,17 +26,9 @@
 #ifdef __KERNEL__
 
 #include <asm/system.h>
-#include <linux/bug.h>
-/* #include <linux/err.h> */
-#include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kallsyms.h>
-/* #include <linux/kernel.h> */
-#include <linux/delay.h>
-/* #include <linux/kd.h> */
-#include <linux/vt_kern.h>
 #include <linux/sysrq.h>
-#include <linux/aufs_type.h>
 
 #ifdef CONFIG_AUFS_DEBUG
 #define AuDebugOn(a)		BUG_ON(a)
diff --git a/fs/aufs/dentry.h b/fs/aufs/dentry.h
index 4f08275..802635f 100644
--- a/fs/aufs/dentry.h
+++ b/fs/aufs/dentry.h
@@ -26,7 +26,6 @@
 #ifdef __KERNEL__
 
 #include <linux/dcache.h>
-#include <linux/aufs_type.h>
 #include "rwsem.h"
 
 struct au_hdentry {
diff --git a/fs/aufs/dir.c b/fs/aufs/dir.c
index 6c45d1a..1e0a771 100644
--- a/fs/aufs/dir.c
+++ b/fs/aufs/dir.c
@@ -20,7 +20,6 @@
  * directory operations
  */
 
-#include <linux/file.h>
 #include <linux/fs_stack.h>
 #include "aufs.h"
 
diff --git a/fs/aufs/dir.h b/fs/aufs/dir.h
index 2d0d8d2..99e973a 100644
--- a/fs/aufs/dir.h
+++ b/fs/aufs/dir.h
@@ -26,7 +26,6 @@
 #ifdef __KERNEL__
 
 #include <linux/fs.h>
-#include <linux/aufs_type.h>
 
 /* ---------------------------------------------------------------------- */
 
diff --git a/fs/aufs/dynop.h b/fs/aufs/dynop.h
index c3217d4..3ddebe7 100644
--- a/fs/aufs/dynop.h
+++ b/fs/aufs/dynop.h
@@ -25,10 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/fs.h>
-#include <linux/mm.h>
-#include <linux/rcupdate.h>
-#include <linux/aufs_type.h>
 #include "inode.h"
 
 enum {AuDy_AOP, AuDyLast};
diff --git a/fs/aufs/export.c b/fs/aufs/export.c
index 992a799..2f29e1f 100644
--- a/fs/aufs/export.c
+++ b/fs/aufs/export.c
@@ -21,7 +21,6 @@
  */
 
 #include <linux/exportfs.h>
-#include <linux/file.h>
 #include <linux/mnt_namespace.h>
 #include <linux/namei.h>
 #include <linux/nsproxy.h>
diff --git a/fs/aufs/f_op.c b/fs/aufs/f_op.c
index eb6b909..372308d 100644
--- a/fs/aufs/f_op.c
+++ b/fs/aufs/f_op.c
@@ -20,10 +20,8 @@
  * file and vm operations
  */
 
-#include <linux/file.h>
 #include <linux/fs_stack.h>
 #include <linux/mman.h>
-#include <linux/mm.h>
 #include <linux/security.h>
 #include "aufs.h"
 
diff --git a/fs/aufs/f_op_sp.c b/fs/aufs/f_op_sp.c
index 4f5cde8..0068ff2 100644
--- a/fs/aufs/f_op_sp.c
+++ b/fs/aufs/f_op_sp.c
@@ -22,7 +22,6 @@
  * their file I/O is handled out of aufs.
  */
 
-#include <linux/fs_stack.h>
 #include "aufs.h"
 
 static ssize_t aufs_aio_read_sp(struct kiocb *kio, const struct iovec *iov,
diff --git a/fs/aufs/file.c b/fs/aufs/file.c
index 5dc3d0e..257cc2b 100644
--- a/fs/aufs/file.c
+++ b/fs/aufs/file.c
@@ -20,9 +20,6 @@
  * handling file/dir, and address_space operation
  */
 
-#include <linux/file.h>
-#include <linux/fsnotify.h>
-#include <linux/namei.h>
 #include <linux/pagemap.h>
 #include "aufs.h"
 
diff --git a/fs/aufs/file.h b/fs/aufs/file.h
index 831dc5d..d2468de 100644
--- a/fs/aufs/file.h
+++ b/fs/aufs/file.h
@@ -28,7 +28,6 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/poll.h>
-#include <linux/aufs_type.h>
 #include "rwsem.h"
 
 struct au_branch;
diff --git a/fs/aufs/finfo.c b/fs/aufs/finfo.c
index c1d71ba..8995db9 100644
--- a/fs/aufs/finfo.c
+++ b/fs/aufs/finfo.c
@@ -20,7 +20,6 @@
  * file private data
  */
 
-#include <linux/file.h>
 #include "aufs.h"
 
 void au_hfput(struct au_hfile *hf, struct file *file)
diff --git a/fs/aufs/fstype.h b/fs/aufs/fstype.h
index 3bdbd14..8ed557d 100644
--- a/fs/aufs/fstype.h
+++ b/fs/aufs/fstype.h
@@ -28,7 +28,6 @@
 #include <linux/fs.h>
 #include <linux/magic.h>
 #include <linux/romfs_fs.h>
-#include <linux/aufs_type.h>
 
 static inline int au_test_aufs(struct super_block *sb)
 {
diff --git a/fs/aufs/hfsplus.c b/fs/aufs/hfsplus.c
index 678b69c..6fa5ed8 100644
--- a/fs/aufs/hfsplus.c
+++ b/fs/aufs/hfsplus.c
@@ -26,7 +26,6 @@
  * and au_h_open_post() after releasing it.
  */
 
-#include <linux/file.h>
 #include "aufs.h"
 
 struct file *au_h_open_pre(struct dentry *dentry, aufs_bindex_t bindex)
diff --git a/fs/aufs/i_op.c b/fs/aufs/i_op.c
index 065bb76..7141158 100644
--- a/fs/aufs/i_op.c
+++ b/fs/aufs/i_op.c
@@ -22,10 +22,8 @@
 
 #include <linux/device_cgroup.h>
 #include <linux/fs_stack.h>
-#include <linux/mm.h>
 #include <linux/namei.h>
 #include <linux/security.h>
-#include <linux/uaccess.h>
 #include "aufs.h"
 
 static int h_permission(struct inode *h_inode, int mask,
diff --git a/fs/aufs/inode.h b/fs/aufs/inode.h
index d0bd9c6..dffceae 100644
--- a/fs/aufs/inode.h
+++ b/fs/aufs/inode.h
@@ -25,9 +25,7 @@
 
 #ifdef __KERNEL__
 
-#include <linux/fs.h>
 #include <linux/fsnotify.h>
-#include <linux/aufs_type.h>
 #include "rwsem.h"
 
 struct vfsmount;
diff --git a/fs/aufs/ioctl.c b/fs/aufs/ioctl.c
index 93151b3..2ca49c0 100644
--- a/fs/aufs/ioctl.c
+++ b/fs/aufs/ioctl.c
@@ -22,7 +22,6 @@
  * assist the pathconf(3) wrapper library.
  */
 
-#include <linux/file.h>
 #include "aufs.h"
 
 static int au_wbr_fd(struct path *path, struct aufs_wbr_fd __user *arg)
diff --git a/fs/aufs/opts.c b/fs/aufs/opts.c
index 82a9697..84a1bc4 100644
--- a/fs/aufs/opts.c
+++ b/fs/aufs/opts.c
@@ -20,8 +20,6 @@
  * mount options/flags
  */
 
-#include <linux/file.h>
-#include <linux/jiffies.h>
 #include <linux/namei.h>
 #include <linux/types.h> /* a distribution requires */
 #include <linux/parser.h>
diff --git a/fs/aufs/opts.h b/fs/aufs/opts.h
index 1ef3710..76b3119 100644
--- a/fs/aufs/opts.h
+++ b/fs/aufs/opts.h
@@ -25,9 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/path.h>
-#include <linux/aufs_type.h>
-
 struct file;
 struct super_block;
 
diff --git a/fs/aufs/rdu.c b/fs/aufs/rdu.c
index 4e0756d..e77b6ff 100644
--- a/fs/aufs/rdu.c
+++ b/fs/aufs/rdu.c
@@ -23,8 +23,6 @@
 #include <linux/compat.h>
 #include <linux/fs_stack.h>
 #include <linux/security.h>
-#include <linux/uaccess.h>
-#include <linux/aufs_type.h>
 #include "aufs.h"
 
 /* bits for struct aufs_rdu.flags */
diff --git a/fs/aufs/rwsem.h b/fs/aufs/rwsem.h
index dcd1def..3c9e7c3 100644
--- a/fs/aufs/rwsem.h
+++ b/fs/aufs/rwsem.h
@@ -25,7 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/rwsem.h>
 #include "debug.h"
 
 struct au_rwsem {
diff --git a/fs/aufs/sbinfo.c b/fs/aufs/sbinfo.c
index d9141f8..0509d05 100644
--- a/fs/aufs/sbinfo.c
+++ b/fs/aufs/sbinfo.c
@@ -20,7 +20,6 @@
  * superblock private data
  */
 
-#include <linux/jiffies.h>
 #include "aufs.h"
 
 /*
diff --git a/fs/aufs/spl.h b/fs/aufs/spl.h
index 37a0329..47a28d5 100644
--- a/fs/aufs/spl.h
+++ b/fs/aufs/spl.h
@@ -25,10 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/spinlock.h>
-#include <linux/list.h>
-#include <linux/rculist.h>
-
 struct au_splhead {
 	spinlock_t		spin;
 	struct list_head	head;
diff --git a/fs/aufs/super.c b/fs/aufs/super.c
index 0ee7ceb..735cff3 100644
--- a/fs/aufs/super.c
+++ b/fs/aufs/super.c
@@ -20,8 +20,7 @@
  * mount and super_block operations
  */
 
-#include <linux/buffer_head.h>
-#include <linux/jiffies.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/seq_file.h>
 #include <linux/statfs.h>
diff --git a/fs/aufs/super.h b/fs/aufs/super.h
index f490b4a..e810699 100644
--- a/fs/aufs/super.h
+++ b/fs/aufs/super.h
@@ -26,7 +26,6 @@
 #ifdef __KERNEL__
 
 #include <linux/fs.h>
-#include <linux/aufs_type.h>
 #include "rwsem.h"
 #include "spl.h"
 #include "wkq.h"
diff --git a/fs/aufs/sysaufs.c b/fs/aufs/sysaufs.c
index ab4036e..01c6fbd 100644
--- a/fs/aufs/sysaufs.c
+++ b/fs/aufs/sysaufs.c
@@ -21,9 +21,7 @@
  * they are necessary regardless sysfs is disabled.
  */
 
-#include <linux/fs.h>
 #include <linux/random.h>
-#include <linux/sysfs.h>
 #include "aufs.h"
 
 unsigned long sysaufs_si_mask;
diff --git a/fs/aufs/sysaufs.h b/fs/aufs/sysaufs.h
index 5b6b8d0..66b0fee 100644
--- a/fs/aufs/sysaufs.h
+++ b/fs/aufs/sysaufs.h
@@ -25,8 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/sysfs.h>
-#include <linux/aufs_type.h>
 #include "module.h"
 
 struct super_block;
diff --git a/fs/aufs/sysfs.c b/fs/aufs/sysfs.c
index 8afb350..a3a1f65 100644
--- a/fs/aufs/sysfs.c
+++ b/fs/aufs/sysfs.c
@@ -20,10 +20,7 @@
  * sysfs interface
  */
 
-#include <linux/fs.h>
-#include <linux/module.h>
 #include <linux/seq_file.h>
-#include <linux/sysfs.h>
 #include "aufs.h"
 
 static struct attribute *au_attr[] = {
diff --git a/fs/aufs/sysrq.c b/fs/aufs/sysrq.c
index e10f555..072e5d9 100644
--- a/fs/aufs/sysrq.c
+++ b/fs/aufs/sysrq.c
@@ -20,9 +20,6 @@
  * magic sysrq hanlder
  */
 
-#include <linux/fs.h>
-#include <linux/module.h>
-#include <linux/moduleparam.h>
 /* #include <linux/sysrq.h> */
 #include <linux/writeback.h>
 #include "aufs.h"
diff --git a/fs/aufs/vdir.c b/fs/aufs/vdir.c
index 5e42376..db8c800 100644
--- a/fs/aufs/vdir.c
+++ b/fs/aufs/vdir.c
@@ -20,7 +20,6 @@
  * virtual or vertical directory
  */
 
-#include <linux/hash.h>
 #include "aufs.h"
 
 static unsigned int calc_size(int nlen)
diff --git a/fs/aufs/vfsub.c b/fs/aufs/vfsub.c
index dda4547..28219c9 100644
--- a/fs/aufs/vfsub.c
+++ b/fs/aufs/vfsub.c
@@ -20,12 +20,10 @@
  * sub-routines for VFS
  */
 
-#include <linux/file.h>
 #include <linux/ima.h>
 #include <linux/namei.h>
 #include <linux/security.h>
 #include <linux/splice.h>
-#include <linux/uaccess.h>
 #include "aufs.h"
 
 int vfsub_update_h_iattr(struct path *h_path, int *did)
diff --git a/fs/aufs/whout.c b/fs/aufs/whout.c
index 61545ea..5d5ba13 100644
--- a/fs/aufs/whout.c
+++ b/fs/aufs/whout.c
@@ -20,7 +20,6 @@
  * whiteout for logical deletion and opaque directory
  */
 
-#include <linux/fs.h>
 #include "aufs.h"
 
 #define WH_MASK			S_IRUGO
diff --git a/fs/aufs/whout.h b/fs/aufs/whout.h
index 11137f4..3a82828 100644
--- a/fs/aufs/whout.h
+++ b/fs/aufs/whout.h
@@ -25,7 +25,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/aufs_type.h>
 #include "dir.h"
 
 /* whout.c */
diff --git a/fs/aufs/wkq.h b/fs/aufs/wkq.h
index 23a6d30..8b06193 100644
--- a/fs/aufs/wkq.h
+++ b/fs/aufs/wkq.h
@@ -26,10 +26,6 @@
 
 #ifdef __KERNEL__
 
-#include <linux/sched.h>
-#include <linux/wait.h>
-#include <linux/aufs_type.h>
-
 struct super_block;
 
 /* ---------------------------------------------------------------------- */
diff --git a/fs/aufs/xino.c b/fs/aufs/xino.c
index 5a44272..20fc652 100644
--- a/fs/aufs/xino.c
+++ b/fs/aufs/xino.c
@@ -20,9 +20,7 @@
  * external inode number translation table and bitmap
  */
 
-#include <linux/file.h>
 #include <linux/seq_file.h>
-#include <linux/uaccess.h>
 #include "aufs.h"
 
 /* todo: unnecessary to support mmap_sem since kernel-space? */
-- 
1.7.2.5


------------------------------------------------------------------------------
Write once. Port to many.
Get the SDK and tools to simplify cross-platform app development. Create 
new or port existing apps to sell to consumers worldwide. Explore the 
Intel AppUpSM program developer opportunity. appdeveloper.intel.com/join
http://p.sf.net/sfu/intel-appdev
