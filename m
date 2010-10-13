From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Wed, 13 Oct 2010 20:17:21 +0000
Message-ID: <Pine.BSM.4.64L.1010132016320.19763@herc.mirbsd.org>
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
Received: from lo.gmane.org ([80.91.229.12]:50557 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752903Ab0JMURg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Oct 2010 16:17:36 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P67lU-0001TP-RU
	for linux-m68k@vger.kernel.org; Wed, 13 Oct 2010 22:17:32 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 13 Oct 2010 22:17:32 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 13 Oct 2010 22:17:32 +0200
In-Reply-To: <AANLkTim_gdMc5scQm-oAD6Jowv6q=W0bK=rkjZUmAgLd@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>> Besides, this still looks like an obvious omission to me.
>> Look a few lines above, the macros are defined in the other
>> case (CONFIG_ISA defined).
>
>I'm not questioning they're missing.

I can=E2=80=99t help but notice the patch hasn=E2=80=99t yet shown up i=
n the
gitweb (but Stephen committed it to Debian already, thanks).

//mirabilos, currently trying to build again
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
