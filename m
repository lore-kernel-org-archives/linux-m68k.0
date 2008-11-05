From: Joshua Juran <jjuran@gmail.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Tue, 4 Nov 2008 23:37:09 -0800
Message-ID: <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info> <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org> <20081104200600.GA32663@cynthia.pants.nu>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.168]:26614 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399AbYKEHhO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 02:37:14 -0500
Received: by wf-out-1314.google.com with SMTP id 27so3696706wfd.4
        for <linux-m68k@vger.kernel.org>; Tue, 04 Nov 2008 23:37:13 -0800 (PST)
In-Reply-To: <20081104200600.GA32663@cynthia.pants.nu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Brad Boyer <flar@allandria.com>
Cc: Riccardo <riccardo@kaffe.org>, Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Nov 4, 2008, at 12:06 PM, Brad Boyer wrote:

> On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
>> I have a mac II, but I upgraded the SWIM chip, IIRC. I think I  
>> upgraded
>> only one of the two drives to high density, but that shouldn't affect
>> you I suppose, since the problem would be the chip. I'll look in my
>> spare parts bin.
>
> I'm curious about how the chip update appears on the II. Does this  
> system
> now show up as a IIx? My understanding is that the upgrade kit  
> included
> a new set of ROM chips that include the same bits as the ones from  
> the IIx.
> Hopefully there's a logical way to detect this upgrade, but it  
> would be
> interesting to know if the update changes the gestalt ID.

You would detect an upgraded ROM by reading the ROM, I imagine.  In  
Genie, it's at /sys/mac/rom.

By the way, does anyone know how to calculate a ROM checksum, or will  
I have to reverse-engineer CopyROM or somesuch?

Josh


