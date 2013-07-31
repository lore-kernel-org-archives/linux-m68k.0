From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: linux 3.10.1 with initrd
Date: Wed, 31 Jul 2013 11:57:59 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1307311155280.14681@herc.mirbsd.org>
References: <alpine.DEB.2.02.1305132122190.14304@tglase.lan.tarent.de>
 <CAMuHMdX+t0=J+8a1JoF6Jf=gO_ROuL_kgAVjF0DJA-cgPGp_Ng@mail.gmail.com>
 <Pine.BSM.4.64L.1305132126170.11828@herc.mirbsd.org> <5192331E.9010009@debian.org>
 <Pine.BSM.4.64L.1305141338580.14676@herc.mirbsd.org> <20130514144112.GH11842@chumley.earth.sol>
 <Pine.BSM.4.64L.1305141642360.9568@herc.mirbsd.org>
 <Pine.BSM.4.64L.1307201716460.31890@herc.mirbsd.org>
 <CAMuHMdVj_xZWYc1Cszun0F6Xrrz0=e_EJN4b1cqdbcRqgC7ABg@mail.gmail.com>
 <20130731090107.GA22608@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:16311 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098Ab3GaMGM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 31 Jul 2013 08:06:12 -0400
In-Reply-To: <20130731090107.GA22608@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Christian T. Steigies dixit:

>Not sure if this is the correct thread, but crest is working with your=
 new
>kernel, without using a memfile!

Yesss! Cool! Thanks for confirming!

>The only thing that does not work seems to
>be nfs so far...

Did you load all relevant modules? We=E2=80=99re _heavily_ modularised =
now.

>Is gcc-4.8 now the default compiler for all buildds?

Since gcc-defaults_1.122 or something like that, gcc-4.8 is the
default for the m68k platform as for all others. We have one
default gcc version per Debian architecture, not per buildd,
which is also what regular _users_ get when they install e.g.
the gcc or gobjc package. Ideally we=E2=80=99d even have only one defau=
lt
compiler in all of Debian=E2=80=A6

Anyway, the switch was overdue, and gcc-4.7 wasn=E2=80=99t really teste=
d
either and Doko said he=E2=80=99d remove gcc-4.6 soon (maybe except GNA=
T).

bye,
//mirabilos
--=20
13:22=E2=8E=9C=C2=ABneurodamage=C2=BB mira, what's up man? I have a CVS=
 question for you in #cvs
13:22=E2=8E=9C=C2=ABneurodamage=C2=BB since you're so good w. it =E2=94=
=82 =C2=ABneurodamage:#cvs=C2=BB i love you
13:28=E2=8E=9C=C2=ABneurodamage:#cvs=C2=BB you're a handy guy to have a=
round for systems stuff =E2=98=BA
16:06=E2=8E=9C<Draget:#cvs> Thank god I found you =3D)   20:03=E2=94=82=
=C2=ABbioe007:#cvs=C2=BB mira2k: ty
17:14=E2=8E=9C<ldiain:#cvs> Thanks big help you are :-)   <bioe007> mir=
a|nwt: ty again
18:35=E2=8E=9C=C2=ABalturiak:#cvs=C2=BB mirabilos: aw, nice. thanks :o
18:36=E2=8E=9C=C2=ABThunderChicken:#cvs=C2=BB mirabilos FTW!  23:03=E2=8E=
=9C=C2=ABmithraic:#cvs=C2=BB aaah. thanks
18:41=E2=8E=9C=C2=ABalturiak:#cvs=C2=BB phew. thanks a bunch, guys. you=
 just made my weekend :-)
18:10=E2=8E=9C=C2=ABsumit:#cvs=C2=BB mirabilos: oh ok.. thanks for that
21:57=E2=8E=9C<bhuey:#cvs> yeah, I really appreciate help
18:50=E2=8E=9C=C2=ABgrndlvl:#cvs=C2=BB thankyou            18:50=E2=8E=9C=
=C2=ABgrndlvl:#cvs=C2=BB worked perfectly
20:50=E2=8E=9C<paolo:#cvs> i see. mirabilos, thnks for your support
00:36=E2=8E=9C=C2=ABhalirutan:#cvs=C2=BB ok, the obvious way:-) thx
18:44=E2=8E=9C=C2=ABarcfide:#cvs=C2=BB mirabilos, I am running OpenBSD.=
     18:59=E2=8E=9C=C2=ABarcfide:#cvs=C2=BB
Hrm, yes, I see what you mean. 19:01=E2=8E=9C=C2=ABarcfide:#cvs=C2=BB Y=
eah, thanks for the help.
21:33=E2=8E=9C=C2=ABCardinalFang:#cvs=C2=BB Ugh.  Okay.  Sorry for the =
dumb question.  Thank you
21:34=E2=8E=9C<centosian:#cvs> mirabilos: whoa that's sweet
21:52=E2=8E=9C=C2=ABgarrett__:#cvs=C2=BB much appreciated  =C2=ABgarret=
t__:#cvs=C2=BB thanks for your time
23:39=E2=8E=9C<symons:#cvs> this worked, thank you very much 16:26=E2=8E=
=9C<schweizer:#cvs> ok
thx, i'll try that     20:00=E2=8E=9C=C2=ABstableable:#cvs=C2=BB Thank =
you.    20:50=E2=8E=9C=C2=ABs833:#cvs=C2=BB
mirabilos: thanks a lot.        19:34=E2=8E=9C<bobbytek:#cvs> Thanks fo=
r confirming :)
20:08=E2=8E=9C<tsolox:#cvs> ...works like a charm.. thanks mirabilos
