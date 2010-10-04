From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros =?utf-8?b?e2luLG91dH17dyxsfV9wKCk=?= for =?utf-8?b?IUNPTkZJR19JU0E=?=
Date: Mon, 4 Oct 2010 14:13:35 +0000 (UTC)
Message-ID: <loom.20101004T161145-690@post.gmane.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org> <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org> <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org> <alpine.OSX.2.00.1010041943530.285@localhost> <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org> <alpine.OSX.2.00.1010042115260.285@localhost> <AANLkTi=TZBpWS1_ybct=fHeZ9N9AZE_+UoJnwM0HxanM@mail.gmail.com> <Pine.BSM.4.64L.1010041338370.24518@herc.mirbsd.org> <AANLkTim_gdMc5scQm-oAD6Jowv6q=W0bK=rkjZUmAgLd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:38391 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752117Ab0JDOOH (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 4 Oct 2010 10:14:07 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2lnY-0002HX-LO
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 16:13:48 +0200
Received: from p578b229c.dip0.t-ipconnect.de ([87.139.34.156])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 16:13:48 +0200
Received: from tg by p578b229c.dip0.t-ipconnect.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 16:13:48 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven <geert <at> linux-m68k.org> writes:

> I am questioning a distro building staging drivers for m68k.
> IMHO it's a waste of CPU cycles (especially for native builds).

Yeah. However, I don=E2=80=99t speak for the kernel team. I=E2=80=99m =E2=
=80=9Cjust=E2=80=9D
someone playing buildd, until they can do that automatedly
again (after getting new kernel+gcc+eglibc). It=E2=80=99s annoying
to me, too (just how much longer do I need to wait?).

bye,
//mirabilos
--=20
=C2=ABMyISAM tables -will- get corrupted eventually. This is a fact of =
life. =C2=BB
=E2=80=9Cmysql is about as much database as ms access=E2=80=9D =E2=80=93=
 =E2=80=9CMSSQL at least descends
from a database=E2=80=9D =E2=80=9Cit's a rebranded SyBase=E2=80=9D =E2=80=
=9CMySQL however was born from a
flatfile and went downhill from there=E2=80=9D =E2=80=93 =E2=80=9Cat le=
ast jetDB doesn=E2=80=99t claim to
be a database=E2=80=9D  (#nosec)    =E2=80=A3=E2=80=A3=E2=80=A3 Please =
let MySQL and MariaDB finally die!
