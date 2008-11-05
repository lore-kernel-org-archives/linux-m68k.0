From: Riccardo <riccardo@kaffe.org>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 01:58:48 +0100
Message-ID: <E7AD906F-AAD4-11DD-9F63-00050249ADE1@kaffe.org>
References: <20081104200600.GA32663@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v553)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cp-out9.libero.it ([212.52.84.109]:59359 "EHLO
	cp-out9.libero.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753554AbYKEA7G (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Nov 2008 19:59:06 -0500
In-Reply-To: <20081104200600.GA32663@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org


On Tuesday, November 4, 2008, at 09:06  PM, Brad Boyer wrote:

> On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
>> I have a mac II, but I upgraded the SWIM chip, IIRC. I think I 
>> upgraded
>> only one of the two drives to high density, but that shouldn't affect
>> you I suppose, since the problem would be the chip. I'll look in my
>> spare parts bin.
>
> I'm curious about how the chip update appears on the II. Does this 
> system
> now show up as a IIx? My understanding is that the upgrade kit included
> a new set of ROM chips that include the same bits as the ones from the 
> IIx.
> Hopefully there's a logical way to detect this upgrade, but it would be
> interesting to know if the update changes the gestalt ID.

Under Mac 7.1 it gets definitively recognized as Mac II. I definitively 
have a SWIM, since one of my two floppies reads HD disks, I checked

Penguin says my  gestalt is 6, Mac II

A clue for the MacII is the 68020 CPU + FPU + MMU, AFAIK the only apple 
machine with these specs.

I tried to boot a current 2.6.18 kernel just for fun, it goes past the 
letter screen and dumps stack after recognizing the TOBY frame buffer 
card and attempting to init it.

Riccardo

PS: I didn't use this mac since many months, it first stasrted up, but 
then refusedfurther boots with the sad mac sound and no video output. 
REmoving components trying to isolate the problem didn't help. When I 
put al back together with no luck, a last attempt made it boot. Any 
ideas? I see no visible damage on the motherboard, the batteries still 
have some juice left...

