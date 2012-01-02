From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 13:01:50 +0900
Message-ID: <7012.1325476910@jrobl>
References: <1325264773.13595.133.camel@deadeye> <9569.1325306817@jrobl> <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com> <Pine.BSM.4.64L.1112311628570.14351@herc.mirbsd.org> <5968.1325473093@jrobl> <1325475600.13595.208.camel@deadeye>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail05-md.ns.itscom.net ([175.177.155.115]:58282 "EHLO
	mail05-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446Ab2ABEBy (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 23:01:54 -0500
Received: from scan02-mds.s.noc.itscom.net (scan02-md.ns.itscom.net [175.177.155.123])
	by mail05-md-outgoing.ns.itscom.net (Postfix) with ESMTP id 732A6658468
	for <linux-m68k@vger.kernel.org>; Mon,  2 Jan 2012 13:01:51 +0900 (JST)
In-Reply-To: <1325475600.13595.208.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Thorsten Glaser <tg@mirbsd.de>, aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


Ben Hutchings:
> Why, how often do you expect to change AUFS_NAME?

I don't know.
I just don't want call myself idiot when it happens.


> I think it would be much better to put this in fs/aufs/aufs.h and make
> each of fs/aufs/*.c include that first.

Yes, that is my another option I have considered.
Also I am considering to move AUFS_NAME back into aufs_type.h.

In aufs_type.h:
(at the top)
#define AUFS_NAME ...
#if KERNEL
#define pr_fmt ...
#include sched.h
#endif

and include aufs_type.h at the top of source files.


> The comment about sparse belongs immediately before the definition of
> pr_fmt.

Yes, I am changing like this.

--- a/fs/aufs/Makefile
+++ b/fs/aufs/Makefile
@@ -8,9 +8,10 @@ endif
 # cf. include/linux/kernel.h
 # enable pr_debug
 ccflags-y += -DDEBUG
+# sparse requires the fullpath
+ccflags-y += -imacros ${srctree}/include/linux/aufs_name.h
+ccflags-y += -include ${srctree}/include/linux/sched.h
 # sparse doesn't allow spaces
-ccflags-y += -imacros linux/aufs_name.h
-ccflags-y += -include linux/sched.h
 ccflags-y += -D'pr_fmt(fmt)=AUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
 
 obj-$(CONFIG_AUFS_FS) += aufs.o


J. R. Okajima
