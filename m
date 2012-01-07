From: Alan Hourihane <alanh@fairlite.co.uk>
Subject: Re: Atari TT (next)
Date: Sat, 07 Jan 2012 16:59:11 +0000
Message-ID: <4F0879DF.60501@fairlite.co.uk>
References: <4F079F6B.8080502@fairlite.co.uk> <4F07EA66.6020603@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from fairlite.demon.co.uk ([80.176.228.186]:47448 "EHLO
	fairlite.demon.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751548Ab2AGQ7O (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 7 Jan 2012 11:59:14 -0500
In-Reply-To: <4F07EA66.6020603@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On 07/01/12 06:47, Michael Schmitz wrote:
> Hi Guys,
>> O.k. I'm passed the unexpected interrupt problem.
>>
>> Now the next problem is that the console is all corrupted because atafb
>> initializes and shows this...
>>
>> atafb_init: start
>> atafb_init: initializing TT hw
>> atafb: screen_base 0046e000 real_screen_base 0046e000 screen_len 311296
>> Determined 640x480, depth 4
>>    virtual 640x972
>>
>> Now, that screen_base is above 4MB, and I've only got 4MB STRAM.
> You need to reserve ST-RAM for use by late initializing drivers -
> stram_pool=512k would be a good start. Not sure this works with only
> 4MB of ST-RAM though.

I saw this option and I don't understand why it even exists. ST-RAM is
being sent by the bootloader with it's start (0) and size. ST-RAM always
starts at 0. So it's perfectly detectable, so why the need for an option
to specify the ST-RAM pool size ?

>> But there's also this further up the boot log.
>>
>> Ignoring memory chunk at 0x0:0x400000 before the first chunk
>> Fix your bootloader or use a memfile to make use of this area!
>>
>> I tried a memfile, but that just produces the same message.
> Looks like your kernel gets placed in TT-RAM (because of size?) and
> hence TT-RAM is listed as the first memory chunk. I don't think
> ataboot supports a memfile, so it remains the first chunk?
>

No, because I don't use "-s" on the bootloader. That means it loads the
kernel in TTRAM.

> I've tried to play around with the MM init code to circumvent this in
> the past, to no avail. I think  memory chunks have to be listed in
> strict order for MM init to work. I don't think reordering the memory
> chunk list once the kernel has started will work, so implementing the
> memfile option in ataboot may be necessary.

I think anyone with ARanyM should be able to see this problem, by
setting their STRAM to 4MB and removing the "-s" flag from the
bootstra.tos app, to load the kernel in TTRAM.

Alan.
