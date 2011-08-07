From: "Christian T. Steigies" <cts@debian.org>
Subject: Re: watchdog (?) on linux 3.0.0 and 2.6.39.3
Date: Mon, 8 Aug 2011 00:07:44 +0200
Message-ID: <20110807220744.GA5199@chumley.earth.sol>
References: <4E369834.9070707@aalto.fi>
 <alpine.OSX.2.00.1108021532260.256@ibook.intranet>
 <4E3ACFE5.7020901@aalto.fi>
 <CAOmrzkL1ZaWBtYG6uyotwgGzoZLEdafrUCh6qfq-_siNZ9vvdQ@mail.gmail.com>
 <4E3BD9C1.6020209@aalto.fi>
 <4E3C6F8D.7030902@gmail.com>
 <CAMuHMdXeFH-uTw5XWB4_arvj2DfbXrb4q_9BKKhDhxNxwFvmBw@mail.gmail.com>
 <CAOmrzkKRP+mD8zESBHrJYxzVvj1NE4rEA+ATaaD6u4BJOQyV6Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAOmrzkKRP+mD8zESBHrJYxzVvj1NE4rEA+ATaaD6u4BJOQyV6Q@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Tuomas Vainikka <tuomas.vainikka@aalto.fi>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Aug 08, 2011 at 08:01:33AM +1200, Michael Schmitz wrote:
> Hi Geert,
> 
> >> Geert: is the genirq change simple to back out, just for tests?
> >
> > The genirq conversion is not complete, and not yet on the master branch.
> > So it's unrelated.
> 
> Thanks for clarifying - if there had been any major change to the
> Amiga interrupt code I'm sure you would have mentioned.
> 
> Christian - can you remember which 2.6 kernel that last had ethernet
> working for you?

I haven't been testing kernels a lot recently... from the logfiles it would
seem the last kernel that was running on kullervo was this one:

Linux version 2.6.24-1-amiga (Debian 2.6.24-4) (waldi@debian.org) (gcc version 3.3.6) #1 Tue Feb 12 10:05:37 CET 2008

I think the kernel from Stephens d-i image was working also, but I have not
tested that intensively, only for installing from scratch. In May I wrote
this was:

Linux kullervo 2.6.26-1-amiga #1 Thu Oct 16 08:59:25 CDT 2008 m68k GNU/Linux

Christian
