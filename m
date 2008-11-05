From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 17:58:51 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811051746550.23115@loopy.telegraphics.com.au>
References: <E7AD906F-AAD4-11DD-9F63-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:54823 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750807AbYKEG6y (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 01:58:54 -0500
In-Reply-To: <E7AD906F-AAD4-11DD-9F63-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Brad Boyer <flar@allandria.com>, Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org



On Wed, 5 Nov 2008, Riccardo wrote:

> 
> On Tuesday, November 4, 2008, at 09:06 PM, Brad Boyer wrote:
> 
> > On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
> > > I have a mac II, but I upgraded the SWIM chip, IIRC. I think I 
> > > upgraded only one of the two drives to high density, but that 
> > > shouldn't affect you I suppose, since the problem would be the chip. 
> > > I'll look in my spare parts bin.
> >
> > I'm curious about how the chip update appears on the II. Does this 
> > system now show up as a IIx? My understanding is that the upgrade kit 
> > included a new set of ROM chips that include the same bits as the ones 
> > from the IIx. Hopefully there's a logical way to detect this upgrade, 
> > but it would be interesting to know if the update changes the gestalt 
> > ID.
> 
> Under Mac 7.1 it gets definitively recognized as Mac II. I definitively 
> have a SWIM, since one of my two floppies reads HD disks, I checked
> 
> Penguin says my gestalt is 6, Mac II
> 
> A clue for the MacII is the 68020 CPU + FPU + MMU, AFAIK the only apple 
> machine with these specs.

One way around this (if we can't probe for SWIM vs. IWM), is install "I 
Wish I Were" and set the Gestalt ID to 7 (Mac IIx). It works on my Daystar 
'030 Mac II; it may work for you too.

> I tried to boot a current 2.6.18 kernel just for fun, it goes past the 
> letter screen and dumps stack after recognizing the TOBY frame buffer 
> card and attempting to init it.

I've seen this with more recent kernels. Not sure about 2.6.18. It happens 
because a proc file is registered twice by the nubus probe code. It is 
only a cosmetic problem, but I have been working on a patch for it.

You may want to try Stephen's daily build,

http://people.debian.org/~smarenka/m68k/kernel/linux-image-2.6.26-1-mac_2.6.26-9_m68k.deb

> 
> Riccardo
> 
> PS: I didn't use this mac since many months, it first stasrted up, but 
> then refusedfurther boots with the sad mac sound and no video output. 
> REmoving components trying to isolate the problem didn't help. When I 
> put al back together with no luck, a last attempt made it boot. Any 
> ideas? I see no visible damage on the motherboard, the batteries still 
> have some juice left...

My machine does that sometimes too. I blame the aging 
powersupply/capacitors (either too slow to reach a stable voltage or too 
quick to come out of reset) but I'm guessing.

Finn

> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
