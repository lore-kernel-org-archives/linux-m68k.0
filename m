From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: 8390 drivers (was: Re: Debian kernel 2.6.38-5)
Date: Tue, 19 Jul 2011 21:31:49 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1107191754510.189@ibook.intranet>
References: <BANLkTimG+3jqLiLaA_NVEpGg3LFtvK4bQQ@mail.gmail.com> <20110509213213.GA28675@chumley.earth.sol> <BANLkTik27HjWOF0s5HRqgva5zYzQRis27Q@mail.gmail.com> <20110510072928.GA32679@chumley.earth.sol> <20110523204414.GA10664@chumley.earth.sol>
 <alpine.OSX.2.00.1107181901080.145@ibook.local>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.OSX.2.00.1107181901080.145@ibook.local>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "Christian T. Steigies" <cts@debian.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>


On Mon, 18 Jul 2011, I wrote:

> I've not tested any older kernels yet but I'll try that next.

I tested 2.6.29 and mac8390 fails like 2.6.39 in this system. This also 
required a backport of the patch discussed earlier in this thread, since 
2.6.29 has commit ca17584bf2ad1b1e37a5c0e4386728cc5fc9dabc.

I also tested 2.6.19 which pre-dates that commit, and it too failed in the 
same way.

Anyway, the mac8390 driver issue here may be unrelated to your zorro8390 
bug (and may simply be a quirk of this particular card).

It might be useful to know whether an older kernel works for you.

Likewise it would be useful to test the apne driver (Amiga PCMCIA NE-2000 
NIC).

I don't have the hardware for that either.

Finn
