Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EF2C001DF
	for <linux-m68k@archiver.kernel.org>; Sat, 29 Jul 2023 04:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjG2E5G (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sat, 29 Jul 2023 00:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229617AbjG2E5F (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sat, 29 Jul 2023 00:57:05 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 568B149E0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 21:57:03 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-55c993e26ffso1621311a12.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 21:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690606622; x=1691211422;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Cz/GJLqNnac9acs8DsBrc2EEQJ/b7GKTSsYz/p/5GY=;
        b=mS0dshfAT9Qu8LVJI3NF/qla+W6bwqgBdXwbX0sA24ChhULj/MLP+6PAzsSfJpHnTb
         TauXLgszdwDb+5GhWJRALSw8V7lbgY8doJmX1xgg5vA4dSJMvbdMOX4K8g647Hku5yjV
         fiPZeXPT3ru9kNKMB74DZITR+vlV/WcFJ5G0P0MY2XWXouYxQIeT6k57zT3rM4c0TcWz
         MCH+qQ1FFRjOxuOY/QmgjsLo6k9XnhnTGyz8jJAlIdFpZYiZH0Uelq+CHtwDFrKcfaGM
         vqdf7qKMXL8SluPtmaUisT3RIUIG7Ju6fzU4njDix2uqEOw4wtlJe0G7zLXJJdkwbI9D
         abPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690606622; x=1691211422;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Cz/GJLqNnac9acs8DsBrc2EEQJ/b7GKTSsYz/p/5GY=;
        b=lARdk78wUfuPeobo2ymqcf328zzvQbeNA4a+LPM0K9FJBnV8IOY4UT4hYxjUhqWs+O
         5k3Kn9V9yO8ccFx7MtcaAMyPNV9hoYoV3dknS8Nmb71Z+ElFzi7nrmsHkN2C1BikHIzp
         d/qSfCeEk8cxsz2AssI5IbwCvcr94iWJG/jWCfpwbhX8037zLu5mOi1HJGRolZyV1VlY
         UNvKPTcfq1ZRjJbKqPb/NAc/3bS/k2N4Pqy7v7bb3oEJWgKxBMzyz5pI91HZteURZ+40
         zdqgzpURKCv3c34t9AQ8NaKaO9Vz+/29UfUhTZbyoax0O4nyMWh7TMt+ZAi9Cya1hmBe
         Bc0g==
X-Gm-Message-State: ABy/qLY83et+BnsIXsEW1EswKDgJtXWBxeS8lPwpctxXRV2SFRCf9y4x
        v9aaLqs2SpK5bDCLG3F1V/8=
X-Google-Smtp-Source: APBJJlG6uZOt8Q/8Ky+loBbgRZSr0hB13k6M4ocsOtBdEoR8Hkqz9VsmFsqD+X/NjXzZ+CmnFn6gHw==
X-Received: by 2002:a17:90a:db82:b0:263:e423:5939 with SMTP id h2-20020a17090adb8200b00263e4235939mr3532130pjv.28.1690606622379;
        Fri, 28 Jul 2023 21:57:02 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a1a5d00b0025c2c398d33sm3513072pjl.39.2023.07.28.21.56.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jul 2023 21:57:01 -0700 (PDT)
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Geert Uytterhoeven <geert@linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
 <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
 <997f0ff1-865d-29fb-ef65-2bb693549da8@linux-m68k.org>
 <288847c5-46bd-fcd4-11a7-829685a02c79@gmail.com>
 <521776cc-a11e-0a3a-b44d-fc051f6ee2ea@linux-m68k.org>
 <624c5629-e337-46ba-c8ac-411fe19f2f46@gmail.com>
 <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
 <1e6e6dce-7b97-e206-b4f9-228520d44a45@gmail.com>
 <CAMuHMdX8Mv9=6zimfMW-=r9XH+np3V5eyGyQeRVYKV14vJ-q9w@mail.gmail.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        William R Sowerbutts <will@sowerbutts.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <6b2eb3ad-5053-4998-7aa6-d7e2e90141f9@gmail.com>
Date:   Sat, 29 Jul 2023 16:56:55 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX8Mv9=6zimfMW-=r9XH+np3V5eyGyQeRVYKV14vJ-q9w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 28.07.2023 um 20:03 schrieb Geert Uytterhoeven:
> Hi Michael,
>
> On Fri, Jul 28, 2023 at 9:52 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
>> Am 28.07.2023 um 11:47 schrieb Finn Thain:
>>> What I had in mind is probably unacceptable because drivers end up having
>>> to do byteswapping as happens in pata_falcon (or falconide and q40ide).
>>
>> Yes, but Q40 and Falcon are impossible to support any other way, and
>> byte swapping the IDE interface in hardware was never repeated anywhere
>> else, fortunately. We will have to keep pata_falcon around for that
>> cause in any event.
>
> Anyone remember TiVo? PPC with byte-swapped IDE interface.

I vaguely remember, but had forgotten even that it was a PPC machine.

>
>>> It might be helpful to look for some precedent for this kind of thing
>>> among the other big-endian platforms with ISA. MIPS Magnum is dual-endian
>>> but Linux only runs in little-endian mode and the problem doesn't arise.
>>> But there must be other examples. Maybe CHRP?
>>
>> Not all of CHRP, hearing Geert tell it. But there must be some boards
>> that have an ISA bus?
>
> It did have an ISA bus, but no ISA slots.
> But the only external device on that bus was cs4232 audio.

Thanks, I'll take a look at that.

Cheers,

	Michael

> All other ISA devices were internal to the south bridge.
> http://g33rt.be/migrated/Linux/PPC/pci/isaAT1/.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
