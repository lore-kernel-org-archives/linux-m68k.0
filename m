Return-Path: <SRS0=PT/U=ED=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37641C55179
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Oct 2020 22:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D805E20714
	for <linux-m68k@archiver.kernel.org>; Wed, 28 Oct 2020 22:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXNAYzp0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389503AbgJ1WoM (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389527AbgJ1WoD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 28 Oct 2020 18:44:03 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BD3C0613CF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Oct 2020 15:44:02 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id s21so1312572oij.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 28 Oct 2020 15:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=s9cgYbyfQqq5UrYB+51r7q1mjBjejxSSOe4Pf+0dXSc=;
        b=rXNAYzp0HeMoYo9Rs2j7a7wVExN8Iyb5gKJa3ilnzOfGHJwcd+RFugTbbv4YUD3Mnj
         2VUO9dlRzbWeNmhZQWRmIldeVTDDuir4KELQdTV8pKPdUaKgxaJ0IfJxBnM0G7vRBCYg
         wiT8wBbr85sNx5oNi5w1j5zdrDvcm3y/EvCc8kg4eRMh6e4OhiTUEBlFVB0b+ClJRPsJ
         TUQPC9Lpnd7T4yc2WOtO43nneYC6WKlAT53mGvvaNge6Yx9M/aeXZ+pqCJrHxuwPUVlT
         Z3sxPuGh8uWER8Un/fum42c093n9HO5gFE6T+nYBivL+DRtjuefzSY2LaKQepJTmgDcw
         UYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=s9cgYbyfQqq5UrYB+51r7q1mjBjejxSSOe4Pf+0dXSc=;
        b=JmWUyu31Cz1/rBVWe/W2xO/l1h+mCTW60LxsdWS/SpUDGgquoL9tg+AawyYjgmuvJj
         IP56chVh0hvspf9TMcWEYYwmVI4y1tawxw5CKorEC1TLf42izvRTfJ17uvRY/9PWjx8H
         DnOKoRX5MXRp3zy5yEQTH+X+nfyXTMRRijrTtxeyu/Wm0igRZyLTJcnkR8CDF/Im4AOf
         M0FJv/twRMomMO2C1CE7JwJPpFHeeogFVKQS7DNdWKE+0bduBKVF0Lmla12ox8z4VQZ2
         hxwMvNxUT/ugmMxT4uZxzeNM1jAFni74nVhHpredIoVlj+fcN/A9197HZ8ZP5jp2hm8z
         x1Nw==
X-Gm-Message-State: AOAM5334OEOXCBDL1v6Ks+oUGwUUiGFXRXQo62VpTdnGy1YyJ4gmdx7W
        5MOZWymVcCOG6NLk+JRaNkt2l38BKzNgxw==
X-Google-Smtp-Source: ABdhPJxTVCFgGb7WglQERoAc+UBIhCpYSdy5fzH3i6p6S1gDc3JwHMqoX8TTAJWZ5WiJDakcD5Jdcg==
X-Received: by 2002:a17:90b:4a83:: with SMTP id lp3mr209008pjb.138.1603908889414;
        Wed, 28 Oct 2020 11:14:49 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:70b5:cf21:2a3a:f170? ([2001:df0:0:200c:70b5:cf21:2a3a:f170])
        by smtp.gmail.com with ESMTPSA id i21sm60510pgh.2.2020.10.28.11.14.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Oct 2020 11:14:48 -0700 (PDT)
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
To:     Mike Rapoport <rppt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Matt Turner <mattst88@gmail.com>, Meelis Roos <mroos@linux.ee>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Russell King <linux@armlinux.org.uk>,
        Tony Luck <tony.luck@intel.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Will Deacon <will@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux MM <linux-mm@kvack.org>,
        arcml <linux-snps-arc@lists.infradead.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
 <20201028111631.GF1428094@kernel.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <fd55643a-a17b-5a23-4c77-9e832c1e5128@gmail.com>
Date:   Thu, 29 Oct 2020 07:14:38 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201028111631.GF1428094@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mike,

On 29/10/20 12:16 AM, Mike Rapoport wrote:
> Hi Geert,
>
> On Wed, Oct 28, 2020 at 10:25:49AM +0100, Geert Uytterhoeven wrote:
>> Hi Mike,
>>
>> On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> The pg_data_t node structures and their initialization currently depends on
>>> !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
>>> make this dependency explicit and replace usage of
>>> CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
>>>
>>> The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
>>> variant, although it always presumed a single memory bank. As there is no
>>> actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
>>> systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> Thanks for your patch!
>>
>>> ---
>>>   arch/m68k/Kconfig.cpu           | 6 +++---
>>>   arch/m68k/include/asm/page_mm.h | 2 +-
>>>   arch/m68k/mm/init.c             | 4 ++--
>>>   3 files changed, 6 insertions(+), 6 deletions(-)
>> Is there any specific reason you didn't convert the checks for
>> CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
> In arch/m68k/kernel/setup_mm.c the CONFIG_SINGLE_MEMORY_CHUNK is needed
> for the case when a system has two banks, the kernel is loaded into the
> second bank and so the first bank cannot be used as normal memory. It
> does not matter what memory model will be used in this case.


That case used to be detected just fine at run time (by dint of the 
second memory chunk having an address below the first; the chunk the 
kernel resides in is always listed first), even without using 
CONFIG_SINGLE_MEMORY_CHUNK.

Unless you changed that behaviour (and I see nothing in your patch that 
would indicate that), this is still true.

Converting the check as Geert suggested, without also adding a test for 
out-of-order memory bank addresses, would implicitly treat DISCONTIGMEM 
as  SINGLE_MEMORY_CHUNK, regardless of bank ordering. I don't think that 
is what we really want?

Cheers,

     Michael


>
>> and arch/m68k/include/asm/virtconvert.h?
>   
> I remember I had build errors and troubles with include file
> dependencies if I changed it there, but I might be mistaken. I'll
> recheck again.
>
>> Gr{oetje,eeting}s,
>>
>>                          Geert
>>
>> -- 
>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>
>> In personal conversations with technical people, I call myself a hacker. But
>> when I'm talking to journalists I just say "programmer" or something like that.
>>                                  -- Linus Torvalds
