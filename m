From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Sun, 14 Aug 2011 10:29:42 +0200
Message-ID: <CAMuHMdWf4wnto0Y5u01XDPpSfJeHDPCRV06w1ZWejNHpFs2sAQ@mail.gmail.com>
References: <4E369834.9070707@aalto.fi>
	<alpine.OSX.2.00.1108021532260.256@ibook.intranet>
	<4E3ACFE5.7020901@aalto.fi>
	<CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com>
	<4E3BD9C1.6020209@aalto.fi>
	<4E3C6F8D.7030902@gmail.com>
	<CAMuHMdXeFH-uTw5XWB4_arvj2DfbXrb4q_9BKKhDhxNxwFvmBw@mail.gmail.com>
	<CAOmrzkKRP+mD8zESBHrJYxzVvj1NE4rEA+ATaaD6u4BJOQyV6Q@mail.gmail.com>
	<20110807220744.GA5199@chumley.earth.sol>
	<4E474E7D.2000405@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E474E7D.2000405@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: "Christian T. Steigies" <cts@debian.org>, Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Sun, Aug 14, 2011 at 06:26, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>>> Christian - can you remember which 2.6 kernel that last had etherne=
t
>>> working for you?
>>>
>>
>> I haven't been testing kernels a lot recently... from the logfiles i=
t
>> would
>> seem the last kernel that was running on kullervo was this one:
>>
>> Linux version 2.6.24-1-amiga (Debian 2.6.24-4) (waldi@debian.org) (g=
cc
>> version 3.3.6) #1 Tue Feb 12 10:05:37 CET 2008
>>
>
> Plain 2.6.24 from Geert's tree does show TX timeouts again - no watch=
dog
> firing this time because IDE wasn't even built as module (something c=
ause
> make oldconfig to drop all IDE stuff when starting from Tuomas' .conf=
ig).
>
> Speaking of which - I cannot even build IDE at all in that release:
>
> =C2=A0CC [M] =C2=A0drivers/ide/ide-lib.o
> drivers/ide/ide-lib.c: In function `ide_dump_atapi_status':
> drivers/ide/ide-lib.c:601: internal compiler error: in
> verify_local_live_at_start, at flow.c:600
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://gcc.gnu.org/bugs.html> for instructions.
>
> I'm sure we've seen that before and it did eventually get fixed.

You can probably work around that by building with "make V=3D1" to show
the compile command,
and manually executing it with a lower optimization level.

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
