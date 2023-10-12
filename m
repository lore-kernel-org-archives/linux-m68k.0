Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A6BCDB46E
	for <linux-m68k@archiver.kernel.org>; Thu, 12 Oct 2023 19:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442062AbjJLTSp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 12 Oct 2023 15:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441868AbjJLTSo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 12 Oct 2023 15:18:44 -0400
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B74BB
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Oct 2023 12:18:41 -0700 (PDT)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-57bb6a2481fso703665eaf.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 12 Oct 2023 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697138321; x=1697743121; darn=lists.linux-m68k.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lly61ot32j8FoDDoJ6cWEByOKtkJuuXw1V179YkQ+qQ=;
        b=Mi2kqbS6Lw4E9uIZPyfSfdR+roAeqzuW/vF0qB/Ga22ycy6i853UMhIgDaj28yAyAP
         9Qunu6isBGdbVMUiEZeHRRh336QxPX/uIZVjYne/yrV5z/CSgrAEjmpY1Co3cn6zswsd
         +5PMniYZjaFThalmK9PfLKX8cAA8Q5zCPLCOQSUcUO5BNEHEcY7cwXbtgngycwzgyk32
         pxLnUAEAcqX1TnQcEOLDbwYh47JqU9wzEYmlyCr2CqSpXO1xmJ2LaF7ZQF2o2GyM3SQV
         UMQYcm/kTrOouTfWLVpHwPRc7aAkioHWOdjdWn9j6/yptGjOmoz0HVJDvHuqrFTrD2Ww
         tHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697138321; x=1697743121;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lly61ot32j8FoDDoJ6cWEByOKtkJuuXw1V179YkQ+qQ=;
        b=VuxwKOO/GpVUy8vonV8ujDq3Hv3C+rEFSK2lGpaXhw5f33ZbvpNSFaJw3b923n2Pkh
         P2Ax4hHXJILDvVhu5+L99Am1zq39uTVEQXwPiHE8j8DeL8YRm1HCC71zT4rqQIprqZtj
         STivAsGBIzuM9SAi6uXhrMAAxOv8s/Z7qceeEZyc3BkK8uJlpPjS47UzYHefWMb7GUAB
         tPuzGFoOVc3jZjchYSaW2FDuAWhSJ57jdpBHrOVAPVKQKMofkQZ8Az3CFIHq76UT1lyn
         IJXvkD1LRvtyf77x7G2Mgkbdq2oX9iHGqJ6KV0Wf6+m5JhCB8qHOjHuSUL/mX53WY+Uq
         +LEg==
X-Gm-Message-State: AOJu0YxwK6NInniaCEY73UC8CruqHJIRFlFQujypYfalDh4ReErBtmiM
        Pmff04UPQgEsNROaAjwY3zE=
X-Google-Smtp-Source: AGHT+IFQ/8tRfh231wBImO6e9gycJ9gLPybhZL4tPQAP4HmrzWQeBUlcNv5nsoXTDJkx7CggGPiXrA==
X-Received: by 2002:a05:6358:998e:b0:13c:dd43:f741 with SMTP id j14-20020a056358998e00b0013cdd43f741mr17793249rwb.24.1697138320720;
        Thu, 12 Oct 2023 12:18:40 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:a953:6b0a:23f3:fb73? ([2001:df0:0:200c:a953:6b0a:23f3:fb73])
        by smtp.gmail.com with ESMTPSA id p6-20020aa78606000000b0068c006dd5c1sm12133698pfn.115.2023.10.12.12.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 12:18:40 -0700 (PDT)
Message-ID: <2627cc80-f431-b47c-68aa-fc818785808f@gmail.com>
Date:   Fri, 13 Oct 2023 08:18:32 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/6] net: fec: use dma_alloc_noncoherent for m532x
Content-Language: en-US
To:     Greg Ungerer <gerg@linux-m68k.org>, Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231009074121.219686-1-hch@lst.de>
 <20231009074121.219686-6-hch@lst.de>
 <ea608718-8a50-4f87-aecf-fc100d283fe8@arm.com>
 <0299895c-24a5-4bd4-b7a4-dc50cc21e3d8@linux-m68k.org>
 <20231011055213.GA1131@lst.de>
 <cff2d9f0-4719-4b88-8ed5-68c8093bcebf@linux-m68k.org>
 <12c7b0db-938c-9ca4-7861-dd703a83389a@gmail.com>
 <e16ac0a4-3e4a-4e8c-98ba-7b600a8c6768@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <e16ac0a4-3e4a-4e8c-98ba-7b600a8c6768@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On 13/10/23 02:25, Greg Ungerer wrote:
> Hi Michael,
>
> On 12/10/23 04:21, Michael Schmitz wrote:
>> Hi Greg,
>>
>> On 12/10/23 02:09, Greg Ungerer wrote:
>>>
>>> I think this needs to be CONFIG_COLDFIRE is set and none of 
>>> CONFIG_HAVE_CACHE_CB or
>>> CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set.
>>>
>>>
>>>> in the fec driver do the alloc_noncoherent and global cache flush
>>>> hack if:
>>>>
>>>> COMFIG_COLDFIRE && (CONFIG_CACHE_D || CONFIG_CACHE_BOTH)
>>>
>>> And then this becomes:
>>>
>>> CONFIG_COLDFIRE && (CONFIG_HAVE_CACHE_CB || CONFIG_CACHE_D || 
>>> CONFIG_CACHE_BOTH)
>>
>> You appear to have dropped a '!' there ...
>
> Not sure I follow. This is the opposite of the case above. The 
> noncoherent alloc
> and cache flush should be performed if ColdFire and any of 
> CONFIG_HAVE_CACHE_CB,
> CONFIG_CACHE_D or CONFIG_CACHE_BOTH are set - since that means there 
> is data
> caching involved.

Now I see - I had read that definition to correspond to the 'select 
coherent allocations on m68k' case, not the latter 'use non-coherent 
allocations in the fec driver'.

Your definitions are correct as written (and for all I can see, 
Christoph's implementation is correct, too).

Apologies for the noise - I blame jet leg for getting my wires crossed ...

Cheers,

     Michael

>
> Regards
> Greg
>
