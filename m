From: Brad Boyer <flar@allandria.com>
Subject: Re: I'm back on linux-m68k
Date: Mon, 3 Nov 2008 11:47:57 -0800
Message-ID: <20081103194757.GA19432@cynthia.pants.nu>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:42510 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1751618AbYKCTsb (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 3 Nov 2008 14:48:31 -0500
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0811031259300.21302@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joshua Juran <jjuran@gmail.com>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Mon, Nov 03, 2008 at 01:01:01PM +0100, Geert Uytterhoeven wrote:
> On Mon, 3 Nov 2008, Joshua Juran wrote:
> > I don't remember if 68K machines can have multiple SCSI buses.  If so, we'll
> > need to figure out how to address external vs. internal.
> 
> At least the Quadra 900 and 950 have two SCSI buses, as deducted from Finn'ss
> recent patch.

It is also possible to add SCSI buses. I have a NuBus SCSI card that has
a 53c9x chip of some flavor on it, although I haven't tried it and suspect
that it would take some work to get it supported in Linux. Having a NuBus
SCSI card was a good option to upgrade performance of some of the mid-range
systems where Apple was still using the NCR5380 but better chips were
available. I'm pretty sure Apple supported booting off these as long as
they had the correct software in the ROM on the card.

	Brad Boyer
	flar@allandria.com

