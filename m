From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Mon, 2 Jan 2012 13:30:20 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1201021328500.13674@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1112312229530.14351@herc.mirbsd.org>
 <Pine.BSM.4.64L.1201010113350.14351@herc.mirbsd.org> <9798.1325486722@jrobl>
 <Pine.BSM.4.64L.1201021027220.671@herc.mirbsd.org> <5487.1325510133@jrobl>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:15473 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084Ab2ABNg7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2012 08:36:59 -0500
In-Reply-To: <5487.1325510133@jrobl>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: sfjro@users.sourceforge.net
Cc: aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>, linux-m68k@vger.kernel.org

sfjro@users.sourceforge.net dixit:

>> You include aufs_name.h twice now, once in the Makefile,
>> once in the header. Shouldn=3DE2=3D80=3D99t one be enough?
>
>No, because aufs_type.h is exported to userspace.

Then, why include it in the Makefile at all?
(Or, why include aufs_name.h from aufs_type.h?)

bye,
//mirabilos
--=20
  =E2=80=9CHaving a smoking section in a restaurant is like having
          a peeing section in a swimming pool.=E2=80=9D
						-- Edward Burr
