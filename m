Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F20DECAAA1
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Aug 2022 07:23:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiH3HXd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 Aug 2022 03:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiH3HX2 (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Aug 2022 03:23:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F342C7F81
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2022 00:23:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B6160614A0
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2022 07:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9611DC433D7;
        Tue, 30 Aug 2022 07:23:22 +0000 (UTC)
Message-ID: <337d70c9-5257-a9d4-5ec1-a43b8ade1a14@linux-m68k.org>
Date:   Tue, 30 Aug 2022 17:23:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] m68k: allow kexec on all MMU enabled CPUs
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>
References: <20220826040302.3455339-1-gerg@linux-m68k.org>
 <20220826040302.3455339-3-gerg@linux-m68k.org>
 <CAMuHMdWRjG6n9MpLG+rZtyrTPdj6sGLt7LehHo+i0P9aHach+Q@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <CAMuHMdWRjG6n9MpLG+rZtyrTPdj6sGLt7LehHo+i0P9aHach+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 26/8/22 17:44, Geert Uytterhoeven wrote:
> On Fri, Aug 26, 2022 at 6:08 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
>> The configuration setting for 68k kexec support limits it to only
>> the classic 68k CPU types (so no ColdFire). However the underlying
>> support can handle any 68k CPU that is MMU enabled - and that includes
>> ColdFire. (Of course that support is only as good as mentioned in
>> the current configuration help).
>>
>> None of the no-MMU CPU types (classic or ColdFire) have support for
>> kexec yet, so the configuration as it stands is not quite right, and
>> it will fail to compile on them.
>>
>> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/Kconfig
>> +++ b/arch/m68k/Kconfig
>> @@ -87,7 +87,7 @@ config MMU_SUN3
>>
>>   config KEXEC
>>          bool "kexec system call"
>> -       depends on M68KCLASSIC
>> +       depends on MMU
>>          select KEXEC_CORE
>>          help
>>            kexec is a system call that implements the ability to shutdown your
> 
> Don't you need changes to arch/m68k/kernel/relocate_kernel.S,
> which supports 68020+ only?

I suspect so looking at that now. It compiles ok, but without a
check for MMU type specific to ColdFire it will likely fail.
I didn't dig into it too deeply, my primary goal with to fix compilation
for the non-MMU targets.

I started out testing it with this:

     depends on M68KCLASSIC && MMU

And that works and fixes the problem I was most interested in.
But then I figured that perhaps it is better to allow if for ColdFire with MMU enabled.

I didn't want to go down the rabbit hole of trying to get it working
on non-MMU platforms (and ColdFire with MMU enabled either really).

So I would be just as happy to limit it to M68KCLASSIC and MMU for now?

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
