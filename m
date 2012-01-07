From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari TT (next)
Date: Sat, 07 Jan 2012 19:47:02 +1300
Message-ID: <4F07EA66.6020603@gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43931 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224Ab2AGGrH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jan 2012 01:47:07 -0500
Received: by iaeh11 with SMTP id h11so3776189iae.19
        for <linux-m68k@vger.kernel.org>; Fri, 06 Jan 2012 22:47:07 -0800 (PST)
In-Reply-To: <4F079F6B.8080502@fairlite.co.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Alan Hourihane <alanh@fairlite.co.uk>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Guys,
> O.k. I'm passed the unexpected interrupt problem.
>
> Now the next problem is that the console is all corrupted because atafb
> initializes and shows this...
>
> atafb_init: start
> atafb_init: initializing TT hw
> atafb: screen_base 0046e000 real_screen_base 0046e000 screen_len 311296
> Determined 640x480, depth 4
>    virtual 640x972
>
> Now, that screen_base is above 4MB, and I've only got 4MB STRAM.
You need to reserve ST-RAM for use by late initializing drivers - 
stram_pool=512k would be a good start. Not sure this works with only 4MB 
of ST-RAM though.
> But there's also this further up the boot log.
>
> Ignoring memory chunk at 0x0:0x400000 before the first chunk
> Fix your bootloader or use a memfile to make use of this area!
>
> I tried a memfile, but that just produces the same message.
Looks like your kernel gets placed in TT-RAM (because of size?) and 
hence TT-RAM is listed as the first memory chunk. I don't think ataboot 
supports a memfile, so it remains the first chunk?

I've tried to play around with the MM init code to circumvent this in 
the past, to no avail. I think  memory chunks have to be listed in 
strict order for MM init to work. I don't think reordering the memory 
chunk list once the kernel has started will work, so implementing the 
memfile option in ataboot may be necessary.

Cheers,

   Michael

> I've read in some old threads about stram_swap=0 helping, but I don't
> see that implemented anymore.
>
> Alan.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
