Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFFCC61DA4
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 12:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjBFMCP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:02:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjBFMCP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 07:02:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1958512F28
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 04:02:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90D9C60E33;
        Mon,  6 Feb 2023 12:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1004C433EF;
        Mon,  6 Feb 2023 12:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675684931;
        bh=wS4sH264dDdF0uW6V4ThXzifTpLKkJP2kgphdNctr/w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lNQcVBnJea+WfT6stx5JBbLRReavQPY3zk1f4aoLy1jyCvl4q30L6VlLUxKBEP50I
         /MbRlkaP0skLvd8fPH1mQf/HdyBrvJjnjHhjrPrt59m51MwkMqCemKuzu+u+Ks3mKr
         djhiLgOfIvJN6SM30v5btt0Hpsaa0+/Z+tQDAzylDrUSugGsZn2pMJCgTRatWI+rNF
         lnohgUSpUy0ag5ZbzkXXR0SfLjYXO4qGhpqADjB2LtxIyiIRE9s5KTFC+lGBsydFb5
         sw9JWMAOiSNEztMMMDRV0/y/wnNEyPfFtMVvZ8Xhvn/xDJ+Cz3rAlM+96neWB5Uhty
         3VvicbqCcsrcw==
Message-ID: <b7d1cfce-3ba3-6621-60c0-9b401a382971@kernel.org>
Date:   Mon, 6 Feb 2023 22:02:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: U-Boot support for M68K removal
To:     Angelo Dureghello <angelo.dureghello@timesys.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Tom Rini <trini@konsulko.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org,
        Joshua Thompson <funaho@jurai.org>,
        Philip Blundell <philb@gnu.org>, u-boot@lists.denx.de,
        Huan Wang <alison.wang@nxp.com>
References: <Y9PWhU7DVQCLP9EX@bill-the-cat>
 <CAMuHMdUMvGhpbfsTaaNSpypH_XdKjVzY3yWOOpR=Acj_7K6-uw@mail.gmail.com>
 <CALJHbkBqdvJu8KGKbJ2eayhiP_t607AvuwgYidhLTPY7=Mt4Hg@mail.gmail.com>
 <Y9fs2wH4WHIzae5r@bill-the-cat>
 <7739d9da9f49f99d156dacf645a311388e9eb628.camel@physik.fu-berlin.de>
 <af87d98baa2eb3bf253a1f06bc29ee9cd5034e3b.camel@physik.fu-berlin.de>
 <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com>
Content-Language: en-US
From:   Greg Ungerer <gerg@kernel.org>
In-Reply-To: <CALJHbkAuaGrfiAm2jzTmrAPSM+Gq1z-gVSZ+7hgn8-e_Lr82XQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 6/2/23 18:14, Angelo Dureghello wrote:
> Hi John,
> 
> On Sat, Feb 4, 2023 at 4:55 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
>>
>> On Mon, 2023-01-30 at 17:22 +0100, John Paul Adrian Glaubitz wrote:
>>> FWIW, m68k is still a very actively maintained architecture in the
>>> Linux kernel and userland with even LLVM and Rust having recently
>>> added support for m68k.
>>>
>>> I also own a Coldfire board myself (not sure which one without
>>> looking), so I can offer to test U-Boot patches in the future.
>>
>> So, I just found my Coldfire board and it's actually a 547x/548x EVB
>> fitted with a 5475 CPU module clocked at 266 MHz.
>>
>> I will get this board set up during the next weeks and I am happy to
>> test any Coldfire kernel patches, and eventually, U-Boot patches if
>> that board is still supported.
>>
> 
> thanks a lot.
> 
> Actually, i am debugging on a 54415 based board, totally dead
> using current master.
> I cannot printf, so using some gpio's for debug.
> Issue seems to happen at first puts, so, something related
> to serial port initialization. Hope to fix this soon.

I wish I had a 54415 based board in my collection. Would make it so
much easier to keep the kernel working on it :-(

Regards
Greg



>>
>> Adrian
>>
>> --
>>   .''`.  John Paul Adrian Glaubitz
>> : :' :  Debian Developer
>> `. `'   Physicist
>>    `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
> 
> 
> Regards,
> angelo
> 
