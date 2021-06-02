Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14C3C47083
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Jun 2021 13:13:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8248E613D6
	for <linux-m68k@archiver.kernel.org>; Wed,  2 Jun 2021 13:13:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhFBNPB (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 2 Jun 2021 09:15:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229654AbhFBNPB (ORCPT <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 2 Jun 2021 09:15:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23AFD61246;
        Wed,  2 Jun 2021 13:13:16 +0000 (UTC)
Subject: Re: [PATCH 07/15] m68k: convert to setup_initial_init_mm()
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
 <20210529105504.180544-8-wangkefeng.wang@huawei.com>
 <CAMuHMdVvbA-bJCubhmKaJ_4VbKo+U538x7s34OkZ94kL7z4nrw@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <8305967a-4e1f-489e-e04a-cde8f8b5693d@linux-m68k.org>
Date:   Wed, 2 Jun 2021 23:13:14 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVvbA-bJCubhmKaJ_4VbKo+U538x7s34OkZ94kL7z4nrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 31/5/21 5:48 pm, Geert Uytterhoeven wrote:
> Hi Kefeng
> 
> (CC Greg for m68knommu)
> 
> On Sat, May 29, 2021 at 12:46 PM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>> Use setup_initial_init_mm() helper to simplify code.
>>
>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
>> Cc: linux-m68k@lists.linux-m68k.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/kernel/setup_mm.c
>> +++ b/arch/m68k/kernel/setup_mm.c
>> @@ -258,10 +258,7 @@ void __init setup_arch(char **cmdline_p)
>>                  }
>>          }
>>
>> -       init_mm.start_code = PAGE_OFFSET;
>> -       init_mm.end_code = (unsigned long)_etext;
>> -       init_mm.end_data = (unsigned long)_edata;
>> -       init_mm.brk = (unsigned long)_end;
>> +       setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
>> --- a/arch/m68k/kernel/setup_no.c
>> +++ b/arch/m68k/kernel/setup_no.c
>> @@ -87,10 +87,7 @@ void __init setup_arch(char **cmdline_p)
>>          memory_start = PAGE_ALIGN(_ramstart);
>>          memory_end = _ramend;
>>
>> -       init_mm.start_code = (unsigned long) &_stext;
>> -       init_mm.end_code = (unsigned long) &_etext;
>> -       init_mm.end_data = (unsigned long) &_edata;
>> -       init_mm.brk = (unsigned long) 0;
>> +       setup_initial_init_mm(_stext, _etext, _edata, (void *)0);
> 
> Please use NULL instead of (void *)0.

With that in place, no problems I see.

Acked-by: Greg Ungerer <gerg@linux-m68k.org>


> Gr{oetje,eeting}s,
> 
>                          Geert
> 
