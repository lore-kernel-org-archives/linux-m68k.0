From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Aranym, more than 244MB FastRAM, garbled display
Date: Mon, 4 Oct 2010 19:49:25 +0000
Message-ID: <Pine.BSM.4.64L.1010041947160.3776@herc.mirbsd.org>
References: <alpine.LNX.2.00.1010011728270.4788@halbrend.uninett.no>
 <m2tyl5u9hu.fsf@igel.home> <alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:54911 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756369Ab0JDTtf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 15:49:35 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2r2U-00071s-7F
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 21:49:34 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 21:49:34 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 21:49:34 +0200
In-Reply-To: <alpine.LNX.2.00.1010011908550.4788@halbrend.uninett.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Kolbj=C3=B8rn Barmen dixit:

>Anything other than default in video settings or anything?

I=E2=80=99m now seeing this too, with the vmlinuz-2.6.32-5-atari
(Debian 2.6.32-24+m68k) just built.

This WFM:
[GLOBAL]
=46astRAM =3D 768
[LILO]
Kernel =3D vmlinuz-2.6.32-5-atari
# these Args for normal X operation
Args =3D root=3D/dev/hda1 console=3Dtty debug=3Dpar video=3Datafb:vga2

HTH,
//mirabilos
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
