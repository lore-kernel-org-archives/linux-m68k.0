From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [patch] m68k, mm: set all online nodes in N_NORMAL_MEMORY
Date: Mon, 25 Apr 2011 14:22:00 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1104251419250.13600@herc.mirbsd.org>
References: <1303317178.2587.30.camel@mulgrave.site>
 <alpine.DEB.2.00.1104201410350.31768@chino.kir.corp.google.com>
 <20110421220351.9180.A69D9226@jp.fujitsu.com>
 <alpine.DEB.2.00.1104211237250.5829@chino.kir.corp.google.com>
 <alpine.DEB.2.00.1104211500170.5741@router.home>
 <alpine.DEB.2.00.1104211411540.20201@chino.kir.corp.google.com>
 <alpine.DEB.2.00.1104211501470.20201@chino.kir.corp.google.com>
 <4DB3840F.3060503@gmail.com> <BANLkTi=vm-qs48-JySCpv+YHyC+9sO9U0A@mail.gmail.com>
 <Pine.BSM.4.64L.1104241131460.8787@herc.mirbsd.org> <4DB4DF5F.809@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:2215 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753131Ab1DYO1h convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 25 Apr 2011 10:27:37 -0400
In-Reply-To: <4DB4DF5F.809@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: KOSAKI Motohiro <kosaki.motohiro@gmail.com>, David Rientjes <rientjes@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, schwab@linux-m68k.org

Michael Schmitz dixit:

> Thought so. That's fine actually. Your cross toolchain will be a lot =
more
> recent than mine.

Just these tools in the exact versions I=E2=80=99d use natively, too:

binutils-m68k-linux-gnu 2.21.51.20110419-2
gcc-4.4-m68k-linux-gnu 4.4.6-2+m68k.1

>> So, which of these do you guys want?
>> =20
> Whatever is cleaner and easier to understand. I'm a poor judge of cod=
e
> elegance.

I=E2=80=99d say the =E2=80=9Ccorrecter=E2=80=9D one, if m68k would have=
 to care about
memoryless nodes in the future (not sure whether it=E2=80=99s possible
for that to happen). But I=E2=80=99ve added your two-liner to Debian no=
w.

bye,
//mirabilos
--=20
13:47=E2=8E=9C<tobiasu> if i were omnipotent, i would divide by zero
                all day long ;)
(thinking about http://lobacevski.tumblr.com/post/3260866481 by waga)
