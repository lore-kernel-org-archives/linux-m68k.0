Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EF1C46467
	for <linux-m68k@archiver.kernel.org>; Tue, 17 Jan 2023 02:16:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233746AbjAQCQP (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 16 Jan 2023 21:16:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbjAQCQN (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Jan 2023 21:16:13 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB81C2331B
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jan 2023 18:16:12 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id k12so9986971plk.0
        for <linux-m68k@vger.kernel.org>; Mon, 16 Jan 2023 18:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izGz6pAJ9apCUcUIVpq2dFKgG4tsV4+qAHgJHWpXuV0=;
        b=Khd9H/iUiMyYFiUsj737mty3iDjC9M0YH9UF8+hXrZiNOYHrs403g73V4m6YmsYTyj
         w3aMvaOODAinKSfZFrEAcuILMS5CaK/UwvZqxjPbZHIOToBu6YZ3hG9q2pionJ+HIbKf
         wYhVlb5gco/LNlfn77SxfUGQCvjI72fX7M/29yomCB2GBqNjFwT4y6q3hsQNg032ESvK
         H8d6Yl/nwQRv4C6RZHvwGBT3vW9/4eIN6eF982XaRjXmaLUyhRP35JMbx2bcbB/tbipI
         a0KscSBr5w428q4FuUXKTCz/sb4uxzed8Zyg9PCRMS6mdUK9jaCIreMTEB0IQvaBsHdO
         ENcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=izGz6pAJ9apCUcUIVpq2dFKgG4tsV4+qAHgJHWpXuV0=;
        b=filBhn1zKXcbqQ6qS1Sg6rCt/hmAeEpndr/mp1DczE3NhTw1tOKlEplTYb2znCHtBc
         9mV6D4gOXf6OjrvbrRz2HZ69Ym4BirPgs+SX9A069g/s1dWtVqzIiVF9+mldPACZ4fxt
         odYUcq9HbMsScCBO1N1Nhi3DQkFlGZp4QDjz5XsxksiBTy6YZ8sOXQTJW9L8oYkjNbMj
         G+VOpRStsxfivA/HRwiXMx/CNEayzlmReDUSqtc664Jfo+FhyxmzbLWi3z0yfwQ9lOOy
         LPFr6LhGG56kcY0Sv3aC+mLM+ZlPPHfWc21GY2M20S+rxiBpQzK4y24Xoon2MNetxPAx
         m0vw==
X-Gm-Message-State: AFqh2krs+35/Mzjh0d7mfYLMGxq9uGnRUppcAqFAk4my+Fdjw3BBoRGZ
        kiSudzTppJ/5XpzyaWsHOZQ/qsSG7Jw=
X-Google-Smtp-Source: AMrXdXs4a0LpxCU8k+brMzKoYEIhjXAMSVh8IMa5WiWX6NM42c7CE6iargdrY/AH4/6U8BK8WGO60A==
X-Received: by 2002:a17:902:e805:b0:194:a372:d904 with SMTP id u5-20020a170902e80500b00194a372d904mr2586537plg.17.1673921772207;
        Mon, 16 Jan 2023 18:16:12 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id w19-20020a170902a71300b0019339f3368asm3447852plq.3.2023.01.16.18.16.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Jan 2023 18:16:11 -0800 (PST)
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
 <38518fa1-a584-6e9e-5160-a6922730e8f5@gmail.com>
 <6eab0d17-8928-212b-740c-6db249f79838@physik.fu-berlin.de>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <10371c02-c54b-fa3e-2729-12d524685652@gmail.com>
Date:   Tue, 17 Jan 2023 15:15:56 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <6eab0d17-8928-212b-740c-6db249f79838@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

Am 16.01.2023 um 22:12 schrieb John Paul Adrian Glaubitz:
> Hi Michael!
>
> On 1/14/23 01:00, Michael Schmitz wrote:
>>> Unfortunately, libseccomp fails to build after I updated the
>>> syscalls.csv file
>>> after adding m68k support. It seems that the problem are a number of
>>> syscalls
>>> that exist on m68k only:
>>>
>>>   CC       libseccomp_la-syscalls.perf.lo
>>> syscalls.perf:152:70: error: '__PNR_getpagesize' undeclared here (not in
>>> a function)
>>>   152 |
>>> getpagesize,119,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,166,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF,__PNR_getpagesize,SCMP_KV_UNDEF
>>>
>>
>> That one also exists on alpha and sparc. The other two are indeed
>> unique to m68k.
>>
>> There must have been other cases of novel syscalls added to libseccomp
>> before?
>
> Neither alpha nor sparc are supported by libseccomp, so I think that's
> not an argument.

Explains why getpagesize still is not handled by libseccomp, then.

Now do any of the other architectures recently added to libseccomp have 
non-standard syscalls? (Trying to work out what commits might hold the 
secret to adding support for new syscalls...)

Cheers,

	Michael

>
> Adrian
>
