Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4E7C61DA3
	for <linux-m68k@archiver.kernel.org>; Wed, 22 Feb 2023 00:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbjBVAyE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 21 Feb 2023 19:54:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBVAyD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 21 Feb 2023 19:54:03 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7156730CD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 16:54:02 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id z10so3886896ple.6
        for <linux-m68k@lists.linux-m68k.org>; Tue, 21 Feb 2023 16:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LaXinuwIqs1Onwm11QXFoNqx1vuxv2jszoLWtq3Z8EA=;
        b=PjhYB1jDOh7/snEBTUu3TqTRQZK8y4PCqJZzVsaZKfJz77hI6SQsnyDfoMQ137DTky
         QkszM//gVcLoi9t9M8zs0KuUPUiJvy8CAD9EyBi6rJeNnqw/K6l7F/sLgPCakow18+v7
         IWCXjHQhPjhJmNBo0ba5NpguZuI9Y6Doo51apyV2oIF8PQk5VVegNiMkUwTcJYYywYYz
         gl0kLKanHNGnneqsXrJaUOTe7wn5tqSIhwqB7rhEjr9FCtdkb5OkuW0Gw7SSrxdSuuKt
         N6f6/DS/KoAUVl5Lap4QPjpBFvETDPCFNwSAZwEl+GMuiBbLGySZ63pbJKF+Y2LTBQtN
         TaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LaXinuwIqs1Onwm11QXFoNqx1vuxv2jszoLWtq3Z8EA=;
        b=VYwE1CU4qa1i212pRd4zE/7PrUd8b/cNf3uO+FMhUMc56I5ldjmCgNubA5QMmO4uPF
         GO35wIpRJYTDf7JY51OZADzSDMdL7Um2bdYMoiYArBX9OEYzGlnYvsicdgNlbVp91n45
         rfg81dN2YCAfeRwdV44S4aQ2bSvcbaUP6mUq2jLV/sWYWTJNP5mY0tpXbGVm2SwWpQ06
         2Im+/gUffgy8kK21WAPeVseC4QPYGc0hhutkBMbsP33RmlZ/7aGf62WWeZYkwGTlJ0Lm
         bT14L7/0YOHqQrFJcv9IXAuYHjFgpmUJPOmOmNViwzEp56ud5eHcKQ1WrkEUI6t3vsOB
         nLzQ==
X-Gm-Message-State: AO0yUKVd2zowf+YWH0MkZsUo+P3FIBuZjmgPXpGd7xjiIgrH83X0rPix
        1leaPMmHoqGrZhFImdDwXRE=
X-Google-Smtp-Source: AK7set/ZfTfqBXm5cqxptxLcAnn5ahjssAE2Fr9fykNoRxR3oKfh8b8HCcIBpnBC9eG5errHZkPYjQ==
X-Received: by 2002:a17:90b:3e84:b0:234:2776:a357 with SMTP id rj4-20020a17090b3e8400b002342776a357mr7085420pjb.43.1677027241562;
        Tue, 21 Feb 2023 16:54:01 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:401d:bbfb:545b:8035? ([2001:df0:0:200c:401d:bbfb:545b:8035])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a698200b00235419fc2d1sm3433917pjj.40.2023.02.21.16.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 16:54:00 -0800 (PST)
Message-ID: <9e3915af-2f52-0121-5c63-00dd449b4295@gmail.com>
Date:   Wed, 22 Feb 2023 13:53:56 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
Content-Language: en-US
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <40e057d3-dfa3-6cd9-2bce-98f0db93430b@gmail.com>
 <c531fc933a033be61ee63ce4ac58ceeb3a8df39e.camel@physik.fu-berlin.de>
From:   Michael Schmitz <schmitzmic@gmail.com>
In-Reply-To: <c531fc933a033be61ee63ce4ac58ceeb3a8df39e.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Adrian,

On 22/02/23 10:46, John Paul Adrian Glaubitz wrote:
> Hi Michael!
>
> On Wed, 2023-02-22 at 10:09 +1300, Michael Schmitz wrote:
>> a1 is just  before the end of your RAM chunk. If that's a longword

Actually it isn't that close - if I read the stack correctly, we're 
comparing 0xc bytes from 0x0f7ffff4 which is to 0x0f7ffffff.

The post-increment of a5 to 0x0f800000 might cause a pre-fetch beyond 
end of memory - how does that get handled?

>> access, you'd fall over the edge :) Can you disassemble the code snippet
>> (or memcmp()) so we can see what's happening?
> Here you go:
>
> 00201d14 <memcmp>:
>    201d14:       48e7 301c       moveml %d2-%d3/%a3-%a5,%sp@-
>    201d18:       226f 0018       moveal %sp@(24),%a1
>    201d1c:       266f 001c       moveal %sp@(28),%a3
>    201d20:       206f 0020       moveal %sp@(32),%a0
>    201d24:       7003            moveq #3,%d0
>    201d26:       b088            cmpl %a0,%d0
>    201d28:       650a            bcss 201d34 <memcmp+0x20>
>    201d2a:       4281            clrl %d1
>    201d2c:       b288            cmpl %a0,%d1
>    201d2e:       661e            bnes 201d4e <memcmp+0x3a>
>    201d30:       4280            clrl %d0
>    201d32:       6030            bras 201d64 <memcmp+0x50>
>    201d34:       2a49            moveal %a1,%a5			<=======  0x0f7ffff4
>    201d36:       284b            moveal %a3,%a4
>    201d38:       264c            moveal %a4,%a3
>    201d3a:       224d            moveal %a5,%a1
>    201d3c:       bb8c            cmpml %a4@+,%a5@+		<=======  a5 will be 0x0f800000 after post-increment
>    201d3e:       66ea            bnes 201d2a <memcmp+0x16>
>    201d40:       5988            subql #4,%a0
>    201d42:       7003            moveq #3,%d0
>    201d44:       b088            cmpl %a0,%d0
>    201d46:       65f0            bcss 201d38 <memcmp+0x24>
>    201d48:       224d            moveal %a5,%a1
>    201d4a:       264c            moveal %a4,%a3
>    201d4c:       60dc            bras 201d2a <memcmp+0x16>
>    201d4e:       4283            clrl %d3
>    201d50:       1631 1800       moveb %a1@(0,%d1:l),%d3
>    201d54:       4282            clrl %d2
>    201d56:       1433 1800       moveb %a3@(0,%d1:l),%d2
>    201d5a:       2003            movel %d3,%d0
>    201d5c:       9082            subl %d2,%d0
>    201d5e:       5281            addql #1,%d1
>    201d60:       b483            cmpl %d3,%d2
>    201d62:       67c8            beqs 201d2c <memcmp+0x18>
>    201d64:       4cdf 380c       moveml %sp@+,%d2-%d3/%a3-%a5
>    201d68:       4e75            rts
>
> The kernel image is actually unstripped. Is there a config option for that?
I'm sure the compressed kernel image is stripped but includes the kernel 
symbol table (see below). The symbol table is definitely good to have 
(otherwise you'd have to figure what all the addresses on the stack mean 
from a separate symbol table).
> Do we want to keep symbols in a non-debug kernel?

Definitely ...

Cheers,

     Michael

Output of objdump -h:

vmlinux-6.2.0-rc8-atari-fpuemu-atafbfix+:     file format elf32-m68k

Sections:
Idx Name          Size      VMA       LMA       File off  Algn
   0 .text         0030169c  00001000  00001000  00001000  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
   1 __ex_table    00001ab0  003026a0  003026a0  003026a0  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   2 .rodata       000c81e8  00305000  00305000  00305000  2**4
                   CONTENTS, ALLOC, LOAD, DATA
   3 __ksymtab     00009a14  003cd1e8  003cd1e8  003cd1e8  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   4 __ksymtab_gpl 000057c0  003d6bfc  003d6bfc  003d6bfc  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   5 __ksymtab_strings 000166a3  003dc3bc  003dc3bc  003dc3bc  2**0
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   6 __param       000006cc  003f2a60  003f2a60  003f2a60  2**1
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   7 __modver      00000088  003f312c  003f312c  003f312c  2**1
                   CONTENTS, ALLOC, LOAD, DATA
   8 .notes        00000054  003f31b4  003f31b4  003f31b4  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, DATA
   9 .data         00051a20  003f4000  003f4000  003f4000  2**4
                   CONTENTS, ALLOC, LOAD, DATA
  10 .bss          0002266c  00445a20  00445a20  00445a20  2**4
                   ALLOC
  11 .init.text    00017be0  00469000  00469000  00447000  2**2
                   CONTENTS, ALLOC, LOAD, READONLY, CODE
  12 .init.data    00004c1c  00480be0  00480be0  0045ebe0  2**2
                   CONTENTS, ALLOC, LOAD, DATA
  13 .m68k_fixup   00000480  004857fc  004857fc  004637fc  2**0
                   CONTENTS, ALLOC, LOAD, DATA
  14 .init_end     00000384  00485c7c  00485c7c  00463c7c  2**0
                   ALLOC
  15 .comment      0000002d  00000000  00000000  00463c7c  2**0
                   CONTENTS, READONLY

>
>> I do recall recent changes to the mm code, but that was for NOMMU. I
>> wonder whether there was anything else that would introduce an implicit
>> assumption about memory starting at 0x0 ...
> Sounds like a possible culprit.
>
> Adrian
>
