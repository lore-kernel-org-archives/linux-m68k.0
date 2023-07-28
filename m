Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B847EB64DD
	for <linux-m68k@archiver.kernel.org>; Fri, 28 Jul 2023 07:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232784AbjG1HwV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 28 Jul 2023 03:52:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbjG1HwU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 28 Jul 2023 03:52:20 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61E630DE
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 00:52:18 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-26598fc0825so2028162a91.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 28 Jul 2023 00:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690530738; x=1691135538;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m42+ZIR1N6GzQ9aPdoFfIV31yJzQ/iuKCQY7C80w4Dc=;
        b=l9U1E1vPe1BKUt1wKoD65+ccGJ78JH451y21ulctowMibpCBnfMKFpFhHiKOXnzHWY
         2OWsJX/IiS6Ww/qAvvm74xtLXk++WP9c+fO3wsM3vzcKMoJUW7S4KFk8AyoLgC+qLuW0
         tU84PvRplpwnVSp1tUeEiFs9O85aGG6ONt9Z/5r5amgzaUnj8S8mssO/db3vlbByWxA0
         Ke1yReu+PLkeN9sr8KTEEyUYTGFk25o7AAEQWRoYxEcdLGqBDximK9BYrmK2PjdrhgLI
         r+XKQDUrwJdTAo+Ow6ui8IxM6FwEhG9AosygG7UPYIFLKr3sILsnGKTIxx2zkCOgv+T2
         pmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690530738; x=1691135538;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m42+ZIR1N6GzQ9aPdoFfIV31yJzQ/iuKCQY7C80w4Dc=;
        b=H0Pw+F2EahNujVBBuAEXl8uFL6vvu/FF3ScIjeHA9Kf0J04AXtMK3t0Me7QaUXRUtQ
         5jRQywnJLXZYa4vu1p9CDKszD4P06Xr2uLtBcOxkbm9MhaBO5fBqkUcgNV+QNXpX7slK
         M4zjvUO58JfpNsax9l4v5HozXN6LQeUg/tfOiIUKxw/57pRDVFHy1ciVW9E2Tlk6iZro
         BZZ007rcC3s8dv0SEFlz26icLPwMi+bHlXZ1Z82qu5XoJOpCmBpwh9Yy2Uhfj3lG+bvX
         0hPqWYjXBq3tyTzVd49b63bOJv9T5Tf+jisuwxSkLG/Z0XSk5MPUHF1aR1tap497TMry
         0hBA==
X-Gm-Message-State: ABy/qLZmCIGLmirMTu9Wf9UzwZ+lxyYsp58/m4nMT3VrWJc7TZ8Ix4ZT
        VNnWpQuLsUWSJ1N/MvNWcxE=
X-Google-Smtp-Source: APBJJlFBrxvICyJu1SXUFLrRnEIPtvZSkM6E+e9b0hUnJTCXM1tFZX/FZFc98xWsYJ1Fg1zmTpGR1A==
X-Received: by 2002:a17:90b:1910:b0:268:2f6:61c4 with SMTP id mp16-20020a17090b191000b0026802f661c4mr1568732pjb.12.1690530737955;
        Fri, 28 Jul 2023 00:52:17 -0700 (PDT)
Received: from [10.1.1.24] (222-152-184-54-fibre.sparkbb.co.nz. [222.152.184.54])
        by smtp.gmail.com with ESMTPSA id gk11-20020a17090b118b00b0024e4f169931sm3794190pjb.2.2023.07.28.00.52.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jul 2023 00:52:17 -0700 (PDT)
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
To:     Finn Thain <fthain@linux-m68k.org>
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
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Richard Zidlicky <rz@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <1e6e6dce-7b97-e206-b4f9-228520d44a45@gmail.com>
Date:   Fri, 28 Jul 2023 19:52:10 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <81706cdc-2a7a-f383-881a-7313fefbb938@linux-m68k.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

Am 28.07.2023 um 11:47 schrieb Finn Thain:
>>> Anyway, you make a good point about on-going maintenance. Do you think
>>> that by supporting standard ISA drivers we might actually reduce the
>>> ideosyncracies in m68k IO code?
>>
>> You and DaveM ought to have a chat about that - abstracting the legacy
>> drivers from the ISA constraints was his preferred option when I last
>> attempted to get the Gayle network driver patches merged. When I say
>> 'preferred', I'm probably understating a little.
>>
>
> A discussion with maintainers probably won't get far without working code
> to look at. Perhaps William will send an RFC patch to illustrate his
> approach.

That would be good to have. Once that's tested and shown to work, we can 
float the idea with the IDE maintainers first.

>> I had toyed with that using the EtherNEC driver as test case but never
>> got very far (this would have been splitting the driver into a core
>> lib8390 module and a platform-specific module that allows to hook a
>> variety of IO accessors as hooks, not static defines, and I wasn't too
>> certain about performance impacts of such a change, the performance of
>> the EtherNEC being so shitty it won't make any impact there),
>>
>> The only other option (that I can see) would be creating a bus driver
>> for the ISA bus, with platforms allowed to register their particular IO
>> accessors for IO and memory accesses - again, performance impacts to
>> consider and getting test coverage on legacy ISA hardware a nightmare.
>> This would allow to use legacy driver code more or less unchanged.
>> Haven't given that much thought at all (the idea pretty much originated
>> from this present mess, but that's all).
>>
>> There may be other approaches that can be considered, if none of this is
>> what you had in mind.
>>
>
> What I had in mind is probably unacceptable because drivers end up having
> to do byteswapping as happens in pata_falcon (or falconide and q40ide).

Yes, but Q40 and Falcon are impossible to support any other way, and 
byte swapping the IDE interface in hardware was never repeated anywhere 
else, fortunately. We will have to keep pata_falcon around for that 
cause in any event.

> Perhaps your bus driver idea would probabably find more acceptance. OTOH
> if the aim of the exercise is to use standard drivers (like pata_legacy)
> there would probably be driver changes either way.

Supporting non-IDE drivers without too much hassle would be enough for 
starters (again excepting EtherNEC. Hmmm - I don't seem to have any 
hardware to test that wouldn't need quirky accessor hooks!).

> It might be helpful to look for some precedent for this kind of thing
> among the other big-endian platforms with ISA. MIPS Magnum is dual-endian
> but Linux only runs in little-endian mode and the problem doesn't arise.
> But there must be other examples. Maybe CHRP?

Not all of CHRP, hearing Geert tell it. But there must be some boards 
that have an ISA bus?
Probably not ISA, but I've got a PCMCIA slot on the Powerbook that I 
haven't been able to use. Maybe something's to be gleaned there.

Cheers.

	Michael


