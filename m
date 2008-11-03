From: Joshua Juran <jjuran@gmail.com>
Subject: Re: I'm back on linux-m68k
Date: Mon, 3 Nov 2008 03:40:09 -0800
Message-ID: <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.180]:52081 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942AbYKCLkP (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 3 Nov 2008 06:40:15 -0500
Received: by wa-out-1112.google.com with SMTP id v27so1403908wah.21
        for <linux-m68k@vger.kernel.org>; Mon, 03 Nov 2008 03:40:14 -0800 (PST)
In-Reply-To: <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Laurent Vivier <laurent@lvivier.info>
Cc: Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Oct 15, 2008, at 4:05 PM, Laurent Vivier wrote:

>> On Wed, 15 Oct 2008, Joshua Juran wrote:
>>
>>> I thought I'd mention that I'm back lurking on linux-m68k.  Some  
>>> of you
>>> may remember me as one of the Penguin contributors.
>>>
>>> Please let me know if you would find anything running on the Mac  
>>> OS side
>>> helpful.
>
> So perhaps Joshua can help me to write some parts, in my TODO there  
> are:
>
> - save/change/restore the boot device

I've written ReadXPRam(), seen at the top of this file:

FSTree_sys_mac_xpram.cc
http://lamp.cvs.sourceforge.net/viewvc/lamp/Genie/Genie/FileSystem/ 
FSTree_sys_mac_xpram.cc?revision=1.3&view=markup

WriteXPRam() is identical, except with a different trap number.  Each  
routine is passed the address of a buffer, how much data to transfer,  
and the offset into XPRam at which to start reading or writing.

The startup device info is stored in 4 bytes starting at offset  
0x78.  For SCSI devices, this is the driver reference number, which  
is the one's complement of the unit table index, which (again) for  
SCSI devices is 32 plus the ID number.

So, for example, SCSI ID 0 has unit number 32, driver refnum -33, and  
XPRam data 0xFFFFFFDF, and SCSI ID 6 is 38, -39, and 0xFFFFFFD9  
respectively.

I don't remember if 68K machines can have multiple SCSI buses.  If  
so, we'll need to figure out how to address external vs. internal.

Setting the RAM disk as the boot device on my system sets the value  
0x0006FFCC.  Interpreting the low word as a signed integer yields  
-52, corresponding to unit number 51, which is the .EDisk driver.  I  
don't know what the high word means, but it's clear that it will be  
-1 for a SCSI device.

This should be enough info to get you going on save/restore and  
setting a bus 0 device.

Josh


