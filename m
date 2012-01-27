From: Thorsten Glaser <tg@debian.org>
Subject: Re: Atari TT (next)
Date: Fri, 27 Jan 2012 17:01:56 +0000 (UTC)
Message-ID: <loom.20120127T175834-143@post.gmane.org>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk> <4F0917E9.9090600@gmail.com> <4F0964EC.2080505@fairlite.co.uk> <CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from lo.gmane.org ([80.91.229.12]:33327 "EHLO lo.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751840Ab2A0RCL (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 27 Jan 2012 12:02:11 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <glpm-linux-m68k@m.gmane.org>)
	id 1RqpBh-0003hn-Um
	for linux-m68k@vger.kernel.org; Fri, 27 Jan 2012 18:02:09 +0100
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 27 Jan 2012 18:02:09 +0100
Received: from tg by static-87-79-237-121.netcologne.de with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-m68k@vger.kernel.org>; Fri, 27 Jan 2012 18:02:09 +0100
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org

Michael Schmitz <schmitzmic <at> googlemail.com> writes:

> >> Can you try to have the kernel placed in ST-RAM?
> >
> > No, the kernel is too big. I've only got 4MB ST-RAM. And getting mo=
re on

The guys at the Atari booth at OpenRheinRuhr had the same problem,
they also had a 4/4 MiB split.

> You may have to pare the kernel down to the bare minimum (i.e.
> modularize about everything you don't need to boot to initrd). Not
> sure where the limit for this is these days.

Note that the Debian kernel does not use initrd to boot (to the
finally installed system), especially as those tools are built
with klibc, which is currently still broken on m68k, and thus
contains everything needed to get into an ext3fs / from disc,
and then some. I don=E2=80=99t think you should be using a distro kerne=
l
made under such constraints (nor should the distro kernel be
stripped more down considering the problems; I think there may
even be flavours that don=E2=80=99t _support_ initrd, outside the image
that is) but compile a stripped-down one yourself.

> >> You're right, this should be possible to test with ARAnyM - the
> >> behavior is not new though. Loading the kernel in TT-RAM has been
> >> problematic on the Falcon for a long time now.

I don=E2=80=99t know about that; ARanyM has a built-in LILO, so I never
saw any TOS (except when using AfrOS, but that=E2=80=99s a whole differ=
ent
beast)=E2=80=A6

bye,
//mirabilos
