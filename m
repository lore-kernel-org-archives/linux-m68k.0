Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A6FDC0015E
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Jul 2023 01:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjGWBI4 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 22 Jul 2023 21:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGWBIz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 22 Jul 2023 21:08:55 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A06771BE2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Jul 2023 18:08:54 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8ad9eede0so25237655ad.1
        for <linux-m68k@lists.linux-m68k.org>; Sat, 22 Jul 2023 18:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690074533; x=1690679333;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBlbl1pSWpR4BQFATiB6kcRrhHvuDmG7iQn/xHVyqDs=;
        b=cRkthiIFj5B53WcHiIpa4F5CGwz4iclD6GBTptlnihL//y1Cc9l72qU2VsiS9rk3GM
         hqm7frtXPb6veCE+VbQCyzO33qMDKLgJrJZZHa9Fc11JwadZY1+nu69NCyBNy76lAOYo
         xhugYJiDZKXliPb7cL6JV7pwW8x9A3VfQIibU3hdnUn63imEwzUNYaT03s4HkxRhpXVh
         QllLq/EFcidN4RDW+qWZppnbEHKFKYJbgTW7nnl5ccX0+TIuQ7zf/Vn/pdmgeK2gR3O3
         Lpivivkau/lVlrofQCZHwL73/J21Anu5k6inM08erYAAQDpb+Kq+EnyiSNisSVNZjtoH
         hDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690074533; x=1690679333;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBlbl1pSWpR4BQFATiB6kcRrhHvuDmG7iQn/xHVyqDs=;
        b=kBPaAbAUmZpkQq80JyzZirZg9b8RKOqi6BgWeghvybFkyV4USo+kNLOiAjb0Vl5BK4
         tf+MCDZdCiNQTs/dZUhheDS48G8ivzgiMLZM9kxzOGA/6MahFGkHpOCi/Q1pgjuUUq6V
         OBTlapiKahJobCP4MlQrQ8tVRQSvZ7Zlt7A56NJTZRnLLkMA5r5I4SY1QnC8g0/f7FsR
         81kX4aq3YJQcY54NkcJMO0+gA+aJ7+uJeDVwLsAEKeCtpUwepK8mordwvPK/URxCpQe7
         sNn8K01VR/RP2IRUXl+0kiI23h+SKb9SsrYcFe7vjDIAHujM5UQEv8wEjVqIvsPtrHP/
         9xFg==
X-Gm-Message-State: ABy/qLYLS1M1hrT68ireLfDNMph7h+YkAhIZfR9/wpj1vBhT3r+WbDV8
        Rju9s9phGnvXDvuxXouZAnQ00oNUDOA=
X-Google-Smtp-Source: APBJJlEjjT/iNxpc6d59t05FPQXhHd6Qmz54Hld4lIfsrfgxEpHAHoFeFMslKujxzCO1QfulvRL5oA==
X-Received: by 2002:a17:903:41c3:b0:1b8:a234:7617 with SMTP id u3-20020a17090341c300b001b8a2347617mr8162755ple.5.1690074533372;
        Sat, 22 Jul 2023 18:08:53 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id d134-20020a63368c000000b0055be951145csm5688998pga.36.2023.07.22.18.08.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 22 Jul 2023 18:08:52 -0700 (PDT)
Subject: Re: clear_bit_unlock_is_negative_byte
To:     Brad Boyer <flar@allandria.com>,
        Matthew Wilcox <willy@infradead.org>
References: <ZLmKq2VLjYGBVhMI@casper.infradead.org>
 <87jzut6acw.fsf@linux-m68k.org> <ZLpzNAIVVLH9JYZ1@casper.infradead.org>
 <20230721202904.GA12851@allandria.com>
 <ZLtQKfMDDGQdtsaR@casper.infradead.org>
 <20230722234902.GA29173@allandria.com>
Cc:     Andreas Schwab <schwab@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <90b5f309-3cd9-64b4-4f02-38c13de34129@gmail.com>
Date:   Sun, 23 Jul 2023 13:08:48 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20230722234902.GA29173@allandria.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Brad,

Am 23.07.2023 um 11:49 schrieb Brad Boyer:
> On Sat, Jul 22, 2023 at 04:42:33AM +0100, Matthew Wilcox wrote:
>> What I want to do is allow us to set/clear multiple bits in the same
>> instruction that unlocks the folio.  The obvious one is
>> folio_mark_uptodate(); this is commonly paired with folio_unlock(),
>> and it's a crucial part of page cache reads.  There are some less
>> obvious ones like folio_start_writeback() and folio_unlock(),
>> which isn't included in this patch series.  If we're going to set
>> one bit and clear another bit, we have to use the xor/eor instruction,
>> and that's what we do.
>>
>> On some architectures, such as MIPS, there's actually a
>> separate function to implement all of this and so passing it a
>> (constant) mask (instead of calculating that mask from what
>> is now a variable bit) makes sense, and we can then use that
>> function to implement both clear_bit_unlock_is_negative_byte() and
>> change_and_unlock_is_negative_byte().  I'm still going around on this.
>> I might change the API to always pass in a mask from folio_set_unlock().
>>
>> And maybe we actualy get rid of clear_bit_unlock_is_negative_byte()
>> since it's essentially a subset of change_and_unlock_is_negative_byte().
>> But I can change m68k to use andi.b for now if you feel strongly.
>
> I do prefer to be consistent. We already have strange inconsistencies
> for bad reasons or no reason at all. However, if it's temporary, I
> suppose it doesn't matter that much. With the new code in the diff in
> your git tree, the use of eori is now consistent if you get rid of the
> old clear bit version as separate code. If there's a decent chance it
> will be a while before that next stage, I would personally recommend
> using the andi. However, I would defer to the others on the list if
> people think it's fine.

First off - I know nothing about the code calling this function, so my 
argument may be mooted by design, or proof showing use of xor is safe ...

The only thing that has me worried about the xor scheme is Matthew's 
assertion that the bit meant to be cleared is known to be set before 
clear_bit_unlock_is_negative_byte() is called. Should that be incorrect 
in corner cases, I'd expect things to fall apart with the proposed patch.

Personally, I'd prefer we catch such cases sooner rather than later, 
should they exist. But others may take the view, with rather more 
justification, that the old code using andi is safer and ought to be 
used until other changes force use of xor.

Just my $.02 worth...

Cheers,

	Michael
>
> 	Brad Boyer
> 	flar@allandria.com
>
