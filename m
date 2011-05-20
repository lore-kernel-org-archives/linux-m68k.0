From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC][PATCH] extable: Make sure all archs define _sdata
Date: Fri, 20 May 2011 16:42:34 +0200
Message-ID: <BANLkTim0jCi-aE2fQ84HfwpD9mAZzfwfaw__13803.8325858817$1305903035$gmane$org@mail.gmail.com>
References: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1305855298.1465.19.camel@gandalf.stny.rr.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, linux-alpha@vger.kernel.org, Hirokazu Takata <takata@linux-m32r.org>, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, Ralf Baechle <ralf@linux-mips.org>, Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>, "JamesE.J.Bottomley" <jejb@parisc-linux.org>

On Fri, May 20, 2011 at 03:34, Steven Rostedt <rostedt@goodmis.org> wro=
te:
> Can I get an Acked-by (or comment) from the following Maintainers:

> =C2=A0m68k

> =C2=A0arch/m68k/kernel/vmlinux-std.lds =C2=A0| =C2=A0 =C2=A02 ++
> =C2=A0arch/m68k/kernel/vmlinux-sun3.lds | =C2=A0 =C2=A01 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
