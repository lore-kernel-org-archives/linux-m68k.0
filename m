From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 8390 drivers
Date: Sat, 23 Jul 2011 16:03:18 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107231455010.193@ibook.intranet>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com> <20110509213213.GA28675@chumley.earth.sol> <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com> <20110510072928.GA32679@chumley.earth.sol> <20110523204414.GA10664@chumley.earth.sol>
 <alpine.OSX.2.00.1107181901080.145@ibook.local> <alpine.OSX.2.00.1107191754510.189@ibook.intranet> <alpine.OSX.2.00.1107192341160.189@ibook.intranet> <CAOmrzkJXB=2oW8f2h5Cs7CfJMK5LBMz4UQcU5dzfW0=YeW36ug@mail.gmail.com> <alpine.OSX.2.00.1107201304410.189@ibook.intranet>
 <4E2A42D1.4040201@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4E2A42D1.4040201@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: "Christian T. Steigies" <cts@debian.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Sat, 23 Jul 2011, Michael Schmitz wrote:

> Duplicate symbols should have been reported at link time (or when a 
> module is inserted, at latest).

I'm not so sure. If I change "mac8390.o" to "mac8390.o 8390.o" in 
drivers/net/Makefile, I get some compiler warnings but that's all. (I 
didn't try booting it. Also mac8390 is built-in -- apparently it doesn't 
do modular).

> > Yes, but if the NIC works with idle disk and fails with SCSI load, 
> > would you not blame the VIA driver?
> >   
> Not necessarily - there may be a driver locking out interrupts for too 
> long so the timeout happens before the interrupt gets serviced. Not very 
> likely - the timeout would have to run before the net bottom half.

If that were the kind of bug affecting Christian's machine, it seems 
unlikely that it would show up on a Mac. But I will add disk I/O to the 
stress test and report anything relevant.

> > I guess there are benefits to each approach? I assume that linking to 
> > 8390.o, though simpler, would end up slower (?)
> >   
> That, and it ends up not using net_ops in the driver at all. Obsolete 
> interface ...

hydra.c, zorro8390.c, 8390.c and 8390p.c all have have net_device_ops 
structs these days. I think everything got converted a year or so back.

Finn
