From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: aranym bug, manifests as "ida_remove called for id=13" on recent
 kernels
Date: Mon, 11 Oct 2010 13:45:54 +0000
Message-ID: <Pine.BSM.4.64L.1010111343580.8035@herc.mirbsd.org>
References: <20101007174948.GT19804@ZenIV.linux.org.uk>
 <AANLkTin4886D+-yo=zrf2Yj2R5NM9qdRkc3M9cG2rN_F@mail.gmail.com>
 <20101010144952.GF19804@ZenIV.linux.org.uk>
 <AANLkTinuA3AzMoJ82pvCuhmo59DZxL2F1j3xhXUkjj7z@mail.gmail.com>
 <20101010235256.GG19804@ZenIV.linux.org.uk> <20101011024103.GH19804@ZenIV.linux.org.uk>
 <20101011043632.GA2566@cynthia.pants.nu> <20101011044808.GI19804@ZenIV.linux.org.uk>
 <Pine.BSM.4.64L.1010111218040.23471@herc.mirbsd.org>
 <20101011133545.GJ19804@ZenIV.linux.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:58778 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754211Ab0JKNqH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 11 Oct 2010 09:46:07 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P5IhX-0008Hf-MQ
	for linux-m68k@vger.kernel.org; Mon, 11 Oct 2010 15:46:03 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 11 Oct 2010 15:46:03 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 11 Oct 2010 15:46:03 +0200
In-Reply-To: <20101011133545.GJ19804@ZenIV.linux.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Al Viro dixit:

>	Huh?  Oh, you mean the net_device_ops transition missed in

No, I mean that the Debian kernel apparently lost the m68k patches=E2=80=
=A6
I=E2=80=99ll leave that to those people.

>BTW, now that I've tried allmodconfig build, 4.3 gives a bunch of ICE
>on e.g. ntfs.  Cross-build, so it's not an underlying kernel breakage.=
=2E.

Probably GCC PR#37052 (first was btrfs for me).
=E2=80=A3 http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D598893
=E2=80=A3 http://wiki.debian.org/M68k/Gcc#iceinfindreloads

bye,
//mirabilos
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
