From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Tue, 4 Nov 2008 18:28:50 -0800
Message-ID: <20081105022850.GA3243@cynthia.pants.nu>
References: <20081104200600.GA32663@cynthia.pants.nu> <E7AD906F-AAD4-11DD-9F63-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:56002 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753601AbYKEC3h (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 4 Nov 2008 21:29:37 -0500
Content-Disposition: inline
In-Reply-To: <E7AD906F-AAD4-11DD-9F63-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Wed, Nov 05, 2008 at 01:58:48AM +0100, Riccardo wrote:
> Under Mac 7.1 it gets definitively recognized as Mac II. I definitively 
> have a SWIM, since one of my two floppies reads HD disks, I checked
> 
> Penguin says my  gestalt is 6, Mac II
> 
> A clue for the MacII is the 68020 CPU + FPU + MMU, AFAIK the only apple 
> machine with these specs.

That definitely answers my question. Thank you.

> PS: I didn't use this mac since many months, it first stasrted up, but 
> then refusedfurther boots with the sad mac sound and no video output. 
> REmoving components trying to isolate the problem didn't help. When I 
> put al back together with no luck, a last attempt made it boot. Any 
> ideas? I see no visible damage on the motherboard, the batteries still 
> have some juice left...

It's hard to say what might be the problem. The symptoms of a bad
battery are quite a bit different. This almost sounds more like a
bad video card to me. Do you have a different one you can try? A
lot of older macs refuse to boot without video.

	Brad Boyer
	flar@allandria.com

