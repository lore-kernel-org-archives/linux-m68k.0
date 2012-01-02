From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 2 Jan 2012 16:14:46 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201021613370.29291@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1112312229530.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org> <9798.1325486722@jrobl>
 <Pine.BSM.4.64L.1201021027220.671@herc.mirbsd.org> <5487.1325510133@jrobl>
 <Pine.BSM.4.64L.1201021328500.13674@herc.mirbsd.org> <6600.1325512436@jrobl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:41797 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752743Ab2ABQY7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2012 11:24:59 -0500
In-Reply-To: <6600.1325512436@jrobl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

sfjro@users.sourceforge.net dixit:

>- AUFS_NAME is necessary for both of kernel-space and user-space.
>- from userspace, users include aufs_type.h. to keep the consistency,
>  aufs_type.h should include aufs_name.h.
>- for kernelspace, to put aufs_name.h _before_ all other headers.

Hrm, okay. I=E2=80=99ll try your patch then, once we get that register_=
cpu
issue solved too. I=E2=80=99ll get back to you with test results.

>Do I make myself clear with my poor English?

I have the same problem ;-) it=E2=80=99s only my third natural language=
=2E

bye,
//mirabilos
--=20
08:05=E2=8E=9C<XTaran:#grml> mika: Does grml have an tool to read Apple
     =E2=8E=9C    System Log (asl) files? :)
08:08=E2=8E=9C<ft:#grml> yeah. /bin/rm. ;)       08:09=E2=8E=9C<mrud:#g=
rml> hexdump -C
08:31=E2=8E=9C<XTaran:#grml> ft, mrud: *g*
