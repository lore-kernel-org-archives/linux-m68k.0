From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC v4 03/25] m68k/atari: Move Atari-specific code out of
 drivers/char/nvram.c
Date: Sat, 25 Jul 2015 11:00:20 +1000
Message-ID: <1437786020.19730.2.camel@ellerman.id.au>
References: <20150712102527.356151908@telegraphics.com.au>
	 <20150712102528.107134628@telegraphics.com.au> <87d1zwc4dj.fsf@igel.home>
	 <alpine.LNX.2.00.1507141804300.1622@nippy.intranet>
	 <55AF1364.3080701@gmail.com>
	 <alpine.LNX.2.00.1507221421100.4187@nippy.intranet>
	 <20150723092114.GA10989@guido.earth.sol>
	 <CAOmrzkL1rOV=9zu=sfpt4-oveR2j-_KVGYvCvCGWzj83oOihnw@mail.gmail.com>
	 <20150724190749.GA7529@guido.earth.sol>
	 <alpine.LNX.2.00.1507251023410.10487@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35552 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754516AbbGYBAW (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 24 Jul 2015 21:00:22 -0400
In-Reply-To: <alpine.LNX.2.00.1507251023410.10487@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: "Christian T. Steigies" <cts@debian.org>, Michael Schmitz <schmitzmic@gmail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Andreas Schwab <schwab@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Sat, 2015-07-25 at 10:35 +1000, Finn Thain wrote:
> On Fri, 24 Jul 2015, Christian T. Steigies wrote:
> > 3b5801864975cf23bcacb52f648e74cc  /dev/nvram
> > 3b5801864975cf23bcacb52f648e74cc  /tmp/nvram
> 
> Thanks for helping with this, Christian. I'll add your name in "Tested-by" 
> tags on the relevant patches. These are rudimentary tests but combined 
> with my own testing on m68k, ppc32 and x86, coverage is quite good. Some 
> testing on ppc64 is still lacking though.

*Blush*

I'll try and get to it next week promise!

cheers
