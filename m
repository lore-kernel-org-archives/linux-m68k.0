From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 2 Jan 2012 10:31:16 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201021027220.671@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1112312229530.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org> <9798.1325486722@jrobl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:35180 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810Ab2ABKg7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2012 05:36:59 -0500
In-Reply-To: <9798.1325486722@jrobl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

sfjro@users.sourceforge.net dixit:

>This is the last version of my approach (documentations are omitted).

This doesn=E2=80=99t really differ from what I sent last,
does it?

>Would you try on your m68k when you have time?

You _are_ aware that a kernel compile takes over a day, right?
Why don=E2=80=99t you use the patch from:
http://lists.debian.org/debian-kernel/2012/01/msg00000.html

>+# sparse requires the full pathname
>+ccflags-y +=3D -include ${srctree}/include/linux/aufs_name.h

If that is so, (whatever sparse is =E2=80=93 the build succeeded with
my patch), change this in my patch too.

>+#ifdef __KERNEL__

Hrm. Is this needed?

>+#define pr_fmt(fmt)	AUFS_NAME " %s:%d:%s[%d]: " fmt,\
>+		__func__, __LINE__, current->comm, current->pid

You need to #undef it first. It=E2=80=99s always defined, to just fmt.

>+#include <linux/aufs_name.h>

You include aufs_name.h twice now, once in the Makefile,
once in the header. Shouldn=E2=80=99t one be enough?

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
