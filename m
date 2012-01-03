From: sfjro@users.sourceforge.net
Subject: [PATCH 1/2] aufs: headers 1/2, bugfix, where the pr_fmt macro definition
Date: Tue,  3 Jan 2012 14:21:21 +0900
Message-ID: <1325568082-25540-2-git-send-email-sfjro@users.sourceforge.net>
References: <1325568082-25540-1-git-send-email-sfjro@users.sourceforge.net>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail04-md.ns.itscom.net ([175.177.155.114]:35459 "EHLO
	mail04-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795Ab2ACFVZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 3 Jan 2012 00:21:25 -0500
Received: from scan01-mds.s.noc.itscom.net (scan01-md.ns.itscom.net [175.177.155.122])
	by mail04-md-outgoing.ns.itscom.net (Postfix) with ESMTP id C98AF620471
	for <linux-m68k@vger.kernel.org>; Tue,  3 Jan 2012 14:21:22 +0900 (JST)
In-Reply-To: <1325568082-25540-1-git-send-email-sfjro@users.sourceforge.net>
In-Reply-To: <Pine.BSM.4.64L.1201021735430.29291@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1201021735430.29291@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: tg@mirbsd.de
Cc: aufs-users@lists.sourceforge.net, debian-kernel@lists.debian.org, linux-m68k@vger.kernel.org

From: J. R. Okajima <hooanon05@yahoo.co.jp>

The pr_fmt macro is defined in fs/aufs/Makefile and it refers to the
AUFS_NAME macro, which caused a compilation error in m68k architecture.
Also it refers to the "current" macro which will be a problem too.

See-also: http://sourceforge.net/mailarchive/message.php?msg_id=28608043
Reported-by: Ben Hutchings <ben@decadent.org.uk>
Suggested-by: Thorsten Glaser <tg@mirbsd.de>
Signed-off-by: J. R. Okajima <hooanon05@yahoo.co.jp>
---
 fs/aufs/Makefile          |    4 ++--
 include/linux/aufs_type.h |   20 ++++++++++++++------
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/aufs/Makefile b/fs/aufs/Makefile
index 0aadd21..dc8fd36 100644
--- a/fs/aufs/Makefile
+++ b/fs/aufs/Makefile
@@ -4,8 +4,8 @@ include ${srctree}/${src}/magic.mk
 # cf. include/linux/kernel.h
 # enable pr_debug
 ccflags-y += -DDEBUG
-# sparse doesn't allow spaces
-ccflags-y += -D'pr_fmt(fmt)=AUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
+# sparse requires the full pathname
+ccflags-y += -include ${srctree}/include/linux/aufs_type.h
 
 obj-$(CONFIG_AUFS_FS) += aufs.o
 aufs-y := module.o sbinfo.o super.o branch.o xino.o sysaufs.o opts.o \
diff --git a/include/linux/aufs_type.h b/include/linux/aufs_type.h
index 60b52b0..25cdc06 100644
--- a/include/linux/aufs_type.h
+++ b/include/linux/aufs_type.h
@@ -19,15 +19,24 @@
 #ifndef __AUFS_TYPE_H__
 #define __AUFS_TYPE_H__
 
-#include <linux/ioctl.h>
-#include <linux/kernel.h>
-#include <linux/limits.h>
+#define AUFS_NAME	"aufs"
+
 #ifdef __KERNEL__
-#include <linux/types.h>
+/*
+ * define it before including all other headers.
+ * sched.h may use pr_* macros before defining "current", so define the
+ * no-current version first, and re-define later.
+ */
+#define pr_fmt(fmt)	AUFS_NAME " %s:%d: " fmt, __func__, __LINE__
+#include <linux/sched.h>
+#undef pr_fmt
+#define pr_fmt(fmt)	AUFS_NAME " %s:%d:%s[%d]: " fmt, \
+		__func__, __LINE__, current->comm, current->pid
 #else
+#include <linux/limits.h>
 #include <stdint.h>
 #include <sys/types.h>
-#endif
+#endif /* __KERNEL__ */
 
 #define AUFS_VERSION	"2.2-35"
 
@@ -58,7 +67,6 @@ typedef int16_t aufs_bindex_t;
 
 /* ---------------------------------------------------------------------- */
 
-#define AUFS_NAME		"aufs"
 #define AUFS_FSTYPE		AUFS_NAME
 
 #define AUFS_ROOT_INO		2
-- 
1.7.2.5
