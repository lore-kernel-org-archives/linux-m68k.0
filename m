From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Mon, 8 Aug 2011 12:23:47 +1200
Message-ID: <CAOmrzkK=3e724KQPCWFckxSzm3eYL86f0VnY4vv-AVKRYPevmQ@mail.gmail.com>
References: <4E369834.9070707@aalto.fi>
	<alpine.OSX.2.00.1108021532260.256@ibook.intranet>
	<4E3ACFE5.7020901@aalto.fi>
	<CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com>
	<4E3BD9C1.6020209@aalto.fi>
	<4E3C6F8D.7030902@gmail.com>
	<CAMuHMdXeFH-uTw5XWB4_arvj2DfbXrb4q_9BKKhDhxNxwFvmBw@mail.gmail.com>
	<CAOmrzkKRP+mD8zESBHrJYxzVvj1NE4rEA+ATaaD6u4BJOQyV6Q@mail.gmail.com>
	<20110807220744.GA5199@chumley.earth.sol>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20110807220744.GA5199@chumley.earth.sol>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Finn Thain <fthain@telegraphics.com.au>, Linux/m6

Hi Christian,

>> Christian - can you remember which 2.6 kernel that last had ethernet
>> working for you?
>
> I haven't been testing kernels a lot recently... from the logfiles it would
> seem the last kernel that was running on kullervo was this one:
>
> Linux version 2.6.24-1-amiga (Debian 2.6.24-4) (waldi@debian.org) (gcc version 3.3.6) #1 Tue Feb 12 10:05:37 CET 2008
>
> I think the kernel from Stephens d-i image was working also, but I have not
> tested that intensively, only for installing from scratch. In May I wrote
> this was:
>
> Linux kullervo 2.6.26-1-amiga #1 Thu Oct 16 08:59:25 CDT 2008 m68k GNU/Linux

Thanks, I'll look up the likely commit to start from using 2.6.24
then. I have the .config Tuomas used for his kernel - do you need any
modules built as well, Tuomas?

Cheers,

  Michael
