Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D3EC433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 03:15:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A07FA60FDA
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Sep 2021 03:15:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237213AbhINDQr (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 13 Sep 2021 23:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238135AbhINDQr (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 13 Sep 2021 23:16:47 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A88AC061574
        for <linux-m68k@vger.kernel.org>; Mon, 13 Sep 2021 20:15:29 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id g14so10821181pfm.1
        for <linux-m68k@vger.kernel.org>; Mon, 13 Sep 2021 20:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=HoG1CRkqnPAtOoAv6b09kulUP0T/YlAugQZLXP2TvVA=;
        b=fhhrv7QqiZvZlSRPqK5OUuZCHqLxZbSIEj97V5l/smb+FoDxmH3NrulJRsvsRHy7NI
         Ki/SAgU8qMS03mxd8tgBHGX08WxMVRT6v8FfOHeNUQff+1E67oPFx5xftlRritSGwrZ6
         v/xM8vuUwyVhJVN3GbwAWqrVq3SExBaA9kN/qISG1Gj79bTYuNyb2WiEYljig1zgMYyG
         kzOIFeCdqQCBUeTscsB3P61Mi/4946o0JySTLZdGsQLpMYVUpwknfVSNJYl39+ACoYLJ
         wyA/J58zs6jdlQdT89p7nsTyJ8l0G26spHFChNqH87AqDC8qHnjNKWiRhhj1h5ed08QP
         +rLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=HoG1CRkqnPAtOoAv6b09kulUP0T/YlAugQZLXP2TvVA=;
        b=dJ6TTRPsKslwURUKEmZqcYSnCNTtvzuDDhcU80gvq69fwGtsYtnfLaXtlqebxfD+Yn
         slMKAevjKIWJtHSbumLd9aUb32EmDG/3Z87PEYqQYFqoGq+PKOKtE9sgLpkqvn0qrvck
         tvDqgwgVdvIrPm3UV/qkFyBnMT3I8aY1BuM57Ka4NBs7DmOhLUzs7IScy9+N4zSh36NU
         SEcgqu+VszAgRVTKtdEm7EAp2UCjAS3i07pTUuwNIKLp6TkKzLicdsRpXq9r7a1gi6XG
         oaROTA/oGHyamdxrdrJbNi6ZCWcCSos9RUDFJEcZsOxuZvAgTiTcXs5H7gNzm4zJ9fsf
         beMA==
X-Gm-Message-State: AOAM5322vwopzlq54Wl5ma9ylr7rsgnI75POo93Hn0Zp7Sudp4TIV4GH
        jweV7FlFc+K/PuCaosIwrkGCHPN7t70=
X-Google-Smtp-Source: ABdhPJwtxTkPL3CsxsRsTXp5PwQ8j9+RRWMBVFUuaWAFGlBV2vo1+ZbWSV3+iiMfmJfJlc2UgTpjFQ==
X-Received: by 2002:aa7:8246:0:b029:39a:1e0a:cd48 with SMTP id e6-20020aa782460000b029039a1e0acd48mr2531954pfn.14.1631589328659;
        Mon, 13 Sep 2021 20:15:28 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id 4sm8169056pjb.21.2021.09.13.20.15.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Sep 2021 20:15:27 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
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
 <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <38c23979-e662-2f7b-2bae-53955f9ab443@gmail.com>
Date:   Tue, 14 Sep 2021 15:13:50 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b43a3f6d-3d91-e1c6-bafd-103326087d50@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 13/09/21 19:20, Michael Schmitz wrote:
>>>
>>> Incidentally - have you ever checked whether Al Viro's signal handling
>>> fixes have an impact on these bugs?
>>>
>>
>> I will try that patch series if you think it is related.
>
> Initial tests look promising (but I've said that before).
>
>> So far the problem seems to be confined to one machine. Stress tests on
>> other mac models did not yet reproduce the problem.
>
> Yes, that's suspicious. I'll keep you posted.

I've seen neither format errors in resume_userspace() nor bus errors in 
setup_frame() after two days of tests (and would have expected multiple 
errors in that amount of time). Al's patches appear to have fixed these 
errors for me. And that makes a lot of sense, considering handling of 
multiple signals was broken before, and would have been expected to 
result in corrupt exception frames on return from exception, and just 
the sort of format errors I'd seen.

I still have to trace what issues the incorrect exception stack handling 
would have caused in setup_frame() to force a bus error on the first 
__put_user() there.

My tests were run successfully without any disabling of interrupts games 
BTW.

The issues on 040 would be very similar, and I don't think you'd seen 
format errors on exception return or bus errors in setup_frame(), so 
this might not matter to you.

Cheers,

	Michael


