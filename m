From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 11:58:13 +0900
Message-ID: <5968.1325473093@jrobl>
References: <1325264773.13595.133.camel@deadeye> <9569.1325306817@jrobl> <CAMuHMdXFrFqxjEBr5iG4s7naBRom6FzM6wPGi1f9HYVsv_c8dg@mail.gmail.com> <Pine.BSM.4.64L.1112311628570.14351@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail03-md.ns.itscom.net ([175.177.155.113]:55335 "EHLO
	mail03-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751446Ab2ABC6Q (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 1 Jan 2012 21:58:16 -0500
Received: from scan01-mds.s.noc.itscom.net (scan01-md.ns.itscom.net [175.177.155.122])
	by mail03-md-outgoing.ns.itscom.net (Postfix) with ESMTP id E71CAFF0053
	for <linux-m68k@vger.kernel.org>; Mon,  2 Jan 2012 11:58:13 +0900 (JST)
In-Reply-To: <Pine.BSM.4.64L.1112311628570.14351@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


Thorsten Glaser:
> >It introduces a new separated file include/linux/aufs_name.h.
>
> Isn=E2=80=99t that a bit overkill?

Hmm, I may have to agree with that.
Honestly speaking, I don't like this approach.
But embedding (expanding) AUFS_NAME is worse for me.


> >If the Makefile refers to the macro, perhaps the Makefile should
> >define it, and pass it with -D?
>
> Indeed. I like Ben=E2=80=99s patch better. But if it must be a separate
> file, please move the pr_fmt definition out of the Makefile and
> into that file, too. Code doesn=E2=80=99t belong into a Makefile IMHO.

You guys don't see "-imacros linux/aufs_name.h" in Makefile?
Or do I totaly miunderstand -imacros?

----------------------------------------------------------------------
> Ben Hutchings dixit:
>
> >-ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__fun=
> c__,__LINE__,current->comm,current->pid'
> >+ccflags-y +=3D -D'pr_fmt(fmt)=3D"aufs\040%s:%d:%s[%d]:\040"fmt,__func__,_=
> _LINE__,current->comm,current->pid'
>
> Sadly, this doesn=E2=80=99t work either:
	:::
> /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source_m68k_none/arch/m68k/inclu=
> de/asm/hardirq.h:23:2: error: dereferencing pointer to incomplete type
	:::
> The difference between a static inline function and a pr=C3=A6processor
> macro makes the difference. I know, now, why I never used the former
> myself =E2=98=BA I guess =E2=80=9Ccurrent=E2=80=9D is not defined there.

That must be an error around the "current" macro which I was afraid.

----------------------------------------------------------------------

> What do you think of this (untested)? I omitted the Documentation/**
> patch as that part it not present in the Debian Linux kernel.
	:::
+#define AUFS_NAME		"aufs"
+#define pr_fmt(fmt)		AUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid

Here are the comments from me.
- aufs_name.h is used both in kernel-space and user-space, so we need
  "#ifdef __KERNEL__"
- the macro may already be defined, so we need "#ifndef pr_fmt"
  now we should decide which we force (choose), the pr_fmt macro we
  define in aufs or the one previously defined somewhere else.
And I chose "defined aufs aufs".
These are also reasons to put it in Makefile.

----------------------------------------------------------------------

> well, it compiles (with warnings, see below). I=E2=80=99ll know if it links
> and loads tomorrow, I guess (unless the other problems are still
> there).
>
> /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source_m68k_none/include/linux/a=
> ufs_name.h:27:0: warning: "pr_fmt" redefined [enabled by default]
> /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source_m68k_none/include/linux/p=
> rintk.h:152:0: note: this is the location of the previous definition
>
> Version 2 of this patch (attached) fixes this by #undef pr_fmt
> before defining it. Please decide whether you want to fix it

Yes, undefining will be necessary if we move the macro difinition into
the header file. Or we may add a condition "#ifndef pr_fmt" when we
define the macro in the header. In other words,
- adding a condition means giving precedence to the difinition in
  somewhere else.
- undefining means forcing the definition in aufs.
But this "forcing" is not enough since the macro can be defined _before_
including the header. I know you put "-include linux/aufs_name.h" in
Makefile, but it is not enough either since the macro _may_ be defined
in sched.h or somewhere else which will be included before aufs_name.h.
Also I understand it is not a big problem. But I hope you would agree
that unconditionally or blindly defined macro is effective (or less
subject to bug) in a single module.

So I still think it is better to define it in Makefile.
If I remove refering the "current" macro in the definition, then the
life will be easier, but it is still useful and I want to keep
it. Additonally it is not a essential problem I think.
Finally I'd like to add sched.h between aufs_name and pr_fmt (see the
attached patch).
How do you think?


J. R. Okajima

--- a/fs/aufs/Makefile
+++ b/fs/aufs/Makefile
@@ -10,6 +10,7 @@ endif
 ccflags-y += -DDEBUG
 # sparse doesn't allow spaces
 ccflags-y += -imacros linux/aufs_name.h
+ccflags-y += -include linux/sched.h
 ccflags-y += -D'pr_fmt(fmt)=AUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
 
 obj-$(CONFIG_AUFS_FS) += aufs.o
