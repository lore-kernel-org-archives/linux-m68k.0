Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14358C433F5
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Sep 2021 02:52:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB1A760E0B
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Sep 2021 02:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhICCxU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Sep 2021 22:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230499AbhICCxU (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Sep 2021 22:53:20 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C58CC061575
        for <linux-m68k@vger.kernel.org>; Thu,  2 Sep 2021 19:52:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id k24so4133511pgh.8
        for <linux-m68k@vger.kernel.org>; Thu, 02 Sep 2021 19:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:references:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=yGt9uMwL4TqsYrgkcM8Ou3m3vIHQMRB5Cp8FALJfCBQ=;
        b=AA15C5SdCfT0lBLpQ1cSSzsVJoEYVIgjzhedT7myc4Myk3nc6e9TKsOHsjQtDY7C3d
         MVFKck7p2TSNZS63NYog8e0ObwMVHG+sDbGeBPfMMeluArDrMbd54gkJwBZ3K9ZhhbAg
         iRCUpUws0+6aT0AWBylFZM3p+lLz9C7z4cLB9TjGPp2gv7y3cgti5U7cTzzLX0i1RjE1
         18YvIDPDASKskZT8yfDPWHGwDdRZdAQwlTHUu0n3XeVDUomkS9KlZHLewhdbEZBx3rR/
         RLBn2xT18A+l5PeKarKt2lHrgEocss38/DNx0vxYUSMgChi+L4eD6F4+W/XIasUDfx1u
         9JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=yGt9uMwL4TqsYrgkcM8Ou3m3vIHQMRB5Cp8FALJfCBQ=;
        b=teouBsTzvp1upL36NoE5sxf9fzwx4qefbZ33VZOfS5hPyvGQKZvotvcwjuG+HrEtA9
         dVkSdfbWHb4h7l9Cjvf+Ht0UAXAt64/dfZ4NEbciWc6rUSW5p2QIIhs+A2XrG3QS4Udi
         L9KbNTFfGVNc6LTaXAkXDctfSAltLjbfG3a0ZM5tIKaBPzOCvoJRszJPi5Ar+5jY4aoe
         Agtt2nb6q38TclmxwP8WeF203Ih1C2xDhHxX31typOkyJwucAMdTK/fDWh6t40kcTqn+
         RA+po8UidbYC1cSJXz5vNclrpdTwZuJmewielJ0XUi2TMC6iGhGzoqkly2Jx0fyzMBvH
         pHrA==
X-Gm-Message-State: AOAM532TaB6e39aCRRmLpPlldMB0suRGAxzOQzdCKMECXuindeMOtbvP
        5P8rPZVJYPGsCjFCYsefhVU=
X-Google-Smtp-Source: ABdhPJyKvzBJvzq8ndve/QrwSjx/KvFePhS0Ku8MqG+L2BltABrz1xnW9K3W1YnTCPjte+EZ7g311A==
X-Received: by 2002:a63:204a:: with SMTP id r10mr1457420pgm.365.1630637540220;
        Thu, 02 Sep 2021 19:52:20 -0700 (PDT)
Received: from [10.1.1.26] (222-155-5-209-adsl.sparkbb.co.nz. [222.155.5.209])
        by smtp.gmail.com with ESMTPSA id z9sm3452319pfa.2.2021.09.02.19.52.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Sep 2021 19:52:19 -0700 (PDT)
From:   Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v7 1/4] m68k: Kconfig - select core PCMCIA support module
 for Amiga PCMCIA
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
 <1630206710-5954-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdV5hWcg=pPZ7=E5QEi5OqM=X4JsqymsL-vHWjMjDvyWQQ@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, ALeX Kazik <alex@kazik.de>
Message-ID: <6843c140-7f58-8510-30f2-201d824601df@gmail.com>
Date:   Fri, 3 Sep 2021 14:51:19 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdV5hWcg=pPZ7=E5QEi5OqM=X4JsqymsL-vHWjMjDvyWQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

[resending due to bounce]

thanks for your review!

On 03/09/21 00:42, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Sun, Aug 29, 2021 at 5:12 AM Michael Schmitz<schmitzmic@gmail.com>  wrote:
>> The 16 bit card support test for the apne.c driver needs a whole
>> lot of hairy parser code which is already present in the core
>> PCMCIA code - make use of that instead of duplicating it.
>>
>> Signed-off-by: Michael Schmitz<schmitzmic@gmail.com>
> Thanks for your patch!
>
>> --- a/arch/m68k/Kconfig.bus
>> +++ b/arch/m68k/Kconfig.bus
>> @@ -31,6 +31,8 @@ config ZORRO
>>   config AMIGA_PCMCIA
>>          bool "Amiga 1200/600 PCMCIA support"
> Can this become tristate?
I suspect it can - though I wonder why it hasn't been made tristate 
before. Ah - pcmcia.c needs a little patch to add a MODULE_LICENSE clause.
>>          depends on AMIGA
>> +       select PCCARD
>> +       select PCMCIA
> This is now forcing PCCARD and PCMCIA builtin instead of modular
> in an allmodconfig kernel.
Thanks, that's what I'd been worried about.

How do I make sure CONFIG_PCMCIA gets selected as module as well? I can 
select this when CONFIG_APNE is set, from 
drivers/net/ethernet/8390/Kconfig, but I'd then have to protect the 
cftable parse hook in amiga/pcmcia.c against the case where CONFIG_APNE 
is not selected.

Not to mention we need to rename amiga/pcmcia.c to avoid a module naming 
conflict.

Just including cistpl.o as a module is not an option unfortunately - too 
many dependencies.

And I don't think we need CONFIG_PCMCIA_PROBE=Y?

Cheers,

     Michael

>>          help
>>            Include support in the kernel for pcmcia on Amiga 1200 and Amiga
>>            600. If you intend to use pcmcia cards say Y; otherwise say N.
> Gr{oetje,eeting}s,
>
>                          Geert
>

