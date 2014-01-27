From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Mon, 27 Jan 2014 21:28:05 +1300
Message-ID: <52E61895.6000007@gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de> <52D1F299.7080909@gmail.com> <201401122100.28877.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:37702 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751059AbaA0I2N (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Jan 2014 03:28:13 -0500
Received: by mail-pd0-f178.google.com with SMTP id y13so5446938pdi.37
        for <linux-m68k@vger.kernel.org>; Mon, 27 Jan 2014 00:28:13 -0800 (PST)
In-Reply-To: <201401122100.28877.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

Geert,

I will submit patches to the Atari SCSI driver based on Arnd's patch 
later this week. Has Arnd's initial patch made it into mainline yet?

While working on the driver, I noticed my Falcon ran into a memory 
squeeze once a day, resulting in oom-killing processes and rendering the 
system unusable. Most likely culprit to trigger this is the daily 
updatedb run. This sort of trouble started pretty much with my work on 
the SCSI driver, based on commit 
aa5311c454ed0ff959adca29c65be2157f52a84c (3.13-rc7). Do you know of any 
memory leak affecting m68k, introduced between last November and 3.13-rc7?

Cheers,

    Michael
>> Arnd,
>>
>> your patch breaks the Atari NCR5380 SCSI driver (easily verified using 
>> ARAnyM). Last console output:
>>
>>     
>
> Thanks so much for testing and sorry for your troubles. It seems I
> got the wrong polarity on at least one of the conditions when converting
> from a while()-style loop to an until()-style wait_event loop.
> I did double-check all the patches before, but this one must have
> slipped through because the use is so obscure.
>
> 	Arnd
>
>   
