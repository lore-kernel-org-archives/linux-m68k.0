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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10BAC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:50:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF1EC60E97
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 05:50:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbhIMFv5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 01:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbhIMFv4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 13 Sep 2021 01:51:56 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EE1C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 22:50:41 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id 5so5074242plo.5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 22:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=sM9wc6R921yrAHjQ4DgZYxSRIwmvS5b3yoRkX3g9fuA=;
        b=ZWqcK7oHRg9m8xGQ+fD40jHri1F6kYlCgL9MdWe/Ypd77RXdEV/18UXteM8Masw9rZ
         CNFnIOI/dqQ1p6qUciTkCSePFuUnNDmL2PGacRnR7oxObFkFdlaOEbUAIpAEpx3sp0wX
         4nzVLIHNIgOct7Q1Lu8P0Gin8pBEbM6w1qcHp5luXAKQuZ+n84BQmgxj6wtRvgH0U4/U
         BU51xNfoNX/jEqwYPs5jwWq+3Dqw1J5rjktwtM4liLyZP/f3j2RgSW4jmkgyyYv1nlE/
         28izOJLoJtbNaBImrGdLZkn4WSE32xCeisR8VYQkUarST7++1jgrZetgGiP1e5Tfvc+I
         GlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=sM9wc6R921yrAHjQ4DgZYxSRIwmvS5b3yoRkX3g9fuA=;
        b=WH/YufJaHmmR1lTt6mDoyqRxXxUQkFAbiZc75y0ga/ekYG6wv5QzV9e9Xv6SFwMtuR
         ozewg1uroyNKKvDoFCpovWUuMTf5SBloQwp/UlsvrwxTDYIf1PI90aFWDt186dSBNOyo
         Cux6BfxMkBUM6aN6iPO6PAoFbYt4yWHZ0Za5bgNJtsNQJh4yfRUB8wrys3WQsg38i+tX
         jneuuQOcGt1LDVp/M9xtEPoeG3O93SX315p0VLno99Sg6nP2LMP3tqijesr4xyxab+hB
         Q1Sj1fI07bQhH6155XtIq8O8A8VoRJfgsG05UCBx0aagOHtoEDzkkimkUIbWccvwwdbF
         x4aQ==
X-Gm-Message-State: AOAM533LAeG0Xp0wiKBbSY73E+h/xnLwDDF2Qnwfltld6tUFEjn1lcP5
        Nu9MXU8Kb8Nf/UE77VxpUHlygjQQ04Y=
X-Google-Smtp-Source: ABdhPJwn1hFfncFVUqnzHajkoIkqHIHSwBY6hS7do2nUs+Ju8weQYhvp4TSCr4gbCL6gmXdjf2QYOg==
X-Received: by 2002:a17:90a:9a2:: with SMTP id 31mr11061985pjo.58.1631512240711;
        Sun, 12 Sep 2021 22:50:40 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id s3sm5579804pfd.188.2021.09.12.22.50.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 22:50:40 -0700 (PDT)
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
To:     Mike Rapoport <rppt@kernel.org>
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
 <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
 <YT7ky3zuUk5msHDs@kernel.org>
Cc:     Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ee0206da-f188-73e5-1512-2d057957ca63@gmail.com>
Date:   Mon, 13 Sep 2021 17:49:05 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <YT7ky3zuUk5msHDs@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

thanks - from what I can see, the easiest way to fix the problem we see 
with memtest clobbering the ramdisk data then is to either move the 
memblock_reserve() for the ramdisk image into paging_init(), or else 
move early_memtest() into setup_mm.c:setup_arch().

(Tried excepting the ramdisk range in when calling early_memtest() from 
paging_init() but that requires exporting m68k_ramdisk, Geert might not 
be overly keen on that).

Cheers,

	Michael


On 13/09/21 17:42, Mike Rapoport wrote:
> Hi Michael,
>
> On Mon, Sep 13, 2021 at 03:40:12PM +1200, Michael Schmitz wrote:
>> Hi Finn,
>>
>> On 13/09/21 13:34, Finn Thain wrote:
>>>
>>> This appears to work on Aranym, QEMU and the Quadra 630 I have here.
>>> It is completely untested on Coldfire etc. I don't even know whether the
>>> right memory mappings are in place for this to actually work as intended.
>>
>> The comment just above the section from paging_init() in your patch states
>> that all physical memory is mapped into kernel virtual address space. I
>> don't think that mapping is contiguous though.
>
> early_memtest() operates on physical ranges, so it does not matter what is
> the virtual mapping.
>
>>> Would someone take a look please?
>>>
>>> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
>>> index 6e40f7f29ebc..d87e12b4855b 100644
>>> --- a/arch/m68k/Kconfig
>>> +++ b/arch/m68k/Kconfig
>>> @@ -9,6 +9,7 @@ config M68K
>>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>>>  	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>>>  	select ARCH_NO_PREEMPT if !COLDFIRE
>>> +	select ARCH_USE_MEMTEST
>>>  	select ARCH_WANT_IPC_PARSE_VERSION
>>>  	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>>>  	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
>>> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
>>> index 3a653f0a4188..d6301a094fc1 100644
>>> --- a/arch/m68k/mm/motorola.c
>>> +++ b/arch/m68k/mm/motorola.c
>>> @@ -455,6 +455,8 @@ void __init paging_init(void)
>>>
>>>  	flush_tlb_all();
>>>
>>> +	early_memtest(min_addr, max_addr);
>>> +
>>>  	/*
>>>  	 * initialize the bad page table and bad page to point
>>>  	 * to a couple of allocated pages
>>>
>>
>> I'd rather start that from availmem, not from min_addr ... I'm amazed this
>> works - I'd expect the kernel text segment to get trashed by the memory test
>> routines.
>
> early_memtest() checks only free memory ranges, i.e. those that were not
> memblock_reserve()d, so as long as we reserve the range [min_addr,
> availmem] the memtest will skip it.
>
