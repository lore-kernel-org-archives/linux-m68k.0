Return-Path: <SRS0=X0A7=CS=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D869C433E2
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 07:54:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1AB920732
	for <linux-m68k@archiver.kernel.org>; Wed,  9 Sep 2020 07:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgIIHyo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 9 Sep 2020 03:54:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbgIIHyn (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Wed, 9 Sep 2020 03:54:43 -0400
Received: from [192.168.0.106] (193-116-198-1.tpgi.com.au [193.116.198.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CF15B206F4;
        Wed,  9 Sep 2020 07:54:40 +0000 (UTC)
Subject: Re: [PATCH] m68knommu: switch to using asm-generic/uaccess.h
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
References: <20200909021831.1881990-1-gerg@linux-m68k.org>
 <CAMuHMdU8DWRpnTp=iOGDqYbhsDaiDi9TtLLojm5Vd3umBbOo+w@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <7a0a274b-b047-db66-6005-224a7d063ddb@linux-m68k.org>
Date:   Wed, 9 Sep 2020 17:54:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU8DWRpnTp=iOGDqYbhsDaiDi9TtLLojm5Vd3umBbOo+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 9/9/20 4:55 pm, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Wed, Sep 9, 2020 at 4:18 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> Switch to using the asm-generic/uaccess functions for non-MMU builds.
>> Remove all the m68knommu local specific uaccess defines and macros.
>>
>> There is nothing so special about the m68knommu targets that they cannot
>> use all of the asm-generic uaccess support. Using the asm-generic
>> uaccess definitions also resolves some of the existing problems with
>> missing __user annotations in the m68knommu specific functions.
>>
>> The elimination of all of the contents of uaccess_no.h means we can fold
>> the uaccess_mm.h back into uaccess.h - and just have the single file
>> now.
>>
>> The resulting generated code ends up being slightly smaller (by a few
>> hundred bytes) due to the compilers ability to better optimize load
>> and stores without forcing its hand with asm statements.
>>
>> Specifically trivial cases like this contrived example:
>>
>>      get_user(x, ptr);
>>      x++;
>>      put_user(x, ptr);
>>
>> end up now being optimized to a single instruction on m68k. More
>> generally the compiler can avoid using a temporary register in many
>> cases as well.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for your patch!
> 
>> rename from arch/m68k/include/asm/uaccess_mm.h
>> rename to arch/m68k/include/asm/uaccess.h
>> index 9ae9f8d05925..f98208ccbbcd 100644
>> --- a/arch/m68k/include/asm/uaccess_mm.h
>> +++ b/arch/m68k/include/asm/uaccess.h
>> @@ -2,12 +2,15 @@
>>   #ifndef __M68K_UACCESS_H
>>   #define __M68K_UACCESS_H
>>
>> +#ifdef CONFIG_MMU
>> +
>>   /*
>>    * User space memory access functions
>>    */
>>   #include <linux/compiler.h>
>>   #include <linux/types.h>
>>   #include <asm/segment.h>
>> +#include <asm/extable.h>
> 
> For a moment, I wondered where this new include came from...
> 
> Seems like git doesn't show what happened to the old
> arch/m68k/include/asm/uaccess.h file, which was overwritten by the
> rename:
> 
>      -/* SPDX-License-Identifier: GPL-2.0 */
>      -#ifdef __uClinux__
>      -#include <asm/uaccess_no.h>
>      -#else
>      -#include <asm/uaccess_mm.h>
>      -#endif
>      -#include <asm/extable.h>
> 
> There it is ;-)
> 
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks Geert.

I noticed that in the diff too. I generated this one with
"git format-patch -1 -M -B" to make it easier to review. Otherwise you end up
with all those identical lines being inserted and deleted.
But it makes that "#include <asm/extable.h>" appear to come out of nowhere.

Regards
Greg



>>   /* We let the MMU do all checking */
>>   static inline int access_ok(const void __user *addr,
>> @@ -387,4 +390,8 @@ unsigned long __clear_user(void __user *to, unsigned long n);
>>
>>   #define clear_user     __clear_user
>>
>> +#else /* !CONFIG_MMU */
>> +#include <asm-generic/uaccess.h>
>> +#endif
>> +
>>   #endif /* _M68K_UACCESS_H */
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
