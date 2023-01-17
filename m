Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AA8C00A5A
	for <linux-m68k@archiver.kernel.org>; Wed, 18 Jan 2023 00:10:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjARAKg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 17 Jan 2023 19:10:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjARAKQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 17 Jan 2023 19:10:16 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41F3F234CC
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jan 2023 15:25:47 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id z3so541739pfb.2
        for <linux-m68k@vger.kernel.org>; Tue, 17 Jan 2023 15:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+YrCgSjDGGC2azNPNa1XAM9BW1N3ytJT2FCMIjlgks=;
        b=HS0dYKMIKrmEa2qMmfNfofLqepNhkEgCjCpdZ/HAZERHrgtP5hjruIvRqSpdS04xB8
         euMpj3kz0sqUFzctw7Yde7Ir35wIK5JOnvG4H/6ybM7lwftATLiT6HMaldXZHJ+WNNsd
         j6Rb/2ZSCqtRFFc3P7x+zolN4WD5ezXjs2J5PbvYgLGrZPf2U9t/TUegYOLM5oY+nUIB
         bnJN9hxgUMhQ03zwtBMj/j9vQlRJH6cBu/sFsocQ6xPDAfdJsPJBwgz33RpwSPQ2X4Op
         2OKVQrMQ6E9ianZ/6xuS2CSPSblIDvdx0eL/iSWtTksGfxQijmWBKQYUNSpp19TCP8ol
         cAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+YrCgSjDGGC2azNPNa1XAM9BW1N3ytJT2FCMIjlgks=;
        b=14crk60W1NiEnyyeQA2amQHp106a3OWNq4QTpkds5NG61qhGAdp/uwGg7rM8oVKUv8
         NGCx83vYMShSjd7q4wrwmGq2AlxR+q+phkUx0V/65N+DtPknVPz1vEYLTWCSuOmQC02s
         1SCPLO0YHVZw82ohRX+Y8FhHShsHdfdmIMW5ChL5K4oWMV/7HDdB+PgyLN22blFk8fYo
         YAbwVgY15b4XfKYjO9oqmvabApAb+bptAA571HXr/Sl/QofFZKw810EWYYTJgIO3bTPX
         zZI1npX63Yupvvo0yx5ePE68Z6br8mHbevhJgnvl0Cu6f8X+ZOJZywf0eaUFi5EqNvLh
         SUKw==
X-Gm-Message-State: AFqh2kpPdC9A6xZqMkMKG94RkfTET15012p0Dke6oCKhmd66e0QcuiuC
        4hpKhs9+YkxGn0dRBv/gHUZdeUjnedI=
X-Google-Smtp-Source: AMrXdXsE/YhjMvg9QGCl0AXuz+bTgloAZBseI6OYXk4R4+zFlBwJsWFlsauAAUOeuXv/eM+9Jk3ZPA==
X-Received: by 2002:a05:6a00:4291:b0:573:f869:2115 with SMTP id bx17-20020a056a00429100b00573f8692115mr5446362pfb.9.1673997946800;
        Tue, 17 Jan 2023 15:25:46 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:42d:d91a:dc2:f631? ([2001:df0:0:200c:42d:d91a:dc2:f631])
        by smtp.gmail.com with ESMTPSA id g26-20020aa796ba000000b005891c98e1aasm16101080pfk.119.2023.01.17.15.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 15:25:46 -0800 (PST)
Message-ID: <739413f9-0425-59d9-b6a5-fe225f56cf78@gmail.com>
Date:   Wed, 18 Jan 2023 12:25:41 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v13 0/3] Add kernel seccomp support for m68k
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     linux-m68k@vger.kernel.org, geert@linux-m68k.org,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>
References: <20230112035529.13521-1-schmitzmic@gmail.com>
 <0687610a-0efd-51f5-110d-fad0de113556@physik.fu-berlin.de>
 <38518fa1-a584-6e9e-5160-a6922730e8f5@gmail.com>
 <6eab0d17-8928-212b-740c-6db249f79838@physik.fu-berlin.de>
 <10371c02-c54b-fa3e-2729-12d524685652@gmail.com>
 <e5e6d22a-fafc-9535-4682-a957286ce38d@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <e5e6d22a-fafc-9535-4682-a957286ce38d@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,


On 17/01/23 21:08, John Paul Adrian Glaubitz wrote:
> Hi Michael!
>
> On 1/17/23 03:15, Michael Schmitz wrote:
>>>> That one also exists on alpha and sparc. The other two are indeed
>>>> unique to m68k.
>>>>
>>>> There must have been other cases of novel syscalls added to libseccomp
>>>> before?
>>>
>>> Neither alpha nor sparc are supported by libseccomp, so I think that's
>>> not an argument.
>>
>> Explains why getpagesize still is not handled by libseccomp, then.
>>
>> Now do any of the other architectures recently added to libseccomp 
>> have non-standard
>> syscalls? (Trying to work out what commits might hold the secret to 
>> adding support for
>> new syscalls...)
>
> This interactive arch-wide chart table should be helpful for finding 
> this out:
>
>> https://marcin.juszkiewicz.com.pl/download/tables/syscalls.html

Look at include/seccomp-syscalls.h - I'd add the missing syscalls after 
this one:

#define __PNR_memfd_secret                      -10244

(pseudo syscall numbers for the other architectures)

plus appropriate boilerplate such as this:

#ifdef __NR_memfd_secret
#define __SNR_memfd_secret              __NR_memfd_secret
#else
#define __SNR_memfd_secret              __PNR_memfd_secret
#endif

(actual syscall numbers from our arch/m68k/include/uapi/asm/unistd-32.h 
used).

Just looked at the source, didn't try to build anything so I may be 
missing something crucial here...

Cheers,

     Michael


>
> Adrian
>
