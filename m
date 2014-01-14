From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] m68k/mac: Make SCC reset work more reliably
Date: Tue, 14 Jan 2014 19:31:40 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1401141907220.12677@nippy.intranet>
References: <alpine.LNX.2.00.1401122320210.21591@nippy.intranet> <CAMuHMdXtAzA_UPJS_OaMSSxGE493uqGGCNVwy_RMrNoPBxxmDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:42831 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750949AbaANIcu (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Jan 2014 03:32:50 -0500
In-Reply-To: <CAMuHMdXtAzA_UPJS_OaMSSxGE493uqGGCNVwy_RMrNoPBxxmDw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>


On Mon, 13 Jan 2014, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Sun, Jan 12, 2014 at 2:56 PM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> > For SCC initialization we cannot assume that the control register is 
> > in the correct state to accept a register pointer. So first read from 
> > the control register in order to "sync" up.
> >
> > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> 
> Thaks for your patch!
> 
> > ---
> >

> > This patch fixes a boot failure (presumably caused by unhandled SCC 
> > interrupt) on PowerBook 180 with CONFIG_EARLY_PRINTK and with the 
> > bootloader not configured to wake up the serial ports.

> > AFAIK this happens only on PowerBooks. Even with this fix, Penguin 
> > still has to wake the serial ports or else they don't function on 
> > PowerBooks like this one.

> 
> IMHO the above should be part of the patch description (i.e. above the 
> three dashes), as it contains valuable information. Is that OK for you?

The first part is good information, especially if this were submitted to 
-stable.

The rest, beginning with "AFAIK", is really guesswork based on anecdote 
(e.g. reports from users not affected). Even the mailing list archives are 
perhaps too permanent (e.g. the need for the wake-up workaround may go 
away one day).

I'm unsure about submitting this to -stable. I don't like the idea that 
the first debian user to boot a powerbook might see a crash (depending on 
bootloader etc). But not all stable trees carry df66834a which is a 
prerequisite. This patch is only applicable to 3.4.y and >= 3.9.y. Can you 
nominate particular stable trees?

Finn
