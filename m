From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 21:31:01 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811051852060.23823@loopy.telegraphics.com.au>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info>
 <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org> <20081104200600.GA32663@cynthia.pants.nu>
 <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:58367 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754752AbYKEKbE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 05:31:04 -0500
In-Reply-To: <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Juran <jjuran@gmail.com>
Cc: Brad Boyer <flar@allandria.com>, Riccardo <riccardo@kaffe.org>, Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org



On Tue, 4 Nov 2008, Joshua Juran wrote:

> On Nov 4, 2008, at 12:06 PM, Brad Boyer wrote:
> 
> >On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
> >
> >Hopefully there's a logical way to detect this upgrade, but it would be 
> >interesting to know if the update changes the gestalt ID.
> 
> You would detect an upgraded ROM by reading the ROM, I imagine.

Good point. But I think we'd need the ROM base to be supplied by Penguin? 
Or even just the ROM checksum.

> In Genie, it's at /sys/mac/rom.
> By the way, does anyone know how to calculate a ROM checksum, or will I 
> have to reverse-engineer CopyROM or somesuch?

I assumed that CopyROM etc did not validate anything, they just reported 
the checksum contained in the ROM (first 4 bytes). The code must be part 
of the POST though, since a bad rom checksum is a sad mac error. So you 
could reverse engineer that. But IIRC there is a card ROM checksum 
algorithm given in Designing Card and Drivers for the Mac II and Mac SE. 
It's probably the same algorithm. I don't have access to my copy at the 
moment.

Finn

> 
> Josh
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
