From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sat, 31 Dec 2011 13:46:57 +0900
Message-ID: <9569.1325306817@jrobl>
References: <1325264773.13595.133.camel@deadeye>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <aufs-users-bounces@lists.sourceforge.net>
In-Reply-To: <1325264773.13595.133.camel@deadeye>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/aufs-users>,
	<mailto:aufs-users-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=aufs-users>
List-Post: <mailto:aufs-users@lists.sourceforge.net>
List-Help: <mailto:aufs-users-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/aufs-users>,
	<mailto:aufs-users-request@lists.sourceforge.net?subject=subscribe>
Errors-To: aufs-users-bounces@lists.sourceforge.net
To: Ben Hutchings <ben@decadent.org.uk>
Cc: aufs-users@lists.sourceforge.net, Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org, Debian kernel team <debian-kernel@lists.debian.org>
List-Id: linux-m68k@vger.kernel.org


Hello Ben,

Ben Hutchings:
> AUFS_NAME is only defined in aufs_type.h but pr_fmt may be used in
> headers included before aufs_type.h.

Thanx for bug reporting and a patch.

I don't think the "current" macro will be a problem, but I want you to
test this patch since I don't have m68k environment.
It introduces a new separated file include/linux/aufs_name.h.
If you (any of you) think this new file is not a good idea, please let
me know.


J. R. Okajima

diff --git a/Documentation/filesystems/aufs/README b/Documentation/filesystems/aufs/README
index 420faeb..058f95e 100644
--- a/Documentation/filesystems/aufs/README
+++ b/Documentation/filesystems/aufs/README
@@ -213,7 +213,7 @@ If you don't like aufs2-standalone.patch, then try aufs2-2.6 tree.
   path on the branch fs.
 - apply ./aufs2-standalone.patch too, if you have a plan to set
   CONFIG_AUFS_FS=m. otherwise you don't need ./aufs2-standalone.patch.
-- copy ./{Documentation,fs,include/linux/aufs_type.h} files to your
+- copy ./{Documentation,fs,include/linux/*.h} files to your
   kernel source tree. Never copy ./include/linux/Kbuild.
 - enable CONFIG_EXPERIMENTAL and CONFIG_AUFS_FS, you can select either
   =m or =y.
@@ -240,12 +240,12 @@ If you don't like aufs2-standalone.patch, then try aufs2-2.6 tree.
   + run "make install" to install the aufs module, or copy the built
     ./aufs.ko to /lib/modules/... and run depmod -a (or reboot simply).
   + run "make headers_install" to install the aufs header file (you can
-    specify DESTDIR), or copty ./usr/include/linux/aufs_type.h to
+    specify DESTDIR), or copty ./usr/include/linux/*.h to
     /usr/include/linux or wherever you like.
 - no need to apply aufs2-kbuild.patch, nor copying source files to your
   kernel source tree.
 
-Note: The haeder file aufs_type.h is necessary to build aufs2-util
+Note: The aufs haeder files under include/linux are necessary to build aufs2-util
       as well as "make headers_install" in the kernel source tree.
       headers_install is subject to be forgotten, but it is essentially
       necessary, not only for building aufs2-util.
@@ -255,7 +255,7 @@ Note: The haeder file aufs_type.h is necessary to build aufs2-util
 And then,
 - read README in aufs2-util, build and install it.
 - note that your distribution may contain an obsoleted version of
-  aufs_type.h in /usr/include/linux or something. When you build aufs
+  aufs header files in /usr/include/linux or something. When you build aufs
   utilities, make sure that your compiler refers the correct aufs header
   file which is built by "make headers_install."
 - if you want to use readdir(3) in userspace or pathconf(3) wrapper,
diff --git a/fs/aufs/Makefile b/fs/aufs/Makefile
index 0a757f4..b63f12a 100644
--- a/fs/aufs/Makefile
+++ b/fs/aufs/Makefile
@@ -9,6 +9,7 @@ endif
 # enable pr_debug
 ccflags-y += -DDEBUG
 # sparse doesn't allow spaces
+ccflags-y += -imacros linux/aufs_name.h
 ccflags-y += -D'pr_fmt(fmt)=AUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
 
 obj-$(CONFIG_AUFS_FS) += aufs.o
diff --git a/include/linux/Kbuild b/include/linux/Kbuild
index 4268c75..60bd38d 100644
--- a/include/linux/Kbuild
+++ b/include/linux/Kbuild
@@ -34,6 +34,7 @@ header-y += atmppp.h
 header-y += atmsap.h
 header-y += atmsvc.h
 header-y += atm_zatm.h
+header-y += aufs_name.h
 header-y += aufs_type.h
 header-y += auto_fs4.h
 header-y += ax25.h
diff --git a/include/linux/aufs_name.h b/include/linux/aufs_name.h
new file mode 100644
index 0000000..838cc43
--- /dev/null
+++ b/include/linux/aufs_name.h
@@ -0,0 +1,25 @@
+/*
+ * Copyright (C) 2011 Junjiro R. Okajima
+ *
+ * This program, aufs is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
+ */
+
+#ifndef __AUFS_NAME_H__
+#define __AUFS_NAME_H__
+
+/* fs/aufs/Makefile refers this macro */
+#define AUFS_NAME		"aufs"
+
+#endif /* __AUFS_NAME_H__ */
diff --git a/include/linux/aufs_type.h b/include/linux/aufs_type.h
index ca4a6be..6f23223 100644
--- a/include/linux/aufs_type.h
+++ b/include/linux/aufs_type.h
@@ -28,6 +28,7 @@
 #include <stdint.h>
 #include <sys/types.h>
 #endif
+#include <linux/aufs_name.h>
 
 #define AUFS_VERSION	"2.2-stdalone-35-lktr-YyyyMmDd"
 
@@ -58,7 +59,6 @@ typedef int16_t aufs_bindex_t;
 
 /* ---------------------------------------------------------------------- */
 
-#define AUFS_NAME		"aufs"
 #define AUFS_FSTYPE		AUFS_NAME
 
 #define AUFS_ROOT_INO		2

------------------------------------------------------------------------------
Ridiculously easy VDI. With Citrix VDI-in-a-Box, you don't need a complex
infrastructure or vast IT resources to deliver seamless, secure access to
virtual desktops. With this all-in-one solution, easily deploy virtual 
desktops for less than the cost of PCs and save 60% on VDI infrastructure 
costs. Try it free! http://p.sf.net/sfu/Citrix-VDIinabox
