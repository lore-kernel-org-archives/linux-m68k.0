From: sfjro@users.sourceforge.net
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 02 Jan 2012 22:15:33 +0900
Message-ID: <5487.1325510133@jrobl>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org> <Pine.BSM.4.64L.1112312229530.14351@herc.mirbsd.org> <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org> <9798.1325486722@jrobl> <Pine.BSM.4.64L.1201021027220.671@herc.mirbsd.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail04-md.ns.itscom.net ([175.177.155.114]:51762 "EHLO
	mail04-md.ns.itscom.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749Ab2ABNPh (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2012 08:15:37 -0500
Received: from scan03-mds.s.noc.itscom.net (scan03-md.ns.itscom.net [175.177.155.124])
	by mail04-md-outgoing.ns.itscom.net (Postfix) with ESMTP id 0EECB620471
	for <linux-m68k@vger.kernel.org>; Mon,  2 Jan 2012 22:15:34 +0900 (JST)
In-Reply-To: <Pine.BSM.4.64L.1201021027220.671@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Thorsten Glaser <tg@mirbsd.de>
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org


Thorsten Glaser:
> This doesn=E2=80=99t really differ from what I sent last,
> does it?

I am afraid you may not understand the important parts.
- the order of the definition and sched.h.
- no undef.


> >+#ifdef __KERNEL__
>
> Hrm. Is this needed?

Indeed necessary since aufs_name.h is exported to userspace.


> >+#define pr_fmt(fmt)=09AUFS_NAME " %s:%d:%s[%d]: " fmt,\
> >+=09=09__func__, __LINE__, current->comm, current->pid
>
> You need to #undef it first. It=E2=80=99s always defined, to just fmt.

No, I don't think undef is a good approach. The purpose of my patch, or
the difference from yours is to define pr_fmt first before all headers
including sched.h.


> >+#include <linux/aufs_name.h>
>
> You include aufs_name.h twice now, once in the Makefile,
> once in the header. Shouldn=E2=80=99t one be enough?

No, because aufs_type.h is exported to userspace.


J. R. Okajima
