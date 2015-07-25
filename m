From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [RFC v4 03/25] m68k/atari: Move Atari-specific code out of
 drivers/char/nvram.c
Date: Sat, 25 Jul 2015 17:27:54 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1507251722580.25996@nippy.intranet>
References: <20150712102527.356151908@telegraphics.com.au> <20150712102528.107134628@telegraphics.com.au> <87d1zwc4dj.fsf@igel.home> <alpine.LNX.2.00.1507141804300.1622@nippy.intranet> <55AF1364.3080701@gmail.com> <alpine.LNX.2.00.1507221421100.4187@nippy.intranet>
 <20150723092114.GA10989@guido.earth.sol> <CAOmrzkL1rOV=9zu=sfpt4-oveR2j-_KVGYvCvCGWzj83oOihnw@mail.gmail.com> <20150724190749.GA7529@guido.earth.sol> <55B2DD88.2090804@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42146 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753590AbbGYH2T (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 25 Jul 2015 03:28:19 -0400
In-Reply-To: <55B2DD88.2090804@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>


On Sat, 25 Jul 2015, Michael Schmitz wrote:

> Hi Christian,
> 
> good to know this worked - for the record (Finn), this is the kernel 
> with Finn's patch applied.

That was v5 of this patch series. I will send that out to the lists now. 
It has some minor changes that relate to powerpc.

Thanks for your help with this, Michael.

Finn

> 
> I'll build the missing LVM module so Christian can run the tests on the 
> unpatched kernel as well.
> 
> Thanks for testing!
> 
>     Michael
> 
> 
