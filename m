From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/9] arch/m68k{,nommu}: Removing dead SMP config option
Date: Mon, 13 Sep 2010 20:14:01 +0200
Message-ID: <AANLkTin=DKXUddwqxRP-iXhaYptc=ounfN88O5R8OShk@mail.gmail.com>
References: <cover.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
	<86fd3a30b5cce0a637243e822e96f5bc76269670.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:61253 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754457Ab0IMSOB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Sep 2010 14:14:01 -0400
In-Reply-To: <86fd3a30b5cce0a637243e822e96f5bc76269670.1280924671.git.qy03fugy@stud.informatik.uni-erlangen.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Christian Dietrich <qy03fugy@stud.informatik.uni-erlangen.de>
Cc: Roman Zippel <zippel@linux-m68k.org>, John Stultz <johnstul@us.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Sam Creasey <sammy@sammy.net>, Greg Ungerer <gerg@uclinux.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Joe Perches <joe@perches.com>, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, vamos-dev@i4.informatik.uni-erlangen.de

On Wed, Aug 4, 2010 at 14:41, Christian Dietrich
<qy03fugy@stud.informatik.uni-erlangen.de> wrote:
> CONFIG_SMP doesn't exist in Kconfig (for this architecure), therefore
> removing all references to it from the source.
>
> Signed-off-by: Christian Dietrich <qy03fugy@stud.informatik.uni-erlan=
gen.de>

Applied

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
