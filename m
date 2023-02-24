Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236EEC7EE23
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Feb 2023 18:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229897AbjBXS5X (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 24 Feb 2023 13:57:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjBXS5W (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 24 Feb 2023 13:57:22 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75936DD87
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 10:57:21 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so191863pjp.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 24 Feb 2023 10:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20nO/fRuZem/BlBqyGOJWmtXfr5KWtI0Q/Q/VDWSkSM=;
        b=bnAEMUOBC8P2VI0hOv6rDQq1z38+cNLNWtB5JQkJNGBeYSe9WlU6DZEitHjy+2FSkn
         HbU6lR3TijY1NR+53Gwj4UVWoJn3TtSaf2QSSRTTfe9wDVvz0/kHLvlRSl07F9fTWpQ/
         yynPsEa4xJW1c0t+vGHx75gDddvg9SSbkMn2zNBaj9rv1DrIglmTLQ0X/HagPP/WUaHM
         wsu9QTEmdDBTRPTiwKmyTJgC0azVZ0xhTcq2D3CrhL8E0NN0m+VqfXlVrha9N8bzWuOR
         N8pcsdkMg2W7siLIkB7RXCvW6nP4jUtilrOgYn8HQ7MxmWD3RYLNx3CM4Ty9l3ZZFQag
         axpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20nO/fRuZem/BlBqyGOJWmtXfr5KWtI0Q/Q/VDWSkSM=;
        b=kwTtFJpycpdaB2gio6N9gDrJ47OA6LgvOAtAz9dt6qx/RhYsZ0Ac6yt4Q017b7Pk69
         vDvKn4rBMcVICaD3mybgOPhbOEZzQI73nbV4SWNJTqJkYL6J2vw+yLRKU7vZYYxrb4K5
         fVkgOX4QELrURzcKemgHrnCqN3qs/Xs+89LUtKrgQe72ZirIoEkaCeQpM5Xy+abkhNcv
         FvvnifpjsQ3wld2/OKbn+DnSSafSwr3nt5R75Acnl6iGicgB3GFofEdwecAaQY2Wpplf
         UdWUSTBeWTJyP/PLrKJ2h950idl7TwX0EVbkT7NJzmQvkj4MxD1lLAhlBgLcOAJGvOTh
         JVdQ==
X-Gm-Message-State: AO0yUKVuNOYuFtkY3yqjLTB6jvXUQdjKRL0vHLKifhCtpgfK4PEd3str
        w3C5K5UlptVFW6FM4grNtOg=
X-Google-Smtp-Source: AK7set9My8fNli1zPRqIJ5JOddd9dbVEj7bGy9YgIjo9kEPu5VZJaWgDttqXsMzEYAyW8zcH3AhSwA==
X-Received: by 2002:a17:903:1392:b0:19c:dc38:3eb5 with SMTP id jx18-20020a170903139200b0019cdc383eb5mr1557336plb.14.1677265040990;
        Fri, 24 Feb 2023 10:57:20 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id jb17-20020a170903259100b001994fc55998sm8446857plb.217.2023.02.24.10.57.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Feb 2023 10:57:20 -0800 (PST)
Subject: Re: [PATCH] m68k: fix for systems with memory at end of 32-bit
 address space
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Kars de Jong <jongk@linux-m68k.org>
References: <20230223112349.26675-1-jongk@linux-m68k.org>
 <CAMuHMdWVwyRuwUZY4t7NKEbAePTuj44zYi7gmYiL1_ZCJWySZQ@mail.gmail.com>
 <CACz-3rhNFb81+auU10+ctG2XrcvKgQ7o0MGy+6DV5MsNw9XmNg@mail.gmail.com>
 <CACz-3rh+m7FEXVyNUUwCzbUFg6Ytk-iMNcc12o_WNie69aHT+Q@mail.gmail.com>
 <CAMuHMdU-cic=oSo7q=SCpC-g_3rjzFT-H=861aWaMEoP1PKnYg@mail.gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org, Mike Rapoport <rppt@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <34622a7a-0984-5d4c-3d9f-67476b47434d@gmail.com>
Date:   Sat, 25 Feb 2023 07:57:14 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU-cic=oSo7q=SCpC-g_3rjzFT-H=861aWaMEoP1PKnYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 25.02.2023 um 00:01 schrieb Geert Uytterhoeven:
>> Now I just need to figure out why the last page of memory is excluded.
>> Do you also see this on other machines?
>>
>> Zone ranges:
>>   DMA      [mem 0x00000000fc000000-0x00000fffffffefff]
>>   Normal   empty
>> Movable zone start for each node
>> Early memory node ranges
>>   node   0: [mem 0x00000000fc000000-0x00000000ffffefff]
>> Initmem setup node 0 [mem 0x00000000fc000000-0x00000000ffffefff]
>
> I don't see that on ARAnyM or on qemu-system-m68k, but those
> don't have memory at the end of the address space.
>
> ISTR something about not mapping the last page of RAM, if it's at the
> end of the address space, to avoid wrap-around while prefetching?

What would that achieve? The prefetch would still hit an unmapped page.

I can see that excluding the last page from use by memory allocators 
will prevent wrap, but that last page must then still be mapped, no?

Cheers,

	Michael

>
> [searching]
>
> I think it's a side-effect of:
>
>     static inline phys_addr_t memblock_cap_size(phys_addr_t base,
> phys_addr_t *size)
>     {
>             return *size = min(*size, PHYS_ADDR_MAX - base);
>     }
>
> with
>
>     #define PHYS_ADDR_MAX  (~(phys_addr_t)0)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
>
