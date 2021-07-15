Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4737C636CA
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Jul 2021 23:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1E22613D2
	for <linux-m68k@archiver.kernel.org>; Thu, 15 Jul 2021 23:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhGOXNz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 15 Jul 2021 19:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhGOXNy (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 15 Jul 2021 19:13:54 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11092C06175F
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jul 2021 16:11:00 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id k20so8117020pgg.7
        for <linux-m68k@lists.linux-m68k.org>; Thu, 15 Jul 2021 16:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ZKZNTsgqHnrNxZh/SAE44Z985am6aILcgY4zhrZ3sxk=;
        b=uVz+OK2Jy4a8lEKsLSEGo2j1vou015O6gC9GsKtddySmvXtX+CSdbrKyqdLjsBMUF2
         vpqzoUWOW64LAYpqs1+N5eQoz9aJzzl4kzvwyK9kb8CXZCLHYIQhQvJiS663Jm7H6Pjo
         17js2HbJ5oCXPXIUPBsx3wyKahSqtTewSYNeA1pLxmSq1KNYf0XbRAo/v8kfOGoBWGn8
         NwiT68BSLKzepQkty7vRcAbC0q7yFSd9FN0uwRgb3sJnsrsJ/kW2ta2Y6FUXvzPlgNzE
         sF8Mo1osKd2lSpgTs0tZqRBpZQYpX62/cFIGH4yUwwftHFdoK/IxrNoFBq5W1vstX0ef
         9Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ZKZNTsgqHnrNxZh/SAE44Z985am6aILcgY4zhrZ3sxk=;
        b=DGkB4s87871wCjsjNkBb+IzKoQe9DDUyrenj/aJ66EzdsT1yAYquX0CbB943hxtB48
         TVA1xendkrIlkWQzChV9LHG/ILSmcF9NA3mocI6nfBcEmIO/EGITSudna3Ee8h+2ia5/
         TGJ3OEwrubJA9Unqd67noiuJwQ3zbCyNjXx/ZQWF/SC4EDBJ1HGgI+B4EcRZ3uPOekMS
         icixGMXC/5etAU2KtqT65LVmhlfXsbfoXgwLDuSByNJ7ZzFu3mTpw68RRSI/YPp1S713
         WLeZ7fxKwQNjk22pLppd0E1bb/KPItyxtePBByuoWns8F9yn8nil7t9MS1zh5HAPQ9wZ
         aLZw==
X-Gm-Message-State: AOAM531LWPVmxgp9nSIUJZe/ETry4VwsqV5gC1inC5qTZAS1z9aMSU9m
        kJp8UZhBT/8f6cAUikK/H3c=
X-Google-Smtp-Source: ABdhPJwybjkcSwKtfczA7oymoeqzSzOmRRYi0V9ZLJiuYIboLaS3xmHLMdLh3JNFWGCCB/H2sT6bRA==
X-Received: by 2002:a05:6a00:234f:b029:32d:fceb:4f8a with SMTP id j15-20020a056a00234fb029032dfceb4f8amr6934196pfj.11.1626390659315;
        Thu, 15 Jul 2021 16:10:59 -0700 (PDT)
Received: from ?IPv6:2001:df0:0:200c:bd84:68b:cf56:4515? ([2001:df0:0:200c:bd84:68b:cf56:4515])
        by smtp.gmail.com with ESMTPSA id z5sm7666960pfb.114.2021.07.15.16.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jul 2021 16:10:58 -0700 (PDT)
Subject: Re: [PATCH v4 0/3] m68k: Improved switch stack handling
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     geert@linux-m68k.org, linux-arch@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, torvalds@linux-foundation.org,
        schwab@linux-m68k.org
References: <1624407696-20180-1-git-send-email-schmitzmic@gmail.com>
 <87zgunzovm.fsf@disp2133>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3b4f287b-7be2-0e7b-ae5a-6c11972601fb@gmail.com>
Date:   Fri, 16 Jul 2021 11:10:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87zgunzovm.fsf@disp2133>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Eric,

On 16/07/21 1:29 am, Eric W. Biederman wrote:
>
> I have been digging into this some more and I have found one place
> that I am having a challenge dealing with.
>
> In arch/m68k/fpsp040/skeleton.S there is an assembly version of
> copy_from_user that calls fpsp040_die when the bytes can not be read.
>
> Now fpsp040_die is just:
>
> /*
>   * This function is called if an error occur while accessing
>   * user-space from the fpsp040 code.
>   */
> asmlinkage void fpsp040_die(void)
> {
> 	do_exit(SIGSEGV);
> }

In other places (bus error handlers) we have

force_sig(SIGSEGV);

or

force_sig_fault(sig, si_code, addr);

(the latter for floating point traps from FPU hardware). Would that be 
any better?

>
> The problem here is the instruction emulation performed in the fpsp040
> code performs a very minimal saving of registers.  I don't think even
> the normal system call entry point registers that are saved are present
> at that point.
>
> Is there any chance you can help me figure out how to get a stack frame
> with all of the registers present before fpsp040_die is called?

I suppose adding the following code (untested) to entry.S:

ENTRY(fpsp040_die)
         SAVE_ALL_INT
         jbsr    fpsp040_die_c
         jra     ret_from_exception

along with renaming above C entry point to fpsp040_die_c would add the 
basic saved registers, but these would not necessarily reflect the state 
of the processor when the fpsp040 trap was called. Is that what you're 
after?

To add the rest of the switch stack (again, won't reflect state before 
entering fpsp040), try:

ENTRY(fpsp040_die)
         SAVE_ALL_INT

         SAVE_SWITCH_STACK

         jbsr    fpsp040_die_c

         addql   #24,%sp_c

         jra     ret_from_exception


If you need the registers saved at fpsp040 entry, the only way I can see 
is to change the code in arch/m68k/kernel/vectors.c to use a common fpsp 
trap entry point that saves state, before jumping to the desired fpsp040 
entry point using a FPU trap table. Just like we do for system calls.

Cheers,

     Michael


> Eric
