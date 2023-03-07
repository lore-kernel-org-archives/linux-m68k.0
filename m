Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B27C61DA4
	for <linux-m68k@archiver.kernel.org>; Tue,  7 Mar 2023 00:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjCGA2V (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Mar 2023 19:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbjCGA2T (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 6 Mar 2023 19:28:19 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC835FD7
        for <linux-m68k@vger.kernel.org>; Mon,  6 Mar 2023 16:28:10 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id a9so12384876plh.11
        for <linux-m68k@vger.kernel.org>; Mon, 06 Mar 2023 16:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678148889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbQx2cBIFdXIRV7X0J0wOtiDLl3f585/Nj8mDeVP0l4=;
        b=BAEPSitvf1C4Ox54O0h6wwLLbIpb1LHG5L6Gc8wPLiAa/gl2RbmdRlMXN3bJ8pmj9y
         3vUUGuRD54aC88kt7IsbwjPRlFes0BZMZX7AwqjjXn4kOAPVphGvyd5h27CJi5sWHs9x
         yCvmqYQPV06wyGsICSAVCtcNhqxHpk4eozbtGoeH7+nF3KvbATauqCkFEJ+rd/D/AH1Y
         hAfZpApb5I1+SxlulEsP6zGIaUOyFq4n+ju5gNqcGLnRFzYr4xTCet5QdQlrP1vuVF4/
         vJpj8Eo79OPyXa5FVqTeYdXakumRoZpxsDD+ZbtatieidbUolxAWk+h5ce8kR2JtGniR
         /OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678148889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbQx2cBIFdXIRV7X0J0wOtiDLl3f585/Nj8mDeVP0l4=;
        b=kniz/7knKDkB+VwAZhsBfPgi74SQc++uU3MH7ti4wEfHRDPqecgQulmgMl7b/MOdgc
         ayRqdkWnpA52dZl/4lbA2dBKhSyXybuQzYQY1NRvfBe6vr8+1hEhtE0LS/i4Mpq9h0Vp
         qb9uwvPH+pzG7XbeqHCw0/cmeiC6OVtvSj2a2QK067CcValBCIRFpOXV5bvIT9g05N74
         HW1GT1pHZR1Yfe2UmyYhp9qV9KOHTXzh8BgYyVPbse/TgTEcN148GFvG8ivn211CEi5I
         9xv0Ui1FpeqLl5cwU0hqryGEp14p8ENf/il9C/RJjOlf88mqIwsdRbxeNFGmgtuIHbyR
         5y3Q==
X-Gm-Message-State: AO0yUKWwRaroMz+PrYQhxDuFJkDuF3eDk1ClV+MtlX3P1yMmkUxcYttn
        IL58P2g3p6QcAPdRZrmLx+dVBaiy6gU=
X-Google-Smtp-Source: AK7set/rXQ9IBtgaIHzCZJSMwD+0bwhb4o2+0MpaJet4JHsJOrTzX/rYlCkHr394cYHyH5yR9z8A1g==
X-Received: by 2002:a17:903:1d2:b0:19c:be07:4af2 with SMTP id e18-20020a17090301d200b0019cbe074af2mr16716685plh.45.1678148889516;
        Mon, 06 Mar 2023 16:28:09 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:30b0:fa2a:478a:23d8? ([2001:df0:0:200c:30b0:fa2a:478a:23d8])
        by smtp.gmail.com with ESMTPSA id ks12-20020a170903084c00b001933b4b1a49sm7237052plb.183.2023.03.06.16.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 16:28:09 -0800 (PST)
Message-ID: <e02f3388-461c-27ac-b305-2a63ae144a48@gmail.com>
Date:   Tue, 7 Mar 2023 13:28:04 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] m68k: kernel/traps.c - only force 030 bus error if PC
 not in exception table
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <fthain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <20230301021107.26307-1-schmitzmic@gmail.com>
 <CAMuHMdVP=cNZKZcurO8V1UrNTUgookaWnmPr02+Wv9vxKX-b6Q@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdVP=cNZKZcurO8V1UrNTUgookaWnmPr02+Wv9vxKX-b6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 7/03/23 02:03, Geert Uytterhoeven wrote:
> On Wed, Mar 1, 2023 at 3:13 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> __get_kernel_nofault() does copy data in supervisor mode when
>> forcing a task backtrace log through /proc/sysrq_trigger.
>> This is expected cause a bus error exception on e.g. NULL
>> pointer dereferencing when logging a kernel task has no
>> workqueue associated. This bus error ought to be ignored.
>>
>> Our 030 bus error handler is ill equipped to deal with this:
>>
>> Whenever ssw indicates a kernel mode access on a data fault,
>> we don't even attempt to handle the fault and instead always
>> send a SEGV signal (or panic). As a result, the check
>> for exception handling at the fault PC (buried in
>> send_sig_fault() which gets called from do_page_fault()
>> eventually) is never used.
>>
>> In contrast, both 040 and 060 access error handlers do not
>> care whether a fault happened on supervisor mode access,
>> and will call do_page_fault() on those, ultimately honoring
>> the exception table.
>>
>> Add a check in bus_error030 to call do_page_fault() in case
>> we do have an entry for the fault PC in our exception table.
>>
>> I had attempted a fix for this earlier in 2019 that did rely
>> on testing pagefault_disabled() (see link below) to achieve
>> the same thing, but this patch should be more generic.
>>
>> Tested on 030 Atari Falcon.
>>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>> Reported-by: Eero Tamminen <oak@helsinkinet.fi>
>> CC: Eero Tamminen <oak@helsinkinet.fi>
>> CC: Finn Thain <fthain@linux-m68k.org>
>> CC: Andreas Schwab <schwab@linux-m68k.org>
>> CC: Geert Uytterhoeven <geert@linux-m68k.org>
>> Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
>> Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
>> --
>>
>> Changes from v1:
>>
>> - add comment
>> - reword commit message
>> - add link to old patch as well (stick to lore.kernel.org
>>    even though these links are currently not functional)
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> i.e. will queue as a fix in the m68k for-v6.3 branch.

Thanks - I neglected to search far enough back to find where the context 
of this diff originates, but upon a closer look, it appears to be the 
well-known commit 1da177e4c3f4 (start of git history). Do you think this 
is worth a backport to stable?

Cheers,

     Michael

> Gr{oetje,eeting}s,
>
>                          Geert
>
