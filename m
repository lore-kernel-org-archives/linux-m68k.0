From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] amiflop: get rid of sleep_on calls
Date: Sat, 13 Dec 2008 22:30:48 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812132229560.5728@anakin>
References: <1228755578-26069-1-git-send-email-aeb@debian.org>
 <Pine.LNX.4.64.0812090927580.29640@anakin> <alpine.LNX.2.00.0812131614360.20992@firda.kolla.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:54923 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbYLMVau (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Dec 2008 16:30:50 -0500
In-Reply-To: <alpine.LNX.2.00.0812131614360.20992@firda.kolla.no>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Kolbj=C3=B8rn_Barmen?= <linux-m68k@kolla.no>
Cc: Andreas Bombe <aeb@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>, linux-kernel@vger.kernel.org

On Sat, 13 Dec 2008, Kolbj=C3=B8rn Barmen wrote:
> On Tue, 9 Dec 2008, Geert Uytterhoeven wrote:
> > > The complete_all() with INIT_COMPLETION() was because I'm not sur=
e about
> > > whether fd_motor_on() might run concurrently.  Better safe than s=
orry.
> >=20
> > I'm afraid my Amiga floppy drive doesn't work anymore...
> > Any other testers available?
>=20
> I have some, even enough external ones to chain up to the max of 4
> floppy drives (floppy raid anyone? :)). What needs to be tested?

That the floppy drive still works(tm)? ;-)

> I havent updated kernel for quite some time (still running 2.6.22),
> should I now pull sources from git or what?

I haven't applied Andreas' patch yet, so you should pull the sources fr=
om git
and apply his patch.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
