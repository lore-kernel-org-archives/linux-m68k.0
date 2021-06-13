Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C45BC48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 21:53:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC6AE61357
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 21:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232106AbhFMVz3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Jun 2021 17:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232020AbhFMVz2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 13 Jun 2021 17:55:28 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1457CC061574
        for <linux-m68k@vger.kernel.org>; Sun, 13 Jun 2021 14:53:09 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so8908771pjs.2
        for <linux-m68k@vger.kernel.org>; Sun, 13 Jun 2021 14:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Mro1VyAxlQkGLtn5uSbOgQ/UW0V9GlQMwFoiLahKSsk=;
        b=q+uWtC7mS5Xn3+OBf2Wd0aUl8TUvEfJoPQNQI3xM5Ng+i/Yp9zl8BJ7NZYc2Ht++3g
         65oqLOcvPgZ9kNroARSHgYoDVQMLkI31j4/7ipXBnoy7MWwFNtHzyFn5ePK8rHA2OjxM
         J7oY7j0CoOiyFXyJ0eDkGcOV5JwlkX6foACRTziBRM4dQNtRjR0B5XdoCxwyPNjKzP6f
         wqrcAn8Zi0mBtRmWDw9TuMH0Alygdwh9cfgDstC4hNXsZktDV4lGzsjNM2AGzEWbbD3t
         W340GAchDNWSNo7o4b5dk7HA5+tRjNqEYLcaopfDxO0/zOOzxk02KRd53wJh119bYFKt
         2SHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Mro1VyAxlQkGLtn5uSbOgQ/UW0V9GlQMwFoiLahKSsk=;
        b=YPiCuOhCwdhbSdmxIdUAom/L6doMkpsaEgHQx625fyF7L+utmQtnU6AJ1c1kQp/Pmb
         sKc0ZzrhY2wMgZNzkfEUTYdvoArfG+rVIUOLqccFlSPhBM2WAZFvWuJsIwdg8SnfWlt+
         Qg5CNrF6TYjbtuImj71MxtlO22UvZh9/GcuNRZ5cGRLp61bCMyLWR3cHvHtbFpU5J1xL
         QGv7xnTquRADhmgywHoC570iQZIsquwh5Or1l5m/QJFxIsYbAmhnSlMTeU5Qk+KBK5/h
         lsSUsVyN+OQHCAIgV4E9GnKx3XdtgtQleLmZteWNtNrnXCu4rxSpkOuQMSSw0smzsPUL
         3H2Q==
X-Gm-Message-State: AOAM532Fi3CqgAGvEh8BS3q1jOPHHKfKuW2A+z3wiJHuMWPbTy8aM1Xd
        TjP5C3tEr/lMJiwxRPmqwa2IAY30PtY=
X-Google-Smtp-Source: ABdhPJzoR4w8h1i2yzPqfnqOwH2xL+RxgR0CL3IWXngvc4b3FiCHHsTYrKhWvXUb35h02aKBzjgRCQ==
X-Received: by 2002:a17:903:2403:b029:ef:9419:b914 with SMTP id e3-20020a1709032403b02900ef9419b914mr13876327plo.59.1623621188524;
        Sun, 13 Jun 2021 14:53:08 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:9034:3fbe:cf28:988a? ([2001:df0:0:200c:9034:3fbe:cf28:988a])
        by smtp.gmail.com with ESMTPSA id a9sm15010504pjm.51.2021.06.13.14.53.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jun 2021 14:53:08 -0700 (PDT)
Subject: Re: [PATCH RFC 2/2] net/8390: apne.c - add 100 Mbit support to apne.c
 driver
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        Finn Thain <fthain@linux-m68k.org>, ALeX Kazik <alex@kazik.de>
References: <20210605060447.GA18461@allandria.com>
 <1622958877-2026-1-git-send-email-schmitzmic@gmail.com>
 <1622958877-2026-3-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdXOnAwrdjnqwWeMGBv8Y+eKk1SQSs+tHnFL9Q89W3gGhQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fa012986-ccaa-e034-2a42-7beb8df537d3@gmail.com>
Date:   Mon, 14 Jun 2021 09:53:04 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXOnAwrdjnqwWeMGBv8Y+eKk1SQSs+tHnFL9Q89W3gGhQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Alex has been testing the patch for me, but had to resort to hardcoding 
the kernel option (or isa_type).

How would this option be specified on the kernel command line?

I would have thought apne:apne_100_mbit=1 would set that variable to 1?

There's been other issues with the patch as well, this appears to need a 
bit more work.

Cheers,

     Michael

On 8/06/21 12:56 am, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sun, Jun 6, 2021 at 7:54 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Add Kconfig option, module parameter and PCMCIA reset code
>> required to support 100 Mbit PCMCIA ethernet cards on Amiga.
>>
>> 10 Mbit and 100 Mbit mode are supported by the same module.
>> A module parameter switches Amiga ISA IO accessors to word
>> access by changing isa_type at runtime. Additional code to
>> reset the PCMCIA hardware is also added to the driver probe.
>>
>> Patch modified after patch "[PATCH RFC net-next] Amiga PCMCIA
>> 100 MBit card support" submitted to netdev 2018/09/16 by Alex
>> Kazik <alex@kazik.de>.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> --- a/drivers/net/ethernet/8390/apne.c
>> +++ b/drivers/net/ethernet/8390/apne.c
>> @@ -120,6 +120,10 @@ static u32 apne_msg_enable;
>>   module_param_named(msg_enable, apne_msg_enable, uint, 0444);
>>   MODULE_PARM_DESC(msg_enable, "Debug message level (see linux/netdevice.h for bitmap)");
>>
>> +static u32 apne_100_mbit;
>> +module_param_named(apne_100_mbit, uint, 0);
> error: macro "module_param_named" requires 4 arguments, but only 3 given
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
