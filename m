From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Wed, 20 Jul 2011 13:36:47 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107201304410.189@ibook.intranet>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com> <20110509213213.GA28675@chumley.earth.sol> <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com> <20110510072928.GA32679@chumley.earth.sol> <20110523204414.GA10664@chumley.earth.sol>
 <alpine.OSX.2.00.1107181901080.145@ibook.local> <alpine.OSX.2.00.1107191754510.189@ibook.intranet> <alpine.OSX.2.00.1107192341160.189@ibook.intranet> <CAOmrzkJXB=2oW8f2h5Cs7CfJMK5LBMz4UQcU5dzfW0=YeW36ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAOmrzkJXB=2oW8f2h5Cs7CfJMK5LBMz4UQcU5dzfW0=YeW36ug@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: "Christian T. Steigies" <cts@debian.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Wed, 20 Jul 2011, Michael Schmitz wrote:

> Is lib8390.c ever compiled standalone (as opposed to it being included
> in each driver)?

That probably depends on Christian's .config (I don't know how modularity 
affects things) but in general yes: apne.c links in 8390.o. (Whereas hydra 
and zorro8390 #include the library.)

> Either way, to avoid multiple inclusion of lib8390 symbols confusing the 
> zorro8390 driver, Christian could disable the apne and eventual other 
> ISA 8390 drivers in the build.

If he did that instead of testing the patch, and fixed the problem, he 
would then have to perform another test for the same patch, no?

> 
> If that's not helping, something in the Amiga interrupt code may be at 
> fault. Your Mac driver withstands a flood ping OK (that still leaves you 
> open to concurrent net and disk I/O presenting a problem BTW - 
> transferring a big amount of data using netcat might be a better 
> approximation of Christian's problem).

Yes, but if the NIC works with idle disk and fails with SCSI load, would 
you not blame the VIA driver?

Anyway, I shall try that test before I send the patch for the VIA driver 
to fix the nubus slot IRQ issue.

> The Atari EtherNEC driver has withstood 15 minutes of single-source 
> flooding with a single log message:
> 
> Jul 20 02:26:24 hobbes kernel: eth0: bogus packet: status=0x37
> nxpg=0x4f size=102
> 
> I've seen that quite a bit when transferring files in the past, but it
> never stopped the driver from working.
> 
> The main difference between the EtherNEC driver and the other 8390 
> drivers is that I still link to 8390.o explicitly, instead of including 
> lib8390.c (shame on me).

I guess there are benefits to each approach? I assume that linking to 
8390.o, though simpler, would end up slower (?)

Finn

> 
> Cheers,
> 
>   Michael
