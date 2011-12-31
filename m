From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sat, 31 Dec 2011 22:18:17 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:25562 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251Ab1LaWU0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Dec 2011 17:20:26 -0500
In-Reply-To: <1325264773.13595.133.camel@deadeye>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: sfjro@users.sourceforge.net, aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

Ben Hutchings dixit:

>-ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"\040%s:%d:%s[%d]:\040"fmt,_=
_func__,__LINE__,current->comm,current->pid'
>+ccflags-y +=3D -D'pr_fmt(fmt)=3D"aufs\040%s:%d:%s[%d]:\040"fmt,__func=
__,__LINE__,current->comm,current->pid'

Sadly, this doesn=E2=80=99t work either:

  CC [M]  fs/aufs/module.o
In file included from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/hardirq.h:7:0,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/arch/m68k/include/asm/irqflags.h:6,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/irqflags.h:15,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/spinlock.h:53,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/seqlock.h:29,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/time.h:8,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/stat.h:60,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/include/linux/module.h:10,
                 from /tmp/buildd/linux-2.6-3.2~rc7/debian/build/source=
_m68k_none/fs/aufs/module.c:23:
/tmp/buildd/linux-2.6-3.2~rc7/debian/build/source_m68k_none/arch/m68k/i=
nclude/asm/hardirq.h: In function 'ack_bad_irq':
/tmp/buildd/linux-2.6-3.2~rc7/debian/build/source_m68k_none/arch/m68k/i=
nclude/asm/hardirq.h:23:2: error: dereferencing pointer to incomplete t=
ype
/tmp/buildd/linux-2.6-3.2~rc7/debian/build/source_m68k_none/arch/m68k/i=
nclude/asm/hardirq.h:23:2: error: dereferencing pointer to incomplete t=
ype
make[7]: *** [fs/aufs/module.o] Error 1

This one does work:
http://lists.debian.org/debian-kernel/2011/12/msg00474.html

The difference between a static inline function and a pr=C3=A6processor
macro makes the difference. I know, now, why I never used the former
myself =E2=98=BA I guess =E2=80=9Ccurrent=E2=80=9D is not defined there=
=2E


sfjro@users.sourceforge.net dixit:

>I don't think the "current" macro will be a problem, but I want you to

It does. Also, read this:
http://people.netfilter.org/rusty/unreliable-guides/kernel-hacking/rout=
ines-current.html
=E2=80=9CThis global variable (really a macro) contains a pointer to th=
e
current task structure, so is only valid in user context. For example,
when a process makes a system call, this will point to the task
structure of the calling process. It is not NULL in interrupt context.=E2=
=80=9D

So I don=E2=80=99t know how safe it is to dereference 'current' in the =
inline
function ack_bad_irq (probably, not at all). On the other hand, the
ack_bad_irq function is probably not expanded in aufs3=E2=80=A6 so we c=
ould
go on. I can try a patch based on yours, but probably the best fix
would be to not use a static inline function in m68k.

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
