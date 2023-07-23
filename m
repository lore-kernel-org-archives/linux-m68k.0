Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8E0C001DE
	for <linux-m68k@archiver.kernel.org>; Sun, 23 Jul 2023 20:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjGWU1A (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 23 Jul 2023 16:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjGWU07 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 23 Jul 2023 16:26:59 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 320BD1BB
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 13:26:58 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-666eb03457cso1984247b3a.1
        for <linux-m68k@lists.linux-m68k.org>; Sun, 23 Jul 2023 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690144017; x=1690748817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OORwefeEFaKHrJYAg5mriCU7fSGiq4MKaaDOrNuJ5U=;
        b=dlBMVnDPQR9XhTlnozGox9hig7DFP2TfkzJ8mVKjNwWzA858RwAXkMkRxSQq8wUj4e
         ZHVS144cWSoS7/ZIeqp5ZPX6dmLIzfaMKmDohRvl5voZb+tBUyoBKs4th1rUkiuP8Xn5
         wAjPI3QqqAw1josMXY6p/qYum/1TZ1uVig6g7wz89y6Co5zhWxUTLCX2COpjUQJuFw47
         JInSTrOrDVSz5gEEtsMTa1yf3b0yT0XunmabQrUtO7HYjloxiv0OBKQkLByCNwnixVfX
         V83xwLf2bCWVkluoLyaDY0MUBEsgt915AsFupjV2Hr7SbFnbQt72ma74xuyCOv0c1pNx
         Ljuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690144017; x=1690748817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OORwefeEFaKHrJYAg5mriCU7fSGiq4MKaaDOrNuJ5U=;
        b=PYwaOcLMAeQO12CjAdukkZQeZE/4wFpJY0p7xbQmXz1BFNzW5EMHreXyCU3Nny0D3n
         PlgTy/za4KXjF9zhXhLKyKs0bEnUeMAy1AoyGdN/SmKA/JEXkpEnP3C1jInfXoAZPQ9Q
         H+q2JdXKDW+EE9lH50xrcPGKG9436wTeqyvMDt2ymXXTq1OSujcebODyW65eYiUas/cr
         5VtTEC/15UBWQXvnVoggDIWI0tPuH5CGVaRsu37h9CJuWo33UmAfU/m4bF/rwEwhrskV
         qkeaLql/xfZL0oUlOQeAFDu+0fS28vXI6034zn//7PWeGYwEeyv0wXZ36W/OHiDGCH7X
         HWOw==
X-Gm-Message-State: ABy/qLYAsF3dGDHuxVR2ioNSEljkQjLzVT0m2gX3WaT3jCGnEYerdMzL
        nooqbZ/BontUn5fsVm2FgeQ=
X-Google-Smtp-Source: APBJJlFnmKbh4uZbuavYN4WYKoy0PlnB5jLUueEiF86J0VlCsWsMR9Aq+og4zE/mO5y1xpXUJc5AcA==
X-Received: by 2002:a05:6a00:21c6:b0:679:bc89:e45 with SMTP id t6-20020a056a0021c600b00679bc890e45mr6122945pfj.6.1690144017341;
        Sun, 23 Jul 2023 13:26:57 -0700 (PDT)
Received: from ?IPV6:2001:df0:0:200c:d018:4bef:f066:25f9? ([2001:df0:0:200c:d018:4bef:f066:25f9])
        by smtp.gmail.com with ESMTPSA id j21-20020aa78dd5000000b00682a61fa525sm6531334pfr.91.2023.07.23.13.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jul 2023 13:26:56 -0700 (PDT)
Message-ID: <c47f07a9-d302-b8ce-c630-988e08cc8254@gmail.com>
Date:   Mon, 24 Jul 2023 08:26:51 +1200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: Linux 6.4.4 on m68k - Q40 - pata_falcon causes oops at boot time
Content-Language: en-US
To:     Finn Thain <fthain@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     William R Sowerbutts <will@sowerbutts.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <ZLvZmVfzJNHlPTlJ@sowerbutts.com>
 <CAMuHMdUU62jjunJh9cqSqHT87B0H0A4udOOPs=WN7WZKpcagVA@mail.gmail.com>
 <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <1dabd80c-d91e-7869-e95e-199fc58b9f84@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn, William,

On 23/07/23 21:59, Finn Thain wrote:
> On Sun, 23 Jul 2023, Geert Uytterhoeven wrote:
>
>>> First the correct ISA port address (0x3f6) is translated to the
>>> correct MMIO address (0xff400000 + 4 * 0x3f6 = 0xff400fd8).  This is
>>> done when the platform device is declared in arch/m68k/q40/config.c
>>> around line 288.
>>>
>>> Then this address is passed to pata_falcon which computes the correct
>>> MMIO addresses for the ATA task file registers in
>>> drivers/ata/pata_falcon.c around line 168 (ap->ioaddr.altstatus_addr =
>>> 0xff400fd8 + 1 = 0xff400fd9)
>>>
>>> The access to the hardware registers is performed in
>>> drivers/ata/libata-sff.c which uses ioread8/iowrite8. These functions
>>> are defined in lib/iomap.c. These functions look at the address passed
>>> it, determine that it is an MMIO address, and pass it to readb/writeb.
>>> This is the first error, we actually want to do an ISA I/O cycle, not

Thanks for testing the function of Q40 IDE after rebuilding a Q40!

I was left with the impression that the Q40 does not actually have the 
IDE controller on the ISA bus. The address translation in io_mm.h 
assumes IDE on Q40 works through MMIO on the 0xff400000 IO window. This 
also assumes that addresses passed to the m68k IO primitives must be IO 
port addresses (< 0x1000 or so).

If that assumption is incorrect, the address translation in io_mm.h must 
be changed.


>>> memory cycle, but being passed a pre-translated address confuses these
>>> two functions.
Doesn't seem to do that for my Falcon - the addresses passed are all 
from the 0xffxxxxxx range and get passed straight through to the IDE 
controller. But there's no translation in use for IDE there.
>>>
>>> arch/m68k/include/asm/io_mm.h defines inb/outb/readb/writeb etc. They
>>> translate the provided address into the MMIO address in the Q40s
>>> physical address space and then perform the MMIO access.  This is
>>> where the second, unnecessary, translation takes place, and the
>>> resulting address is wrong: (0xff800000 + 1 + 4 * 0xff400fd9) &
>>> 0xffffffff = 0xfc803f65 -- and this is the address accessed when we
>>> get the oops.
> Could be related to the bug that Michael tackled here?
> https://lore.kernel.org/linux-m68k/1623290683-17859-1-git-send-email-schmitzmic@gmail.com/

That patch just tried to make sure the address translation and IO 
primitives are selected based on the machine (and ISA bus) type. It 
didn't change the Q40 address translations.

The problem appears to be that pata_falcon.c used addresses from the 
MMIO range for both IO and memory cycles (there's no difference on 
Falcon - the address translation in use for IDE is an identity mapping). 
On Q40, the addresses set up in pata_falcon_init_one() ought to be IO 
port addresses instead, as long as Q40 address translations then map 
these into the correct IO or memory access windows. But pata_falcon 
takes the addresses to use from resources defined at platform init time, 
so that won't work anymore. I rather think the second patch in this 
context is to blame:

>> Looks like something was missed in commit 44b1fbc0f5f30e66 ("m68k/q40:
>> Replace q40ide driver with pata_falcon and falconide") in v5.14. Before,
>> Q40 used its own IDE driver (q40ide, CONFIG_BLK_DEV_Q40IDE).
> Could be that too.

Yep - what's been missed is that the Q40 address translation functions 
Q40_ISA_IO_B() and Q40_ISA_IO_W() were only used to set up the register 
addresses in the old Q40 driver. My intention with that patch was to 
only use the new IO resources for the purpose of request_region(), but 
at least (!) since converting to the pata_falcon driver, they are now 
also used for the unwanted second translation step.

Can you try changing Q40_ISA_IO_B() and Q40_ISA_IO_W() to identity 
mappings, so only one set of translations takes place?

>
>> It might be a good idea to verify that IDE works in v5.13
> Yes, please do.

And please also verify it's broken after 44b1fbc0f5f30e66 was applied.

Cheers,

     Michael

