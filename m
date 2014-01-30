From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Thu, 30 Jan 2014 21:08:20 +1300
Message-ID: <52EA0874.7070302@biophys.uni-duesseldorf.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de>	<70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de>	<52D1F299.7080909@gmail.com>	<201401122100.28877.arnd@arndb.de>	<52E61895.6000007@gmail.com> <CAMuHMdWM=MXZveRHMQPbBvg88MFABViVueVfo0mT4esXZuvfsg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:44823 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751025AbaA3IIN (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 03:08:13 -0500
Received: by mail-pd0-f177.google.com with SMTP id x10so2721940pdj.22
        for <linux-m68k@vger.kernel.org>; Thu, 30 Jan 2014 00:08:13 -0800 (PST)
In-Reply-To: <CAMuHMdWM=MXZveRHMQPbBvg88MFABViVueVfo0mT4esXZuvfsg@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Linux//m68k <linux-m68k@vger.kernel.org>

Hi Geert,
>> While working on the driver, I noticed my Falcon ran into a memory squeeze
>> once a day, resulting in oom-killing processes and rendering the system
>> unusable. Most likely culprit to trigger this is the daily updatedb run.
>> This sort of trouble started pretty much with my work on the SCSI driver,
>> based on commit aa5311c454ed0ff959adca29c65be2157f52a84c (3.13-rc7). Do you
>> know of any memory leak affecting m68k, introduced between last November and
>> 3.13-rc7?
>>     
>
> How much RAM and swap do you have?
>   

14 MB ST-RAM, 512 MB FastRAM, 2GB swap.

> Modern kernels just require more memory...
>   
Surely not that much more, I hope?

Cheers,

    Michael


>   
