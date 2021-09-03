Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4E2C433F5
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Sep 2021 21:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71A7D60FD7
	for <linux-m68k@archiver.kernel.org>; Fri,  3 Sep 2021 21:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhICVxf (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 3 Sep 2021 17:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349762AbhICVxe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2021 17:53:34 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBEEC061764
        for <linux-m68k@vger.kernel.org>; Fri,  3 Sep 2021 14:52:34 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so459320pjx.5
        for <linux-m68k@vger.kernel.org>; Fri, 03 Sep 2021 14:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=gKeSZ+pF0BB5facpi5/3rm8YHs77lF8++bw8wKEiUDA=;
        b=YsILxUeUm/UpWjhTLk8bdEgnj9Ms5mJ6iL92euc07kNw3H5yzNIrlLX3Dl51KOIu+H
         rW6a+3dPn15GnIZ0wfAQPnboZitw55T/nQk4Kv/65LfsjJ4qTxFUH8QQZ1MuQ7mwpPu2
         P5ReoBa3+1quM9LA46Cqbi+On/eFX8HNmvK22nwsGXvBv9Z1TnO3VWCNkXLQX0H0zq/T
         HQNOFLBBCNHwxhQZ+ooByhzdrAFPNkcyAnDNvEbecM7jhvhXo96xdgSreUTrt/wkgz9g
         FDxbrewojiVlzq+A2bs6ZIyofcY3rXtcHVavIrQc/VxNxrKzNbjAzzU56V5sqo71EmoS
         CzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=gKeSZ+pF0BB5facpi5/3rm8YHs77lF8++bw8wKEiUDA=;
        b=HlL4R2AZ8cQ4lFjGJdMFTC8MObnsBIW63C6cY270GED1cIs0cMzn9qIaur4x8M39VK
         BGzCf31s7MjRcXxhXA3fL8/YKL0U5rHBsTeCnGGPRmDMgPew8jgF3MiVVQaK8TJr+pfh
         4DmQIRiez9NBdvYux0gvse7z8PiRHG/Ox8E5t9xdqzA6WJOlGJwhaSX9rXfDW2AzhWFH
         NvKYEABc8HUQkeP40kmT+gW2KAA4hpZ5nJ/n9uL+GcbaTPVVSN1Pwf2cE5HMF0kfRYqz
         VHJL7g5q8RJ0gb3A9dkTzR0R+cYZIxSMsrXyf7mVjjmtI06XRTnwwveHF+SSjByZrGDQ
         HCUw==
X-Gm-Message-State: AOAM532rNMBqYx1enq5RFnO1+ikLSIEtTP3I2DTkPSQBSqyLs4PT8hnm
        mmtb8MSa5rhM8cfGcddaSFs=
X-Google-Smtp-Source: ABdhPJxDLONtMreBtv/Zr/nJ5jDz497ADPFGKcVdhyWYzs0pnmJHFTeq0xUc0NjEjSEKMQ3M44KDTA==
X-Received: by 2002:a17:90a:df0c:: with SMTP id gp12mr962064pjb.116.1630705953941;
        Fri, 03 Sep 2021 14:52:33 -0700 (PDT)
Received: from [10.1.1.26] (222-155-5-209-adsl.sparkbb.co.nz. [222.155.5.209])
        by smtp.gmail.com with ESMTPSA id d3sm337234pga.7.2021.09.03.14.52.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:52:33 -0700 (PDT)
Subject: Re: [PATCH v7 1/4] m68k: Kconfig - select core PCMCIA support module
 for Amiga PCMCIA
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1630206710-5954-1-git-send-email-schmitzmic@gmail.com>
 <1630206710-5954-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdV5hWcg=pPZ7=E5QEi5OqM=X4JsqymsL-vHWjMjDvyWQQ@mail.gmail.com>
 <6843c140-7f58-8510-30f2-201d824601df@gmail.com>
 <CAMuHMdUwSMDgQ8Vk9JV4kngJ52Vz1X8fXiTPLow_9sE9OX2tLg@mail.gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>, ALeX Kazik <alex@kazik.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <2edf2cc4-7e5a-1045-cb58-0b8f55d20b3f@gmail.com>
Date:   Sat, 4 Sep 2021 09:51:29 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUwSMDgQ8Vk9JV4kngJ52Vz1X8fXiTPLow_9sE9OX2tLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 04/09/21 02:14, Geert Uytterhoeven wrote:
> Hi Michael,
>> How do I make sure CONFIG_PCMCIA gets selected as module as well? I can
>> select this when CONFIG_APNE is set, from
>> drivers/net/ethernet/8390/Kconfig, but I'd then have to protect the
>> cftable parse hook in amiga/pcmcia.c against the case where CONFIG_APNE
>> is not selected.
>
> That will be fixed automatically by making AMIGA_PCMCIA tristate.
> Select from a modular symbol will make the target modular, too.

Maybe when starting from a new .config - if no one had these set on m68k 
before, we're OK.

>
>> Not to mention we need to rename amiga/pcmcia.c to avoid a module naming
>> conflict.

No objection? Anything in particular to be careful about when renaming a 
file?

>>
>> Just including cistpl.o as a module is not an option unfortunately - too
>> many dependencies.
>>
>> And I don't think we need CONFIG_PCMCIA_PROBE=Y?
>
> No idea if we need that...

It's about IRQ probing, so yechhh .... OTOH, it doesn't hurt as we'll 
never call the IRQ probe hooks, so we can just as well leave it active.

> -default y if ISA && !ARCH_SA1100 && !PARISC
> +default y if ISA && !ARCH_SA1100 && !PARISC && !AMIGA_PCMCIA
>
> (wondering how many platforms that can use PCMCIA are left, and if
>  this can be converted into positive logic?)

You're welcome to open that discussion. Hope it won't backfire...

Cheers,

	Michael

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
