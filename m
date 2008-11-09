From: Brad Boyer <flar@allandria.com>
Subject: Re: I'm back on linux-m68k
Date: Sat, 8 Nov 2008 18:05:16 -0800
Message-ID: <20081109020516.GA22235@cynthia.pants.nu>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin> <BA0FEE24-96F9-4905-8067-3C0A117067C3@gmail.com> <Pine.LNX.4.64.0811090006020.13889@loopy.telegraphics.com.au> <E6F5E51C-FCEC-4DCD-85EC-6BD1FFE1088F@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from [76.245.85.235] ([76.245.85.235]:37520 "EHLO cynthia.pants.nu"
	rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
	id S1753703AbYKICGF (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Sat, 8 Nov 2008 21:06:05 -0500
Content-Disposition: inline
In-Reply-To: <E6F5E51C-FCEC-4DCD-85EC-6BD1FFE1088F@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joshua Juran <jjuran@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier <laurent@lvivier.info>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Nov 08, 2008 at 08:14:01AM -0800, Joshua Juran wrote:
> Solution:  Pretend it's all one bus and give everything a unique SCSI  
> ID.  Or, just don't 'upstage' the boot disks (with a device of the  
> same ID on a lower-numbered bus).
> 
> (Bad news if you were hoping to have eight or more different startup  
> disks...)

The classic MacOS doesn't track bus numbers internally anyway. It's
just a fundamental issue with the SCSI manager implementation that
Apple used. It only knows about device IDs. Since the ROM includes
chunks of the MacOS to do its own work, the limitation carries over
for the boot sequence.

	Brad Boyer
	flar@allandria.com

