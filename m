Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E87C433F5
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:18:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 749F160F9F
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:18:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhIMFT6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhIMFT5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 01:19:57 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD54C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 22:18:42 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so5702596pjc.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 22:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=eAr7IGTCY/oeEs4JWryKAUqtbazAAQ+YiWcbPULMT8c=;
        b=SqApj1LVCOII+Qirda+N/5xKZv0BQCLAlCoR115cndVwxEQOLH1CYjaCdqPMdlmvy3
         XMoqNbF48jQVZwn7kkaGaSaajgsyDvLFS5ylE7e1I96aF0/tA+r/WbYNKyEQcQrODBk2
         1xtIRkOMZqKDK+sb3KJeagmBIvk7b7HwdJEPaBd3v5VAIjDyd+5XJuHx3zghv8reHcjv
         oAcpQyvseOuPv1723wYq0ISA5pv1UZdrTmwJz+dLts89tWO0J0DGx5fgpPCkFtHT/9G5
         lcrTc/p7DmNzw0tSoW7sjyTFPvUxPPOifBCQRATT6DtjvaUnuX+1DSqtugrhUbuKZY3k
         R6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=eAr7IGTCY/oeEs4JWryKAUqtbazAAQ+YiWcbPULMT8c=;
        b=75ZT5S9PXQJpi7qUUU3xroBVALTbTydJOSEY5kRgPoXszV8vndT9MKKixHcHYkamE7
         nf+pGdd969JFaP02BXmKBMO++em87j2xDyxWo+3uhLBQIWMNQo+fTlJpSc7G8Ce7Kcfv
         vt0oeESDLhHPAYRQG2U5r5dwhRYezVWwLfH7kKeWWCGtVJIkz0DfOcNnrqFqyNPOumDj
         guSzOa6IrKkTR/USpxZBKcRFZ28TmNBiq/GUqiaq3eA7e2HJFWiLUCAHHL4JJdGH5DJA
         kiM5n3L0VCpymVhfsuE5VjuQFOJT2uxw4CuZlVdDgDFaNmmDIIQ4m5jmvdqHQGEqdwl0
         dzOQ==
X-Gm-Message-State: AOAM530iU9hYDVAOEnbw5R0tymLinyW94e1uVWalLfZ0nHHBkdap7Yjp
        b1gY3SVBXl9mDyZWtiQcvt4=
X-Google-Smtp-Source: ABdhPJyw3tkZ6FnvAV5qbHk5O+2NRiwXmn3qSRtO/5QFj0QEmKTZdKnPGurXNeeonHOuh0XF+1McpA==
X-Received: by 2002:a17:902:7103:b0:13a:356c:d0e8 with SMTP id a3-20020a170902710300b0013a356cd0e8mr9005477pll.32.1631510321735;
        Sun, 12 Sep 2021 22:18:41 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id m64sm6337147pga.55.2021.09.12.22.18.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 22:18:41 -0700 (PDT)
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
To:     Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
Cc:     Mike Rapoport <rppt@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3c3db102-b9d3-e5cd-648b-7c4ee2af70a6@gmail.com>
Date:   Mon, 13 Sep 2021 17:17:06 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

it looks as though early_memtest() does skip allocated and unmapped 
areas, so I'd say this looks fine.

Cheers,

	Michael


On 13/09/21 15:40, Michael Schmitz wrote:
> Hi Finn,
>
> On 13/09/21 13:34, Finn Thain wrote:
>>
>> This appears to work on Aranym, QEMU and the Quadra 630 I have here.
>> It is completely untested on Coldfire etc. I don't even know whether the
>> right memory mappings are in place for this to actually work as intended.
>
> The comment just above the section from paging_init() in your patch
> states that all physical memory is mapped into kernel virtual address
> space. I don't think that mapping is contiguous though.
>
>> Would someone take a look please?
>>
>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>> index 6e40f7f29ebc..d87e12b4855b 100644
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -9,6 +9,7 @@ config M68K
>>      select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>>      select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>>      select ARCH_NO_PREEMPT if !COLDFIRE
>> +    select ARCH_USE_MEMTEST
>>      select ARCH_WANT_IPC_PARSE_VERSION
>>      select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>      select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
>> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
>> index 3a653f0a4188..d6301a094fc1 100644
>> --- a/arch/m68k/mm/motorola.c
>> +++ b/arch/m68k/mm/motorola.c
>> @@ -455,6 +455,8 @@ void __init paging_init(void)
>>
>>      flush_tlb_all();
>>
>> +    early_memtest(min_addr, max_addr);
>> +
>>      /*
>>       * initialize the bad page table and bad page to point
>>       * to a couple of allocated pages
>>
>
> I'd rather start that from availmem, not from min_addr ... I'm amazed
> this works - I'd expect the kernel text segment to get trashed by the
> memory test routines.
>
> Cheers,
>
>     Michael
