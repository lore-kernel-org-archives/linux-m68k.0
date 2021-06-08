Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5310C47082
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 21:51:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0732613AE
	for <linux-m68k@archiver.kernel.org>; Tue,  8 Jun 2021 21:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234628AbhFHVxU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 8 Jun 2021 17:53:20 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:51124 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234501AbhFHVxU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 8 Jun 2021 17:53:20 -0400
Received: by mail-pj1-f50.google.com with SMTP id g4so184970pjk.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 08 Jun 2021 14:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1PmZ9kz58nKHjfIBFsO+WAO9mwq+ME6l/h6YokFSMjw=;
        b=paF71qvFbJ82VzJaJwbX5OnOp/m2MWuS0qVF5WcsfYH9E/3XtcV6uvSnMR1hJlIb7E
         1qOu5c3dI1kMb/tHM+BfsRa8EjotdVb412Wpsp51fdXWLMym+71B7otdFG4Vd3/pDva7
         3C1u4itQDeyYVj7jSmDNE8xgb5rgs1SWrgMFzUezZ+mHDtz/r3WoMqH72c9Tvh/u/A9U
         ySiiuvfxszw00b09ERRhk4U7/N2owCI2paB72hwDP2r+o4IwX/ISWjBFEQFYXJiCNhzL
         5bB3VvXf+tExgxkEbdkIUUyw80flCq5teum7bUD9wepfVw8tG/+L8kEotqFz/t/e2gcA
         BrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1PmZ9kz58nKHjfIBFsO+WAO9mwq+ME6l/h6YokFSMjw=;
        b=T98T61AB0hERzvXPVPJCX6dv3sHBG9lQ9/bokNb2w7r0F5HtzND0hlIDo/ffYlZSXq
         fsjJ+STHMBszgbuNpalbsD6TLP7Qawu26S7YfsW/puOBZp3h9uKVCOr+OFn2ixEle1Xl
         Z/lqqMTQMPCptTW7MByPRhwCq2Of0fhCvaLLT4EeDC8hM/i21Vu8U0m6YnvV8fTOC4VO
         zUrTJw4mWnNTsC29eIkKjmH6D8GswEkdOF1keOFK1BmzJbiFgBqu5AAvHM7InSiHUgzU
         sq17ZKxlD7n4vMTCEhL5PCLFW5FA25X0UAojYaKzibYBImHFCfPQ5z02lA2j9paWKj5D
         ntPw==
X-Gm-Message-State: AOAM530MsNW5RsUhpjnJ76PkbgG5Mix3kfDHpU4zjgbmMIMRBMysz6Am
        /jCYBF63ozkJodDrIt/IxiI=
X-Google-Smtp-Source: ABdhPJz3vVrf5bzZXhMEvKhAbBLqVoo6j5WxNhEJxPxzZHuEjLBdv0kHNrPya/F/HsqmtF/a09QJlA==
X-Received: by 2002:a17:902:c784:b029:104:9a21:262a with SMTP id w4-20020a170902c784b02901049a21262amr1808434pla.21.1623189010218;
        Tue, 08 Jun 2021 14:50:10 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:6c1b:b1ca:5501:207d? ([2001:df0:0:200c:6c1b:b1ca:5501:207d])
        by smtp.gmail.com with ESMTPSA id q23sm8861482pff.175.2021.06.08.14.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 14:50:09 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] Use libata platform drivers to replace deprecated
 m68k IDE drivers
To:     Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@infradead.org>,
        Finn Thain <fthain@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S. Miller" <davem@davemloft.net>,
        Joshua Thompson <funaho@jurai.org>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Richard Zidlicky <rz@linux-m68k.org>
References: <cover.1623131194.git.fthain@linux-m68k.org>
 <YL+AqIEPjMgG519L@infradead.org>
 <d3c70f7a-368a-ad9a-6575-8289234b0ce0@kernel.dk>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <36f7519d-698f-1284-551a-0dbd82e2a0d8@gmail.com>
Date:   Wed, 9 Jun 2021 09:50:03 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d3c70f7a-368a-ad9a-6575-8289234b0ce0@kernel.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Jens,

please note that Finn's patch depends on one of mine currently under 
review. Without that one, Q40 support may break in certain cases.

Cheers,

     Michael Schmitz

On 9/06/21 9:04 am, Jens Axboe wrote:
> On 6/8/21 8:37 AM, Christoph Hellwig wrote:
>> On Tue, Jun 08, 2021 at 03:46:34PM +1000, Finn Thain wrote:
>>> This patch series allows m68k platforms to switch from deprecated IDE
>>> drivers to libata drivers.
>> Thanks, this looks good to me:
>>
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>>
>> Jens, any chance you could pick this up quickly to prepare for the
>> legacy IDE removal series?
> I can, but had assumed it'd go through the IDE tree. But not that
> important I guess. I've queued it up for now.
>
