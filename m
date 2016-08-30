From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 7/8] m68k: only generate FPU instructions of CONFIG_FPU
Date: Tue, 30 Aug 2016 08:26:22 +0200
Message-ID: <CAMuHMdUCAzHFG0XOQ8AKb3Y=ERrgToVOUCrew4ub9jAZwAm44A@mail.gmail.com>
References: <1472471004-4580-1-git-send-email-gerg@linux-m68k.org>
 <1472471004-4580-8-git-send-email-gerg@linux-m68k.org> <CAMuHMdWZEG+mtX+339QbKVfaHXf6TsTs6dVvFsuBjaXDP9t8Rw@mail.gmail.com>
 <dd16c1a3-5fe9-7d93-fb73-52f58ee91bcc@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:34991 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751804AbcH3G0Y (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Aug 2016 02:26:24 -0400
Received: by mail-it0-f67.google.com with SMTP id f128so1215819ith.2
        for <linux-m68k@vger.kernel.org>; Mon, 29 Aug 2016 23:26:23 -0700 (PDT)
In-Reply-To: <dd16c1a3-5fe9-7d93-fb73-52f58ee91bcc@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Greg,

On Tue, Aug 30, 2016 at 1:58 AM, Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 29/08/16 22:53, Geert Uytterhoeven wrote:
>> On Mon, Aug 29, 2016 at 1:43 PM, Greg Ungerer <gerg@linux-m68k.org> wrote:
>>> Most of the m68k code that supports a hardware FPU is surrounded by
>>> CONFIG_FPU. Except this setup code in setup_mm.c. Be consistent and
>>> surround these hardware FPU instructions with CONFIG_FPU instead of
>>> a check based on CONFIG_M68KFPU_EMU_ONLY.
>>>
>>> The side effect of this is that we can now compile a kernel with no
>>> m68k/ColdFire hardware support FPU instructions at all (if we do not
>>> define CONFIG_FPU).
>>>
>>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
>>> ---
>>>  arch/m68k/kernel/setup_mm.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
>>> index 13f4640..00290c4 100644
>>> --- a/arch/m68k/kernel/setup_mm.c
>>> +++ b/arch/m68k/kernel/setup_mm.c
>>> @@ -245,7 +245,7 @@ void __init setup_arch(char **cmdline_p)
>>>          * We should really do our own FPU check at startup.
>>>          * [what do we do with buggy 68LC040s? if we have problems
>>>          *  with them, we should add a test to check_bugs() below] */
>>> -#ifndef CONFIG_M68KFPU_EMU_ONLY
>>> +#ifdef CONFIG_FPU
>>>         /* clear the fpu if we have one */
>>>         if (m68k_fputype & (FPU_68881|FPU_68882|FPU_68040|FPU_68060|FPU_COLDFIRE)) {
>>>                 volatile int zero = 0;
>>
>> This piece of code is now compiled in if CONFIG_M68KFPU_EMU_ONLY=y?
>
> Yes, that is true. In that scenario I would expect m68k_fputype
> to be 0. So it wouldn't be executed.
>
> The problem for me on ColdFire is that we currently do not
> support the FPU emulation (the assembler for it is not ColdFire
> clean). So in this case here we can't have CONFIG_M68KFPU_EMU_ONLY=y.
>
> Would you prefer if it became:
>
>   #if defined(CONFIG_FPU) && !defined(CONFIG_M68KFPU_EMU_ONL)

(with the missing "Y" added)

Yes, I prefer not to change the semantics of M68KFPU_EMU_ONLY, whose
help text states:

    "This option prevents any floating-point instructions from being
     compiled into the kernel"

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
