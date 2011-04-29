From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Debian kernel v2.6.38
Date: Sat, 30 Apr 2011 11:44:12 +1200
Message-ID: <4DBB4D4C.6070100@gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com> <Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org> <alpine.OSX.2.00.1104250119030.307@ibook.intranet> <4DB4E109.3090809@gmail.com> <alpine.OSX.2.00.1104251301580.196@ibook.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-px0-f173.google.com ([209.85.212.173]:64220 "EHLO
	mail-px0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757835Ab1D2XoR (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Apr 2011 19:44:17 -0400
Received: by pxi16 with SMTP id 16so1086977pxi.4
        for <linux-m68k@vger.kernel.org>; Fri, 29 Apr 2011 16:44:17 -0700 (PDT)
In-Reply-To: <alpine.OSX.2.00.1104251301580.196@ibook.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Michael Schmitz <schmitzmic@googlemail.com>, Thorsten Glaser <tg@mirbsd.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org

Hi Finn,
>> Incidentially - did you work on the Mac 5380 SCSI code recently? Does it 
>> work with full error handling capability in its current state?
>>     
>
> I got as far as confirming the reports of working mac_scsi on the IIfx. It 
> fails on every other model. I didn't really investigate error handling.
>   
OK so it works in principle but error handling may still be in need of 
updating.
> The explanation was that PDMA isn't relevant to the IIfx so the driver 
> runs in PIO mode (should be DMA but that has not yet been implemented 
> successfully).
>   
Gives me something to fall back to, at least...
>> I begin to feel the only way to make the Falcon SCSI code work again is 
>> a clean restart ...
>>     
>
> That was also my feeling when we discussed this some years ago*.
>   
I do well remember we talked about that - since mac_scsi uses mainline 
NCR5380.c I think you are in better shape already. No other driver uses 
anything close to PDMA but I cannot see what should be wrong there.
> I'm told that mac_scsi PDMA worked for either mac68k or mainline 2.2 
> kernels and so I tend to think that a rewrite would likely suffer from the 
> same PDMA bug. I really need to investigate that bug.
>   
> There are still good reasons for a rewrite but I don't have the necessary 
> understanding of the SCSI subsystem nor the time to tackle those issues.
>   
The Falcon driver worked in 2.2 and 2.4 and even as recent as 2.6.18 but 
broke in later 2.6 releases. Error handling changes, running the 
coroutine as delayed task instead of immediate soft interrupt and 
replacement of the big kernel lock by subsystem locking have all changed 
since. Some of that has been taken care of in NCR5380.c from what I've 
seen. atari_NCR5380.c still uses global locking, manually delays the 
task queue and fiddles with the queue pointers explicitly. I'll have to 
go over the whole file manually and make it as close to NCR5380.c as I 
can while still keeping the Falcon specific bits in.
> But if someone else were to rewrite the core 5380 driver as was done with 
> esp_scsi.c then I would be willing to tackle the mac portion (the 
> equivalent of mac_esp.c)...
>   
I lack an understanding of how the current SCSI error handling code is 
supposed to work - that part still needs to be done for NCR5380.c but 
I'm at a loss to find a good example of a current SCSI driver to look at.

All I manage so far is get the kernel to lock up solid once a request 
times out, but I've pretty much started from scratch so there will be 
bits missing to be patched.

Cheers,

    Michael
