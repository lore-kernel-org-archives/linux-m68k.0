Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB80C636D7
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Feb 2023 22:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbjBPWDZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Feb 2023 17:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjBPWDY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Feb 2023 17:03:24 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0823E63E
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Feb 2023 14:03:22 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id kk7-20020a17090b4a0700b00234463de251so7326021pjb.3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 16 Feb 2023 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tk54cGH4LqQLVC9wacMRd+1/MbtH+DDbz5meeqWmlLg=;
        b=Cn/Z8dptlM1o5l8Qv2p3Oaokark0bEAl1MucuaCKlVeM+0nhegqv6XBQSJ7iLJkXtE
         cQpSFXJsZsnqKjyy1NVXcMCPM8yVsKLZIY1IXS7NLrGMbScUo5PmC6krigekwmd/lx2O
         pc1qgDKmO0d6YsxcPD/c6i18hhvWvWng7n9BRq2rs9lKMlp46D+6wCgng8wUOp7JUlS8
         ITkvtg1QaQJCfndc1GwCoZx7zw3v3BljoOu33hQQQPv0Oae8m0Qi025g/G0ouXCDH0HB
         8WoCU6zMHYKSuwklsq/FTsCnJ0F3o2zfMnQeNVO2j7SvoPxgwNoAlz9YqmsXkxCPhC7g
         Uw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk54cGH4LqQLVC9wacMRd+1/MbtH+DDbz5meeqWmlLg=;
        b=zokT0PwkYnFqsBUHdjPAI5P80L2t+EXpfd4cG/MUEigIfn+gciEz7ipkvMttiTLYjK
         NQEvBC4KTuhn1xAQw/ZiFwFWAGa2LtyVVxIiOBN9Uhi6a4ertogb7Xl3ZtsRiE6heBw1
         CHW3CQsWFaYTdORswcI2wilFDWlBPzEGgkbiWtuqwpqlBIK0uuYaZbWBg50WJZ6kfkxG
         fe7BtK2bCU+cjkvxawJgdRls5lk4tJuxvmo1tBAedyRxCcwXECIfqD19KWg+TICcAfAu
         w58eSdeK2ANw1iylpaCta8yLuwP/B0tSpFV3T7KfTpveg+eTTKGVG2it/gVm1HZu+q10
         s4Yw==
X-Gm-Message-State: AO0yUKU+vaammK1VdbzA9kycLl6hOkViXVwQpD0R4sMMx2gDw46wRO2J
        ntXjO0nbCmo0yilKpuBas8g=
X-Google-Smtp-Source: AK7set/O7mi33sTg65iC+16XhIxGTaiqxvui8Y6X+Ehn5Zki9wIVvuZcanngN2uUvi/EFQX18Bb5iA==
X-Received: by 2002:a17:903:2844:b0:19a:9797:1631 with SMTP id kq4-20020a170903284400b0019a97971631mr5811307plb.3.1676585002264;
        Thu, 16 Feb 2023 14:03:22 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:8dff:a3c:def2:5826? ([2001:df0:0:200c:8dff:a3c:def2:5826])
        by smtp.gmail.com with ESMTPSA id 13-20020a170902ee4d00b0019919b7e5b1sm1789528plo.168.2023.02.16.14.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 14:03:21 -0800 (PST)
Message-ID: <a1783a1c-b599-0e44-e88c-181470c5675f@gmail.com>
Date:   Fri, 17 Feb 2023 11:03:16 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 15/17] m68k: Implement the new page table range API
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch@vger.kernel.org
References: <20230215000446.1655635-1-willy@infradead.org>
 <20230215200920.1849567-1-willy@infradead.org>
 <20230215200920.1849567-2-willy@infradead.org>
 <84c923f7-c60b-068d-bb06-48aea1412f53@gmail.com>
 <Y+2wdSxVgS6HmFRy@casper.infradead.org>
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <Y+2wdSxVgS6HmFRy@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Matthew,

On 16/02/23 17:26, Matthew Wilcox wrote:
> On Thu, Feb 16, 2023 at 01:59:44PM +1300, Michael Schmitz wrote:
>> Matthew,
>>
>> On 16/02/23 09:09, Matthew Wilcox (Oracle) wrote:
>>> Add set_ptes(), update_mmu_cache_range(), flush_icache_pages() and
>>> flush_dcache_folio().  I'm not entirely certain that the 040/060 case
>>> in __flush_pages_to_ram() is correct.
>> I'm pretty sure you need to iterate to hit each of the pages - the code as
>> is will only push cache entries for the first page.
>>
>> Quoting the 040 UM:
>>
>> "Both instructions [cinv, cpush] allow operation on a single cache line, all
>> cache lines in a specific page, or an entire cache, and can select one or
>> both caches for the operation. For line and page operations, a physical
>> address in an address register specifies the memory address."
> I actually found that!  What I didn't find was how to tell if this
> cpush insn is the one which is operating on a single cache line,
> a single page, or the entire cache.
>
> So I should do a loop around this asm and call it once for each page
> we're flushing?

Yes, that's the idea. I'm uncertain whether contiguous virtual pages are 
always guaranteed to have contiguous physical mappings, so no point in 
trying to 'optimize' and shift the loop into inline assembly.

Cheers,

     Michael



>
