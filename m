Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21851C2B9F4
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Jun 2021 21:15:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDCA56141F
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Jun 2021 21:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbhFYVRq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Jun 2021 17:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYVRq (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 25 Jun 2021 17:17:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A83C061574
        for <linux-m68k@vger.kernel.org>; Fri, 25 Jun 2021 14:15:25 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id o3so261135plg.4
        for <linux-m68k@vger.kernel.org>; Fri, 25 Jun 2021 14:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=3U6p47sRzIk4w7iXxcEQp2aWvZqEv54IzcJm1u9VuP4=;
        b=eRDdokSlApm8Jy2JZU9jeHqHxgfFO5A1fHnrCBOmLRQP6g72YqrzSnbG1+HFBd9YSd
         EQjTy+6LvwOcvp6Gajvf6Tk8MKAG/1nLjLvTBkHFfZByNj92DTopgiJxBecXVEUC9rX5
         rEAT/GmyzeXN7eOmB2J4dzdNl/LbLfFxzZN1oxDyLQblvuR4A/c99M+os3vYQ8egIv/x
         zFLuPD84TXa4EGwPhiJpFGRdSAz062jQeiunMTLP6yGJ2rPuCvsrBoHhrjgyLYt9i/MV
         lCVuVol+VaEROx/UiC+tGPi6FnwFJ2NUbzWS77vQR9GU6MVlmRZZoluIDcNBQwi7EXe2
         Pbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=3U6p47sRzIk4w7iXxcEQp2aWvZqEv54IzcJm1u9VuP4=;
        b=B/T0V+aiP6LIDXQ4ul1xAg+TZtZXvfU2MnEUV0K67YqmSBKK5eywVd/ZKU+x6kShmZ
         8nKHz6zre2XO0xFQGEdmgzWVmQso62TssWSMd0/jt5fXbr/qpU5K335prDNkVngRNqZJ
         DYlr/xY0aLGEaRyeXmEEj+qzzAdEXTFyPxDT51oesRS/Kh1zrnrvsqpvuoSOpm+LDFX0
         Hz5TOwtj+npN1qIKuKSvNuPspiLvDWctlni60oPjnwwLXarWT55e5uBCSsSm3NeOwtD+
         BQXOLThI0Ka2D3rjdxBgw1leYVklXXTjiN0eE7JXcs3LUsRPCNrZD8gTtIt3AgvwYwnL
         Z+vg==
X-Gm-Message-State: AOAM532q4szsDdYMsYf3UDf6SNMEvy0T/t21FwIv6o0oxp54W0Ojgkru
        UBsRBiXw48o8hs9hYyA7PJQxX+NGcN0=
X-Google-Smtp-Source: ABdhPJzSGwLaokLioX/KcADcQ+H1xjLd/YwzhxSNMCHK+0X5g9pYy/wxfoAKHeaHx7SVeaQz9rbziQ==
X-Received: by 2002:a17:90b:3581:: with SMTP id mm1mr22347451pjb.98.1624655724826;
        Fri, 25 Jun 2021 14:15:24 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id b1sm6448071pjk.51.2021.06.25.14.15.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Jun 2021 14:15:24 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
 <78dee109-3714-073c-110b-3d023f66f815@gmail.com>
 <CAMuHMdVtyTyC0L-LZPZCdNsaaxqcVLXky4dsd3m8uyyLUm9drg@mail.gmail.com>
 <3c7cb5b1-4a31-2802-dc60-021c67aa06d3@gmail.com>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <53a462f0-bb89-00fa-76f6-3c615ddf4711@gmail.com>
Date:   Sat, 26 Jun 2021 09:15:18 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <3c7cb5b1-4a31-2802-dc60-021c67aa06d3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 26.06.2021 um 06:42 schrieb Michael Schmitz:
> Hi Geert,
>
> Am 25.06.2021 um 19:31 schrieb Geert Uytterhoeven:
>> Hi Michael,
>>
>> On Thu, Jun 24, 2021 at 11:20 PM Michael Schmitz
>> <schmitzmic@gmail.com> wrote:
>>> On 23/06/21 7:35 pm, Geert Uytterhoeven wrote:
>>>> BTW, there was also "[PATCH] [WIP] selftests/seccomp: Add m68k support"
>>>> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg/
>>>>
>>>>
>>>> I kept on up-porting it, but haven't exercised it recently.
>>>
>>> See attached for test results on my ARAnyM image (Laurent's qemu image,
>>> essentially).
>>>
>>> Is that any different from what you got in your earlier tests?
>>
>> Fortunately lore has a better memory than I do ;-)
>>
>> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261612360.2926@ramsan.of.borg/
>>
>>
>> mine: FAILED: 35 / 86 tests passed
>> yours: FAILED: 35 / 87 tests passed
>>
>> So one new test, and it fails?
>
> Looks like it. I must be missing some mail in my mail archive, can't
> recall ever seeing that one.
>
> There's one new test added after your mail was sent - KILL_unknown. I
> suppose it's that one.
>
> Anyway, both much better than without seccomp support. And going back
> over the archive, I found your patch where you added seccomp.h - and
> added a line in Kbuild as well, which I forgot. Will fix that.

Hmm - after that change, I get:

   SYSHDR  arch/m68k/include/generated/uapi/asm/unistd_32.h
   SYSTBL  arch/m68k/include/generated/asm/syscall_table.h
   UPD     include/config/kernel.release
scripts/Makefile.asm-generic:25: redundant generic-y found in 
arch/m68k/include/asm/Kbuild: seccomp.h
   WRAP    arch/m68k/include/generated/asm/seccomp.h
   UPD     include/generated/utsrelease.h

in the build log.

None of the other archs do add seccomp.h to their include/asm/Kbuild 
script. I'll leave it at v6 then.

Cheers,

	Michael
