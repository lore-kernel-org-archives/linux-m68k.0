From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH 11/14] nubus: Repopulate /proc/bus/nubus/s/
Date: Tue, 14 Nov 2017 11:21:29 +1100 (AEDT)
Message-ID: <alpine.LNX.2.00.1711141020480.3@nippy.intranet>
References: <cover.1510377368.git.fthain@telegraphics.com.au> <51c5a1526bbf522bbb76d6a71040c220e7e72a8a.1510377369.git.fthain@telegraphics.com.au> <CAMuHMdUCWzmGNyPp0OV-XFvtyTcxCgW-eLKdxnkd0gg_rGToVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:51448 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751113AbdKNAV2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Nov 2017 19:21:28 -0500
In-Reply-To: <CAMuHMdUCWzmGNyPp0OV-XFvtyTcxCgW-eLKdxnkd0gg_rGToVw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, 13 Nov 2017, Geert Uytterhoeven wrote:

> On Sat, Nov 11, 2017 at 7:12 AM, Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> 
> > ---
> >  drivers/nubus/nubus.c | 117 +++++++++++++++++++++++++++-------
> >  drivers/nubus/proc.c  | 170 +++++++++++++++++++++++++++++++++++++++++++++++---
> >  include/linux/nubus.h |  35 ++++++++++-
> >  3 files changed, 288 insertions(+), 34 deletions(-)
> 
> Wow, that's much more code added than was removed by "[PATCH 10/14] 
> nubus: Depopulate /proc/bus/nubus/s/":
> 
>  drivers/nubus/proc.c  | 100 --------------------------------------------------
>  include/linux/nubus.h |   1 -
>  2 files changed, 101 deletions(-)
> 

You're right. The new code includes two structs file_operations and there 
is probably some redundancy in this arrangement. I'll see if it can be 
done with one set of file operations methods.

> How much memory is saved by not using the stored representation of slot 
> resource data?
> 

That question might be expressed as "how much RAM would be wasted by 
duplicating the contents of the slot ROM resources in RAM?".

Either way, the answer is hard to estimate because we don't know which 
resources will be accessed via procfs. (Resource IDs that are not known to 
nubus.c are omitted already though they may end up being needed.)

The few resources needed by sysfs are already stored in RAM at a cost of a 
tens of bytes per board. The resources required by drivers are read from 
ROM as needed and I think that's the simplest and cheapest approach for 
procfs too.

> BTW, should 10 and 11 be combined, to avoid a regression during 
> bisection?
> 

Right. There isn't any reason to separate them now. I'll squash them 
together.

Thanks for reviewing.

-- 

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
