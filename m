Return-Path: <SRS0=2kwO=74=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38461C433E0
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 13:33:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11E2A20739
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Jun 2020 13:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgFONc7 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Jun 2020 09:32:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730058AbgFONc6 (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 15 Jun 2020 09:32:58 -0400
Received: from [10.44.0.192] (unknown [103.48.210.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4FE152071A;
        Mon, 15 Jun 2020 13:32:56 +0000 (UTC)
Subject: Re: [PATCH 1/5] m68knommu: fix overwriting of bits in ColdFire V3
 cache control
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Joachim Dietrich <jo.dietrich@gmx.de>
References: <20200615063508.2435061-1-gerg@linux-m68k.org>
 <CAMuHMdV=LORyqrFPLTuysHVBEqcKXuDydr15b883yStjaVrWZQ@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <50281a07-31eb-d4e3-4491-9ed648542f3d@linux-m68k.org>
Date:   Mon, 15 Jun 2020 23:32:54 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV=LORyqrFPLTuysHVBEqcKXuDydr15b883yStjaVrWZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 15/6/20 9:26 pm, Geert Uytterhoeven wrote:
> On Mon, Jun 15, 2020 at 8:38 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> The Cache Control Register (CACR) of the ColdFire V3 has bits that
>> control high level caching functions, and also enable/disable the use
>> of the alternate stack pointer register (the EUSP bit) to provide
>> separate supervisor and user stack pointer registers. The code as
>> it is today will blindly clear the EUSP bit on cache actions like
>> invalidation. So it is broken for this case - and that will result
>> in failed booting (interrupt entry and exit processing will be
>> completely hosed).
>>
>> This only affects ColdFire V3 parts that support the alternate stack
>> register (like the 5329 for example) - generally speaking new parts do,
>> older parts don't. It has no impact on ColdFire V3 parts with the single
>> stack pointer, like the 5307 for example.
>>
>> Fix the cache bit defines used, so they maintain the EUSP bit when
>> carrying out cache actions through the CACR register.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/include/asm/m53xxacr.h
>> +++ b/arch/m68k/include/asm/m53xxacr.h
>> @@ -89,9 +89,9 @@
>>    * coherency though in all cases. And for copyback caches we will need
>>    * to push cached data as well.
>>    */
>> -#define CACHE_INIT       CACR_CINVA
>> -#define CACHE_INVALIDATE  CACR_CINVA
>> -#define CACHE_INVALIDATED CACR_CINVA
>> +#define CACHE_INIT        (CACHE_MODE + CACR_CINVA)
> 
> This line is different from the RFC v2 in
> https://www.spinics.net/lists/linux-m68k/msg13973.html ?

Thanks Geert, you are absolutely correct. I will generate a v2
with the correct change.

Regards
Greg

