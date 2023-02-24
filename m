Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06378C61DA4
	for <linux-m68k@archiver.kernel.org>; Fri, 24 Feb 2023 02:47:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjBXCrC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 21:47:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbjBXCrB (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Feb 2023 21:47:01 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2413A57D36
        for <linux-m68k@vger.kernel.org>; Thu, 23 Feb 2023 18:47:00 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id oe18-20020a17090b395200b00236a0d55d3aso1294127pjb.3
        for <linux-m68k@vger.kernel.org>; Thu, 23 Feb 2023 18:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlWTIRg/Gj6y5W6XUi168+n23fIUjBzqs3mIwpOCcOs=;
        b=Uehd+2L/nPQIHeQ5rp6NDD1uWQJBc03QAPXQpGKEvLFLyYi+3PQCopquOkzLCG4Uru
         7vDb8ZeiLe65MSfYuLxrkS5kQNxqfRKd4brAucmuz6MIqkhlCd1lwQoxoK3KgRtyB8EW
         15i2NAAvbmBF39VdcVGToOCZDDgpKN7aYW8/cJCRivmkqqgUkxIOpEVeMrwL4OCxSryE
         +dVX09o4Nt4eUo+ow6s0n2I25oTqq5m/8mPgVQHAfSsiUzWrAP9sSZ5K+eHO8ubAS7oM
         ZGVT/quIL7xY4rC9UqFIJUYXAC2GF1EjJBOb8l7hOV8UoxWY/3uyz2EQMUFs9iFyiXEq
         lUjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vlWTIRg/Gj6y5W6XUi168+n23fIUjBzqs3mIwpOCcOs=;
        b=EOBilblgCupMxUSNPm8aTBvzKjqHrK+QtQ7E3/YvMckXv8R9XuUXjFMD5WqRamCrvf
         Qh2dWGC98bhfwkcInUExxGFDclawBBPRPtC+uY39HzTufOowEOitL8e2fUr1NUsDW151
         DL21YWg1cLDWKJ7+5/SmRFtZzxtGdP/wPE2IPaRV3reHvyzYSKNVdwTzkID1hDYftjbJ
         WF9+t2SAnD8bF8PuSg4mT5BQCl4G9oehZUCDPGhaybbsgAWJjDFyhTY0LXODMge2T5EG
         UE3SsMKv8KCBsl1WGmUAbT6r4PL7KiGFgGRmVQ46Fe90wIl73U8WLiVSOtFXBEfvOIuU
         C4Uw==
X-Gm-Message-State: AO0yUKXoMYlQ8c7Jj45P9YOU82xenAj3qODo+CUDEIh+NxLsvKKLGsJA
        hiJP3ylFLU25zWHRgkFr/qBNo1PuFob9VA==
X-Google-Smtp-Source: AK7set+B5TEL0ri+FKC2s2pWlzDyssvQiH2QSUixdbBLPlKuGZhyYE6QBwap+8jibYbp1jfwURZ6dw==
X-Received: by 2002:a17:902:ea07:b0:19a:9580:74c with SMTP id s7-20020a170902ea0700b0019a9580074cmr14559721plg.7.1677206819358;
        Thu, 23 Feb 2023 18:46:59 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902d38400b0019602274208sm10713447pld.186.2023.02.23.18.46.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Feb 2023 18:46:58 -0800 (PST)
Subject: Re: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if
 PC not in exception table
To:     Eero Tamminen <oak@helsinkinet.fi>, linux-m68k@vger.kernel.org,
        geert@linux-m68k.org
References: <20230222195021.6683-1-schmitzmic@gmail.com>
 <2f051c9f-4563-6f0c-c0f6-efc349731ea3@helsinkinet.fi>
Cc:     Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <251d3656-5a2f-2987-2c40-e3730817f7a8@gmail.com>
Date:   Fri, 24 Feb 2023 15:46:52 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <2f051c9f-4563-6f0c-c0f6-efc349731ea3@helsinkinet.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks Eero,

I'll add your Tested-by (and Reported-by; sorry to have forgotten that) 
in v2.

Cheers,

	Michael


Am 24.02.2023 um 13:31 schrieb Eero Tamminen:
> Hi Michael,
>
> On 22.2.2023 21.50, Michael Schmitz wrote:
>> __get_kernel_nofault() does copy data in supervisor mode when
>> forcing a task backtrace dump through the sysrq trigger.
>>
>> Our 030 bus error handler is ill equipped to deal with this:
>>
>> Whenever ssw indicates a kernel mode access on a data fault,
>> we don't even attempt to handle the fault and instead send
>> a bus error signal (or panic). As a result, the check for
>> exception handling at the fault PC (buried in send_sig_fault()
>> which gets called from do_page_fault() eventually) is never
>> used.
>>
>> Both 040 and 060 access error handlers do not care whether
>> a fault happened on supervisor mode access, and will call
>> do_page_fault() even on those.
>>
>> Add a check in bus_error030 to call do_page_fault() in case
>> we do have an entry for the fault PC in our exception table.
>>
>> Tested on 030 Atari Falcon.
>
>
> I've verified that the kernel Oops was there with unpatched kernel, and
> this fixes it, also when using Hatari emulator 030 / Atari Falcon
> emulation.
>
> (Verified both with both v6.0 & v6.2 of Linus' kernel sources.)
>
>
>     - Eero
>
>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com># Please enter
>> the commit message for your changes. Lines starting
>> CC: Eero Tamminen <oak@helsinkinet.fi>
>> CC: Finn Thain <ftain@linux-m68k.org>
>> CC: Andreas Schwab <schwab@linux-m68k.org>
>> CC: Geert Uytterhoeven <geert@linux-m68k.org>
>> Link:
>> https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi
>>
>> ---
>>   arch/m68k/kernel/traps.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/m68k/kernel/traps.c b/arch/m68k/kernel/traps.c
>> index 5c8cba0efc63..67576fb0c466 100644
>> --- a/arch/m68k/kernel/traps.c
>> +++ b/arch/m68k/kernel/traps.c
>> @@ -30,6 +30,7 @@
>>   #include <linux/init.h>
>>   #include <linux/ptrace.h>
>>   #include <linux/kallsyms.h>
>> +#include <linux/extable.h>
>>     #include <asm/setup.h>
>>   #include <asm/fpu.h>
>> @@ -545,7 +546,7 @@ static inline void bus_error030 (struct frame *fp)
>>               errorcode |= 2;
>>             if (mmusr & (MMU_I | MMU_WP)) {
>> -            if (ssw & 4) {
>> +            if (ssw & 4 && !search_exception_tables(fp->ptregs.pc)) {
>>                   pr_err("Data %s fault at %#010lx in %s (pc=%#lx)\n",
>>                          ssw & RW ? "read" : "write",
>>                          fp->un.fmtb.daddr,
