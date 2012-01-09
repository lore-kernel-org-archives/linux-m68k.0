From: Tuomas Vainikka <tuomas.vainikka@aalto.fi>
Subject: Re: Atari TT (next)
Date: Mon, 9 Jan 2012 14:40:26 +0200
Message-ID: <4F0AE03A.7050501@aalto.fi>
References: <4F079F6B.8080502@fairlite.co.uk>	<4F07EA66.6020603@gmail.com>	<4F08E748.4020305@fairlite.co.uk>	<4F0917E9.9090600@gmail.com>	<4F0964EC.2080505@fairlite.co.uk>	<CAOmrzkLH18VCY0dzJPM14dn5ccWmSBkiPzq8EFqnCDHiM3bECQ@mail.gmail.com>	<4F0A2DD0.4000707@fairlite.co.uk>	<CAOmrzk+P3mPXu_Q_KxgEk_jx-JNhXY4ydrKoGM+43LpD5icTHw@mail.gmail.com>	<4F0A3CDE.7070308@fairlite.co.uk>	<4F0A421C.9000600@fairlite.co.uk>	<m2wr91yxa4.fsf@igel.home> <CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mx06.aalto.fi ([130.233.222.105]:52475 "EHLO mx06.aalto.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752424Ab2AIMts (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Mon, 9 Jan 2012 07:49:48 -0500
In-Reply-To: <CAMuHMdXjWyEEOS4fJEaY1dg_cZWLyTps85jaQzsvbO_44-UhqA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On 01/09/2012 02:14 PM, Geert Uytterhoeven wrote:
> On Mon, Jan 9, 2012 at 11:40, Andreas Schwab<schwab@linux-m68k.org>  wrote:
>> Alan Hourihane<alanh@fairlite.co.uk>  writes:
>>
>>> *** FORMAT ERROR ***   FORMAT=0
>>> Current process id is 768
>>> BAD KERNEL TRAP: 00000000
>>> Modules linked in:
>>> PC: [<000029de>] flush_thread+0x8/0xe
>> void flush_thread(void)
>> {
>>         unsigned long zero = 0;
>>
>>         current->thread.fs = __USER_DS;
>>         if (!FPU_IS_EMU)
>>                 asm volatile (".chip 68k/68881\n\t"
>>                               "frestore %0@\n\t"
>>                               ".chip 68k" : : "a" (&zero));
>> }
>>
>> GCC is optimizing away the initialisation of zero, since nothing visible
>> is using its value.
>>
>> Andreas.
>>
>> --------------------------->8----------------------------------------
>>  From bbf7451db90fcec5eade9d8bc913b78829192b9c Mon Sep 17 00:00:00 2001
>> From: Andreas Schwab<schwab@linux-m68k.org>
>> Date: Mon, 9 Jan 2012 11:36:18 +0100
>> Subject: [PATCH] m68k: fix assembler constraint to prevent overeager gcc
>>   optimisation
>>
>> Passing the address of a variable as an operand to an asm statement
>> doesn't mark the value of this variable as used, so gcc optimized its
>> initialisation away.  Fix this by using a "m" constraint instead.
>> ---
>>   arch/m68k/kernel/process_mm.c |    4 ++--
>>   1 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/m68k/kernel/process_mm.c b/arch/m68k/kernel/process_mm.c
>> index 1bc223a..aa4ffb8 100644
>> --- a/arch/m68k/kernel/process_mm.c
>> +++ b/arch/m68k/kernel/process_mm.c
>> @@ -189,8 +189,8 @@ void flush_thread(void)
>>         current->thread.fs = __USER_DS;
>>         if (!FPU_IS_EMU)
>>                 asm volatile (".chip 68k/68881\n\t"
>> -                             "frestore %0@\n\t"
>> -                             ".chip 68k" : : "a" (&zero));
>> +                             "frestore %0\n\t"
>> +                             ".chip 68k" : : "m" (zero));
>>   }
>>
>>   /*
>> --
>> 1.7.8.3
> Thanks!
>
> Tuomas: I think this will fix your problem, too?
>
I'll stop nagging if it works. :)

Tuomas
