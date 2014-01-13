From: schmitz <schmitz@biophys.uni-duesseldorf.de>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Mon, 13 Jan 2014 21:20:39 +1300
Message-ID: <52D3A1D7.5020307@biophys.uni-duesseldorf.de>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <1388664474-1710039-3-git-send-email-arnd@arndb.de> <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de> <52D1F299.7080909@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:36187 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751291AbaAMIVA (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Jan 2014 03:21:00 -0500
Received: by mail-pd0-f172.google.com with SMTP id z10so1773440pdj.31
        for <linux-m68k@vger.kernel.org>; Mon, 13 Jan 2014 00:20:59 -0800 (PST)
In-Reply-To: <52D1F299.7080909@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: arnd@arndb.de
Cc: Michael Schmitz <schmitzmic@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Linux//m68k <linux-m68k@vger.kernel.org>

Arnd,
>
> I'll debug this a bit to see where it gets stuck. Thanks for looking 
> into this ugly mess of code!
>
> Cheers,
>
>    Michael
>
>
>
> Michael Schmitz wrote:
>> Geert,
>>
>> thanks for passing that on - I had in fact disabled that feature of 
>> the driver for a good part of the 3.x series of kernels while 
>> attempting to figure out what else is wrong with the locking scheme.
>>
>> I'll take a fresh stab at this.
>>
>> Cheers,
>>
>>     Michael
>>
>>
>> Am 03.01.2014 um 01:26 schrieb Geert Uytterhoeven:
>>
>>> ---------- Forwarded message ----------
>>> From: Arnd Bergmann <arnd@arndb.de>
>>> Date: Thu, Jan 2, 2014 at 1:07 PM
>>> Subject: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
>>> To: linux-kernel@vger.kernel.org
>>> Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
>>> <geert@linux-m68k.org>, "James E.J. Bottomley"
>>> <JBottomley@parallels.com>, linux-scsi@vger.kernel.org
>>>
>>>
>>> sleep_on is known broken and going away. The atari_scsi driver is 
>>> one of
>>> two remaining users in the falcon_get_lock() function, which is a 
>>> rather
>>> crazy piece of code. This does not attempt to fix the driver's locking
>>> scheme in general, but at least prevents falcon_get_lock from going to
>>> sleep when no other thread holds the same lock or tries to get it,
>>> and we no longer schedule with irqs disabled.
>>>
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>>> Cc: James E.J. Bottomley <JBottomley@parallels.com>
>>> Cc: linux-scsi@vger.kernel.org
>>> ---
>>>  drivers/scsi/atari_scsi.c | 12 +++++++++---
>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
>>> index a3e6c8a..b55a58a 100644
>>> --- a/drivers/scsi/atari_scsi.c
>>> +++ b/drivers/scsi/atari_scsi.c
>>> @@ -90,6 +90,7 @@
>>>  #include <linux/init.h>
>>>  #include <linux/nvram.h>
>>>  #include <linux/bitops.h>
>>> +#include <linux/wait.h>
>>>
>>>  #include <asm/setup.h>
>>>  #include <asm/atarihw.h>
>>> @@ -549,8 +550,10 @@ static void falcon_get_lock(void)
>>>
>>>         local_irq_save(flags);
>>>
>>> -       while (!in_irq() && falcon_got_lock && stdma_others_waiting())
>>> -               sleep_on(&falcon_fairness_wait);
>>> +       wait_event_cmd(falcon_fairness_wait,
>>> +                      !in_irq() && falcon_got_lock && 
>>> stdma_others_waiting(),

Replace by:
                      in_irq() || !falcon_got_lock || 
!stdma_others_waiting(),
 
Much better now. Needs stress testing on real hardware, but that'll have 
to wait until the weekend I guess.

Cheers,

    Michael
