From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Mon, 15 Aug 2011 08:40:12 +1200
Message-ID: <CAOmrzkKa+veNPYXx+_69=unfo-mZNsv2CP992KBv3ZYhrxxGKw@mail.gmail.com>
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
	<CAMuHMdWf4wnto0Y5u01XDPpSfJeHDPCRV06w1ZWejNHpFs2sAQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdWf4wnto0Y5u01XDPpSfJeHDPCRV06w1ZWejNHpFs2sAQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Christian T. Steigies" <cts@debian.org>, Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,


>> =A0CC [M] =A0drivers/ide/ide-lib.o
>> drivers/ide/ide-lib.c: In function `ide_dump_atapi_status':
>> drivers/ide/ide-lib.c:601: internal compiler error: in
>> verify_local_live_at_start, at flow.c:600
>> Please submit a full bug report,
>> with preprocessed source if appropriate.
>> See <URL:http://gcc.gnu.org/bugs.html> for instructions.
>>
>> I'm sure we've seen that before and it did eventually get fixed.
>
> You can probably work around that by building with "make V=3D1" to sh=
ow
> the compile command,
> and manually executing it with a lower optimization level.

I actually had to add -O0 to the EXTRA_CFLAGS in drivers/ide/Makefile
- otherwise I'd manually compile it OK once, and the subsequent make
command would attempt to compile it again (with -Os).

Thanks,

  Michael
