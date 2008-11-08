From: Joshua Juran <jjuran@gmail.com>
Subject: Re: I'm back on linux-m68k
Date: Sat, 8 Nov 2008 08:14:01 -0800
Message-ID: <E6F5E51C-FCEC-4DCD-85EC-6BD1FFE1088F@gmail.com>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin> <BA0FEE24-96F9-4905-8067-3C0A117067C3@gmail.com> <Pine.LNX.4.64.0811090006020.13889@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.174]:51819 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753376AbYKHQOG (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 8 Nov 2008 11:14:06 -0500
Received: by wf-out-1314.google.com with SMTP id 27so1819990wfd.4
        for <linux-m68k@vger.kernel.org>; Sat, 08 Nov 2008 08:14:05 -0800 (PST)
In-Reply-To: <Pine.LNX.4.64.0811090006020.13889@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Vivier <laurent@lvivier.info>, Linux/m68k <linux-m68k@vger.kernel.org>

On Nov 8, 2008, at 5:12 AM, Finn Thain wrote:

> On Sat, 8 Nov 2008, Joshua Juran wrote:
>
>> So far, I haven't been able to boot my 950 while a drive connected to
>> the external bus was powered on.  The external drive's access  
>> light goes
>> on immediately after the screen lights up grey, and startup gets  
>> as far
>> as drawing the Mac OS splash screen and maybe 12 pixels of progress
>> before halting, resuming normally if I power off the external drive.
>>
>> Any ideas?
>
> I see the same issue sometimes. I don't think it is a termination  
> problem
> but it is hard to say. You could try installing drivers from HD SC  
> Setup,
> Drive Setup, Silverlinig or HDT etc.

I had no such problems using a removable storage drive, although I  
had to tighten the cable before it was recognized, so it may have  
been a cabling issue originally.

Anyway, with regards to startup devices, there's no distinction  
between the buses.  If you select the device at SCSI ID 5 on bus 1,  
the XPRam value is set to 0xFFFFFFDA, just as it would be for bus 0.   
And if a SCSI ID is shared by devices on each bus, selecting the  
external one in Startup Disk beeps and sets the XPRam value to  
0x00000000.

Solution:  Pretend it's all one bus and give everything a unique SCSI  
ID.  Or, just don't 'upstage' the boot disks (with a device of the  
same ID on a lower-numbered bus).

(Bad news if you were hoping to have eight or more different startup  
disks...)

Josh


