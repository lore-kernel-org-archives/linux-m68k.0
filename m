From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 09/36] m68k: set register a2 to current if MMU enabled
 on ColdFire
Date: Mon, 31 Oct 2011 14:19:03 +1000
Message-ID: <4EAE21B7.3040702@snapgear.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>	<1319527168-11166-10-git-send-email-gerg@snapgear.com> <CAMuHMdWU-W9jDYs4KMRvyB7uxs2gKS7_FEz6QQr1jDxWY2xPKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:38153 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750891Ab1JaER7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 31 Oct 2011 00:17:59 -0400
In-Reply-To: <CAMuHMdWU-W9jDYs4KMRvyB7uxs2gKS7_FEz6QQr1jDxWY2xPKQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

Hi Geert,

On 30/10/11 23:06, Geert Uytterhoeven wrote:
> On Tue, Oct 25, 2011 at 09:19,<gerg@snapgear.com>  wrote:
>> From: Greg Ungerer<gerg@uclinux.org>
>>
>> Virtual memory m68k systems build with register a2 dedicated to bein=
g the
>> current proc pointer. Add code to the ColdFire interrupt and excepti=
on
>> processing to set this on entry, and also at context switch time.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>> arch/m68k/kernel/entry_no.S  24 ++++++++++++++++++------
>> arch/m68k/platform/coldfire/entry.S | 18 +++++++++++++++++-
>> 2 files changed, 35 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/m68k/kernel/entry_no.S b/arch/m68k/kernel/entry_no=
=2ES
>> index 1b42890..050d7ea 100644
>> --- a/arch/m68k/kernel/entry_no.S
>> +++ b/arch/m68k/kernel/entry_no.S
>> @@ -44,8 +44,12 @@
>>
>>  	ENTRY(buserr)
>>  	SAVE_ALL_INT
>> -	moveq	#-1,%d0
>> - 	movel	%d0,%sp@(PT_OFF_ORIG_D0)
>
> Don't you need the above anymore, at least on nommu?

Yes it is needed, but it is done in the SAVE_ALL_INT macro now.
That was done in commit 61619b12078dc8b85a3d4cbfa16f650daa341bd1
("m68k: merge mmu and non-mmu include/asm/entry.h files").

It sure has nothing to do with the a2 work that the patch description
says above :)  I'll move this change into a separate patch with
appropriate comments.

Regards
Greg



>> +#ifdef CONFIG_MMU
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %sp,%d0 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* get thread_info pointer */
>> + =C3=A1 =C3=A1 =C3=A1 andl =C3=A1 =C3=A1#-THREAD_SIZE,%d0 =C3=A1 =C3=
=A1 =C3=A1 /* at start of kernel stack */
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d0,%a2
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %a2@,%a2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1/* current pointer into a2 */
>> +#endif
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %sp,%sp@- =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* stack frame pointer argument */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1jsr =C3=A1 =C3=A1 buserr_c
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1addql =C3=A1 #4,%sp
>> @@ -53,8 +57,12 @@ ENTRY(buserr)
>>
>> =C3=A1ENTRY(trap)
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1SAVE_ALL_INT
>> - =C3=A1 =C3=A1 =C3=A1 moveq =C3=A1 #-1,%d0
>> - =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d0,%sp@(PT_OFF_ORIG_D0)
>
> Same here.
>
>> +#ifdef CONFIG_MMU
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %sp,%d0 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* get thread_info pointer */
>> + =C3=A1 =C3=A1 =C3=A1 andl =C3=A1 =C3=A1#-THREAD_SIZE,%d0 =C3=A1 =C3=
=A1 =C3=A1 /* at start of kernel stack */
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d0,%a2
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %a2@,%a2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1/* current pointer into a2 */
>> +#endif
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %sp,%sp@- =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* stack frame pointer argument */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1jsr =C3=A1 =C3=A1 trap_c
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1addql =C3=A1 #4,%sp
>> @@ -65,8 +73,12 @@ ENTRY(trap)
>> =C3=A1.globl dbginterrupt
>> =C3=A1ENTRY(dbginterrupt)
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1SAVE_ALL_INT
>> - =C3=A1 =C3=A1 =C3=A1 moveq =C3=A1 #-1,%d0
>> - =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d0,%sp@(PT_OFF_ORIG_D0)
>> +#ifdef CONFIG_MMU
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %sp,%d0 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* get thread_info pointer */
>> + =C3=A1 =C3=A1 =C3=A1 andl =C3=A1 =C3=A1#-THREAD_SIZE,%d0 =C3=A1 =C3=
=A1 =C3=A1 /* at start of kernel stack */
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d0,%a2
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %a2@,%a2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1/* current pointer into a2 */
>> +#endif
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %sp,%sp@- =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* stack frame pointer argument */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1jsr =C3=A1 =C3=A1 dbginterrupt_c
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1addql =C3=A1 #4,%sp
>> diff --git a/arch/m68k/platform/coldfire/entry.S b/arch/m68k/platfor=
m/coldfire/entry.S
>> index f567a16..5fc1f40 100644
>> --- a/arch/m68k/platform/coldfire/entry.S
>> +++ b/arch/m68k/platform/coldfire/entry.S
>> @@ -63,6 +63,13 @@ ENTRY(system_call)
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1SAVE_ALL_SYS
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1move =C3=A1 =C3=A1#0x2000,%sr =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* enable intrs again */
>>
>> +#ifdef CONFIG_MMU
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %sp,%d2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* get thread_info pointer */
>> + =C3=A1 =C3=A1 =C3=A1 andl =C3=A1 =C3=A1#-THREAD_SIZE,%d2 =C3=A1 =C3=
=A1 =C3=A1 /* at start of kernel stack */
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d2,%a2
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %a2@,%a2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1/* current pointer into a2 */
>> +#endif
>> +
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1cmpl =C3=A1 =C3=A1#NR_syscalls,%d0
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1jcc =C3=A1 =C3=A1 enosys
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1lea =C3=A1 =C3=A1 sys_call_table,%a0
>> @@ -166,6 +173,13 @@ Lsignal_return:
>> =C3=A1ENTRY(inthandler)
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1SAVE_ALL_INT
>>
>> +#ifdef CONFIG_MMU
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %sp,%d2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* get thread_info pointer */
>> + =C3=A1 =C3=A1 =C3=A1 andl =C3=A1 =C3=A1#-THREAD_SIZE,%d2 =C3=A1 =C3=
=A1 =C3=A1 /* at start of kernel stack */
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %d2,%a2
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %a2@,%a2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1/* current pointer into a2 */
>> +#endif
>> +
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movew =C3=A1 %sp@(PT_OFF_FORMATVEC),%d0 /=
* put exception # in d0 */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1andl =C3=A1 =C3=A1#0x03fc,%d0 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1 /* mask out vector only */
>>
>> @@ -190,7 +204,9 @@ ENTRY(resume)
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %sp,%a0@(TASK_THREAD+THREAD_=
KSP) /* save kernel stack pointer */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1RDUSP =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1/* movel %usp,%a3 */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %a3,%a0@(TASK_THREAD+THREAD_=
USP) /* save thread user stack */
>> -
>> +#ifdef CONFIG_MMU
>> + =C3=A1 =C3=A1 =C3=A1 movel =C3=A1 %a1,%a2 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1/* se=
t new current */
>> +#endif
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %a1@(TASK_THREAD+THREAD_USP)=
,%a3 /* restore thread user stack */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1WRUSP =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =
=C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=
=A1 =C3=A1 =C3=A1/* movel %a3,%usp */
>> =C3=A1 =C3=A1 =C3=A1 =C3=A1movel =C3=A1 %a1@(TASK_THREAD+THREAD_KSP)=
,%sp /* restore new kernel stack */
>
> Gr{oetje,eeting}s,
>
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1 =C3=A1=
 =C3=A1 =C3=A1 =C3=A1 =C3=A1=C3=A1 =C3=A1=C3=A1 -- Linus Torvalds
>
>
>


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
