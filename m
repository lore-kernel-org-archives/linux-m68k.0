From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Tue, 14 Jan 2014 21:29:45 +1300
Message-ID: <52D4F579.50806@gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <1388664474-1710039-3-git-send-email-arnd@arndb.de> <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de> <52D1F299.7080909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:50710 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750880AbaANI35 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 14 Jan 2014 03:29:57 -0500
Received: by mail-pa0-f52.google.com with SMTP id kx10so4958584pab.39
        for <linux-m68k@vger.kernel.org>; Tue, 14 Jan 2014 00:29:57 -0800 (PST)
In-Reply-To: <52D1F299.7080909@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, arnd@arndb.de
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

Arnd,

this one looks like it should be changed as well:
>>> @@ -562,7 +565,10 @@ static void falcon_get_lock(void)
>>>                         falcon_trying_lock = 0;
>>>                         wake_up(&falcon_try_wait);
>>>                 } else {
>>> -                       sleep_on(&falcon_try_wait);
>>> +                       wait_event_cmd(falcon_try_wait,
>>> +                                      !falcon_got_lock && 
>>> !falcon_trying_lock,

I think using falcon_got_lock && !falcon_trying_lock here reflects what 
we try to achieve - the if branch above this will set that exact
condition, then wake the wait queue. Any other calls to falcon_get_lock 
that have been waiting on the lock should then continue on
as the lock is now held by the driver. Thoughts?

I've not see that case used in a cursory test on hardware, more stress 
testing is needed (logging lock history to a kernel buffer instead
of clogging up the console).

Cheers,

     Michael

>>> + local_irq_restore(flags),
>>> +                                      local_irq_save(flags));
>>>                 }
>>>         }
>>>
>>> -- 
>>> 1.8.3.2
>>> -- 
>>> To unsubscribe from this list: send the line "unsubscribe 
>>> linux-m68k" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>
>
