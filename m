Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28652C678D5
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Mar 2023 18:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCHSQE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Mar 2023 13:16:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjCHSQB (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Mar 2023 13:16:01 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8580DCF987
        for <linux-m68k@vger.kernel.org>; Wed,  8 Mar 2023 10:15:42 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso2546369pju.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Mar 2023 10:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678299342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tPPshpOVX4y9NOpbwy4hWsVAwKzByZRgGHhCRnkW3vk=;
        b=ek4guvUnE6V70zZOuQyPEAup1BoHfAjlSDZV7uShI6Mv79w7sGcqN54F9eus7SC+UU
         9Zmq7JSzZcpEHCuqAf5Pe5UrpsOnrBY3yyD8x/ynj0few0AP5QawnNT3Mep6j8Pz+Vwo
         6o9Ap529AhZazsNcdLWAq+M8+GaqxbTDkWIogKrgmPvrTlLhqLUGMRVGWzEwkgMyuYtu
         WOQfw9BBV3utXDwSmhoUnmA6yqbqXc5fg45KNqLkDgsBBloF2QvMA0oq8Haxm2NhnZ1W
         92FWNZ3xjVQ+y8o4Y8khW2IotE3GxXSACkS+Zhey0L+R6nLIr1FFwZM+wtc+dWhzzkvW
         IRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678299342;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tPPshpOVX4y9NOpbwy4hWsVAwKzByZRgGHhCRnkW3vk=;
        b=RqQKDEXArETjLjjQ4YjV+cur2oyoPOJIy2DCW1iTQgK6WJ0qBZ2LX1Dq2UmtE/sio3
         eZ33u5H0232GcuK75yEo4eWNEiXEPKimgVkG3VVaXsgHVMjQHmBO+hvcW9yMZGirSFvM
         Wi+sVkPDl4Yr9CAO143rwpwwHYreSXzLFUTAEKqZL+9YGA2si1p3QDhlIenwycDicjdT
         dN0gUxRHmSE/0uKqs8nd4uhJMbhD9FZwXb2HslLdeeOUFmtN7ZR0vzTR1F/LtFDZsUJX
         Qu/4m56VlPkNqjbTIvk+KyzRC84Pqz1GJtNA/3ZogNPHtGCi5WKdyftASHdKA2ETarAf
         8MrQ==
X-Gm-Message-State: AO0yUKWDcPzZ5RVud0yIcCjD600aaT22/9rRA4kWtTioe9x+2XNIZetL
        tMOBnkDNzGBZRam1S+jb+rL1WnZELbk=
X-Google-Smtp-Source: AK7set/RQU1foly0XXn131d187tBfv+WQYQ7qf267zjiJaL3oVJHzhjr9CUJJx0jYedonV6CB5l1Tg==
X-Received: by 2002:a17:902:e549:b0:19e:76c4:2d30 with SMTP id n9-20020a170902e54900b0019e76c42d30mr24812568plf.61.1678299341845;
        Wed, 08 Mar 2023 10:15:41 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:69d2:81f8:ea65:418d? ([2001:df0:0:200c:69d2:81f8:ea65:418d])
        by smtp.gmail.com with ESMTPSA id jd4-20020a170903260400b0019a6f32e6c1sm10094084plb.148.2023.03.08.10.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:15:41 -0800 (PST)
Message-ID: <fb6ef993-4698-a25d-88df-62a858f78744@gmail.com>
Date:   Thu, 9 Mar 2023 07:15:35 +1300
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
 <e02f3388-461c-27ac-b305-2a63ae144a48@gmail.com>
 <CAMuHMdWLgQprQDfEavB+wmzLw2PFOZ2uz3Ucm1BxBfhyJvOifA@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWLgQprQDfEavB+wmzLw2PFOZ2uz3Ucm1BxBfhyJvOifA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

On 7/03/23 20:44, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Tue, Mar 7, 2023 at 1:28 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> On 7/03/23 02:03, Geert Uytterhoeven wrote:
>>> On Wed, Mar 1, 2023 at 3:13 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>>> __get_kernel_nofault() does copy data in supervisor mode when
>>>> forcing a task backtrace log through /proc/sysrq_trigger.
>>>> This is expected cause a bus error exception on e.g. NULL
>>>> pointer dereferencing when logging a kernel task has no
>>>> workqueue associated. This bus error ought to be ignored.
>>>>
>>>> Our 030 bus error handler is ill equipped to deal with this:
>>>>
>>>> Whenever ssw indicates a kernel mode access on a data fault,
>>>> we don't even attempt to handle the fault and instead always
>>>> send a SEGV signal (or panic). As a result, the check
>>>> for exception handling at the fault PC (buried in
>>>> send_sig_fault() which gets called from do_page_fault()
>>>> eventually) is never used.
>>>>
>>>> In contrast, both 040 and 060 access error handlers do not
>>>> care whether a fault happened on supervisor mode access,
>>>> and will call do_page_fault() on those, ultimately honoring
>>>> the exception table.
>>>>
>>>> Add a check in bus_error030 to call do_page_fault() in case
>>>> we do have an entry for the fault PC in our exception table.
>>>>
>>>> I had attempted a fix for this earlier in 2019 that did rely
>>>> on testing pagefault_disabled() (see link below) to achieve
>>>> the same thing, but this patch should be more generic.
>>>>
>>>> Tested on 030 Atari Falcon.
>>>>
>>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>>> Reported-by: Eero Tamminen <oak@helsinkinet.fi>
>>>> CC: Eero Tamminen <oak@helsinkinet.fi>
>>>> CC: Finn Thain <fthain@linux-m68k.org>
>>>> CC: Andreas Schwab <schwab@linux-m68k.org>
>>>> CC: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Link: https://lore.kernel.org/r/alpine.LNX.2.21.1904091023540.25@nippy.intranet
>>>> Link: https://lore.kernel.org/r/63130691-1984-c423-c1f2-73bfd8d3dcd3@gmail.com
>>>> --
>>>>
>>>> Changes from v1:
>>>>
>>>> - add comment
>>>> - reword commit message
>>>> - add link to old patch as well (stick to lore.kernel.org
>>>>     even though these links are currently not functional)
>>> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>> i.e. will queue as a fix in the m68k for-v6.3 branch.
>> Thanks - I neglected to search far enough back to find where the context
>> of this diff originates, but upon a closer look, it appears to be the
>> well-known commit 1da177e4c3f4 (start of git history). Do you think this
>> is worth a backport to stable?
> I guess it will be auto-backported to stable once it has reached
> upstream, together with the two other fixes.

Fair enough - I'll check in a month or so and remind the stable 
maintainers if need be.

Cheers,

     Michael


>
> Gr{oetje,eeting}s,
>
>                          Geert
>
