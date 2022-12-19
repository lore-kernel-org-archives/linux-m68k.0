Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36F5C4332F
	for <linux-m68k@archiver.kernel.org>; Mon, 19 Dec 2022 22:07:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232694AbiLSWHH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 19 Dec 2022 17:07:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232802AbiLSWGe (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 19 Dec 2022 17:06:34 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C016167C1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 19 Dec 2022 14:04:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE62161178;
        Mon, 19 Dec 2022 22:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57EEC433D2;
        Mon, 19 Dec 2022 22:04:07 +0000 (UTC)
Message-ID: <58978e45-b598-073b-359b-8c45dfcbea0c@linux-m68k.org>
Date:   Tue, 20 Dec 2022 08:04:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] m68k: nommu: Fix misspellings of "DragonEngine"
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org
References: <8e823d669284abb9b5174f25a4abfc4cd35b1652.1670919535.git.geert@linux-m68k.org>
 <4c17e3cb-43a2-f3a7-d713-71093367eac5@linux-m68k.org>
 <CAMuHMdW+EDZJ4doZeJMrBNghV7G_gDCDP6z5odhdTU26H8oqWg@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdW+EDZJ4doZeJMrBNghV7G_gDCDP6z5odhdTU26H8oqWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 19/12/22 23:42, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Mon, Dec 19, 2022 at 1:33 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> On 13/12/22 18:19, Geert Uytterhoeven wrote:
>>> Exys produced the "DragonEngine II" board.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>> At least the misspelling was used consistently ;-)
>> See arch/m68k/68000/dragen2.c!
> 
> No it was not: that file has a different misspelling.
> Sending v2...

Hah, yes, I missed that entirely different misspelling too.
Good catch.


>> Do you want me to push through the m68knommu git tree?
> 
> Yes please (same for the other patch).
> Thanks!

Yep, will do. As soon this merge window closes I will push them in.

Thanks!
Greg


>>> ---
>>> The printed message:
>>>
>>>       arch/m68k/kernel/setup_no.c:    pr_info("DragonEngine II board support by Georges Menie\n");
>>>
>>> matches Georges' website:
>>>
>>>       https://www.menie.org/georges/DragonEngine/
>>> ---
>>>    arch/m68k/Kconfig.machine | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/m68k/Kconfig.machine b/arch/m68k/Kconfig.machine
>>> index b7a70297fbc1a5a6..e2f961208f18bec5 100644
>>> --- a/arch/m68k/Kconfig.machine
>>> +++ b/arch/m68k/Kconfig.machine
>>> @@ -199,11 +199,11 @@ config UCDIMM
>>>          Support for the Arcturus Networks uCdimm module.
>>>
>>>    config DRAGEN2
>>> -     bool "DragenEngine II board support"
>>> +     bool "DragonEngine II board support"
>>>        depends on !MMU
>>>        select M68VZ328
>>>        help
>>> -       Support for the DragenEngine II board.
>>> +       Support for the DragonEngine II board.
>>>
>>>    config DIRECT_IO_ACCESS
>>>        bool "Allow user to access IO directly"
> 
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
