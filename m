Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442ACC433F5
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Apr 2022 14:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiDFO4v (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Apr 2022 10:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235485AbiDFO4W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Apr 2022 10:56:22 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1E94E81C6
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Apr 2022 04:33:13 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id i6-20020a1c3b06000000b0038e710da2dcso3437470wma.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Apr 2022 04:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fPdHez+B9xoPsCLxTMUwgkfR7VF58WkxSxp727nYR84=;
        b=Y/+LPZSg+vNsnscHarNCJ1f3nTSOszz5+T3BfdFq5x+pnpbt+XeaR/NSPrDGbV+AEG
         B4zDr+b9lFWWfoOOaYcxpN+fEwi4zJs7cc7VPFVRN7sVuIWeyGiGikwd77cK1BzOAr9E
         G1pr39mzUUJmdv/IEwYsk3ErG1rbxZBxDDwSJZayzCljP5VmFGogxMKtHHPK0H7uVz7I
         rRS9MtIOfaUNrFLQc7hMIb5xLxC3tHsMo5ykghYk+kSOjdXt9hxIZyXQUIfQDot1Xw5V
         15gCmNYJEYu0TpoQNOZsTMbIDTtjAt1FcZ9Hbxi2UX9PpPfenumngwg3Allpm91rec6e
         GlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fPdHez+B9xoPsCLxTMUwgkfR7VF58WkxSxp727nYR84=;
        b=aSx+FnxMMK0AyD9pX0Ly2PGVdwElZ0H5jKOk/+BsXSZvWxkuOqI0SSWLQaGkHk+1aI
         JLbEuJdZichJkVZopOtg9Zn2A3e/Z7EtGhd+enV+9MSJbsIP4B0vDbxceqvv93RUPp5f
         lvqpoz365ynnoC9PyqjO2sjfMtOwaB94QnvVVenm8SGKfYGUK1+AZzGQpP4d57ypwnpq
         tt/FYnhGl16Y05eMmc2CDcz90zEWwCIuk/cY9R05VDqs331UvfNGADV2Z7qj35CNI+gb
         cGxhH7VgwtZHgeHUkBZZxYh10naiOXTVbAVpEALu7EnikQwLOZmMYqt65GZn8ElLieQn
         ZOdA==
X-Gm-Message-State: AOAM5305bVkjfpnFCRMNbsRONl0uEv+jEWFHgHaTdQBumWz5ABM5Sejo
        JHZhlr4b8FNAZDcIFgnVa9uUmw==
X-Google-Smtp-Source: ABdhPJy7Fs+DjI4SArLCSlh5kObPiWZ2Bb3VzRhcmspKhUdQfVlkRxkg83++z0XbiQwjiGew22KhdA==
X-Received: by 2002:a05:600c:1c94:b0:38e:7030:24cc with SMTP id k20-20020a05600c1c9400b0038e703024ccmr7102877wms.121.1649244771125;
        Wed, 06 Apr 2022 04:32:51 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:261f:c14c:d23b:d177? ([2a01:e34:ed2f:f020:261f:c14c:d23b:d177])
        by smtp.googlemail.com with ESMTPSA id a16-20020adfdd10000000b002060b4e240dsm10204682wrm.93.2022.04.06.04.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 04:32:49 -0700 (PDT)
Message-ID: <b9a53a99-55ac-3f23-c87c-9827dd76239b@linaro.org>
Date:   Wed, 6 Apr 2022 13:32:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v15 4/5] clocksource/drivers: Add a goldfish-timer
 clocksource
Content-Language: en-US
To:     Laurent Vivier <laurent@vivier.eu>, linux-kernel@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>
References: <20220310090048.1933020-1-laurent@vivier.eu>
 <20220310090048.1933020-5-laurent@vivier.eu>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220310090048.1933020-5-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On 10/03/2022 10:00, Laurent Vivier wrote:
> Add a clocksource based on the goldfish-rtc device.
> 
> Move the timer register definition to <clocksource/timer-goldfish.h>
> 
> This kernel implementation is based on the QEMU upstream implementation:
> 
>     https://git.qemu.org/?p=qemu.git;a=blob_plain;f=hw/rtc/goldfish_rtc.c
> 
> goldfish-timer is a high-precision signed 64-bit nanosecond timer.
> It is part of the 'goldfish' virtual hardware platform used to run
> some emulated Android systems under QEMU.
> This timer only supports oneshot event.
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
