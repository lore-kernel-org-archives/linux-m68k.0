From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: Signal patchset
Date: Sun, 9 Jan 2011 22:14:53 +0000
Message-ID: <Pine.BSM.4.64L.1101092212580.17509@herc.mirbsd.org>
References: <AANLkTi=9B-8KN0oiXoiU+KqPt6B8Vs=d7yu9cui-7e1r@mail.gmail.com>
 <20101215101027.GA31097@ZenIV.linux.org.uk> <Pine.BSM.4.64L.1101011938470.1114@herc.mirbsd.org>
 <AANLkTinBix+uEhWrzcqXPsoJ5VPq6zH=uOBX4VKO_6wW@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:33880 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751884Ab1AIWPK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 9 Jan 2011 17:15:10 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1Pc3XV-00033P-P6
	for linux-m68k@vger.kernel.org; Sun, 09 Jan 2011 23:15:05 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 09 Jan 2011 23:15:05 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 09 Jan 2011 23:15:05 +0100
In-Reply-To: <AANLkTinBix+uEhWrzcqXPsoJ5VPq6zH=uOBX4VKO_6wW@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Geert Uytterhoeven dixit:

>It's a bit tricky as threadinfo_*.h got merged, so I ended up editing =
the
>patch series manually.

Yes, same here.

>Anyway, you want to either use `git am -3'

Which didn=E2=80=99t work for me for some reason=E2=80=A6

>or apply it to the original version it was made for

Yes, except which one is that? ;-( git didn=E2=80=99t tell itself in
the diff, and I had no idea either. Worked against 2.6.36,
though.

>In the end, I got the exact same result as you did, so it must be corr=
ect ;-)

Good to know ;-) As I=E2=80=99m only _just_ back home and need to
catch up on work, I=E2=80=99ve not yet done anything with it tho.

Groetjes,
//mirabilos
--=20
  "Using Lynx is like wearing a really good pair of shades: cuts out
   the glare and harmful UV (ultra-vanity), and you feel so-o-o COOL."
                                         -- Henry Nelson, March 1999
