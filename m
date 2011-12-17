From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: aufs vs. m68k conflict, please advice
Date: Sat, 17 Dec 2011 20:57:19 +0100
Message-ID: <20111217195719.GM24496@pengutronix.de>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
 <1324054093.2825.282.camel@deadeye>
 <Pine.BSM.4.64L.1112171426140.856@herc.mirbsd.org>
 <20111217184915.GL24496@pengutronix.de>
 <Pine.BSM.4.64L.1112171856380.856@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:59779 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752741Ab1LQT5Y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 17 Dec 2011 14:57:24 -0500
Content-Disposition: inline
In-Reply-To: <Pine.BSM.4.64L.1112171856380.856@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: linux-m68k@vger.kernel.org, Debian Kernel Team <debian-kernel@lists.debian.org>

On Sat, Dec 17, 2011 at 07:00:00PM +0000, Thorsten Glaser wrote:
> Uwe Kleine-K=EF=BF=BDnig dixit:
Your mailer is broken. And it added:

	X-Message-Flag: Your mailer is broken. Get an update at http://www.was=
hington.edu/pine/getpine/pcpine.html for free.

to your mail :-) I guess it means you not me?

> >On Sat, Dec 17, 2011 at 02:28:35PM +0000, Thorsten Glaser wrote:
>=20
> >> Maybe something like this?
> [=E2=80=A6]
> >> Just an idea of the moment,
>=20
> Well, it does make the thing compile with minimal effort.
>=20
> >IMHO the problem is that aufs provides an incomplete definition of
> >pr_fmt. Either it should define AUFS_NAME on the commandline, too, o=
r
> >should define pr_fmt in an aufs header (or a .c file) #included afte=
r
> >all other headers and only when AUFS_NAME is defined, too.
>=20
> My initial thoughts, too.
>=20
> >The ugly thing about aufs' pr_fmt being already there when ack_bad_i=
rq
> >is defined is, that the message printed by the pr_crit suddenly look=
s
> >aufs specific which it clearly isn't. So it should better make sure =
that
> >the definition isn't available to ack_bad_irq.
>=20
> True, but looking at the actual changes, it doesn=E2=80=99t look too =
aufs
> specific to me. (If the function ack_bad_irq is instantiated in
> the aufs code at all, which is debatable; a quick fgrep -r doesn=E2=80=
=99t
> find anything.)
Right, probably pr_something just shouldn't be used in headers I think.

The easiest fix would be:

-ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__=
func__,__LINE__,current->comm,current->pid'
+ccflags-y +=3D -D'pr_fmt(fmt)=3D"aufs\040%s:%d:%s[%d]:\040"fmt,__func_=
_,__LINE__,current->comm,current->pid'

But as it is ugly to have that in a Makefile, you can also try the patc=
h
below.

Best regards
Uwe

=46rom ad5d7fd2630feea17a1a6fffac74fdcb0505b2ee Mon Sep 17 00:00:00 200=
1
=46rom: =3D?UTF-8?q?Uwe=3D20Kleine-K=3DC3=3DB6nig?=3D <u.kleine-koenig@=
pengutronix.de>
Date: Sat, 17 Dec 2011 20:45:21 +0100
Subject: [PATCH] new patch to not leak pr_fmt to foreign headers

---
 patches/features/all/aufs3/dont-leak-pr_fmt.patch |  211 +++++++++++++=
++++++++
 patches/series/base                               |    1 +
 2 files changed, 212 insertions(+), 0 deletions(-)
 create mode 100644 patches/features/all/aufs3/dont-leak-pr_fmt.patch

diff --git a/patches/features/all/aufs3/dont-leak-pr_fmt.patch b/patche=
s/features/all/aufs3/dont-leak-pr_fmt.patch
new file mode 100644
index 0000000..93e05ca
--- /dev/null
+++ b/patches/features/all/aufs3/dont-leak-pr_fmt.patch
@@ -0,0 +1,211 @@
+From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
+Subject: [PATCH] don't leak incomplete definition of pr_fmt to headers
+
+This fixes a build problem on m68k, more details can be found at:
+http://lists.debian.org/debian-kernel/2011/12/msg00460.html
+---
+ fs/aufs/Makefile  |    2 --
+ fs/aufs/aufs.h    |    4 ++++
+ fs/aufs/branch.h  |    1 -
+ fs/aufs/cpup.h    |    1 -
+ fs/aufs/dbgaufs.h |    1 -
+ fs/aufs/debug.h   |    1 -
+ fs/aufs/dentry.h  |    1 -
+ fs/aufs/dir.h     |    1 -
+ fs/aufs/dynop.h   |    1 -
+ fs/aufs/file.h    |    1 -
+ fs/aufs/fstype.h  |    1 -
+ fs/aufs/inode.h   |    1 -
+ fs/aufs/opts.h    |    1 -
+ fs/aufs/rdu.c     |    1 -
+ fs/aufs/super.h   |    1 -
+ fs/aufs/sysaufs.h |    1 -
+ fs/aufs/whout.h   |    1 -
+ fs/aufs/wkq.h     |    1 -
+ 18 files changed, 4 insertions(+), 18 deletions(-)
+
+--- source_amd64_none.orig/fs/aufs/Makefile
++++ source_amd64_none/fs/aufs/Makefile
+@@ -8,8 +8,6 @@
+ # cf. include/linux/kernel.h
+ # enable pr_debug
+ ccflags-y +=3D -DDEBUG
+-# sparse doesn't allow spaces
+-ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,_=
_func__,__LINE__,current->comm,current->pid'
+=20
+ obj-$(CONFIG_AUFS_FS) +=3D aufs.o
+ aufs-y :=3D module.o sbinfo.o super.o branch.o xino.o sysaufs.o opts.=
o \
+--- source_amd64_none.orig/fs/aufs/aufs.h
++++ source_amd64_none/fs/aufs/aufs.h
+@@ -33,6 +33,11 @@
+ #define AuStubInt0(name, ...) \
+ 	AuStub(int, name, return 0, __VA_ARGS__)
+=20
++#include <linux/aufs_type.h>
++
++#undef pr_fmt
++#define pr_fmt(fmt) AUFS_NAME " %s:%d:%s[%d]: " fmt, __func__, __LINE=
__, current->comm, current->pid
++
+ #include "debug.h"
+=20
+ #include "branch.h"
+--- source_amd64_none.orig/fs/aufs/debug.h
++++ source_amd64_none/fs/aufs/debug.h
+@@ -35,7 +35,6 @@
+ #include <linux/delay.h>
+ /* #include <linux/kd.h> */
+ #include <linux/sysrq.h>
+-#include <linux/aufs_type.h>
+=20
+ #include <asm/system.h>
+=20
+--- source_amd64_none.orig/fs/aufs/file.h
++++ source_amd64_none/fs/aufs/file.h
+@@ -28,7 +28,6 @@
+ #include <linux/file.h>
+ #include <linux/fs.h>
+ #include <linux/poll.h>
+-#include <linux/aufs_type.h>
+ #include "rwsem.h"
+=20
+ struct au_branch;
+--- source_amd64_none.orig/fs/aufs/inode.h
++++ source_amd64_none/fs/aufs/inode.h
+@@ -27,7 +27,6 @@
+=20
+ #include <linux/fs.h>
+ #include <linux/fsnotify.h>
+-#include <linux/aufs_type.h>
+ #include "rwsem.h"
+=20
+ struct vfsmount;
+--- source_amd64_none.orig/fs/aufs/rdu.c
++++ source_amd64_none/fs/aufs/rdu.c
+@@ -24,7 +24,6 @@
+ #include <linux/fs_stack.h>
+ #include <linux/security.h>
+ #include <linux/uaccess.h>
+-#include <linux/aufs_type.h>
+ #include "aufs.h"
+=20
+ /* bits for struct aufs_rdu.flags */
+--- source_amd64_none.orig/fs/aufs/branch.h
++++ source_amd64_none/fs/aufs/branch.h
+@@ -27,7 +27,6 @@
+=20
+ #include <linux/fs.h>
+ #include <linux/mount.h>
+-#include <linux/aufs_type.h>
+ #include "dynop.h"
+ #include "rwsem.h"
+ #include "super.h"
+--- source_amd64_none.orig/fs/aufs/cpup.h
++++ source_amd64_none/fs/aufs/cpup.h
+@@ -27,7 +27,6 @@
+=20
+ #include <linux/path.h>
+ #include <linux/time.h>
+-#include <linux/aufs_type.h>
+=20
+ struct inode;
+ struct file;
+--- source_amd64_none.orig/fs/aufs/dbgaufs.h
++++ source_amd64_none/fs/aufs/dbgaufs.h
+@@ -26,7 +26,6 @@
+ #ifdef __KERNEL__
+=20
+ #include <linux/init.h>
+-#include <linux/aufs_type.h>
+=20
+ struct super_block;
+ struct au_sbinfo;
+--- source_amd64_none.orig/fs/aufs/dentry.h
++++ source_amd64_none/fs/aufs/dentry.h
+@@ -26,7 +26,6 @@
+ #ifdef __KERNEL__
+=20
+ #include <linux/dcache.h>
+-#include <linux/aufs_type.h>
+ #include "rwsem.h"
+=20
+ struct au_hdentry {
+--- source_amd64_none.orig/fs/aufs/dir.h
++++ source_amd64_none/fs/aufs/dir.h
+@@ -26,7 +26,6 @@
+ #ifdef __KERNEL__
+=20
+ #include <linux/fs.h>
+-#include <linux/aufs_type.h>
+=20
+ /* ------------------------------------------------------------------=
---- */
+=20
+--- source_amd64_none.orig/fs/aufs/dynop.h
++++ source_amd64_none/fs/aufs/dynop.h
+@@ -28,7 +28,6 @@
+ #include <linux/fs.h>
+ #include <linux/mm.h>
+ #include <linux/rcupdate.h>
+-#include <linux/aufs_type.h>
+ #include "inode.h"
+=20
+ enum {AuDy_AOP, AuDyLast};
+--- source_amd64_none.orig/fs/aufs/fstype.h
++++ source_amd64_none/fs/aufs/fstype.h
+@@ -28,7 +28,6 @@
+ #include <linux/fs.h>
+ #include <linux/magic.h>
+ #include <linux/romfs_fs.h>
+-#include <linux/aufs_type.h>
+=20
+ static inline int au_test_aufs(struct super_block *sb)
+ {
+--- source_amd64_none.orig/fs/aufs/opts.h
++++ source_amd64_none/fs/aufs/opts.h
+@@ -26,7 +26,6 @@
+ #ifdef __KERNEL__
+=20
+ #include <linux/path.h>
+-#include <linux/aufs_type.h>
+=20
+ struct file;
+ struct super_block;
+--- source_amd64_none.orig/fs/aufs/super.h
++++ source_amd64_none/fs/aufs/super.h
+@@ -26,7 +26,6 @@
+ #ifdef __KERNEL__
+=20
+ #include <linux/fs.h>
+-#include <linux/aufs_type.h>
+ #include "rwsem.h"
+ #include "spl.h"
+ #include "wkq.h"
+--- source_amd64_none.orig/fs/aufs/sysaufs.h
++++ source_amd64_none/fs/aufs/sysaufs.h
+@@ -26,7 +26,6 @@
+ #ifdef __KERNEL__
+=20
+ #include <linux/sysfs.h>
+-#include <linux/aufs_type.h>
+ #include "module.h"
+=20
+ struct super_block;
+--- source_amd64_none.orig/fs/aufs/whout.h
++++ source_amd64_none/fs/aufs/whout.h
+@@ -25,7 +25,6 @@
+=20
+ #ifdef __KERNEL__
+=20
+-#include <linux/aufs_type.h>
+ #include "dir.h"
+=20
+ /* whout.c */
+--- source_amd64_none.orig/fs/aufs/wkq.h
++++ source_amd64_none/fs/aufs/wkq.h
+@@ -28,7 +28,6 @@
+=20
+ #include <linux/sched.h>
+ #include <linux/wait.h>
+-#include <linux/aufs_type.h>
+=20
+ struct super_block;
+=20
diff --git a/patches/series/base b/patches/series/base
index dc8b037..98916b1 100644
--- a/patches/series/base
+++ b/patches/series/base
@@ -14,6 +14,7 @@
 + features/all/aufs3/aufs3-add.patch
 # mark as staging/crap
 + features/all/aufs3/mark-as-staging.patch
++ features/all/aufs3/dont-leak-pr_fmt.patch
=20
 + bugfix/ia64/hardcode-arch-script-output.patch
 + bugfix/mips/disable-advansys.patch
--=20
1.7.7.3


--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig     =
       |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
