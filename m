Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B6FC11F66
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Jun 2021 07:46:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 467A361D4D
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Jun 2021 07:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232272AbhF2Hso (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Jun 2021 03:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbhF2Hsm (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Jun 2021 03:48:42 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310CCC061574
        for <linux-m68k@vger.kernel.org>; Tue, 29 Jun 2021 00:46:15 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id d12so17725593pgd.9
        for <linux-m68k@vger.kernel.org>; Tue, 29 Jun 2021 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=njDOyDwa2GCaqf/HhNgL473rNYPz4VAPuXZzGIZrcdk=;
        b=WpRsBbA1SzSVWPD0GUMLOi/SQowS7boMCKN5Qw3a1dSQUmJnMcPEkwf4RqEAllfL6u
         KtwbqFZqDvxU2FyQI+MKMWeXTrOKwRx4d+ku0RHgimU68QkmNo9mocEC2nP646ytVu37
         P8GM7DkXBGODI/HvDlIHR32qJTCJvOcpaTBMdseVboP/G3V2thzIh+CMs/R+n4j6/w88
         uzuiehgLNtUud7vuxEYM8tXdlqqjUDkEKYKF8h8ixg2MeS94hun0kRQHPqBmSZf7+N8X
         X9XIOzsrFs2KbEvuaSHD9R4rhl1RlIzJ5dIrf3aidOurlbCRVhKmFBxCTciMy7uxlPBv
         OYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=njDOyDwa2GCaqf/HhNgL473rNYPz4VAPuXZzGIZrcdk=;
        b=d+VJ18H6rUm7+sPYyhp5DNAovXZexfB8PkJaNOrC52Ip7RP7pERMmebBNmBGj8Yaqz
         i/PzEjSy93mq8wABEf7dIkcamxHKttrxTKFUjJCx0NYGF9ZUAFACw8H+WVZnqN059x2O
         rq3NVlygDfa2SK2IFxXftWcqDh5lT3TOwZOEqOsKqRiJdpWS/89jeaFsnnrcqGx3rB1B
         HrIsC5jciI3nB5qbKooRmMV8UIYL3/fvyK4L4ZZwzXibjuK/Bm5b3c1eHwGV5KZWIRJu
         9ADCi6OvRU9K9059/KYHbVR6+Fpz8HV+hmYVGEteUSlAjbXciy0mO9zqeUfKYvfVSwKZ
         ++kw==
X-Gm-Message-State: AOAM532A/Chglm+72zjuuNuZbiW1X48Be66GWGtJseR8OZ87VETSBeLs
        Xsd+ExKaFYEZjuUpBPhHy6gR7MRTw9dGwA==
X-Google-Smtp-Source: ABdhPJx1S+zxCPuo2O1i2yR5D1IWL8c4Ryqpwx+5KXYnG9816a4knalTFsKihxPKzNLkN6xtd5EyWA==
X-Received: by 2002:a62:3814:0:b029:30d:e2c8:7a27 with SMTP id f20-20020a6238140000b029030de2c87a27mr4285656pfa.54.1624952774726;
        Tue, 29 Jun 2021 00:46:14 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id 30sm14977177pgz.45.2021.06.29.00.46.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Jun 2021 00:46:14 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] m68k/kernel - wire up syscall_trace_enter/leave
 for m68k
To:     Greg Ungerer <gerg@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
 <1624495560-6351-2-git-send-email-schmitzmic@gmail.com>
 <CAMuHMdWoX=6Yf7MZXR92Q3APYixY5MDM6MW_UUf0DO2+oDkHAQ@mail.gmail.com>
 <aeac601a-a6ff-678b-83dc-48dacb430ec3@gmail.com>
 <CAMuHMdXJMuCGv7O8oPLG9YL-VZPzs5ZrrJU769Ks8YRh14c+FA@mail.gmail.com>
 <23eb0e8f-a9d1-24b5-2d97-3dbcbd2bfaaa@linux-m68k.org>
Cc:     Linux/m68k <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <90b05a3c-47af-c89e-860d-ac0d20edbac0@gmail.com>
Date:   Tue, 29 Jun 2021 19:46:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <23eb0e8f-a9d1-24b5-2d97-3dbcbd2bfaaa@linux-m68k.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert, Greg,

no matter - I managed to at least get entry.S to 'compile' for 68000, 
even though the final link failed.

I'm reasonably certain that 'ret_from_exception' is the correct branch 
target if a syscall is to be skipped, but I'd like to have that double 
checked?

Cheers,

	Michael

Am 29.06.2021 um 19:35 schrieb Greg Ungerer:
> Hi Michael, Geert,
>
> On 29/6/21 5:31 pm, Geert Uytterhoeven wrote:
>> Hi Michael,
>>
>> On Tue, Jun 29, 2021 at 12:16 AM Michael Schmitz
>> <schmitzmic@gmail.com> wrote:
>>> On 28/06/21 7:25 pm, Geert Uytterhoeven wrote:
>>>> On Thu, Jun 24, 2021 at 2:46 AM Michael Schmitz
>>>> <schmitzmic@gmail.com> wrote:
>>>>> m68k (other than Coldfire) uses syscall_trace for both trace entry
>>>>> and trace exit. Seccomp support requires separate entry points for
>>>>> trace entry and exit which are already provided for Coldfire.
>>>>>
>>>>> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
>>>>> in preparation for seccomp support. Check return code of
>>>>> syscall_trace_enter(), and skip syscall if -1. Return code will be
>>>>> left at what had been set by ptrace or seccomp (in regs->d0).
>>>>>
>>>>> No regression seen in testing with strace on ARAnyM.
>>>>>
>>>>> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
>>>> b
>>>> Thanks for your patch!
>>>>
>>>>>    arch/m68k/kernel/entry.S  |  8 +++++---
>>>> We need similar changes to arch/m68k/68000/entry.S and
>>>> arch/m68k/coldfire/entry.S
>>>
>>> Do you have a current defconfig for 68000? I've test compiled my patch
>>> with two coldfire defconfigs, but could not find one for m68kclassic ...
>>
>> Unfortunately not.
>> Greg?
>
> Sorry, no, I don't have one.
> Whenever I need to compile for a 68000 target I manually configure one
> ("make menuconfig" and friends).
>
> Would be nice to have one in mainline ;-)
>
> Regards
> Greg
>
