From: Joshua Juran <jjuran@gmail.com>
Subject: Re: I'm back on linux-m68k
Date: Sat, 8 Nov 2008 01:00:59 -0800
Message-ID: <BA0FEE24-96F9-4905-8067-3C0A117067C3@gmail.com>
References: <6C4F43D4-2A75-48DC-98A2-ABE37A2FB1A9@gmail.com> <Pine.LNX.4.64.0810160022330.21195@loopy.telegraphics.com.au> <CEE35843-1B20-4782-A5F9-35F0C62FE0A8@lvivier.info> <7869EA87-0FA5-4D73-A13F-D7DE6A8AA0A6@gmail.com> <Pine.LNX.4.64.0811031259300.21302@anakin>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.236]:51398 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752002AbYKHJBF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 8 Nov 2008 04:01:05 -0500
Received: by rv-out-0506.google.com with SMTP id k40so1655193rvb.1
        for <linux-m68k@vger.kernel.org>; Sat, 08 Nov 2008 01:01:04 -0800 (PST)
In-Reply-To: <Pine.LNX.4.64.0811031259300.21302@anakin>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Vivier <laurent@lvivier.info>, Finn Thain <fthain@telegraphics.com.au>, Linux/m68k <linux-m68k@vger.kernel.org>

On Nov 3, 2008, at 4:01 AM, Geert Uytterhoeven wrote:

> On Mon, 3 Nov 2008, Joshua Juran wrote:
>> I don't remember if 68K machines can have multiple SCSI buses.  If  
>> so, we'll
>> need to figure out how to address external vs. internal.
>
> At least the Quadra 900 and 950 have two SCSI buses, as deducted  
> from Finn'ss
> recent patch.

So far, I haven't been able to boot my 950 while a drive connected to  
the external bus was powered on.  The external drive's access light  
goes on immediately after the screen lights up grey, and startup gets  
as far as drawing the Mac OS splash screen and maybe 12 pixels of  
progress before halting, resuming normally if I power off the  
external drive.

Any ideas?

Josh


