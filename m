Return-Path: <SRS0=EXoE=AZ=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B0DC433E0
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Jul 2020 13:01:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 070B022475
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Jul 2020 13:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgGNNBj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Jul 2020 09:01:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:48340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728075AbgGNNBj (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Tue, 14 Jul 2020 09:01:39 -0400
Received: from [192.168.0.106] (unknown [193.114.103.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F099122473;
        Tue, 14 Jul 2020 13:01:37 +0000 (UTC)
Subject: Re: [PATCH] m68k: mm: fix wrong m68k_fixup_info addresses
To:     Angelo Dureghello <angelo.dureghello@timesys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <20200624233443.3346919-1-angelo.dureghello@timesys.com>
 <CAMuHMdVF848G0S788ufYxz8OO8rLTo-G9PRDO0Did3s0PGTNKg@mail.gmail.com>
 <CALJHbkAn4hKQRT8cp2dQr3+ndKCjZ_E1e2L2nKBzzFKgvSHn6w@mail.gmail.com>
 <CALJHbkDhygS8P9fo6qe2N+ifaPawmuqeCY5pXKTpnLU_5xkbSw@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <89c31d0b-c17b-eb79-bad9-1bb1496ca662@linux-m68k.org>
Date:   Tue, 14 Jul 2020 23:01:33 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALJHbkDhygS8P9fo6qe2N+ifaPawmuqeCY5pXKTpnLU_5xkbSw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Angelo,

On 14/7/20 5:41 am, Angelo Dureghello wrote:
> Hi Geert and all,
> 
> tested now building by kernel.org toolchain 10.1.0,
> i can boot with or without the above added volatile, jfyi.

So is the net out that this was a compiler/toolchain problem?

Regards
Greg


> Regards,
> angelo
> 
> On Fri, Jun 26, 2020 at 10:14 PM Angelo Dureghello
> <angelo.dureghello@timesys.com> wrote:
>>
>> Hi Geert !
>>
>> thanks a lot for the feedbacks.
>>
>> On Thu, Jun 25, 2020 at 10:13 AM Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>>
>>> Hi Angelo,
>>>
>>> Thanks for your patch!
>>>
>>> On Thu, Jun 25, 2020 at 1:28 AM Angelo Dureghello
>>> <angelo.dureghello@timesys.com> wrote:
>>>> On mcf5441x, mmu enabled, using a small initramfs, the boot was
>>>> recently hanging silently in the initial phase, inside
>>>> arch/m68k/mm/init.c, m68k_setup_node()
>>>>
>>>> initrd at 0x47d2f000:0x47d82f64
>>>> overlap at 1073741889 for chunk 0
>>>> overlap at 1073746176 for chunk 0
>>>> overlap at 1073746736 for chunk 0
>>>> overlap at 1073746737 for chunk 0
>>>> overlap at 1073746738 for chunk 0
>>>> overlap at 1073746739 for chunk 0
>>>> overlap at 1073746740 for chunk 0
>>>>
>>>>  From some debugging, at m68k_setup_node(), the 25-bits shift value
>>>> (virt_to_node_shift) seems unset, because applied to a wrong
>>>> address (address previously set from m68k_fixup).
>>>>
>>>> Tried some fixes, but the more low-risk and hopefully correct seems
>>>> to just add a volatile inside __virt_to_node_shift(). This seems to
>>>> produce correct addresses for the next fixup to work. Cannot test this
>>>> on other mmu ColdFire cpu's so every test is eventually welcome.
>>>>
>>>> Signed-off-by: Angelo Dureghello <angelo.dureghello@timesys.com>
>>>
>>>> --- a/arch/m68k/include/asm/page_mm.h
>>>> +++ b/arch/m68k/include/asm/page_mm.h
>>>> @@ -135,7 +135,7 @@ static inline __attribute_const__ int __virt_to_node_shift(void)
>>>>   {
>>>>          int shift;
>>>>
>>>> -       asm (
>>>> +       asm volatile (
>>>>                  "1:     moveq   #0,%0\n"
>>>>                  m68k_fixup(%c1, 1b)
>>>>                  : "=d" (shift)
>>>
>>> Perhaps we should add the volatile to the other asm statements, too?
>>> Andreas?
>>
>> I see volatile is there in other similar m68k asm code chunks,
>> it should not hurt.
>>
>>>
>>> Which compiler version are you using?
>>
>> It's a toolchain i prepared up here years ago,
>> export CROSS_COMPILE=/opt/toolchains/m68k/gcc-5.2.0-nolibc/bin/m68k-linux-
>>
>> If you have a link for a newer toolchain, happy to upgrade :)
>>
>>> Have you compared the difference in generated code?
>>>
>>> With gcc version 8.4.0 (Ubuntu 8.4.0-1ubuntu1~18.04), the above makes
>>> no difference for m68k_setup_node(), and the compiler doesn't even
>>> optimize away the call to __virt_to_node_shift(), which is marked
>>> __attribute_const__.
>>>
>>
>> Well, i only checked the assembly by objdump in object files, right now,
>> at least looking the m68k_fixup section in both cases, opcodes seems ok.
>>
>> with volatile:
>>
>> 00000000 <.m68k_fixup>:
>>     0: 4e71           nop
>> ...
>> 6: R_68K_32 .init.text+0x1e
>>     a: 4e71           nop
>>     c: 4e71           nop
>>     e: 0000           .short 0x0000
>>    10: 0001           .short 0x0001
>>    12: 0000           .short 0x0000
>> 12: R_68K_32 .init.text+0x22 correct, points to
>>                            22: 7200           moveq #0,%d1
>>
>>    14: 0000           .short 0x0000
>>    16: 4e71           nop
>>    18: 4e71           nop
>> ...
>> 1e: R_68K_32 .init.text+0x46
>>    22: 4e71           nop
>>
>>
>> without
>>
>>    00000000 <.m68k_fixup>:
>>     0: 4e71           nop
>>     2: 0000           .short 0x0000
>>     4: 0001           .short 0x0001
>>     6: 0000           .short 0x0000
>> 6: R_68K_32 .init.text+0x10, corrrect, points to
>>                10: 7200           moveq #0,%d1
>>
>>     8: 0000           .short 0x0000
>>     a: 4e71           nop
>>     c: 4e71           nop
>>
>> Do you see anything strange ? Or, how can i objdump better ?
>>
>>> Gr{oetje,eeting}s,
>>>
>>>                          Geert
>>>
>>
>> Thanks, regards
>> angelo
>>
>>> --
>>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>>
>>> In personal conversations with technical people, I call myself a hacker. But
>>> when I'm talking to journalists I just say "programmer" or something like that.
>>>                                  -- Linus Torvalds
> 
> 
> 
