From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Thu, 30 Jan 2014 20:54:40 +1300
Message-ID: <52EA0540.2030503@biophys.uni-duesseldorf.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <201401122100.28877.arnd@arndb.de> <52E61895.6000007@gmail.com> <201401291553.53531.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:35566 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752538AbaA3HzB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 30 Jan 2014 02:55:01 -0500
Received: by mail-pd0-f179.google.com with SMTP id q10so2726947pdj.10
        for <linux-m68k@vger.kernel.org>; Wed, 29 Jan 2014 23:55:00 -0800 (PST)
In-Reply-To: <201401291553.53531.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux//m68k <linux-m68k@vger.kernel.org>

Hi Arnd,
> On Monday 27 January 2014, Michael Schmitz wrote:
>   
>> I will submit patches to the Atari SCSI driver based on Arnd's patch 
>> later this week. Has Arnd's initial patch made it into mainline yet?
>>     
>
> I've been a little occupied with other work recently, so I have never
> gotten around to post a non-RFC version of the sleep_on patches.
> Some have been picked up by various maintainers anyway, but this
> one has not.
>   

OK, I will resend a merged patch for you or Geert to submit further up 
the food chain.

> Thanks so much for taking care of this one!
>   

No matter - thanks for taking the time to look into arcane stuff like 
Atari SCSI drivers!

Cheers,

    Michael

> 	Arnd
>   
