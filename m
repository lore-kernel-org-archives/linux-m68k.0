From: Joshua Juran <jjuran@gmail.com>
Subject: Re: I'm back on linux-m68k
Date: Tue, 4 Nov 2008 00:05:59 -0800
Message-ID: <CEFF8A03-7CD2-4172-A9D8-86473C4D1C99@gmail.com>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin> <20081103194757.GA19432@cynthia.pants.nu> <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.226]:21158 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753348AbYKDIGE (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 4 Nov 2008 03:06:04 -0500
Received: by rv-out-0506.google.com with SMTP id k40so3117035rvb.1
        for <linux-m68k@vger.kernel.org>; Tue, 04 Nov 2008 00:06:03 -0800 (PST)
In-Reply-To: <alpine.DEB.1.00.0811032208480.15114@zirkon.biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: Brad Boyer <flar@allandria.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Nov 3, 2008, at 1:15 PM, Michael Schmitz wrote:

>>> At least the Quadra 900 and 950 have two SCSI buses, as deducted  
>>> from Finn'ss
>>> recent patch.

I have a Quadra 950 (in addition to the Q650 which I've been using so  
far).  I'll set it up and check at some point if someone doesn't beat  
me to it.

>> It is also possible to add SCSI buses. I have a NuBus SCSI card  
>> that has
>> a 53c9x chip of some flavor on it, although I haven't tried it and  
>> suspect
>> that it would take some work to get it supported in Linux. Having  
>> a NuBus
>> SCSI card was a good option to upgrade performance of some of the  
>> mid-range
>> systems where Apple was still using the NCR5380 but better chips were
>> available. I'm pretty sure Apple supported booting off these as  
>> long as
>> they had the correct software in the ROM on the card.
>
> Possible, but someone will just have to report what XPRAM data this  
> would set.

If anybody wants to take Genie/Lamp for a spin, you can get it here:

Lamp Ain't Mac POSIX
http://www.metamage.com/lamp/

Once running, /sys/mac/xpram is a read-only virtual file  
corresponding to the 256-byte XPRam.  You can either hack it with  
perl or cat the whole thing into a real file and view it with HexEdit.

Also, the 'drvr' script will iterate through /sys/mac/unit and list  
all the installed drivers.

Bear in mind that at present I am Lamp's only user, so some gotchas  
are to be expected.

Josh


