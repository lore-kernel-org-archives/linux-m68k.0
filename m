Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FE00C433EF
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Sep 2021 08:16:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0FB70600D4
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Sep 2021 08:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbhIEIRk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Sep 2021 04:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhIEIRk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sun, 5 Sep 2021 04:17:40 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97F18C061575
        for <linux-m68k@vger.kernel.org>; Sun,  5 Sep 2021 01:16:37 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id e16so3089735pfc.6
        for <linux-m68k@vger.kernel.org>; Sun, 05 Sep 2021 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=WJgqLf1eDWRMpOUF85EcT9QTzqD8m45iUkz4o8h5h+8=;
        b=D1EFbiW8hh1ZdvgTfbwVy0+vqYZ8kl3XPg8VTBc2w/mlUr0zurvQiGSux6s5xjXLSl
         Q9fo/s9FTGuFVh3NZ3FBHAFMpwzorzBfZmL9OScud5BtDbxmEw/0fewG8bLwykj4ne2U
         m7GiTfC83Op+Qfs+vQD+HNH36o/xMF4idTRXCkA6YrE7pb5QYA/m1+7TZqNVotrHXvd9
         +CdHy/U2kzAkx13hwqJ/WwGNjJfuleghJivLF2lg1D8308XtxazhAOlkrbAgHF5QSGBP
         IXnP57/ouxcvRJKUBUuTnyja1ENziYZRF4b01m33uJwOMGLOdyt+SFIOOFQnyXjXLv39
         2EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=WJgqLf1eDWRMpOUF85EcT9QTzqD8m45iUkz4o8h5h+8=;
        b=fMVAUWYmU+3fU78EC13yjmRPU6l4vm16ZzHf2lGBb24vLcuH1cZ0D7FQ0G3qRrXskA
         ZkavHaoNbguP4KOqZ7Sdzd/Xfg7gIwgHV1AjYdy6IlSevS6H3E7kybVU8sh9b21L5XNh
         p2vDOxVqa7yJWEbVE8Gb14uaym57Gm2Mgvgg3t7e0RaLLKgqZB33fF/M1wYEybY5YFNw
         3N+MZ8bSc+vh9ClAb7Uddame8L6ZHQajkF+E4MLONGd7SPalqI8y1y+m2CqKf5H/RH/R
         44MFrKimps0WnocxAOUh4AACeYalN9pj1T42EYRbE6HV3DnZmH4aWMm40XXpsMMWEaX7
         nWqQ==
X-Gm-Message-State: AOAM530Da8qOknk6psZGOqsgO/NEMRXQoivGon+AORONC2a+x6oLq+y6
        v4zK28wWqeOps/74ZaWxw+ZNRUcziX8=
X-Google-Smtp-Source: ABdhPJzLCB5w5o49Ndcym0jdmLD8A4yad5ZqEfz7aUBMmzlvjsCwNMPKG2FC7Nif5vH5kaJCcGZwEw==
X-Received: by 2002:a63:ce57:: with SMTP id r23mr6741580pgi.271.1630829797043;
        Sun, 05 Sep 2021 01:16:37 -0700 (PDT)
Received: from [10.1.1.26] (222-155-5-209-adsl.sparkbb.co.nz. [222.155.5.209])
        by smtp.gmail.com with ESMTPSA id d22sm2311422pfv.196.2021.09.05.01.16.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Sep 2021 01:16:36 -0700 (PDT)
Subject: Re: [PATCH v7 1/4] m68k: Kconfig - select core PCMCIA support module
 for Amiga PCMCIA
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
 <1630206710-5954-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdV5hWcg=pPZ7=E5QEi5OqM=X4JsqymsL-vHWjMjDvyWQQ@mail.gmail.com>
 <6843c140-7f58-8510-30f2-201d824601df@gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, ALeX Kazik <alex@kazik.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <0caf0e92-2f74-7fe0-7530-1f2abf352500@gmail.com>
Date:   Sun, 5 Sep 2021 20:15:28 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <6843c140-7f58-8510-30f2-201d824601df@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 03/09/21 14:51, Michael Schmitz wrote:
> Hi Geert,
>
> [resending due to bounce]
>
> thanks for your review!
>
> On 03/09/21 00:42, Geert Uytterhoeven wrote:
>> Hi Michael,
>>
>> On Sun, Aug 29, 2021 at 5:12 AM Michael Schmitz<schmitzmic@gmail.com>
>> wrote:
>>> The 16 bit card support test for the apne.c driver needs a whole
>>> lot of hairy parser code which is already present in the core
>>> PCMCIA code - make use of that instead of duplicating it.
>>>
>>> Signed-off-by: Michael Schmitz<schmitzmic@gmail.com>
>> Thanks for your patch!
>>
>>> --- a/arch/m68k/Kconfig.bus
>>> +++ b/arch/m68k/Kconfig.bus
>>> @@ -31,6 +31,8 @@ config ZORRO
>>>   config AMIGA_PCMCIA
>>>          bool "Amiga 1200/600 PCMCIA support"
>> Can this become tristate?
> I suspect it can - though I wonder why it hasn't been made tristate
> before. Ah - pcmcia.c needs a little patch to add a MODULE_LICENSE clause.
>>>          depends on AMIGA
>>> +       select PCCARD
>>> +       select PCMCIA
>> This is now forcing PCCARD and PCMCIA builtin instead of modular
>> in an allmodconfig kernel.
> Thanks, that's what I'd been worried about.
>
> How do I make sure CONFIG_PCMCIA gets selected as module as well? I can
> select this when CONFIG_APNE is set, from
> drivers/net/ethernet/8390/Kconfig, but I'd then have to protect the
> cftable parse hook in amiga/pcmcia.c against the case where CONFIG_APNE
> is not selected.
>
> Not to mention we need to rename amiga/pcmcia.c to avoid a module naming
> conflict.

I think I rather leave pcmcia_is_16bit() in apne.c where I had initally 
put it. No other driver uses it, and I avoid mucking around with file 
renames. Core PCMCIA code can still be built as modules, as can the APNE 
driver.

Cheers,

	Michael



