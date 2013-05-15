From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: m68k-queue
Date: Wed, 15 May 2013 18:47:39 +1000 (EST)
Message-ID: <alpine.LNX.2.00.1305151727470.10554@nippy.intranet>
References: <CAMuHMdVdP2kyb3hD4H4hyY8O30QJwdHdJ+R9p-ujVncwHCCTLA@mail.gmail.com> <5191FC4C.8010707@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:35402 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758208Ab3EOI6B (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 15 May 2013 04:58:01 -0400
In-Reply-To: <5191FC4C.8010707@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>


On Tue, 14 May 2013, schmitz wrote:

> >   - mac: ADB raw packets
> >     I guess this can be dropped?

Geert, you should drop this patch, because there are no other patches in 
your queue that use ADBREQ_RAW and because it seems to be broken (the idea 
of sending a raw packet using adb_request() was apparently to permit 
req->data[0] != ADB_PACKET). Also it seems to have become obsolete back in 
2006.

> 
> I'd guess so - I struggle to recall what this was for. Perhaps to talk 
> to the clock chip on some Macs.

I went digging in the mac68k repo. ADBREQ_RAW shows up here:

    "Latest ADB changes including the new 68k PMU driver."
    http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/macintosh/adb.c?r1=1.15&r2=1.16&

    "Added Baboon interrupt support.
    Moved all time and PRAM-related functions into misc.c."
    http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/arch/m68k/mac/misc.c?r1=1.4&r2=1.5&

You are right, ADBREQ_RAW was clearly PRAM and clock related.

And this seems to indicate roughly when it got broken:

    "Merge with 2.4.0 release."
    http://linux-mac68k.cvs.sourceforge.net/viewvc/linux-mac68k/linux-mac68k/drivers/macintosh/adb.c?r1=1.21&r2=1.22

Anyway, in mainline kernels, adb_request() was not called from the PRAM 
and clock related code since 2006 when Al Viro got that code to build 
again:

    https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/arch/m68k/mac/misc.c?id=3272244c2b1a8f13cec83c04b8245fa7fcb47a27

Finn
