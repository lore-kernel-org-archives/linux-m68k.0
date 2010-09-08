From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Wed, 8 Sep 2010 21:43:01 +1000
Message-ID: <4C8776C5.9030205@snapgear.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au> <AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:52993 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752741Ab0IHLpL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Sep 2010 07:45:11 -0400
In-Reply-To: <AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org


Hi Geert,

On 08/09/10 06:35, Geert Uytterhoeven wrote:
> On Tue, Sep 7, 2010 at 06:52, Greg Ungerer<gerg@snapgear.com>  wrote:
>> m68k/m68knommu: merge MMU and non-MMU string.h
>>
>> The MMU and non-MMU string.h varients (string_no.h and string_mm.h)
>> and almost the same. Switch to using the string_mm.h one, merging
>> in the necessary ColdFire support.
>>
>> Signed-off-by: Greg Ungerer<gerg@uclinux.org>
>> ---
>>   arch/m68k/include/asm/{string_mm.h =>  string.h} |   16 ++--
>>   arch/m68k/include/asm/string_no.h               |  126 -----------------------
>>   2 files changed, 9 insertions(+), 133 deletions(-)
>>   rename arch/m68k/include/asm/{string_mm.h =>  string.h} (98%)
>>   delete mode 100644 arch/m68k/include/asm/string_no.h
>>
>> diff --git a/arch/m68k/include/asm/string_mm.h b/arch/m68k/include/asm/string.h
>> similarity index 98%
>> rename from arch/m68k/include/asm/string_mm.h
>> rename to arch/m68k/include/asm/string.h
>> index 2eb7df1..2936dda 100644
>> --- a/arch/m68k/include/asm/string_mm.h
>> +++ b/arch/m68k/include/asm/string.h
>
> Thanks!
>
> How do you apply such renaming patches? I thought git can handle them, but
> `git am' just says:

Hmm, good question. Maybe I should generate stand alone patches
without gits rename detection turned on?


> | Applying: m68k/m68knommu: merge MMU and non-MMU string.h
> | error: arch/m68k/include/asm/string.h: already exists in index
> | Patch failed at 0001 m68k/m68knommu: merge MMU and non-MMU string.h
> | When you have resolved this problem run "git am --resolved".
> | If you would prefer to skip this patch, instead run "git am --skip".
> | To restore the original branch and stop patching run "git am --abort".
>
> And according to "git status" no files have conflicts??
>
> I ended up editing the patch to modify string_mm.h, and did the rename manually.
>
> I applied all patches (except the hardirq one) and am currently
> building my test kernels.

Thanks!


> Now I see:
>
> | arch/m68k/kernel/entry.S: Assembler messages:
> | arch/m68k/kernel/entry.S:56: Error: can't resolve `0' {*ABS*
> section} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:64: Error: can't resolve `0' {*UND*
> section} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:119: Error: can't resolve `0' {*UND*
> section} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:203: Error: can't resolve `0' {*UND*
> section} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:236: Error: can't resolve `0' {*UND*
> section} - `THREAD_SIZE' {*UND* section}
> | arch/m68k/kernel/entry.S:257: Error: can't resolve `0' {*UND*
> section} - `THREAD_SIZE' {*UND* section}
>
> this is expanded from `GET_CURRENT'.

Just a thought, is it enough to include thread_info.h inside entry_mm.h?

Regards
Greg


> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>
