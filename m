From: Brad Boyer <flar@allandria.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Tue, 4 Nov 2008 12:06:00 -0800
Message-ID: <20081104200600.GA32663@cynthia.pants.nu>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info> <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:56585 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1754696AbYKDUGf (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Tue, 4 Nov 2008 15:06:35 -0500
Content-Disposition: inline
In-Reply-To: <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Riccardo <riccardo@kaffe.org>
Cc: Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
> I have a mac II, but I upgraded the SWIM chip, IIRC. I think I upgraded 
> only one of the two drives to high density, but that shouldn't affect 
> you I suppose, since the problem would be the chip. I'll look in my 
> spare parts bin.

I'm curious about how the chip update appears on the II. Does this system
now show up as a IIx? My understanding is that the upgrade kit included
a new set of ROM chips that include the same bits as the ones from the IIx.
Hopefully there's a logical way to detect this upgrade, but it would be
interesting to know if the update changes the gestalt ID.

	Brad Boyer
	flar@allandria.com

