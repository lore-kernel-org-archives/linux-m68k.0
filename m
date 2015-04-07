From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [3.13 regression] kswapd0 and ksoftirqd/0 CPU hogs
Date: Tue, 07 Apr 2015 17:38:53 +1200
Message-ID: <55236D6D.5010706@gmail.com>
References: <21393.43065.207399.530921@gargle.gargle.HOWL> <mvm1tuv6dhk.fsf@hawking.suse.de> <21426.40682.197715.245775@gargle.gargle.HOWL> <CAOmrzkK7vXueZ4SYSr49DAZDZn5cVkm=6rYUn6GJq4cvXLSmew@mail.gmail.com> <21786.40688.53001.509365@gargle.gargle.HOWL> <551B6143.4030805@gmail.com> <alpine.LNX.2.00.1504011533340.23336@nippy.intranet> <5522F9D5.3080107@gmail.com> <alpine.LNX.2.00.1504070954300.20378@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:36541 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750862AbbDGFi4 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 7 Apr 2015 01:38:56 -0400
Received: by pdea3 with SMTP id a3so67581538pde.3
        for <linux-m68k@vger.kernel.org>; Mon, 06 Apr 2015 22:38:56 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1504070954300.20378@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Mikael Pettersson <mikpelinux@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Finn,
> On Tue, 7 Apr 2015, Michael Schmitz wrote:
>
>   
>> The gunzip error cannot be reproduced on any of my ARAnyM VMs. Might be 
>> a RAM error or other hardware related problem. Same kernel but 
>> configured slightly different (added 030 and 040 support, plus ARAnyM 
>> support).
>>     
>
> The configuration differences could be cancelled by booting your new 
> aranym kernel on the physical hardware, and reproducing the fault that 
>   

Sure, and I'll make certain to do that once I've finished the current 
task (updating stuff in a current unstable chroot).

> way. BTW, is this the same physical machine that has DMA issues, which we 
> discussed off-list in the past?
>   

The very same. Runs fairly stable otherwise though - I would have 
expected filesystem corruption or other more drastic errors if the RAM 
was faulty.

>   
>> The general behaviour (gunzip eats up all free RAM, then kswapd spins 
>> doing nothing very apparent, with no dirty pages to be flushed and 
>> cached pages never released) remains the same. Though I've seen the 
>> gunzip complete without kicking off kswapd on occasion (had set 
>> dirty_background_ratio and dirty_ratio half the default for that).
>>
>> And yes, dropping cached pages as Andreas suggested, does free up 
>> significant (i.e. most of all) RAM and shuts up kswapd.
>>     
>
> This bug has been reported to Red Hat in the past (on x86_64). They closed 
> the bugzilla entry in 2011, but the bug was still being reported by Fedora 
> users in 2014. https://bugzilla.redhat.com/show_bug.cgi?id=712019
>   

Thanks for pointing that out!

The patches attached to this report made it into Linus' git tree at that 
time so I presume we are seeing something closely related. The 
discussion on LRML makes my head spin - not a chance to debug this in a 
meaningful way, I suppose.

    Michael
