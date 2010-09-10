From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Fri, 10 Sep 2010 11:00:15 +0200
Message-ID: <AANLkTim2pMkmVkwPUViXTuGN43x8Uo2pwMx-q_mfp2Df@mail.gmail.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>
	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
	<4C8776C5.9030205@snapgear.com>
	<AANLkTikhxWgp6xLDqPSLMax6LS2zT71d+WLZnmo-WCyH@mail.gmail.com>
	<4C89B5E4.5030104@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:35838 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754567Ab0IJJAR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 10 Sep 2010 05:00:17 -0400
Received: by fxm16 with SMTP id 16so1552790fxm.19
        for <linux-m68k@vger.kernel.org>; Fri, 10 Sep 2010 02:00:16 -0700 (PDT)
In-Reply-To: <4C89B5E4.5030104@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org

Hi Greg,

On Fri, Sep 10, 2010 at 06:36, Greg Ungerer <gerg@snapgear.com> wrote:
> Geert Uytterhoeven wrote:
>> On Wed, Sep 8, 2010 at 13:43, Greg Ungerer <gerg@snapgear.com> wrote=
:
>>> On 08/09/10 06:35, Geert Uytterhoeven wrote:
>>>>
>>>> Now I see:
>>>>
>>>> | arch/m68k/kernel/entry.S: Assembler messages:
>>>> | arch/m68k/kernel/entry.S:56: Error: can't resolve `0' {*ABS* sec=
tion}
>>>> - `THREAD_SIZE' {*UND* section}
>>>> | arch/m68k/kernel/entry.S:64: Error: can't resolve `0' {*UND* sec=
tion}
>>>> - `THREAD_SIZE' {*UND* section}
>>>> | arch/m68k/kernel/entry.S:119: Error: can't resolve `0' {*UND* se=
ction}
>>>> - `THREAD_SIZE' {*UND* section}
>>>> | arch/m68k/kernel/entry.S:203: Error: can't resolve `0' {*UND* se=
ction}
>>>> - `THREAD_SIZE' {*UND* section}
>>>> | arch/m68k/kernel/entry.S:236: Error: can't resolve `0' {*UND* se=
ction}
>>>> - `THREAD_SIZE' {*UND* section}
>>>> | arch/m68k/kernel/entry.S:257: Error: can't resolve `0' {*UND* se=
ction}
>>>> - `THREAD_SIZE' {*UND* section}
>>>>
>>>> this is expanded from `GET_CURRENT'.
>>>
>>> Just a thought, is it enough to include thread_info.h inside entry_=
mm.h?
>>
>> No, because <asm/thread_info.h> is no longer ASSEMBLY-clean, as it
>> includes
>> <asm/current.h>, which is C-only.
>> The #include <asm/current.h> in there used to be protected by #ifnde=
f
>> ASSEMBLY.
>> If I move that include up just above the definition of struct thread=
_info,
>> <asm/thread_info.h> is ASSEMBLY-clean again.
>>
>> However, just including <asm/thread_info.h> from <asm/entry_mm.h> ca=
uses
>> other
>> problems for the C part, as <asm/thread_info.h> needs the definition=
 of
>> struct
>> restart_block in <linux/thread_info.h>. And <linux/thread_info.h> is
>> definitely
>> not ASSEMBLY-clean.
>>
>> So I came up with the patch (white-space damaged due to the GMail we=
b
>> interface)
>> below. Note that this changes the behavior for m68knommu, which didn=
't
>> include
>> <asm/current.h> from <asm/thread_info.h> before. I hope it doesn't h=
urt...
>
> Unfortunately that breaks the m68knommu build:
>
> /home/gerg/new-wave.2635/linux-2.6.x.git/arch/m68k/include/asm/curren=
t.h: In
> function =E2=80=98get_current=E2=80=99:
> /home/gerg/new-wave.2635/linux-2.6.x.git/arch/m68k/include/asm/curren=
t.h:21:
> error: implicit declaration of function =E2=80=98current_thread_info=E2=
=80=99
> ...
>
> If we just wrap the include of asm/current.h with its own "#ifndef
> __ASSEMBLY__", instead of moving it from above struct thread_info,
> is that better for you?

Builds fine, too.

>> diff --git a/arch/m68k/include/asm/entry_mm.h
>> b/arch/m68k/include/asm/entry_mm.h
>> index 6f70823..73b8c8f 100644
>> --- a/arch/m68k/include/asm/entry_mm.h
>> +++ b/arch/m68k/include/asm/entry_mm.h
>> @@ -3,6 +3,9 @@
>>
>> =C2=A0#include <asm/setup.h>
>> =C2=A0#include <asm/page.h>
>> +#ifdef __ASSEMBLY__
>> +#include <asm/thread_info.h>
>> +#endif
>>
>> =C2=A0/*
>> =C2=A0* Stack layout in 'ret_from_exception':
>> diff --git a/arch/m68k/include/asm/thread_info.h
>> b/arch/m68k/include/asm/thread_info.h
>> index f28775e..aec5eff 100644
>> --- a/arch/m68k/include/asm/thread_info.h
>> +++ b/arch/m68k/include/asm/thread_info.h
>> @@ -22,6 +22,8 @@
>>
>> =C2=A0#ifndef __ASSEMBLY__
>>
>> +#include <asm/current.h>
>> +
>> =C2=A0struct thread_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct task_struct =C2=A0 =C2=A0 =C2=A0*t=
ask; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* main task structure */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 flags;
>> @@ -49,8 +51,6 @@ struct thread_info {
>>
>> =C2=A0#ifdef CONFIG_MMU
>>
>> -#include <asm/current.h>
>> -
>> =C2=A0#ifdef ASM_OFFSETS_C
>> =C2=A0#define task_thread_info(tsk) =C2=A0((struct thread_info *) NU=
LL)
>> =C2=A0#else

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
