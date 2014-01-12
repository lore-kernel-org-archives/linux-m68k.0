From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
Date: Sun, 12 Jan 2014 14:40:41 +1300
Message-ID: <52D1F299.7080909@gmail.com>
References: <1388664474-1710039-1-git-send-email-arnd@arndb.de> <1388664474-1710039-3-git-send-email-arnd@arndb.de> <CAMuHMdWNnOA8dtUPWfQfikTiWxe9-ZwMUU7gkfP3Mv8PcWcvyQ@mail.gmail.com> <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:48972 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750821AbaALBk7 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Jan 2014 20:40:59 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so5956791pbb.31
        for <linux-m68k@vger.kernel.org>; Sat, 11 Jan 2014 17:40:59 -0800 (PST)
In-Reply-To: <70d98fc4293247b4d5a11235a1d676b6@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, arnd@arndb.de
Cc: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>, Linux//m68k <linux-m68k@vger.kernel.org>

Arnd,

your patch breaks the Atari NCR5380 SCSI driver (easily verified using 
ARAnyM). Last console output:

> scsi0: options CAN_QUEUE=8 CMD_PER_LUN=1 SCAT-GAT=0 TAGGED-QUEUING=no 
> HOSTID=7 generic options AUTOSENSE REAL DMA SCSI-2 TAGGED QUEUING 
> generic release=7
> scsi0 : Atari native SCSI
> blk_queue_max_segments: set to minimum 1
> scsi0: aborting command
> scsi 0:0:0:0: CDB:
> Inquiry: 12 00 00 00 24 00
>
> NCR5380 core release=7.
> NCR5380: coroutine isn't running.
> scsi0: no currently connected command
> scsi0: issue_queue
> scsi0: disconnected_queue
> random: nonblocking pool is initialized
>
> scsi0: !!BINGO!! Falcon has no lock in NCR5380_abort
> scsi0: warning : SCSI command probably completed successfully before 
> abortion

No targets are connected, so the driver is expected to time out and 
abort each INQUIRY command. This works fine with the unmodified version 
of the driver (even though its locking scheme is well beyond crazy - I 
grant you that much). Note that the unmodified version also works fine 
on my actual Falcon hardware under moderate load (meaning to say, no 
hardware instabilities are triggered that would cause the SCSI chip to 
lock up and require a bus reset).

I'll debug this a bit to see where it gets stuck. Thanks for looking 
into this ugly mess of code!

Cheers,

    Michael



Michael Schmitz wrote:
> Geert,
>
> thanks for passing that on - I had in fact disabled that feature of 
> the driver for a good part of the 3.x series of kernels while 
> attempting to figure out what else is wrong with the locking scheme.
>
> I'll take a fresh stab at this.
>
> Cheers,
>
>     Michael
>
>
> Am 03.01.2014 um 01:26 schrieb Geert Uytterhoeven:
>
>> ---------- Forwarded message ----------
>> From: Arnd Bergmann <arnd@arndb.de>
>> Date: Thu, Jan 2, 2014 at 1:07 PM
>> Subject: [PATCH, RFC 02/30] scsi: atari_scsi: fix sleep_on race
>> To: linux-kernel@vger.kernel.org
>> Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
>> <geert@linux-m68k.org>, "James E.J. Bottomley"
>> <JBottomley@parallels.com>, linux-scsi@vger.kernel.org
>>
>>
>> sleep_on is known broken and going away. The atari_scsi driver is one of
>> two remaining users in the falcon_get_lock() function, which is a rather
>> crazy piece of code. This does not attempt to fix the driver's locking
>> scheme in general, but at least prevents falcon_get_lock from going to
>> sleep when no other thread holds the same lock or tries to get it,
>> and we no longer schedule with irqs disabled.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: James E.J. Bottomley <JBottomley@parallels.com>
>> Cc: linux-scsi@vger.kernel.org
>> ---
>>  drivers/scsi/atari_scsi.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/scsi/atari_scsi.c b/drivers/scsi/atari_scsi.c
>> index a3e6c8a..b55a58a 100644
>> --- a/drivers/scsi/atari_scsi.c
>> +++ b/drivers/scsi/atari_scsi.c
>> @@ -90,6 +90,7 @@
>>  #include <linux/init.h>
>>  #include <linux/nvram.h>
>>  #include <linux/bitops.h>
>> +#include <linux/wait.h>
>>
>>  #include <asm/setup.h>
>>  #include <asm/atarihw.h>
>> @@ -549,8 +550,10 @@ static void falcon_get_lock(void)
>>
>>         local_irq_save(flags);
>>
>> -       while (!in_irq() && falcon_got_lock && stdma_others_waiting())
>> -               sleep_on(&falcon_fairness_wait);
>> +       wait_event_cmd(falcon_fairness_wait,
>> +                      !in_irq() && falcon_got_lock && 
>> stdma_others_waiting(),
>> +                      local_irq_restore(flags),
>> +                      local_irq_save(flags));
>>
>>         while (!falcon_got_lock) {
>>                 if (in_irq())
>> @@ -562,7 +565,10 @@ static void falcon_get_lock(void)
>>                         falcon_trying_lock = 0;
>>                         wake_up(&falcon_try_wait);
>>                 } else {
>> -                       sleep_on(&falcon_try_wait);
>> +                       wait_event_cmd(falcon_try_wait,
>> +                                      !falcon_got_lock && 
>> !falcon_trying_lock,
>> +                                      local_irq_restore(flags),
>> +                                      local_irq_save(flags));
>>                 }
>>         }
>>
>> -- 
>> 1.8.3.2
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
