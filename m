Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D24BC47088
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 19:27:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20425613D7
	for <linux-m68k@archiver.kernel.org>; Wed, 26 May 2021 19:27:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbhEZT3W (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 26 May 2021 15:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233993AbhEZT3W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 26 May 2021 15:29:22 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76FE9C06175F
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 May 2021 12:27:50 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 29so1783365pgu.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 26 May 2021 12:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=jgFyEOXKnh8oZE9izcWNLKAKmuXy2hvkKvcvU5QJdeA=;
        b=WAu/1lAiAWhIQpzVLGYIynRafwyJME0VnwBhCMkBdkpi9OS6kh0xPzVatJZT9mjOk4
         +7NYDuyqmqDitOrkX5GoLcq9z6YymXtuhx7VVxLLD2H22Z2uprUv19Oa9kG44oBO93Jr
         c/DMDTJX3S1t5DLp8YVl+VhUxcQ9PgKt04nsUK5HVYjRuGbNiGbZZZ04mxbWMYgCqMEN
         gi2GepBTeBHlrjsZyiSHdtjjGnrTdnqMxwX+aAogKgGnUZfaHD1UgJdeuvxlClOYz54u
         104oWpAKsvVA1utiJDEpxK0TlUu9mxj2in0hEwt6pEcFcqDkqsPR1S88Kf79OWu4L5eK
         mfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=jgFyEOXKnh8oZE9izcWNLKAKmuXy2hvkKvcvU5QJdeA=;
        b=dLXs/6ky/1qFPwi9iR3gioqOO7mIzDc3jcbmFPvxJvV4K8BiP4O56er99l4Z5kmfz1
         RgGTri5KRrig0qQOI3rU/k4x7cM/cCPmzr0zNjMYZpw6qmRYv3scuCFkfx+2ZPvxn33x
         T8wrnCT7G4EjZJhb1VAw8k3gi7KzrX/HSSSgLGlclgh7LO/QWf/vPQuEdaFXR9thINb8
         SiHPuhasnALHhMW424qwjjjXYf7Funfh5pbt1CD7JgjlnY+PWw/Wtns3fXAEViEyQXF4
         fvncv/PluChq9l4ubvGdJHC1eE5pLeZRshfqCNlMS11dGF245U3n/dlkaz8abtnsUgQP
         xJNg==
X-Gm-Message-State: AOAM530ubDvGabV8BQlfeUDYhsvyjWc/vFmgGxDF7dVwTeGDYpqiWUkO
        G7oLTfswDnyWzj9HZKMFytq4lFrlspM=
X-Google-Smtp-Source: ABdhPJz5W/J6TsNIc/PrT8G+AXpnxdsT9S0UrC9hvSVgfvwtbW+oNUVr0h9WQPXbbwtnjKk8P9ZPHg==
X-Received: by 2002:aa7:9f5c:0:b029:2de:a5f0:d73b with SMTP id h28-20020aa79f5c0000b02902dea5f0d73bmr37606176pfr.41.1622057269579;
        Wed, 26 May 2021 12:27:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:c104:b5ae:a3c1:6470? ([2001:df0:0:200c:c104:b5ae:a3c1:6470])
        by smtp.gmail.com with ESMTPSA id t7sm47821pju.4.2021.05.26.12.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 May 2021 12:27:48 -0700 (PDT)
Subject: Re: [PATCH] MOUSE_ATARI: fix kconfig unmet dependency warning
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Schmitz <schmitz@debian.org>,
        Roman Zippel <zippel@linux-m68k.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20210526070345.31114-1-rdunlap@infradead.org>
 <CAMuHMdXdpzmFMSmM+8z9csZ094O5UG6nmAyTYYb=4TAmyUiSnw@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <f8718a4f-8338-ef71-53fa-6e1504156ba0@gmail.com>
Date:   Thu, 27 May 2021 07:27:42 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXdpzmFMSmM+8z9csZ094O5UG6nmAyTYYb=4TAmyUiSnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 26/05/21 7:20 pm, Geert Uytterhoeven wrote:
> Hi Randy,
>
> On Wed, May 26, 2021 at 9:03 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>> MOUSE_ATARI should depend on INPUT_KEYBOARD since ATARI_KBD_CORE
>> depends on INPUT_KEYBOARD. This prevents MOUSE_ATARI from
>> selecting ATARI_KBD_CORE when INPUT_KEYBOARD is not set/enabled.
>>
>> WARNING: unmet direct dependencies detected for ATARI_KBD_CORE
>>    Depends on [n]: !UML && INPUT [=y] && INPUT_KEYBOARD [=n]
>>    Selected by [y]:
>>    - MOUSE_ATARI [=y] && !UML && INPUT [=y] && INPUT_MOUSE [=y] && ATARI [=y]
>>
>> Fixes: c04cb856e20a ("m68k: Atari keyboard and mouse support.")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Thanks for your patch!
>
>> --- linux-next-20210525.orig/drivers/input/mouse/Kconfig
>> +++ linux-next-20210525/drivers/input/mouse/Kconfig
>> @@ -348,6 +348,7 @@ config MOUSE_AMIGA
>>
>>   config MOUSE_ATARI
>>          tristate "Atari mouse"
>> +       depends on INPUT_KEYBOARD
>>          depends on ATARI
>>          select ATARI_KBD_CORE
>>          help
> It looks like arch/m68k/atari/atakeyb.c doesn't use anything from the
> input subsystem, so I think you can move the ATARI_KBD_CORE symbol
> outside the "if INPUT_KEYBOARD" section instead.

Correct - while we're at it, what about moving it to 
arch/m68k/Kconfig.machine?

Cheers,

     Michael

>
> Gr{oetje,eeting}s,
>
>                          Geert
>
