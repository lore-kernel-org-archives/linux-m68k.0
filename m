From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: (fwd) Re: [klibc] Bug#334917: [PATCH] Re: klibc barfs on m68k
 syscall interface
Date: Mon, 31 Jan 2011 22:19:29 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1101312215490.30566@herc.mirbsd.org>
References: <20110131105017.GC4655@stro.at>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:43120 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754113Ab1AaWXD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Jan 2011 17:23:03 -0500
In-Reply-To: <20110131105017.GC4655@stro.at>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: maximilian attems <max@stro.at>
Cc: linux-m68k@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Roman Zippel <zippel@linux-m68k.org>, klibc@zytor.com

maximilian attems dixit:

>It be cool if belows patch could be reviewed by a m68k Maintainer.

I=E2=80=99ve patched mksh to work without job signals, depending on a f=
lag;
while this is not desirable generally, it allows me to run its test
suite. The patch per se is correct, but may be incomplete (i.e. I
still get some failures that pass on i386, where other syscalls or
functions may be involved).

I=E2=80=99ll probably debug and submit more of that later.

>-	blt.l	1f
>+	bcs.l	1f			/* jmp short if _not_ error */

I think this is the one-liner (plus repeating in vfork.S, here by
jumping to the common code) fixing the issue. The rest is=E2=80=A6 well=
=E2=80=A6
don=E2=80=99t hit me=E2=80=A6 me mentally converting the code of klibc =
and eglibc
both to i386 assembly, comparing, mixing, fixing, optimising, and
converting back to m68k assembly =E2=80=93 stylistic flames welcome! (Y=
es,
I mean it. I=E2=80=99m learning this as I go.)

//mirabilos
--=20
22:20=E2=8E=9C<asarch> The crazy that persists in his craziness becomes=
 a master
22:21=E2=8E=9C<asarch> And the distance between the craziness and genia=
lity is
only measured by the success                       22:21=E2=8E=9C<mksh>=
 it=E2=80=99s a
very thin line anyway=E2=80=A6 with some, you don=E2=80=99t know which =
side they=E2=80=99re on
