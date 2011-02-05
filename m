From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Early crash (was: Re: module: show version information for
 built-in modules in sysfs)
Date: Sat, 5 Feb 2011 23:47:09 +0000
Message-ID: <Pine.BSM.4.64L.1102052346060.22476@herc.mirbsd.org>
References: <AANLkTin4gOnEMruLDM=TkNYsNf5S370WqbcDVJzT7_Z4@mail.gmail.com>
 <20110201210944.GA12348@dtor-ws.eng.vmware.com>
 <AANLkTimv=KqtuR36dMNa+=OMi0mgd8JK4qsb_SpmKmhs@mail.gmail.com>
 <20110201222637.GA17521@dtor-ws.eng.vmware.com>
 <AANLkTikWVt8NEyHN+=yD4EWSXUQt0gt5nLJtKQDw397M@mail.gmail.com>
 <20110202194227.GA13794@dtor-ws.eng.vmware.com> <m2ipx2dp7v.fsf@igel.home>
 <20110202235948.GA8676@dtor-ws.eng.vmware.com> <m2bp2udllv.fsf@igel.home>
 <20110203002459.GA26729@dtor-ws.eng.vmware.com> <m2mxmdm323.fsf@igel.home>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:40241 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751292Ab1BEXrW convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 5 Feb 2011 18:47:22 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1Plrqa-0006bK-TB
	for linux-m68k@vger.kernel.org; Sun, 06 Feb 2011 00:47:20 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 06 Feb 2011 00:47:20 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 06 Feb 2011 00:47:20 +0100
In-Reply-To: <m2mxmdm323.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Andreas Schwab dixit:

>On m68k, every object by default is at most aligned to a 2 byte
>boundary.  That's a heritage of the original Sun m68000 compiler, whic=
h
>served as the template for the gcc configuration for Linux/m68k when t=
he
>porting started.

Ah, from there. I think it might violate the SYSV ABI, funnily
enough (which I've peeked into in order to port elfutils when
bored again). Oh the history ;)

bye,
//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success                       22:21=E2=8E=9C<mksh>=
 it=E2=80=99s a
very thin line anyway=E2=80=A6 with some, you don=E2=80=99t know which =
side they=E2=80=99re on
