From: Joshua Juran <jjuran@gmail.com>
Subject: Re: [PATCH] Add SWIM floppy support for m68k Macs.
Date: Wed, 5 Nov 2008 04:20:28 -0800
Message-ID: <B0EA0FB1-9FEF-4159-ADAB-B5C2EA910352@gmail.com>
References: <6865D876-3805-41B4-A3AD-15E8659254F2@lvivier.info> <3E58F122-AA9F-11DD-9F63-00050249ADE1@kaffe.org> <20081104200600.GA32663@cynthia.pants.nu> <F4658C02-D1D5-44E5-BF17-671AE770CD71@gmail.com> <Pine.LNX.4.64.0811051852060.23823@loopy.telegraphics.com.au>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.182]:3361 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753867AbYKEMUd (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Nov 2008 07:20:33 -0500
Received: by wa-out-1112.google.com with SMTP id v27so2109238wah.21
        for <linux-m68k@vger.kernel.org>; Wed, 05 Nov 2008 04:20:32 -0800 (PST)
In-Reply-To: <Pine.LNX.4.64.0811051852060.23823@loopy.telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Brad Boyer <flar@allandria.com>, Riccardo <riccardo@kaffe.org>, Laurent Vivier <Laurent@lvivier.info>, geert@linux-m68k.org, linux-m68k@vger.kernel.org

On Nov 5, 2008, at 2:31 AM, Finn Thain wrote:

> On Tue, 4 Nov 2008, Joshua Juran wrote:
>
>> On Nov 4, 2008, at 12:06 PM, Brad Boyer wrote:
>>
>>> On Tue, Nov 04, 2008 at 07:34:41PM +0100, Riccardo wrote:
>>>
>>> Hopefully there's a logical way to detect this upgrade, but it  
>>> would be
>>> interesting to know if the update changes the gestalt ID.
>>
>> You would detect an upgraded ROM by reading the ROM, I imagine.
>
> Good point. But I think we'd need the ROM base to be supplied by  
> Penguin?
> Or even just the ROM checksum.

It's probably a good idea for the kernel to know the address and size  
of the ROM, and given those (or just the former) it can determine the  
checksum.  Penguin can get these from low memory and Gestalt()  
respectively.  EMILE can too iff they're set up in ROM -- I don't know.

>> By the way, does anyone know how to calculate a ROM checksum, or  
>> will I
>> have to reverse-engineer CopyROM or somesuch?
>
> I assumed that CopyROM etc did not validate anything, they just  
> reported
> the checksum contained in the ROM (first 4 bytes).

Oh.  Red herring, then.  So for our purposes it's just a magic  
number, and the "checksum" algorithm would be:

	inline unsigned long checksum( const void* rom, unsigned long size )
	{
		return *(const unsigned long*) rom;
	}

:-)

> The code must be part
> of the POST though, since a bad rom checksum is a sad mac error. So  
> you
> could reverse engineer that. But IIRC there is a card ROM checksum
> algorithm given in Designing Card and Drivers for the Mac II and  
> Mac SE.
> It's probably the same algorithm. I don't have access to my copy at  
> the
> moment.

Might be interesting, but not necessary -- if we really wanted to  
verify the ROM was intact we could use any checksum algorithm we  
wished, with a table mapping one to the other.

But one of these days I should spend some quality time disassembling  
ROM anyway.

Josh


