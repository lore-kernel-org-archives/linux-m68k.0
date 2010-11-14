From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: patches not upstream
Date: Sun, 14 Nov 2010 17:33:13 +0000
Message-ID: <Pine.BSM.4.64L.1011141731400.19951@herc.mirbsd.org>
References: <251136a28833a299adc3df54c1e2bdf4.squirrel@naiad.marenka.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:40636 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756487Ab0KNRd1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 14 Nov 2010 12:33:27 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1PHgSD-0008Tv-B3
	for linux-m68k@vger.kernel.org; Sun, 14 Nov 2010 18:33:25 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 14 Nov 2010 18:33:25 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 14 Nov 2010 18:33:25 +0100
In-Reply-To: <251136a28833a299adc3df54c1e2bdf4.squirrel@naiad.marenka.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Stephen R. Marenka dixit:

>Some of those are already marked for 2.6.37, but the atari/aranym patc=
hes
>seem to have been sitting around a while. Any chance they can go upstr=
eam?

Is it, maybe, possible to split between patches that touch m68k
exclusively (like ARAnyM support) and those that don=E2=80=99t (like FA=
T
changes), and at least push the former?

=46rom what I=E2=80=99ve read, Debian doesn=E2=80=99t want to add any =E2=
=80=9Cfeature=E2=80=9D
patches post-squeeze any more, so the chances of keeping this
in the Debian kernel package get slimmer, or so it seems.

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
