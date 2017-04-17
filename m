From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 00/10] mac68k: Miscellaneous fixes, cleanup and
 modernization
Date: Mon, 17 Apr 2017 11:50:27 +1000 (AEST)
Message-ID: <alpine.LNX.2.00.1704171150090.15400@nippy.intranet>
References: <cover.1491695243.git.fthain@telegraphics.com.au> <CAMuHMdUU8DYj-TKPCbjMCiCt5KrAi4ciTw9F=iL7eJ2shf9s=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51556 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932128AbdDQBuV (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 16 Apr 2017 21:50:21 -0400
In-Reply-To: <CAMuHMdUU8DYj-TKPCbjMCiCt5KrAi4ciTw9F=iL7eJ2shf9s=g@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org


On Sun, 16 Apr 2017, Geert Uytterhoeven wrote:

> Hi Finn,
> 
> On Sun, Apr 9, 2017 at 1:51 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> > This series has various patches from several different people. Two 
> > printk modernization patches were originally from Geert Uytterhoeven 
> > and three Nubus patches were originally committed to the Linux/mac68k 
> > CVS by David Huggins-Daines.
> 
> Thanks, most of them look sane enough to apply and still queue for 
> v4.12.
> 
> I'm a bit reluctant about the nubus changes (patches 6 and 8), though. 
> Do you think they need more testing?
> 
> Thanks!

Patch 6 is partly dead code removal. In principle, this patch is a 
reversion to the old code (pre-v2.3.17). The old code was thoroughly 
tested in Debian Sarge. I suppose a reviewer might wonder whether we want 
to keep new code for probing fake slot resources in Apple's on-board ROMs. 
That would be useful if it could eliminate the macintosh_config struct. 
But it can't, and we don't want both mechanisms. Hence the reversion in 
the mac68k CVS.

Patch 8 changes the pointer validation code and although this has been 
tested on the valid path, you are right that it could use some negative 
testing. But that would seem to require cards with flawed ROMs. I don't 
know of any of such cards. So I think that all we can do is more review.

Maybe Michael or Laurent would be willing to review these two patches?

-- 

> 
> > Finn Thain (10):
> >   m68k/mac: IOP - Modernize printing of kernel messages
> >   m68k/mac: Modernize printing of kernel messages
> >   m68k/mac: Adopt platform_device_register_simple()
> >   m68k/mac: Clarify IOP message alloc/free confusion
> >   nubus: Fix nubus_rewinddir (from mac68k CVS)
> >   nubus: Remove slot zero probe (from mac68k CVS)
> >   nubus: Clean up printk calls (from mac68k CVS)
> >   nubus: Fix pointer validation
> >   nubus: Clean up whitespace
> >   nubus: Add MVC and VSC video card definitions
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
