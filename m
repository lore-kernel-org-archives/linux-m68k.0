From: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: [PATCH 7/8] m68k: only generate FPU instructions of CONFIG_FPU
Date: Tue, 30 Aug 2016 17:30:46 +1000
Message-ID: <3dee32f2-10b9-ecea-dfe5-8811b2f02ac7@linux-m68k.org>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
 <1472471004-4580-8-git-send-email-gerg@linux-m68k.org>
 <CAMuHMdWZEG+mtX+339QbKVfaHXf6TsTs6dVvFsuBjaXDP9t8Rw@mail.gmail.com>
 <dd16c1a3-5fe9-7d93-fb73-52f58ee91bcc@linux-m68k.org>
 <CAMuHMdUCAzHFG0XOQ8AKb3Y=ERrgToVOUCrew4ub9jAZwAm44A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out4.external.iinet.net.au ([203.59.1.220]:33257
        "EHLO icp-osb-irony-out4.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750697AbcH3H27 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 30 Aug 2016 03:28:59 -0400
In-Reply-To: <CAMuHMdUCAzHFG0XOQ8AKb3Y=ERrgToVOUCrew4ub9jAZwAm44A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,

On 30/08/16 16:26, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Tue, Aug 30, 2016 at 1:58 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 29/08/16 22:53, Geert Uytterhoeven wrote:
>>> On Mon, Aug 29, 2016 at 1:43 PM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>>> Most of the m68k code that supports a hardware FPU is surrounded by
>>>> CONFIG_FPU. Except this setup code in setup_mm.c. Be consistent and
>>>> surround these hardware FPU instructions with CONFIG_FPU instead of
>>>> a check based on CONFIG_M68KFPU_EMU_ONLY.
>>>>
>>>> The side effect of this is that we can now compile a kernel with no
>>>> m68k/ColdFire hardware support FPU instructions at all (if we do not
>>>> define CONFIG_FPU).
>>>>
>>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>>> ---
>>>>  arch/m68k/kernel/setup_mm.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
>>>> index 13f4640..00290c4 100644
>>>> --- a/arch/m68k/kernel/setup_mm.c
>>>> +++ b/arch/m68k/kernel/setup_mm.c
>>>> @@ -245,7 +245,7 @@ void __init setup_arch(char **cmdline_p)
>>>>          * We should really do our own FPU check at startup.
>>>>          * [what do we do with buggy 68LC040s? if we have problems
>>>>          *  with them, we should add a test to check_bugs() below] */
>>>> -#ifndef CONFIG_M68KFPU_EMU_ONLY
>>>> +#ifdef CONFIG_FPU
>>>>         /* clear the fpu if we have one */
>>>>         if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
>>>>                 volatile int zero = 0;
>>>
>>> This piece of code is now compiled in if CONFIG_M68KFPU_EMU_ONLY=y?
>>
>> Yes, that is true. In that scenario I would expect m68k_fputype
>> to be 0. So it wouldn't be executed.
>>
>> The problem for me on ColdFire is that we currently do not
>> support the FPU emulation (the assembler for it is not ColdFire
>> clean). So in this case here we can't have CONFIG_M68KFPU_EMU_ONLY=y.
>>
>> Would you prefer if it became:
>>
>>   #if defined(CONFIG_FPU) && !defined(CONFIG_M68KFPU_EMU_ONL)
> 
> (with the missing "Y" added)

Yep :-)


> Yes, I prefer not to change the semantics of M68KFPU_EMU_ONLY, whose
> help text states:
> 
>     "This option prevents any floating-point instructions from being
>      compiled into the kernel"

Ok, makes sense. I'll change an repost that patch.

Thanks!
Greg
