Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337F8ECAAD1
	for <linux-m68k@archiver.kernel.org>; Thu,  1 Sep 2022 12:13:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbiIAMNL (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233342AbiIAMND (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 1 Sep 2022 08:13:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B689F118214
        for <linux-m68k@vger.kernel.org>; Thu,  1 Sep 2022 05:13:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 01E0F61D3A
        for <linux-m68k@vger.kernel.org>; Thu,  1 Sep 2022 12:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF39CC433D7;
        Thu,  1 Sep 2022 12:12:59 +0000 (UTC)
Message-ID: <b13d941a-0df3-c066-cb61-a931243edcd5@linux-m68k.org>
Date:   Thu, 1 Sep 2022 22:12:56 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCHv2 3/3] m68k: allow kexec on M68KCLASSIC with MMU enabled
 only
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <20220831012539.3416470-1-gerg@linux-m68k.org>
 <CAMuHMdVOWHm6HpBRm-MC3PDy0=m6-GbG6s-S2tfGQwZcggpX7A@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdVOWHm6HpBRm-MC3PDy0=m6-GbG6s-S2tfGQwZcggpX7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org


On 31/8/22 17:44, Geert Uytterhoeven wrote:
> On Wed, Aug 31, 2022 at 3:35 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> None of the no-MMU CPU types (classic or ColdFire) or ColdFire with
>> MMU enabled have support for kexec yet, so the configuration as it
>> stands is not quite right, and it will fail to compile on them.
>>
>> Make CONFIG_KEXEC depend on both CONFIG_M68KCLASSIC and CONFIG_MMU.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue in the m68k for-v6.1 branch.

Thanks Geert!

Regards
Greg



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
