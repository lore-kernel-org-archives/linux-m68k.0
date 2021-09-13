Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886D6C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 07:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67BE760F4A
	for <linux-m68k@archiver.kernel.org>; Mon, 13 Sep 2021 07:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237599AbhIMHXR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 03:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237598AbhIMHXQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Sep 2021 03:23:16 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7377AC061574
        for <linux-m68k@vger.kernel.org>; Mon, 13 Sep 2021 00:22:01 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id n18so8584537pgm.12
        for <linux-m68k@vger.kernel.org>; Mon, 13 Sep 2021 00:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=TobJmJd3uZrVEXJWipVb7Ho4alBqqMfAAc6rb99Phng=;
        b=EOIgBV+USHP6BBV0Vuxvf7AezmjDvhMqkzTglCgRbsnyYkNhWKNk3l+as4pEDm35ms
         02MejLSAHUKXHotzJpel7AboCCGXCyp01TFDxZMPaIxWS0f1ErdHZp+lc1TS+X2uEgwH
         WC/Z7oa9LXicKrGxG/0tCnOGy/bHzKj6hrz2h14P+wwKoRzsZFBpsaV9jYlgWjaZSeE6
         IPx7kJ2XRlu+0zDrXlKbE5MK484A5T/JS51bKnN0sTiBXfadkB3o2XV98kXTQYjQLTDc
         qlC6XQhVMzBIUwtRlkVL4vFQL8poxne57q0V9oUQh7fOZALpsV/4dbcBNeT5TWS+ZUzS
         jB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=TobJmJd3uZrVEXJWipVb7Ho4alBqqMfAAc6rb99Phng=;
        b=IWj2K/6geY1T0DCJeq9DsriE0CAx2AK/f+n4z7kigNMCvil86sSIAVxXGEdheSCQwb
         P502fWYUtEdnPfwFucNN7JeJQJo61Z6SlTyzhFvlod1huE9lbS8TUupM9XCeBGiYQe/O
         yOPzqG7eo9qWhAF6+VN+2tijHe1djzhHtlroj8m2enrK2wAuuc19oP5/Yk+uuPp+GJCY
         nPDvCwU/PH754qNlOoaGJLDhK7zPR5rDHFKnVbSJBjYQvpvz/d9qnRg8w8xmEeyl0xJ3
         CSZAoTIoqSWJbrOk2UilwX61AaCDe1CcURym2Hxeh06JScpdbWQVyZV93tkYosMk+V/A
         sp1A==
X-Gm-Message-State: AOAM531hrJQx29xW75Svm0gsPpxrM1yrM7lkOw0irjkZhj3xWcdx92Xj
        bIk31mWI7JeCOznowXV6TQZSqP7fPAs=
X-Google-Smtp-Source: ABdhPJyZLkF5zh8KpC3C7LLWh5ZTozFEBPMaSMhjZo8rk3ohsxN7VVLfc4UoXiUNvPmi6R4zrMrWTQ==
X-Received: by 2002:a63:480a:: with SMTP id v10mr9944784pga.113.1631517720684;
        Mon, 13 Sep 2021 00:22:00 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id b29sm7135048pgn.53.2021.09.13.00.21.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Sep 2021 00:22:00 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
 <dc594142-e459-533e-cac2-c7a213cec464@gmail.com>
 <f4ab2dcb-6761-c60b-54ce-35d0d017d371@gmail.com>
 <d772d22e-a945-3e35-80a2-f4783893bea@linux-m68k.org>
 <b2c55280-657b-51c2-065c-3fc93db050b9@gmail.com>
 <d7b8f7eb-fc18-c8d-fe3e-dcdf19d3f4b@linux-m68k.org>
 <755e55ba-4ce2-b4e4-a628-5abc183a557a@linux-m68k.org>
 <b52a10fe-3e4b-5740-d3f8-52bce3bc988@linux-m68k.org>
 <31f27da7-be60-8eb-9834-748b653c2246@linux-m68k.org>
 <ed2ca322-b957-cd52-8d2f-a8edd2785625@linux-m68k.org>
 <977bb34f-6de9-3a9e-818f-b1aa0758f78f@gmail.com>
 <fa8682aa-c5f4-7995-166d-8fa899594b19@linux-m68k.org>
 <42b30d4f-b871-51ea-1b0e-479f4fe096eb@gmail.com>
 <7ac7a41a-53f9-b13c-83fa-2c6b8ef2b90@linux-m68k.org>
 <0477f373-86c9-dacb-a7b1-25fe4b3befd3@gmail.com>
 <2c624213-6a4-799c-45e-a1be578dd5f@linux-m68k.org>
 <d59a44c-ddea-a774-d217-2484ad582dc0@linux-m68k.org>
 <82f6f161-b9e0-bf9b-3c20-aa2ce810d99a@gmail.com>
 <4564a46-2115-9058-2a9-2d77736291c@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com>
Date:   Mon, 13 Sep 2021 19:20:25 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <4564a46-2115-9058-2a9-2d77736291c@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 13/09/21 17:22, Finn Thain wrote:
> On Mon, 13 Sep 2021, Michael Schmitz wrote:
>
>>>
>>> [23982.680000] list_add corruption. next->prev should be prev
>>> (00b51e98), but was 00bb22d8. (next=00b75cd0).
>>
>> I chased a similar list corruption bug (shadow LRU list corrupt in
>> mm/workingset.c:shadow_lru_isolate()) in 4.10. I believe that was
>> related to an out of bounds memory access - maybe get_reg() from
>> drivers/char/random.c but it might have been something else.
>>
>> That bug had disappeared in 4.12, haven't seen it ever since.
>>
>
> Do all of your builds have BUG_ON_DATA_CORRUPTION and DEBUG_LIST enabled?

None had, but that particular list corruption had generated warnings, 
and null pointer accesses. __list_del() uses WRITE_ONCE() now, can't 
remember that from 4.10 (but the log for linux/list.h doesn't mention 
adding WRITE_ONCE so I suppose it must have been there).

>
>>
>> Incidentally - have you ever checked whether Al Viro's signal handling
>> fixes have an impact on these bugs?
>>
>
> I will try that patch series if you think it is related.

Initial tests look promising (but I've said that before).

> So far the problem seems to be confined to one machine. Stress tests on
> other mac models did not yet reproduce the problem.

Yes, that's suspicious. I'll keep you posted.

Cheers,

	Michael
