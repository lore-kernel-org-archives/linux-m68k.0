From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Thu, 30 Jan 2014 21:06:19 +1300
Message-ID: <52EA07FB.9060404@biophys.uni-duesseldorf.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de> <52D1F299.7080909@gmail.com> <201401122100.28877.arnd@arndb.de> <52E61895.6000007@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:51475 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751000AbaA3IGW (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 03:06:22 -0500
Received: by mail-pd0-f180.google.com with SMTP id x10so2732916pdj.39
        for <linux-m68k@vger.kernel.org>; Thu, 30 Jan 2014 00:06:21 -0800 (PST)
In-Reply-To: <52E61895.6000007@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux//m68k <linux-m68k@vger.kernel.org>

Hi Geert,

>
> While working on the driver, I noticed my Falcon ran into a memory 
> squeeze once a day, resulting in oom-killing processes and rendering 
> the system unusable. Most likely culprit to trigger this is the daily 
> updatedb run. This sort of trouble started pretty much with my work on 
> the SCSI driver, based on commit 
> aa5311c454ed0ff959adca29c65be2157f52a84c (3.13-rc7). Do you know of 
> any memory leak affecting m68k, introduced between last November and 
> 3.13-rc7?

Looks like Arnd's patch is not to blame, as I get a memory leak without 
it as well.

Straight after boot:
schmitz@hobbes:~$ cat /proc/interrupts
13:     316007     atari  timer
15:       2151     atari  ST-DMA floppy,ACSI,IDE,Falcon-SCSI, ide0
schmitz@hobbes:~$ free
             total       used       free     shared    buffers     cached
Mem:        526996      41928     485068          0       1944       9548
-/+ buffers/cache:      30436     496560

One day with no significant activity:
 13:    8895122     atari  timer
 15:      17483     atari  ST-DMA floppy,ACSI,IDE,Falcon-SCSI, ide0
Mem:        526996      83616     443380          0      17324      12732
-/+ buffers/cache:      53560     473436

Two days ...
 13:   17385461     atari  timer
 15:      31264     atari  ST-DMA floppy,ACSI,IDE,Falcon-SCSI, ide0
Mem:        526996      99528     427468          0      25136      12780
-/+ buffers/cache:      61612     465384

I'll try and go backwards to see when this all started. I switched 
toolchains in December, but that should not cause such behaviour, I 
suppose?

Cheers,

    Michael

>
> Cheers,
>
>    Michael
>>> Arnd,
>>>
>>> your patch breaks the Atari NCR5380 SCSI driver (easily verified 
>>> using ARAnyM). Last console output:
>>>
>>>     
>>
>> Thanks so much for testing and sorry for your troubles. It seems I
>> got the wrong polarity on at least one of the conditions when converting
>> from a while()-style loop to an until()-style wait_event loop.
>> I did double-check all the patches before, but this one must have
>> slipped through because the use is so obscure.
>>
>>     Arnd
>>
>>   
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
