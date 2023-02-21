Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9175C61DA3
	for <linux-m68k@archiver.kernel.org>; Tue, 21 Feb 2023 21:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbjBUVJt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 16:09:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBUVJs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 16:09:48 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72F062129E
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 13:09:47 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id s15so1779182pfg.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 13:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vr2KPZ9qoqfM5AcGzo/i5Z1EoxggHrKaTcs+pHDXosM=;
        b=dvkXdrliTII5PBZNQ0GEyGUHx9IJU3/X4WLDaaVdcO77gvP+MrlFtny/aO2gXOjnLu
         3B2N4Og0D5rKOvggspdKR4olwafGUiTxMliqVzSDIaaDrtgCcNFwnMDF/1W34l7QUij1
         Ee/JCVwlLRH/o4vnlZPTNGT8wtQXTvgKjd+5t4KzQILprQTL1VwUcN1zTOsNlnDMEwLM
         3zhnOG7YlE9N8EAE35NOdPuXuYtAf8l9gnmHkVQrUJfb+FLSh3RKNUTvzw1RsvcMwHIL
         FhRHfAGZxE6LtGUwpp5Mxsi50P3lPdbRhMQzeVF0LT4Q36dZAuNT0OSpuPNsC6RJ+V+H
         nX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vr2KPZ9qoqfM5AcGzo/i5Z1EoxggHrKaTcs+pHDXosM=;
        b=3ZaLxV0AY3bCgKvB5jrfQYauGmkDYXtTUDFAlf2TWlBuzI8vRFUJR3+4cgT+UPFfPl
         UqzMqYrogZhM0hc5pnVhyunKq5KSwCnED0gLlu2n8u2Dun6luk/28VZ+DSgkG1eVkjas
         8rSQAabQGP25t4RgivRRdKL3DYM8jLTNDO5QRs4YAetpJtOsLUO54XDXL7ZjqF9G0NX1
         /iIh5bYs4kAJZuQNucBpEvxiTXOmd1IDLONQNuVsZPVFNbLZVzQ4tjJz8fO5OBPD+S0i
         mBULQbiVpCYQZkngcsHNJ9wDGHbHnpZWBV3UAJBNOC7EzsyqOgXpmlrOd9DJxEf0I4bd
         04KQ==
X-Gm-Message-State: AO0yUKXlsNI65CN2/a127e+WTldd2Wk8FQ3KEDfUahXvMSi0KlqyzG/8
        fhzeBEhubwgZ3rXYBPdjigE=
X-Google-Smtp-Source: AK7set84dMKDMw+OgBd0QlgEENOCDYhv5dq98INirOP+6Nx34DyVHV4TECsQEPadoF3jX4MQSAJdoA==
X-Received: by 2002:aa7:97a3:0:b0:5a9:c535:dba3 with SMTP id d3-20020aa797a3000000b005a9c535dba3mr7099733pfq.25.1677013786640;
        Tue, 21 Feb 2023 13:09:46 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:401d:bbfb:545b:8035? ([2001:df0:0:200c:401d:bbfb:545b:8035])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005907716bf8bsm3348095pfi.60.2023.02.21.13.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 13:09:46 -0800 (PST)
Message-ID: <40e057d3-dfa3-6cd9-2bce-98f0db93430b@gmail.com>
Date:   Wed, 22 Feb 2023 10:09:41 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 22/02/23 04:53, John Paul Adrian Glaubitz wrote:
> Hi Geert!
>
> On Tue, 2023-02-21 at 15:55 +0100, Geert Uytterhoeven wrote:
>> Looks surprisingly similar to the issue reported by Stan.
>> Do the mitigations given in
>> https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
>> help?
> The kernel actually crashes with a backtrace:
>
> ABCDGHIJK
> [    0.000000] Linux version 6.0.0-6-m68k (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU ld (GNU Binutils for
> Debian) 2.39) #1 Debian 6.0.12-1 (2022-12-09)
> [    0.000000] Enabling workaround for errata I14
> [    0.000000] printk: bootconsole [debug0] enabled
> [    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA
> LISA ALICE_PAL ZORRO3
> [    0.000000] initrd: 0ef0602c - 0f800000
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000008000000-0x000000000f7fffff]

In both your case and Kars', the memory does not start at 0x0. Kars 
finds all memory reserved on his HP.

6.2rc8 boots fine on my 030 (memory starting at 0x0).

> [    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
> [    0.000000] Unable to handle kernel access at virtual address (ptrval)
> [    0.000000] Oops: 00000000
> [    0.000000] Modules linked in:
> [    0.000000] PC: [<00201d3c>] memcmp+0x28/0x56
> [    0.000000] SR: 2709  SP: (ptrval)  a2: 004a5580
> [    0.000000] d0: 00000003    d1: 00000001    d2: 00201d14    d3: 00000272
> [    0.000000] d4: 00012750    d5: 08023ec0    a0: 0000000c    a1: 0f7ffff4

a1 is just  before the end of your RAM chunk. If that's a longword 
access, you'd fall over the edge :) Can you disassemble the code snippet 
(or memcmp()) so we can see what's happening?

I do recall recent changes to the mm code, but that was for NOMMU. I 
wonder whether there was anything else that would introduce an implicit 
assumption about memory starting at 0x0 ...

> [    0.000000] Process swapper (pid: 0, task=(ptrval))
> [    0.000000] Frame format=4 fault addr=0f7ffff4 fslw=01051000
> [    0.000000] Stack from 004a3fac:
> [    0.000000]         00201d14 00000272 00374e40 0f7ffff4 0f800000 00534b22 0f7ffff4 0042e325
> [    0.000000]         0000000c 0055c000 00000272 00012750 08023ec0 00012750 080dbf48 08001000
> [    0.000000]         08001000 0f7ffff0 00553d9a 00000000 00533872
> [    0.000000] Call Trace: [<00201d14>] memcmp+0x0/0x56
> [    0.000000]  [<00374e40>] _printk+0x0/0x18
> [    0.000000]  [<00534b22>] start_kernel+0x8a/0x5d6
> [    0.000000]  [<00012750>] LOGTBL+0x228/0x800
> [    0.000000]  [<00012750>] LOGTBL+0x228/0x800
> [    0.000000]  [<00533872>] _sinittext+0x872/0x11f8
> [    0.000000]
> [    0.000000] Code: b288 661e 4280 6030 2a49 284b 264c 224d <bb8c> 66ea 5988 7003 b088 65f0 224d 264c 60dc 4283 1631 1800 4282 1433 1800
> 2003
> [    0.000000] Disabling lock debugging due to kernel taint
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---
>
>>> FWIW, I noticed that the kernel image itself is already over 7 MB, not sure
>>> whether this is a problem.
>> Depends on how much RAM you have ;-)
> 128 MB.
>
>>> Anyone else tried a recent kernel on their Amigas?
>> I really should start booting on real Amiga hardware again...
> You should ;-).

Thirded :-)

Cheers,

     Michael

>
> Adrian
>
