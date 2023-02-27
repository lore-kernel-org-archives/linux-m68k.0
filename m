Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345BAC64ED6
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 23:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbjB0X2P (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 27 Feb 2023 18:28:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjB0X2O (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 27 Feb 2023 18:28:14 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0088F10400
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 15:28:12 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id m3-20020a17090ade0300b00229eec90a7fso343949pjv.0
        for <linux-m68k@vger.kernel.org>; Mon, 27 Feb 2023 15:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677540492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7FhREM3K/nJSbKnHwJG8uMCpKm+kSskvdHGLr2mMihI=;
        b=fUkvmwHyq54vpy3dkss6Mh7D2QZBK7avv2dVpl6mtDM4986DQzo7N8F+V7iydO8NwY
         RL6KKo8UD9Cqdb/l1Vw3ZlsmxPTemf//KjwpS0vNtdmEQseVSmM9ouoM1m7Vqmo6/JaP
         Eg3wUDjje/3XGWy4QskGmbWefPK3GWIQ6+EaPrdxtfJwwITJIJauXlNFSw99SbzTB2/A
         Fh0AkK1k9/m4O9WOP2sKjRifypD9RE2ng5hKru4yGxNoGfh/oC1aVTIcXvAmCbni01ck
         WvxNV+2jgh0kdkTFuEZjjpaasGFguL0E+dMQoimQ/jaK5rGX++LEnKE2tI739Xb7KE6L
         3RyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677540492;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FhREM3K/nJSbKnHwJG8uMCpKm+kSskvdHGLr2mMihI=;
        b=1f1v6AXXlkFaKwK0BKo82IZw3dIoPY/hvFOSmbI2h2FGzLiDy/tqnOtyl64ZZyMeYr
         ZQdNl/k3GKp+GZAvkzSXZrjBZxottLYJ/AnylGdJq5Rs4wHiLMMHrkIk53SAjLoBIzJ5
         qZXgJGAwL1V61606RHcvqwdHnuFT5c2vEB7ONYMIV/byQFZQLCIL5+dphWxH6Wtdrurl
         AERWyvb6H7/DdWdugT1/pjtkpyHBZx2/Z0x6Xq18qkK34DGCTRXrJ83tSDOwSf80GfaE
         Cs1jcY1Ri6skN2jXT38qbk32NlUDROIvcL/KR6KZDgNbb9a1nimJwZy0NfQ27vojuE2S
         oEpg==
X-Gm-Message-State: AO0yUKWGrsncJL1Upvp3CJvNStLuALY7sbBNXmZKDDubXwqNpr47BdbC
        nJy/1B3N4EP5pkeD02zQo4xdJlpxg+k=
X-Google-Smtp-Source: AK7set9lNVQrDf3TQQ4htfyI/gnBxzzdzJbcSk1DBahFyeqfOm9nVVfwiw2BXB1IZ8e3Vxx16CvfQg==
X-Received: by 2002:a17:90b:1c05:b0:234:3b63:d4c0 with SMTP id oc5-20020a17090b1c0500b002343b63d4c0mr1107268pjb.2.1677540492413;
        Mon, 27 Feb 2023 15:28:12 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:8061:ae59:3388:46ca? ([2001:df0:0:200c:8061:ae59:3388:46ca])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090a868900b002340b2c62e7sm6590238pjn.55.2023.02.27.15.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 15:28:11 -0800 (PST)
Message-ID: <f716ab75-1523-db03-1615-41ec1b9ae6cf@gmail.com>
Date:   Tue, 28 Feb 2023 12:28:07 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if
 PC not in exception table
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
References: <20230222195021.6683-1-schmitzmic@gmail.com>
 <CAMuHMdWm9yJaHGF-EGVmn69iKXLAh3G9PZer6WJUi-ZJPHDRJQ@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <CAMuHMdWm9yJaHGF-EGVmn69iKXLAh3G9PZer6WJUi-ZJPHDRJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

thanks for your feedback!

On 28/02/23 09:19, Geert Uytterhoeven wrote:
> Hi Michael,
>
> On Wed, Feb 22, 2023 at 8:52 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
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
> Thanks for your patch!
>
>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com># Please enter the commit message for your changes. Lines starting
> Please remove the comment ;-)

Done that already for v2.

>
>> CC: Eero Tamminen <oak@helsinkinet.fi>
>> CC: Finn Thain <ftain@linux-m68k.org>
>> CC: Andreas Schwab <schwab@linux-m68k.org>
>> CC: Geert Uytterhoeven <geert@linux-m68k.org>
>> Link: https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi
> 404
>
> I assume that a message from debian-68k?

No, oddly enough that is a message that I have received with CC to 
linux-m68k (but not from vger!). And mail-archive.com has it:

https://www.mail-archive.com/linux-m68k@vger.kernel.org/msg13081.html

And also on marc.info:

https://marc.info/?l=linux-m68k&m=155477039405576&w=2

Later one with an experimental patch of mine:

https://marc.info/?l=linux-m68k&m=155494864731013&w=2

None of these messages show up on a search of lore...

What source do you prefer - marc.info or mail-archive.com?

Cheers,

     Michael


> Do you have a https://lists.debian.org/debian-68k/ link?
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
