Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB68BC433B4
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Apr 2021 19:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B22E761153
	for <linux-m68k@archiver.kernel.org>; Tue, 27 Apr 2021 19:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbhD0TaN (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 27 Apr 2021 15:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238690AbhD0TaM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 27 Apr 2021 15:30:12 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC2DC061574
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Apr 2021 12:29:27 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id j6so2691418pfh.5
        for <linux-m68k@lists.linux-m68k.org>; Tue, 27 Apr 2021 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4DnDRAFKRSlzBzYaivgjtMj5wX1pqux3PzUstCHe6KE=;
        b=BJ0bqGD8MnjBlehJ3RU4NzEVMGbtX/qpT5wYt8CP2afSy2MZcwNDHieJSEEM5Lg0c9
         uScbs4PNygryH15EVVuS+mxcccHjOeNJYC9mjAePpSua+0jxDkWhwL0p/YRaEA3N8O6/
         FE7hIyMF9zr69mdHJw/N+j0AMykr/u0WhuyEsRyljYaJ/IR619g8Oe4/OXaIeegz+wth
         RMK8f+2XADN13ckRvaehiICCApPnizze+rD4rj/wAIFqwAd//1ASSvL2ARoAQc1h2Dx3
         htsG4CBeez1H+RzRqO52VEnERgS1HNFpZv8XR9g1o8hlFKYezFWPufJo2bPoVUl9+Sxy
         G9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4DnDRAFKRSlzBzYaivgjtMj5wX1pqux3PzUstCHe6KE=;
        b=Q4tjcHDYqqq6U3NW6Xt8NAr5vNFKcxT2YP6s5OO9aiAqVdqf+kmVpQUae4DvHvYeIE
         3DmzwajfVWKne1uvPGVnrnWWT96naiiWSK+neKWzuZukNvxF6/xM5y6/ZUimZKTjYfNS
         AdAp/4xgb0+iwjohekVSK4bD6Gaml7U9ropYWdbKPN4RYl1yMAvWgEIwBzTd0Srg/FPE
         xeks/0unetQjFsO3Sg5fIEI7ZC5G/IoM9lccLUBw8eQfN2bgjwblGstx1LHhCmCFGtqL
         6YF8YmW2reQ8eOVdOkdaHnVNhZKvwCOTBLWNGuDpQ1Lf1QdFcQYyvG8g2uBYCvQy8ZnV
         VzDQ==
X-Gm-Message-State: AOAM530lvXD6/+YyKR/EvfhKzOtiVWN5n1NIklL9GojfLU40u5wBL55m
        DJ9iPyRH9S725Tqw8oCHDTU=
X-Google-Smtp-Source: ABdhPJw9e+tGS96lq3oOZM/s//+pqsPvbTeG8lwZt6ks9l/bAzVja8Dc+WiCSP/HaeSr+dgWtdBX0A==
X-Received: by 2002:a63:f90d:: with SMTP id h13mr5623041pgi.18.1619551767150;
        Tue, 27 Apr 2021 12:29:27 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:2d50:30a4:47de:1dd6? ([2001:df0:0:200c:2d50:30a4:47de:1dd6])
        by smtp.gmail.com with ESMTPSA id k15sm3263204pfi.0.2021.04.27.12.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Apr 2021 12:29:26 -0700 (PDT)
Subject: Re: [PATCH] m68k/mac: Replace macide driver with generic platform
 driver
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Finn Thain <fthain@fastmail.com.au>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Finn Thain <fthain@telegraphics.com.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Joshua Thompson <funaho@jurai.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        linux-ide@vger.kernel.org
References: <793432cca963b632709c4d1312baa9874d73e1d8.1619341585.git.fthain@telegraphics.com.au>
 <ba908b1d-eab5-a4e5-0c0a-2c745287d121@physik.fu-berlin.de>
 <10a08764-c138-9fe5-966c-ce68349b9b6@nippy.intranet>
 <65f01f42-31d9-522a-e690-73d286405a01@gmail.com>
 <dbd5ddaa-c0ee-5aad-20d9-7fae5e2618af@gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <7c5eae75-d1de-171a-07ad-9c34ec7325b2@gmail.com>
Date:   Wed, 28 Apr 2021 07:29:20 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <dbd5ddaa-c0ee-5aad-20d9-7fae5e2618af@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 27/04/21 8:11 pm, Sergei Shtylyov wrote:
> On 27.04.2021 4:51, Michael Schmitz wrote:
>
>>> Was macide the only IDE driver in Debian/m68k kernels without a libata
>>> alternative? If so, this patch would allow you to finally drop 
>>> CONFIG_IDE.
>>>
>> There's still q40ide.c (ISA IDE interface, byte-swapped, so would 
>> need treatment similar to Falcon IDE). Hasn't been updated to a 
>> platform device yet.
>
>    ISA drivers shouldn't be "updated" to the platform drivers. But I 
> don't see 'struct isa_driver' there either...

My bad - while the Q40 has ISA slots, IDE isn't connected to the ISA 
bus. Got confused by the base address range matching what I remember 
from ISA cards...

Cheers,

     Michael


