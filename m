From: Thorsten Glaser <tg@debian.org>
Subject: Re: Atari TT (next)
Date: Sun, 29 Jan 2012 00:57:46 +0000 (UTC)
Message-ID: <loom.20120129T015428-587@post.gmane.org>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com> <loom.20120127T175834-143@post.gmane.org> <4F245B91.60101@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:43264 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752109Ab2A2BQZ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 28 Jan 2012 20:16:25 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1RrJ5h-000197-Fv
	for linux-m68k@vger.kernel.org; Sun, 29 Jan 2012 01:57:57 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 29 Jan 2012 01:57:57 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Sun, 29 Jan 2012 01:57:57 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic <at> googlemail.com> writes:

> > Note that the Debian kernel does not use initrd to boot (to the
> > finally installed system), especially as those tools are built
> > with klibc, which is currently still broken on m68k, and thus

> I wasn't aware of that.

Yeah. I have started trying to fix that, though =E2=98=BA see the other
mail of today.

> That's what I was suggesting - a stripped down kernel tailored to the=
 TT=20
> could then
> be 'distributed' (like you do with other stuff from your people.d.o=20
> page) to those
> that need it.

That would indeed be possible and not too hard (Debian has tools for
that, and if must, these could even be cross-built).

> Not that a total of 8 MB RAM would be a lot of fun to run today's ker=
nel=20
> and userland on.

Indeed. I did that for a friend=E2=80=99s i486 laptop, and I=E2=80=99ve=
 got one of those
myself as well except it has 12 MiB. MirBSD works =E2=80=93 barely. (I =
could go
multiuser on the 12 MiB RAM one, but decided to not do it; it=E2=80=99s=
 enough
for 3 virtual consoles, GNU screen, lynx, ssh client, tinyirc. Not my
regular IRC client sirc, as that one=E2=80=99s written in Perl. So, def=
initively
no stock Linux distribution=E2=80=A6)

bye,
//mirabilos
