From: Thorsten Glaser <tg@mirbsd.de>
Subject: [PATCH 0/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Sun, 3 Oct 2010 18:38:46 +0000
Message-ID: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:44364 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754427Ab0JCSpI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 3 Oct 2010 14:45:08 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2TYV-0004m6-F0
	for linux-m68k@vger.kernel.org; Sun, 03 Oct 2010 20:45:03 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 03 Oct 2010 20:45:03 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 03 Oct 2010 20:45:03 +0200
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Hi,

I=E2=80=99m currently trying to get stock Debian unstable linux-2.6 to =
build
on m68k for the TLS transition. Besides running into gcc-4.3 bugs
(e.g. Debian #598893) there is something mis with the code when
trying to build for ArANYm (atari).

The next mail will contain an attempt at a patch which I hope will
follow patch submission guidelines, however I don=E2=80=99t really know=
 how
to send git diffs out so if this was wrong please tell me how to do
better next time (usually I just attach the 0001-* file to the mail).

As m68k, even emulated, is slow I have yet to test whether this is
indeed the fix, or if other patches are needed, but by submitting
eatly you can already review it. (I=E2=80=99m submitting here because D=
ebian
says to only accept patches after upstream has done so.) Anyway, I=E2=80=
=99ll
write again once I got a kernel or have given up due to failures.

bye,
//mirabilos =E2=80=A2 tg@d.o
--=20
I believe no one can invent an algorithm. One just happens to hit upon =
it
when God enlightens him. Or only God invents algorithms, we merely copy=
 them.
If you don't believe in God, just consider God as Nature if you won't d=
eny
existence.		-- Coywolf Qi Hunt
