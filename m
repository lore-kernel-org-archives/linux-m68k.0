From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH v2 4/4] m68k/atari: fix SCC initialization for debug
 console
Date: Tue, 27 May 2014 23:20:04 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1405272232070.4667@nippy.intranet>
References: <alpine.LNX.2.00.1405262326290.13815@nippy.intranet> <CAOmrzkLw1r+QUxqxQUKEwewtnWRmJknYCzLzf29Tq_TsjK-RyQ@mail.gmail.com> <alpine.LNX.2.00.1405271047450.14863@nippy.intranet> <CAOmrzkLLNeCgFsam+e0_nBKRGhjpFv=bv_eT0wp8R=o4z8D0QQ@mail.gmail.com>
 <alpine.LNX.2.00.1405271306310.14863@nippy.intranet> <538444D8.9000805@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:38054 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751936AbaE0NVR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 27 May 2014 09:21:17 -0400
In-Reply-To: <538444D8.9000805@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 27 May 2014, Michael Schmitz wrote:

> >
> > Problem: bdtab_norm[] above specifies { CLK_RTxC, 24 } for 9600 baud. 
> > This doesn't make sense. Perhaps the logic in SCC_ioctl() in 
> > Atari_SCC.c fixes it up for speeds specified by the user? Who knows.
> >   
> 
> That ends up using time constant 10 and mode 16 as per your calculation 
> for 3.67 MHz clock input - 9562 baud instead of the 9680 possible from 
> the 8 MHz clock.

Yes, I see now. This code is confusing.

> I might have misunderstood something - would really want to check that 
> using a scope.
> 
> Both appear to work OK, so no matter really.

And besides, there's no need to change the baud rate until someone 
#defines USE_SCC_[AB] and then gets annoyed with 9600 baud.

-- 
