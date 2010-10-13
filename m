From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: eglibc sysroot
Date: Wed, 13 Oct 2010 16:59:25 +0000
Message-ID: <Pine.BSM.4.64L.1010131656010.19763@herc.mirbsd.org>
References: <alpine.LNX.2.00.1009221445130.7495@nippy.intranet>
 <alpine.OSX.2.00.1010122347280.278@localhost> <Pine.BSM.4.64L.1010121755580.28735@herc.mirbsd.org>
 <alpine.OSX.2.00.1010131102470.285@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:39613 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750919Ab0JMQ7q convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 13 Oct 2010 12:59:46 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P64g3-0002uv-9F
	for linux-m68k@vger.kernel.org; Wed, 13 Oct 2010 18:59:43 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 13 Oct 2010 18:59:43 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Wed, 13 Oct 2010 18:59:43 +0200
In-Reply-To: <alpine.OSX.2.00.1010131102470.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: 598893@bugs.debian.org

=46inn Thain dixit:

>I guess you patched your compilers as discussed on linux-m68k?

Interestingly enough, I was not hit by GCC PR/41302 because I built
with CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy and CONFIG_FRAME_POINTER=3Dy
to work around GCC PR/37052 already which defines not only
-fno-omit-frame-pointer but also -fno-optimize-sibling-calls =E2=98=BA

Trying again now, thanks to Stephen=E2=80=99s commit in the Debian Kern=
el svn.

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
