From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 13:40:04 +0000
Message-ID: <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041943530.285@localhost> <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
 <alpine.OSX.2.00.1010042115260.285@localhost>
 <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:46154 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753872Ab0JDNkP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 09:40:15 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2lH2-0008U9-V4
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 15:40:12 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 15:40:12 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 15:40:12 +0200
In-Reply-To: <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>I don't think it makes sense to build staging drivers on Debian/m68k.

Yes. Tell that to *them*, though.

>So can't you default to CONFIG_STAGING=3Dn?

No *I* can=E2=80=99t.

Besides, this still looks like an obvious omission to me.
Look a few lines above, the macros are defined in the other
case (CONFIG_ISA defined).

>Gr{oetje,eeting}s,

Terug,
//mirabilos
--=20
15:39=E2=8E=9C=C2=ABmika:#grml=C2=BB mira|AO: "mit XFree86=C2=AE w=C3=A4=
r=E2=80=99 das nicht passiert" - muhaha
15:48=E2=8E=9C<thkoehler:#grml> also warum machen die xorg Jungs eigent=
lich alles
kaputt? :)    15:49=E2=8E=9C<novoid:#grml> thkoehler: weil sie als Kind=
er nie den
gebauten Turm selber umschmeissen durften?	-- ~/.Xmodmap wonders=E2=80=A6
