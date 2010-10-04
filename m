From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 1/1] m68k: add missing I/O macros {in,out}{w,l}_p() for
 !CONFIG_ISA
Date: Mon, 4 Oct 2010 09:10:16 +0000
Message-ID: <Pine.BSM.4.64L.1010040906400.22591@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1010031832530.15165@herc.mirbsd.org>
 <Pine.BSM.4.64L.1010031846060.15165@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041149030.285@localhost> <Pine.BSM.4.64L.1010040738160.22274@herc.mirbsd.org>
 <alpine.OSX.2.00.1010041943530.285@localhost>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:58051 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753897Ab0JDJKg convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 4 Oct 2010 05:10:36 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1P2h42-00040i-RS
	for linux-m68k@vger.kernel.org; Mon, 04 Oct 2010 11:10:30 +0200
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 11:10:30 +0200
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Mon, 04 Oct 2010 11:10:30 +0200
In-Reply-To: <alpine.OSX.2.00.1010041943530.285@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

=46inn Thain dixit:

>It would be better if we used the same .config, don't you think?

*sigh*

# apt-get source linux-2.6
# cd linux-2.6-2.6.32

optionally:
# $EDITOR debian/config/m68k/defines
=E2=87=92 in [base] comment out everything except =E2=80=9Cflavours:=E2=
=80=9D and =E2=80=9Catari=E2=80=9D
  to save time compiling the other images

then:
# debian/rules clean
(this may give you an error message)
# dpkg-buildpackage -B


So, no modifications to stock Debian. Well, except for #598893=E2=80=A6

bye,
//mirabilos
--=20
[...] if maybe ext3fs wasn't a better pick, or jfs, or maybe reiserfs, =
oh but
what about xfs, and if only i had waited until reiser4 was ready... in =
the be-
ginning, there was ffs, and in the middle, there was ffs, and at the en=
d, there
was still ffs, and the sys admins knew it was good. :)  -- Ted Unangst =
=C3=BCber *fs
