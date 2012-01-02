From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 15:45:22 +0900
Message-ID: <9798.1325486722@jrobl>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org> <Pine.BSM.4.64L.1112312229530.14351@herc.mirbsd.org> <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail06-md.ns.itscom.net ([175.177.155.116]:59514 "EHLO
	mail06-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812Ab2ABGpZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2012 01:45:25 -0500
Received: from scan06-mds.s.noc.itscom.net (scan06-md.ns.itscom.net [175.177.155.101])
	by mail06-md-outgoing.ns.itscom.net (Postfix) with ESMTP id 8E1536E8493
	for <linux-m68k@vger.kernel.org>; Mon,  2 Jan 2012 15:45:22 +0900 (JST)
In-Reply-To: <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


Thorsten Glaser:
> >What do you think of this (untested)?
>
> well, it compiles (with warnings, see below). I=E2=80=99ll know if it links
> and loads tomorrow, I guess (unless the other problems are still
> there).
	:::

This is the last version of my approach (documentations are omitted).
Would you try on your m68k when you have time?
You need to revert my previous patch.

J. R. Okajima


diff --git a/fs/aufs/Makefile b/fs/aufs/Makefile
index 0a757f4..7326c22 100644
--- a/fs/aufs/Makefile
+++ b/fs/aufs/Makefile
@@ -8,8 +8,8 @@ endif
 # cf. include/linux/kernel.h
 # enable pr_debug
 ccflags-y += -DDEBUG
-# sparse doesn't allow spaces
-ccflags-y += -D'pr_fmt(fmt)=AUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
+# sparse requires the full pathname
+ccflags-y += -include ${srctree}/include/linux/aufs_name.h
 
 obj-$(CONFIG_AUFS_FS) += aufs.o
 aufs-y := module.o sbinfo.o super.o branch.o xino.o sysaufs.o opts.o \
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
index 0000000..550fbb2
--- /dev/null
+++ b/include/linux/aufs_name.h
@@ -0,0 +1,29 @@
+/*
+ * Copyright (C) 2011-2012 Junjiro R. Okajima
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
+#define AUFS_NAME		"aufs"
+#ifdef __KERNEL__
+#define pr_fmt(fmt)	AUFS_NAME " %s:%d:%s[%d]: " fmt,\
+		__func__, __LINE__, current->comm, current->pid
+#include <linux/sched.h>
+#endif
+
+#endif /* __AUFS_NAME_H__ */
diff --git a/include/linux/aufs_type.h b/include/linux/aufs_type.h
index ca4a6be..779f41a 100644
--- a/include/linux/aufs_type.h
+++ b/include/linux/aufs_type.h
@@ -19,6 +19,7 @@
 #ifndef __AUFS_TYPE_H__
 #define __AUFS_TYPE_H__
 
+#include <linux/aufs_name.h>
 #include <linux/ioctl.h>
 #include <linux/kernel.h>
 #include <linux/limits.h>
@@ -58,7 +59,6 @@ typedef int16_t aufs_bindex_t;
 
 /* ---------------------------------------------------------------------- */
 
-#define AUFS_NAME		"aufs"
 #define AUFS_FSTYPE		AUFS_NAME
 
 #define AUFS_ROOT_INO		2
