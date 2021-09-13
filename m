Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A79CC433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 03:41:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E43060F4C
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 03:41:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235725AbhIMDnD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 12 Sep 2021 23:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235475AbhIMDnC (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 12 Sep 2021 23:43:02 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA952C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 20:41:47 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id k24so8117203pgh.8
        for <linux-m68k@lists.linux-m68k.org>; Sun, 12 Sep 2021 20:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=xVGgrmx4awBGKxk+0c47kVd8YhnOLULEhNM1wunSC0g=;
        b=nMt661fcseGQIRBvmhq4oCE2DBVK9HvWINCTX8nhwjbsHp5fxnc9IPsHaIq+zfgZB5
         77e0/Ms5szUDqDlvY6W8ABdFuK6CM+y9ls4vc9Gsei8SZyTJnq/DlZ8mwGCgdwHC9I4x
         l5Qp5Q1tmx8xKUnpjj8n39emy0S/H1QYHUTyAZqn3tfWMHopJGeY1l204zR2XEbU8sNT
         f53sVBl7pUXMVX+x9AG/zUWUoYp030YImZzPHDa52zRZdbbC5XPpfrA09pickyP1s8Cz
         Oy4eiIpvbQUVRTjiqKn8iKJGwno5qQujlRJc8NlUWO7xM4fKvg57BCHhFx67x69RfPC9
         Z4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=xVGgrmx4awBGKxk+0c47kVd8YhnOLULEhNM1wunSC0g=;
        b=eir5389rocosaPgnJm0Kvj1nsmhK/Z4Xs2f0jGiD4JCbYpG8NpkOTrE2LtxQk7oETX
         Z1BGQlf1aZMrfAWUP1DN7qOrOIx+hTisid4YvZC567EXgy1SX9dff0vKwnOcNf8Tp+tm
         B8BdveqIBjoXu1s2RT1YWh/4ztO6RzHrymrX2Ejx9AddDMrK2Kun9UI/t+lel9GFOXkv
         ibxFTeviV8/0yywS6GFqFeLsPK+Hho3/mLCSCUwSPsC4k9y1+AnyNRXekK+8pr3NCvob
         +joVxpP718SVumx0T0+pWLBT5RXZQkaeOGGzHlttO027MIQKlI+VeZ7VQHY/NMoihme4
         PdWQ==
X-Gm-Message-State: AOAM530x1bbA4Olqojldf9CgfauOREMstKBOQKPs9TnDSmtAwO/JPBms
        xMobhz/XOYpYLe2ZaROEPpE=
X-Google-Smtp-Source: ABdhPJxgVHybidTX3FzGRmoXG9xwlnZcFM4uvfjiaQqAUXgQryGMfY3dBqUylMfgtmnypO5LpmogDQ==
X-Received: by 2002:a63:c045:: with SMTP id z5mr9177888pgi.374.1631504506905;
        Sun, 12 Sep 2021 20:41:46 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id m9sm533076pfh.94.2021.09.12.20.41.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Sep 2021 20:41:46 -0700 (PDT)
Subject: Re: [RFC] m68k: Enable memtest kernel parameter
To:     Finn Thain <fthain@linux-m68k.org>, linux-m68k@lists.linux-m68k.org
References: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Cc:     Mike Rapoport <rppt@kernel.org>
Message-ID: <b1b630b8-d6b6-661b-b5c1-2a2831b5b8c2@gmail.com>
Date:   Mon, 13 Sep 2021 15:40:12 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <9fac90da-18d5-7b89-96a5-3cf9dbc8bcf8@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 13/09/21 13:34, Finn Thain wrote:
>
> This appears to work on Aranym, QEMU and the Quadra 630 I have here.
> It is completely untested on Coldfire etc. I don't even know whether the
> right memory mappings are in place for this to actually work as intended.

The comment just above the section from paging_init() in your patch 
states that all physical memory is mapped into kernel virtual address 
space. I don't think that mapping is contiguous though.

> Would someone take a look please?
>
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 6e40f7f29ebc..d87e12b4855b 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -9,6 +9,7 @@ config M68K
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
>  	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
>  	select ARCH_NO_PREEMPT if !COLDFIRE
> +	select ARCH_USE_MEMTEST
>  	select ARCH_WANT_IPC_PARSE_VERSION
>  	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>  	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index 3a653f0a4188..d6301a094fc1 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -455,6 +455,8 @@ void __init paging_init(void)
>
>  	flush_tlb_all();
>
> +	early_memtest(min_addr, max_addr);
> +
>  	/*
>  	 * initialize the bad page table and bad page to point
>  	 * to a couple of allocated pages
>

I'd rather start that from availmem, not from min_addr ... I'm amazed 
this works - I'd expect the kernel text segment to get trashed by the 
memory test routines.

Cheers,

	Michael
