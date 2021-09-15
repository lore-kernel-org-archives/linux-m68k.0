Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E97DC433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 08:39:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CD03606A5
	for <linux-m68k@archiver.kernel.org>; Wed, 15 Sep 2021 08:39:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231917AbhIOIkZ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbhIOIkY (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 15 Sep 2021 04:40:24 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 692DFC061574
        for <linux-m68k@vger.kernel.org>; Wed, 15 Sep 2021 01:39:06 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id bb10so1200407plb.2
        for <linux-m68k@vger.kernel.org>; Wed, 15 Sep 2021 01:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=3eMAd8NZD6fpQ0sd/4XuhupHmQ14+NpB0MWyOyYQcw0=;
        b=cmxBp4hS94AFP6GUM8E1j0qj46XXq1i0eRrQEf98elO4QDMX0IdA+ncj06TQtpQ6MP
         PtHWItGpIH4YNdscTg4+ThSA5E+jTxwP3QJwzPHKjxA79UkykTd20tkEf4G2D4SQ5aQa
         tHWDv67vPC1oqOtZ4ZtHHPyTSDIJB3LzdzmAvCmgheNGrFIqxOKi0twm5NUTxYek4dqH
         QEaQSNF58REijMUdc8WllWQ/BGxZbAWXh2kek7rj2q/jwy77DhOoVKY1GKZTNn0a0WPv
         5yRgZM7E+hXWDIDeLohtK7fkwHyFKdnXgzEB/UnDtfNQFpi9oQTj6ScvQhpT/kgrjBYj
         oxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=3eMAd8NZD6fpQ0sd/4XuhupHmQ14+NpB0MWyOyYQcw0=;
        b=vr1yvefKvbDHAO5YLMz/qf0icc/uQVqhk3uphYWvQwAEYBijPPTGP6cNBbPTidR+W0
         mZosJQqwElWyyiNpoahSTc3o0mz6mSSxDGJjp+aMOiZOVKU6N7Cu+TEKYNm84SRWdXIU
         6iAymGE/UTs2KB+dsDn34n1JdC6qKRI7NgPY3WTyV/QJKA1Z8LUIjzOidvI21TYONgec
         3Iinl9VCHaUEPJZiTNmeWBO+N8c1m8W7Es8Epfy1bO+DwUbtdMDHdLrUoac0EFCJ4LNr
         0OKke/Fwuab0eFh0zf7fmMhQJJBSwa8RUMzFWcw/0Q967JzHkscCOh0waNvNDCIFM8b/
         bUug==
X-Gm-Message-State: AOAM532pkgJBlP8WJdBdDcP4LhlkWCLCwjUrrnzX697DByIxMDgmS64l
        TyhAHDmhvPSzwjv2d2pWoQe5WkNhdJ0=
X-Google-Smtp-Source: ABdhPJy7RwLbke6kEULI29vXteTP1tded5bTTuLRzZMvcSwPqK3yC/wzLOW5rrRSzvKwHYfTXkjSNQ==
X-Received: by 2002:a17:90b:1bcf:: with SMTP id oa15mr7239931pjb.58.1631695145672;
        Wed, 15 Sep 2021 01:39:05 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id d3sm4054973pjc.49.2021.09.15.01.39.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:39:05 -0700 (PDT)
Subject: Re: Mainline kernel crashes, was Re: RFC: remove set_fs for m68k
To:     Finn Thain <fthain@linux-m68k.org>
References: <20210721170529.GA14550@lst.de>
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
 <189062a2-2b82-8185-2a5b-75a9282dca79@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <c5ee66a3-5227-b49a-c9d7-c8f69a8aca97@gmail.com>
Date:   Wed, 15 Sep 2021 20:37:23 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <189062a2-2b82-8185-2a5b-75a9282dca79@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On 15/09/21 13:38, Finn Thain wrote:
> On Mon, 13 Sep 2021, Michael Schmitz wrote:
>
>>>>
>>>> Incidentally - have you ever checked whether Al Viro's signal
>>>> handling fixes have an impact on these bugs?
>>>>
>>>
>>> I will try that patch series if you think it is related.
>>
>> Initial tests look promising (but I've said that before).
>>
>
> Here's what I found in recent tests on my Quadra 630.
>
> The usual stress-ng panic can happen without list corruption, even with
> local_irq_save/restore() added to do_IRQ().
>
> The panic did not show up at all during stress tests with Al's signal
> handling patch series.
>
> I think my results are consistent with yours.

Thanks - that's encouraging to hear. My tests with Christoph's patches 
on top of Al's haven't shown any further errors either, but I'll give 
that combination some more workout.

Would you care to add your tested-by for Al's patches?

Cheers,

	Michael

>
> The kernel's 'memtest' didn't detect any bad DRAM but it isn't
> particularly thorough so I'm running some tests with memtester-4.5.1.
>
