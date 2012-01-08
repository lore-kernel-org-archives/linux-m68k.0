From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Sun, 08 Jan 2012 17:13:29 +1300
Message-ID: <4F0917E9.9090600@gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com> <4F08E748.4020305@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:48157 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751084Ab2AHENg (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jan 2012 23:13:36 -0500
Received: by iaeh11 with SMTP id h11so4906387iae.19
        for <linux-m68k@vger.kernel.org>; Sat, 07 Jan 2012 20:13:35 -0800 (PST)
In-Reply-To: <4F08E748.4020305@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Alan,
>> You need to reserve ST-RAM for use by late initializing drivers -
>> stram_pool=512k would be a good start. Not sure this works with only
>> 4MB of ST-RAM though.
> I saw this option and I don't understand why it even exists. ST-RAM is
> being sent by the bootloader with it's start (0) and size. ST-RAM always
> starts at 0. So it's perfectly detectable, so why the need for an option
> to specify the ST-RAM pool size ?
The stram_pool option is just to reserve ST-RAM (DMA-capable) that would 
otherwise be used by the kernel for other purposes. Atari sets the DMA 
memory barrier to the entire memory size, which is wrong in the strict 
sense (but cannot be changed easily). Drivers like SCSI and atafb have 
to resort to a special purpose memory allocator in order to
claim DMA capable memory.

For this option to work, ST-RAM first has to be accepted by memory init 
(i.e. it has to be in the first chunk). We might have to resort to 
reserving the entire ST-RAM for the kernel's use if the kernel is not 
residing in ST-RAM (breaking the above assumption). Something similar is 
done for Amiga chip RAM - exactly how does the chip RAM situation 
differ, Geert? Is chip RAM being claimed by mem_init or is it being left 
aside?

Come to think of it - does the TT video chipset actually require screen 
memory to reside in ST-RAM? If it's fully 32 bit addressed we should not 
have any problems with TT-RAM. The problems you see might be caused by a 
fault in the TT codepath in atafb - I'm unsure this has been tested 
since the last atafb rewrite.
>
>>> But there's also this further up the boot log.
>>>
>>> Ignoring memory chunk at 0x0:0x400000 before the first chunk
>>> Fix your bootloader or use a memfile to make use of this area!
>>>
>>> I tried a memfile, but that just produces the same message.
>> Looks like your kernel gets placed in TT-RAM (because of size?) and
>> hence TT-RAM is listed as the first memory chunk. I don't think
>> ataboot supports a memfile, so it remains the first chunk?
>>
> No, because I don't use "-s" on the bootloader. That means it loads the
> kernel in TTRAM.
That's what I meant - the kernel residing in TT-RAM automatically will 
map this chunk at kernel virtual address 0x0. Something in our mem_init 
logic prevents using RAM with a lower physical address than was used by 
the first chunk. I'm quoting from memory here - Roman Zippel might know 
the exact answer to this.

Can you try to have the kernel placed in ST-RAM?

>
>
>> I've tried to play around with the MM init code to circumvent this in
>> the past, to no avail. I think  memory chunks have to be listed in
>> strict order for MM init to work. I don't think reordering the memory
>> chunk list once the kernel has started will work, so implementing the
>> memfile option in ataboot may be necessary.
>>
> I think anyone with ARanyM should be able to see this problem, by
> setting their STRAM to 4MB and removing the "-s" flag from the
> bootstra.tos app, to load the kernel in TTRAM.
You're right, this should be possible to test with ARAnyM - the behavior 
is not new though. Loading the kernel in TT-RAM has been problematic on 
the Falcon for a long time now.

Cheers,

   Michael
