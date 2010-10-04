From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 19:20:22 +0000
Message-ID: <Pine.BSM.4.64L.1010041919220.3776@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041943530.285@localhost> <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
 <alpine.OSX.2.00.1010042115260.285@localhost>
 <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
 <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
 <AANLkTim_gdMc5scQm-oAD6Jowv6q=W0bK=rkjZUmAgLd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:50763 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932398Ab0JDTUc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 15:20:32 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2qaN-0006S6-7g
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 21:20:31 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 21:20:31 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 21:20:31 +0200
In-Reply-To: <AANLkTim_gdMc5scQm-oAD6Jowv6q=W0bK=rkjZUmAgLd@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>I'm not questioning they're missing.

There are other, non-staging, drivers using them as well.

Anyway.
-rw-r--r-- 1 root root 17251 Oct  4 17:43 linux-2.6_2.6.32-24+m68k_m68k=
=2Echanges

So, with that one patch, I can successfully build a kernel.
Now, let=E2=80=99s see whether it boots=E2=80=A6 then, after you accept=
ed that
patch, I can submit that to the Debian kernel people.

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
