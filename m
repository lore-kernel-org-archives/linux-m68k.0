From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH 00/11] Atari Ethernet/USB patch series - for upstream
 and debian-kernel
Date: Fri, 29 Mar 2013 21:38:31 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1303292135220.3992@herc.mirbsd.org>
References: <Pine.BSM.4.64L.1303251751380.27649@herc.mirbsd.org>
 <51515889.6040106@uter.be> <5152996E.50800@gmail.com>
 <20130328211747.GA10917@chumley.earth.sol> <5154C5E0.3040608@gmail.com>
 <20130328231039.GA14587@chumley.earth.sol>
 <CAMuHMdWxCW0Gp8jYYk7R3WDJ8u-LJBZJ5d9jjaPAf27vXv3jDA@mail.gmail.com>
 <20130329080629.GB14587@chumley.earth.sol>
 <CAMuHMdXcy8Apvm58m4XudxfRTRa9aiTojRVanPtY3M=mTUUxqg@mail.gmail.com>
 <5155E1A3.7060307@gmail.com> <20130329193323.GD14587@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:38136 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757217Ab3C2Wsy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Mar 2013 18:48:54 -0400
In-Reply-To: <20130329193323.GD14587@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Wouter Verhelst <w@uter.be>, linux-m68k@vger.kernel.org, Ingo J?rgensmann <ij@2012.bluespice.org>

Christian T. Steigies dixit:

>On Sat, Mar 30, 2013 at 07:46:59AM +1300, Michael Schmitz wrote:
>> Explicitly allowed (and preferred) for that purpose (and a few
>> select other uses).
>> Nesting of if () else () branches for error unwinding would
>> otherwise look silly.

Aye.

>> There's still some Real Programmers (Tm) out there :-)

Right ;-)

>I think that goto could be easily avoided... but I am not a Real Progr=
ammer

Avoiding gotos for the purpose of avoiding gotos is absolutely
silly (as the compiler translates them to jumps, which are the
same in asm) and positively harmful (for the legibility of the
code; I wish I had goto in mksh=E2=80=A6).

>I managed to build an amiga kernel from linux-source-3.8 (in experimen=
tal)
>with this command:
>
>make KBUILD_DEBARCH=3Dm68k ARCH=3Dm68k CROSS_COMPILE=3Dm68k-linux-gnu-=
 deb-pkg

You can just run dpkg-buildpackage -am68k=E2=80=A6

>With this is should be easy to (cross-) build kernel-images for m68k w=
ith
>additional patches and minimized config, since this does not use Debia=
n's
>gencontrol.py. Maybe I will try to understand that later.

I don=E2=80=99t think that=E2=80=99s a good thing. And patches can be a=
dded to the
normal process with not too much difficulty=E2=80=A6 but YMMV, and it=E2=
=80=99s up
to the person doing the work.

IMHO we should try to get to as close to the normal Debian processes
as possible though. I=E2=80=99d wager a guess and say that, if you ask,=
 for
example, waldi or bwh in IRC, they=E2=80=99d be happy to help (as oppos=
ed to
see you doing some n=C5=8Dn-standard stuff).

bye,
//mirabilos
--=20
[DJBDNS Zone] TTL 86400 =E2=80=93 <Natureshadow> kann man da auch 1d sc=
hreiben?
<mirabilos> n=C3=B6, au=C3=9Ferdem kann ein Deutscher oder ein Japaner =
mit 1d
    ja erstmal nix anfangen, oder k=C3=B6nntest du 1=E6=97=A5 im zone f=
ile lesen?
<Natureshadow> das hei=C3=9Ft f=C3=BCr mich: ein Regal, das u.U. schief=
stehen k=C3=B6nnte
