Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 273DDEB64DD
	for <linux-m68k@archiver.kernel.org>; Mon, 24 Jul 2023 20:26:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229823AbjGXU0p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 24 Jul 2023 16:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjGXU0g (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 24 Jul 2023 16:26:36 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A441188
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 13:26:34 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6bb140cd5a5so2449852a34.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 24 Jul 2023 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690230393; x=1690835193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XezL08Ap4/hyYgUICXxhbFBnHQSJAM5qgcOWwA+ptc=;
        b=qekdNA5Nfj3uqrmSsFGOqqRKYlGVh7a7pwxPB/h10qjNXShtVuvbLLeA597if2o6Kh
         F3wre1KtITngztuiFUyQF3UbBW1xZM5Vj7kZXuzBIOT4E9AF6IYk6Dj/dwOOGD7suFFW
         p6PTsIPWyKbYInNWyBGM+h7xlwpJXdv8AXx/5CTJDDE2H7jeglfDn6iOwA1t9WJ5pSm0
         FPMEbGj+ZBMeovy+AyW2tyzoh0u94/bdJGhzze+PuBGijJS0kgvciPiXSRpCTPJQ3PAb
         VdJZTHldd8206mu2Rd2gnVY+sCiokR5VWIC/HGsDxLo1DqBw8ndR6WV9GZJqzNDZenmv
         TXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690230393; x=1690835193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XezL08Ap4/hyYgUICXxhbFBnHQSJAM5qgcOWwA+ptc=;
        b=OnuCwhvNgbydEaO2iobG2SxqaVYvMfJDeUNl771QZjERsP71lDqrMfwAizLQBbWCbN
         OBFx8+GdulgMpVw9W6C0HGhGGPNIfckU3/FhGlUFyHEYPR3J5PvLlCHOQZ+zyNidCjeF
         3yAq3nFIp1ERJj9nPTyPmd0+ahZuFfQ1mhJi7uD4xivCI5vVcCoik7WQe6UZ7qL97Do+
         IK24g66huyzA6jxb3cqbWTlcUUfmLpZx3OaKP3/YR1m5pct8YV4674ZwZzoNDKXrjlhW
         65s4QngccMaUfwpn5iplmn1sbEEUQY565XJfaSxcfVAcHyjber3pxINl1z/i3ypN3zrn
         6SMA==
X-Gm-Message-State: ABy/qLYJaAyUxX9AlMD8gIz+a3DZWyM3K08jGr9e+v/t0eYmikE+93cm
        RVOPdxC673HQ9cGU6N2CYkf6l/yWtz4=
X-Google-Smtp-Source: APBJJlHGa6uGzhw4JUzTWwxJJKqJXj2mhKUiPl4yt6IqNmLA9cuh6qowSi5GNCfRmvmyoHwMEBRvow==
X-Received: by 2002:a05:6358:2495:b0:135:43da:b16d with SMTP id m21-20020a056358249500b0013543dab16dmr6787904rwc.11.1690230392913;
        Mon, 24 Jul 2023 13:26:32 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:8512:bf1c:965b:d08d? ([2001:df0:0:200c:8512:bf1c:965b:d08d])
        by smtp.gmail.com with ESMTPSA id y4-20020a63ad44000000b0055fd10306a2sm8959999pgo.75.2023.07.24.13.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 13:26:32 -0700 (PDT)
Message-ID: <d01db1e6-a0ae-559c-ab64-b3a2f5b60324@gmail.com>
Date:   Tue, 25 Jul 2023 08:26:28 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     William R Sowerbutts <will@sowerbutts.com>
Cc:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
 <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
 <ZL5jwoXAU5t8S+E6@sowerbutts.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <ZL5jwoXAU5t8S+E6@sowerbutts.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Thanks William,

On 24/07/23 23:42, William R Sowerbutts wrote:
>> I was left with the impression that the Q40 does not actually have the IDE
>> controller on the ISA bus.
> This is mistaken.
>
> IDE is definitely accessed over the ISA bus.
>
> There is some documentation on the Q40/Q60 hardware here:
> http://www.q40.de/download/harddoc.pdf
Noted - hadn't seen this one before.
>
> The motherboard integrates the CPU, DRAM, video DRAM and display controller,
> audio DACs, RTC, interrupt controller, keyboard controller, and an LED
> output.

No disk controller on the main board - that's where my error originated.

Note that this also means that the address hardcoded for IDE may be 
incorrect (AFAIR, IDE cards could have their IO base reassigned by 
firmware).

> There are two ISA slots where all other I/O devices are connected. These are
> described (concisely!) on page 7 of the linked manual:
>
> 8-bit ISA I/O cycles are performed for CPU byte accesses to 0xFF400001 + 4 * ISA address
>
> 16-bit ISA I/O cycles are performed for CPU word accesses to 0xFF400000 + 4 * ISA address
>
> 8-bit ISA memory cycles are performed for CPU byte accesses to 0xFF800001 + 4 * ISA address
>
> 16-bit ISA memory cycles are performed for CPU word accesses to 0xFF800000 + 4 * ISA address
Yep, that much is evident from the Q40 address translation scheme. But a 
similar sort of scheme is used on other m68k platforms to wire up 
peripherals that were originally designed for Intel systems, and these 
are not connected through an ISA bus.
> I understand that the machines originally shipped with a 16-bit ISA card
> based on the W83787IF "PC super I/O" chip, integrating a floppy controller,
> IDE interface, game port, parallel port, and two 16550A UARTs.
OK.
>
> My Q40 came without this card, so I am using a card based on the similar
> W83757 chip (the serial ports are 16450 instead of 16550A, it doesn't support
> the fancy EPP/ECP parallel port modes).
>
>>>> It might be a good idea to verify that IDE works in v5.13
>>> Yes, please do.
> It did.
>
>> And please also verify it's broken after 44b1fbc0f5f30e66 was applied.
> I will try to do that!

Probably just try v5.14 - in my tree, 44b1fbc0f5f30e66 came on top of 
5.13-rc2 so 5.14 ought to have it applied (but rather check, just the same).

Cheers,

     Michael


>
> Thanks
>
> Will
>
> _________________________________________________________________________
> William R Sowerbutts                                  will@sowerbutts.com
> "Carpe post meridiem"                               http://sowerbutts.com
>           main(){char*s=">#=0> ^#X@#@^7=",c=0,m;for(;c<15;c++)for
>           (m=-1;m<7;putchar(m++/6&c%3/2?10:s[c]-31&1<<m?42:32));}
>
