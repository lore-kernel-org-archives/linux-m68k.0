Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F30DC63682
	for <linux-m68k@archiver.kernel.org>; Wed, 26 Jan 2022 17:25:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238675AbiAZRZ5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 Jan 2022 12:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237154AbiAZRZ4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 Jan 2022 12:25:56 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDBDC06161C
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 09:25:55 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c190-20020a1c9ac7000000b0035081bc722dso268825wme.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 Jan 2022 09:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f9guB0sh0Lurj0RNnTyzS57ErgkX/og0Be/WymIsHIU=;
        b=Vd6XBkJ2xBnOY4rllJwDqCtX4iFdHLeUoHVxdYK44CHjLa6/1qbYoPPlWQcYat9zVh
         cHxJt+bUdPn6g2G1beKoRj/Mt7MAhCCRQurRmi5l4LUXeaCdyrrNqmLXNL4XoIXCzjo5
         Y4lx3f68pUYiBnmVCOyg6qkRMDyO0549bVYFZv4AfH6244p8ouwS+2jXf8SzSKh9mnm+
         Kd2aJy6zWHAmt+wOvfU8CGyQvOuD+0wlyAhsH+k0VZ+RlXIbcAssfSm7U50dsCFkbBds
         y8XZnmlsCJcSSYPyRkTdHF+dZ3mlsZPEvF4jsOTx/UTz2azYg2bB93x8386UJEVs3YA/
         bv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f9guB0sh0Lurj0RNnTyzS57ErgkX/og0Be/WymIsHIU=;
        b=SPbwiHDy4QxSVdHv6NMP5oG/EMcKI8WtxhnhbdB0/G7JbquHD3wx5R/KcdbjLeUPXG
         CXPW3X18jx5CU+9pyzrkf47L/CyEv6jMpyk+HGvJjjwtrxqHZXjsFfg+wQFxsQC+n90e
         dPROoR0MRo9igGvG02DTcnpet7us6WmvYy53Tc2p8K6wi9amwjpT4Cd4kX3ZoVPUpSYs
         wMP5T0wT8TeuC678JnN9meRCkpBMo7TbYbmLpaNHtdra95vxLQGw/rFd769IpIraTGWg
         bGYhl4TmaFfeW9hN2SFqpO/m2m/Lr04EtRGcu8dNDuXwUrynduSyrNGA8ucYxSvwAayn
         mHVA==
X-Gm-Message-State: AOAM532vdFlHLLKJSEObBaAngZyhfthS/Y01WJEh0Fw8imKzYjnEho5K
        qxV/vjAetReLruh0xgFoomE+4w==
X-Google-Smtp-Source: ABdhPJzSJ02J7ErW+HrQMpYIV6UUT670RliLEK4anwQ99Ei3XZgr3e8nTi4aWuWI4MpjshjqGnwCjA==
X-Received: by 2002:a05:600c:1e15:: with SMTP id ay21mr8352061wmb.111.1643217954348;
        Wed, 26 Jan 2022 09:25:54 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:e5b7:c642:b8ef:60cb? ([2a01:e34:ed2f:f020:e5b7:c642:b8ef:60cb])
        by smtp.googlemail.com with ESMTPSA id t17sm20458505wrs.10.2022.01.26.09.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jan 2022 09:25:49 -0800 (PST)
Subject: Re: [PATCH v12 4/5] clocksource/drivers: Add a goldfish-timer
 clocksource
To:     Laurent Vivier <laurent@vivier.eu>, linux-kernel@vger.kernel.org
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org, Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>
References: <20220121200738.2577697-1-laurent@vivier.eu>
 <20220121200738.2577697-5-laurent@vivier.eu>
 <2dc495b0-b9a1-e493-ddeb-d966afd624c0@linaro.org>
 <1bc0bf2d-49c6-3f68-bc35-919b2a1e4cfc@vivier.eu>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f9119e2f-51e7-e87c-10d9-bc76d6108676@linaro.org>
Date:   Wed, 26 Jan 2022 18:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1bc0bf2d-49c6-3f68-bc35-919b2a1e4cfc@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 26/01/2022 18:14, Laurent Vivier wrote:
> Le 26/01/2022 à 12:55, Daniel Lezcano a écrit :
>>
>> Hi Laurent,
>>
> 
> Hi Daniel,
> 
>> On 21/01/2022 21:07, Laurent Vivier wrote:
>>> Add a clocksource based on the goldfish-rtc device.
>>
>> As a first submission, please provide a more detailed description of the
>> timer.
> 
> ok.
> 
> The timer uses in fact the goldifsh RTC clock so I supposed refering to
> drivers/rtc/rtc-goldfish.c could give the missing pieces of information

[ ... ]

> I agree for irq, but res is passed to request_resource() and I think it
> is added to a linked tree, so I'm not sure it can be local to the function.
> 
> Do you mean a "static" declaration in the function?

I missed request_resource() was adding the resource in a list, thus the
parameter must not be freed. So discard the comment for 'res'.

[ ... ]



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
