From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Thu, 6 Nov 2008 00:10:43 +1100 (EST)
Message-ID: <Pine.LNX.4.64.0811052352001.26662@loopy.telegraphics.com.au>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info>
 <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org> <20081104200600.GA32663@cynthia.pants.nu>
 <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com>
 <Pine.LNX.4.64.0811051852060.23823@loopy.telegraphics.com.au>
 <B0EA0FB1-9FEF-4159-ADAB-B5C2EA910352@gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from loopy.telegraphics.com.au ([202.45.126.152]:46885 "EHLO
	loopy.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754775AbYKENKq (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 08:10:46 -0500
In-Reply-To: <B0EA0FB1-9FEF-4159-ADAB-B5C2EA910352@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Juran <jjuran@gmail.com>
Cc: Brad Boyer <flar@allandria.com>, Riccardo <riccardo@kaffe.org>, Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org



On Wed, 5 Nov 2008, Joshua Juran wrote:

> On Nov 5, 2008, at 2:31 AM, Finn Thain wrote:
> 
> >On Tue, 4 Nov 2008, Joshua Juran wrote:
> >
> > >On Nov 4, 2008, at 12:06 PM, Brad Boyer wrote:
> > >
> > > >On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
> > > >
> > > >Hopefully there's a logical way to detect this upgrade

...
> 
> It's probably a good idea for the kernel to know the address and size of 
> the ROM

No need (the less code the better).

And passing just a checksum from the bootloader is still an awful hack 
compared to probing for IWM or SWIM on a Mac II.

Finn
