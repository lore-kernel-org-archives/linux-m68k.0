From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Wed, 20 Jul 2011 12:32:44 +1200
Message-ID: <CAOmrzkJXB=2oW8f2h5Cs7CfJMK5LBMz4UQcU5dzfW0=YeW36ug@mail.gmail.com>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com>
	<20110509213213.GA28675@chumley.earth.sol>
	<BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com>
	<20110510072928.GA32679@chumley.earth.sol>
	<20110523204414.GA10664@chumley.earth.sol>
	<alpine.OSX.2.00.1107181901080.145@ibook.local>
	<alpine.OSX.2.00.1107191754510.189@ibook.intranet>
	<alpine.OSX.2.00.1107192341160.189@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1107192341160.189@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "Christian T. Steigies" <cts@debian.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Finn,

On Wed, Jul 20, 2011 at 1:55 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
>
> On Tue, 19 Jul 2011, I wrote:
>
>>
>> I tested 2.6.29 and mac8390 fails like 2.6.39 in this system. This also
>> required a backport of the patch discussed earlier in this thread, since
>> 2.6.29 has commit ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc.
>>
>> I also tested 2.6.19 which pre-dates that commit, and it too failed in
>> the same way.
>>
>> Anyway, the mac8390 driver issue here may be unrelated to your zorro8390
>> bug (and may simply be a quirk of this particular card).
>
> It turns out that the mac8390 issue is unrelated. The cause was the old
> nubus interrupt problem. I worked around it and after that the driver
> passed a 1 hour smoke test (several simultaneous ping floods running
> locally and remotely with neglible packet loss).
>
> So, what's the difference between mac8390 and zorro8390? In the mac8390
> case, there is only one way for lib8390.c symbols to end up in the link,
> and that is mac8390.
>
> On amiga, it is a different story: there's at least apne, zorro8390 and
> the ISA NE-2000 drivers that could be pulling in these symbols. So I think
> you should try this patch, which takes the same approach that's used in
> ax88796.c.

Is lib8390.c ever compiled standalone (as opposed to it being included
in each driver)? Either way, to avoid multiple inclusion of lib8390
symbols confusing the zorro8390 driver, Christian could disable the
apne and eventual other ISA 8390 drivers in the build.

If that's not helping, something in the Amiga interrupt code may be at
fault. Your Mac driver withstands a flood ping OK (that still leaves
you open to concurrent net and disk I/O presenting a problem BTW -
transferring a big amount of data using netcat might be a better
approximation of Christian's problem). The Atari EtherNEC driver has
withstood 15 minutes of single-source flooding with a single log
message:

Jul 20 02:26:24 hobbes kernel: eth0: bogus packet: status=0x37
nxpg=0x4f size=102

I've seen that quite a bit when transferring files in the past, but it
never stopped the driver from working.

The main difference between the EtherNEC driver and the other 8390
drivers is that I still link to 8390.o explicitly, instead of
including lib8390.c (shame on me).

Cheers,

  Michael
