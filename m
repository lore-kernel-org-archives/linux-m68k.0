From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: 68000 patches (Atari ST platform)
Date: Fri, 16 Sep 2011 08:20:56 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1109160817420.5206@herc.mirbsd.org>
References: <20110911230920.GA1541@matze-K8NF4G-SATA2>
 <CAOmrzk+sqAzh48zXOKQ06iRhceJMTZvPJiDDTASgmT1Qv1B-7Q@mail.gmail.com>
 <loom.20110915T134159-512@post.gmane.org>
 <CAOmrzkKX7SjVfT4f4yg+t1JmcumNCTNS5m87-b-92gaQsNRKnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:16056 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753993Ab1IPInx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Sep 2011 04:43:53 -0400
Received: from herc.mirbsd.org (tg@localhost [IPv6:::1])
	by herc.mirbsd.org (8.14.5.Beta0/8.14.5.Beta0) with ESMTP id p8G8KwIo020653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-m68k@vger.kernel.org>; Fri, 16 Sep 2011 08:21:03 GMT
In-Reply-To: <CAOmrzkKX7SjVfT4f4yg+t1JmcumNCTNS5m87-b-92gaQsNRKnA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
Cc: linux-m68k@vger.kernel.org

Michael Schmitz dixit:

>> Ah, there they are ;) I=EF=BF=BDve NMU=EF=BF=BDd the m68k bootstraps=
 (Atari, Amiga, VMS,
>
>I don't think VMS was m68k based :-) VME is what we have.

Yeah, obvious typo =E2=98=BA

>The code doesn't change very fast if at all so the packaging doesn't
>need to.

Debian changes, though=E2=80=A6 not much, and not fast, but it does.

>place the kernel in FastRAM. Never got the cross compiler setup sorted
>out.

Maybe this helps?
	deb https://www.freewrt.org/~tg/debs68k/ cross main

That one contains binutils, gcc-4.4, eglibc and linux-libc-dev stuff
for cross-compiling from sid/amd64 to sid/m68k.

>Geert has a git clone of the repo so it could be either CVS or git. I
>don't mind either way - a home box would be OK, we just need to make
>sure cvs.linux-m68k points that way.

I can do CVS if I get a dump of the repo (i.e. the ,v files), but
won=E2=80=99t touch that git thingy ;-) I don=E2=80=99t mind either way=
=2E Just an
offer.

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
