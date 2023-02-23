Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCFDC61DA4
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Feb 2023 18:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjBWSYy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Feb 2023 13:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231379AbjBWSYs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Feb 2023 13:24:48 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2036354A1F
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 10:24:28 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so4493690pjn.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Feb 2023 10:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zYKdWKr2UV5sL4F4ebosIZK3yuSiJeT6vRAhlrLqg=;
        b=Jj0ER6G6pPJephKY2lDQe+IYGBcBtF+srOqJeZl6Bqj1kdjmjyt57j/L6PfGWBGGbx
         w3PL8Fnod0sMWyFYS4oCsc+FnWMv2P9qDErmP1fzK5Od/a0VLqiBjv4Ozzqhno6+JnD3
         VONMcFkP5s9o0JYuyzwmbbgTdoAAtUt1sVq2r/1554HFGwnb2QvHRaWwqA0Q/ECfhhy6
         hEpBGPNqimdb33rPI+Rgj/+x5uoDKjERbdNPnxT+XaMJqUnqs6tJRZA72Pqradnwn1WB
         HzyRXJZBCEgEL1nUxAYJFYRHE1yzYBduEWT0dwEGDlCNKNpxTCck9aOAaHfqhXO0xf27
         aQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9zYKdWKr2UV5sL4F4ebosIZK3yuSiJeT6vRAhlrLqg=;
        b=7HrjYvcvl5Hgz6AgU4i6O/BWCeUY2/yH4eEi2slzW72iHs8EfKOzU6Gx8IFUCejY/m
         crQ/U85Ow3d6Rq9abvn3MCBXcSmWRv4iqdG51DWE1i5RRoS2ToLjDnS/7MUhnxweLxTa
         v8WKUH2R6QfArSPXKVlKddF+DAPI5dikM4ZXQhE01FhZujDHRNlDL323+8mwsLDTvC6q
         TPJHLR3STYlLn4aikppvZ4r1f4ZcSdH0T61wR2CXDCGhqsMiWAKe4mTH55hjgUYGgsDw
         eIFVYj6VX47ODW1fHxA0sWlDYPK+hjlBPtlO8XRqciez7KH6dPUA1JcYwUFMkk0teRHh
         LbXg==
X-Gm-Message-State: AO0yUKXGpUbJW66Pk/ItOKg6iBIxkvfndxaOmSD5eKTp34edjY9qKmkr
        +kw2CTg9Gu2UNOoSZikpCCNHEKz9obU=
X-Google-Smtp-Source: AK7set8UoRbn0AJeSOd7WXpz/T21PS0ApZHr72N/dgBpnbLUBPGPOE2fB46EeYTLSkkqCO0nrLkH9w==
X-Received: by 2002:a17:902:e851:b0:19a:7758:e5e6 with SMTP id t17-20020a170902e85100b0019a7758e5e6mr16240808plg.48.1677176667470;
        Thu, 23 Feb 2023 10:24:27 -0800 (PST)
Received: from ?IPV6:2001:df0:0:200c:5169:eed6:c2d0:93c3? ([2001:df0:0:200c:5169:eed6:c2d0:93c3])
        by smtp.gmail.com with ESMTPSA id t8-20020a1709028c8800b001994a7a662esm9161885plo.201.2023.02.23.10.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 10:24:26 -0800 (PST)
Message-ID: <cfb34ddb-ffce-bcf5-acca-1c5e2ef56846@gmail.com>
Date:   Fri, 24 Feb 2023 07:24:22 +1300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
Content-Language: en-US
From:   Michael Schmitz <schmitzmic@gmail.com>
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <40e057d3-dfa3-6cd9-2bce-98f0db93430b@gmail.com>
 <c531fc933a033be61ee63ce4ac58ceeb3a8df39e.camel@physik.fu-berlin.de>
 <9e3915af-2f52-0121-5c63-00dd449b4295@gmail.com>
In-Reply-To: <9e3915af-2f52-0121-5c63-00dd449b4295@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Correcting myself again...

On 22/02/23 13:53, Michael Schmitz wrote:
> Hi Adrian,
>
> On 22/02/23 10:46, John Paul Adrian Glaubitz wrote:
>> Hi Michael!
>>
>> On Wed, 2023-02-22 at 10:09 +1300, Michael Schmitz wrote:
>>> a1 is just  before the end of your RAM chunk. If that's a longword
>
> Actually it isn't that close - if I read the stack correctly, we're 
> comparing 0xc bytes from 0x0f7ffff4 which is to 0x0f7ffffff.
>
> The post-increment of a5 to 0x0f800000 might cause a pre-fetch beyond 
> end of memory - how does that get handled?

The stack frame format in this case (at least, going by the 68000 series 
PRM) seems to indicate it's not something to do with prefetch.

Can you try Kars' recent patch? Maybe the old bug calculating the RAM 
end address only now got 'active' on your configuration due to more 
recent MM changes?

Cheers,

     Michaell

>
>>> access, you'd fall over the edge :) Can you disassemble the code 
>>> snippet
>>> (or memcmp()) so we can see what's happening?
>> Here you go:
>>
>> 00201d14 <memcmp>:
>>    201d14:       48e7 301c       moveml %d2-%d3/%a3-%a5,%sp@-
>>    201d18:       226f 0018       moveal %sp@(24),%a1
>>    201d1c:       266f 001c       moveal %sp@(28),%a3
>>    201d20:       206f 0020       moveal %sp@(32),%a0
>>    201d24:       7003            moveq #3,%d0
>>    201d26:       b088            cmpl %a0,%d0
>>    201d28:       650a            bcss 201d34 <memcmp+0x20>
>>    201d2a:       4281            clrl %d1
>>    201d2c:       b288            cmpl %a0,%d1
>>    201d2e:       661e            bnes 201d4e <memcmp+0x3a>
>>    201d30:       4280            clrl %d0
>>    201d32:       6030            bras 201d64 <memcmp+0x50>
>>    201d34:       2a49            moveal %a1,%a5 <=======  0x0f7ffff4
>>    201d36:       284b            moveal %a3,%a4
>>    201d38:       264c            moveal %a4,%a3
>>    201d3a:       224d            moveal %a5,%a1
>>    201d3c:       bb8c            cmpml %a4@+,%a5@+ <=======  a5 will 
>> be 0x0f800000 after post-increment
>>    201d3e:       66ea            bnes 201d2a <memcmp+0x16>
>>    201d40:       5988            subql #4,%a0
>>    201d42:       7003            moveq #3,%d0
>>    201d44:       b088            cmpl %a0,%d0
>>    201d46:       65f0            bcss 201d38 <memcmp+0x24>
>>    201d48:       224d            moveal %a5,%a1
>>    201d4a:       264c            moveal %a4,%a3
>>    201d4c:       60dc            bras 201d2a <memcmp+0x16>
>>    201d4e:       4283            clrl %d3
>>    201d50:       1631 1800       moveb %a1@(0,%d1:l),%d3
>>    201d54:       4282            clrl %d2
>>    201d56:       1433 1800       moveb %a3@(0,%d1:l),%d2
>>    201d5a:       2003            movel %d3,%d0
>>    201d5c:       9082            subl %d2,%d0
>>    201d5e:       5281            addql #1,%d1
>>    201d60:       b483            cmpl %d3,%d2
>>    201d62:       67c8            beqs 201d2c <memcmp+0x18>
>>    201d64:       4cdf 380c       moveml %sp@+,%d2-%d3/%a3-%a5
>>    201d68:       4e75            rts
>>
>> The kernel image is actually unstripped. Is there a config option for 
>> that?
> I'm sure the compressed kernel image is stripped but includes the 
> kernel symbol table (see below). The symbol table is definitely good 
> to have (otherwise you'd have to figure what all the addresses on the 
> stack mean from a separate symbol table).
>> Do we want to keep symbols in a non-debug kernel?
>
> Definitely ...
>
> Cheers,
>
>     Michael
>
> Output of objdump -h:
>
> vmlinux-6.2.0-rc8-atari-fpuemu-atafbfix+:     file format elf32-m68k
>
> Sections:
> Idx Name          Size      VMA       LMA       File off  Algn
>   0 .text         0030169c  00001000  00001000  00001000  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>   1 __ex_table    00001ab0  003026a0  003026a0  003026a0  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   2 .rodata       000c81e8  00305000  00305000  00305000  2**4
>                   CONTENTS, ALLOC, LOAD, DATA
>   3 __ksymtab     00009a14  003cd1e8  003cd1e8  003cd1e8  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   4 __ksymtab_gpl 000057c0  003d6bfc  003d6bfc  003d6bfc  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   5 __ksymtab_strings 000166a3  003dc3bc  003dc3bc  003dc3bc  2**0
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   6 __param       000006cc  003f2a60  003f2a60  003f2a60  2**1
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   7 __modver      00000088  003f312c  003f312c  003f312c  2**1
>                   CONTENTS, ALLOC, LOAD, DATA
>   8 .notes        00000054  003f31b4  003f31b4  003f31b4  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, DATA
>   9 .data         00051a20  003f4000  003f4000  003f4000  2**4
>                   CONTENTS, ALLOC, LOAD, DATA
>  10 .bss          0002266c  00445a20  00445a20  00445a20  2**4
>                   ALLOC
>  11 .init.text    00017be0  00469000  00469000  00447000  2**2
>                   CONTENTS, ALLOC, LOAD, READONLY, CODE
>  12 .init.data    00004c1c  00480be0  00480be0  0045ebe0  2**2
>                   CONTENTS, ALLOC, LOAD, DATA
>  13 .m68k_fixup   00000480  004857fc  004857fc  004637fc  2**0
>                   CONTENTS, ALLOC, LOAD, DATA
>  14 .init_end     00000384  00485c7c  00485c7c  00463c7c  2**0
>                   ALLOC
>  15 .comment      0000002d  00000000  00000000  00463c7c  2**0
>                   CONTENTS, READONLY
>
>>
>>> I do recall recent changes to the mm code, but that was for NOMMU. I
>>> wonder whether there was anything else that would introduce an implicit
>>> assumption about memory starting at 0x0 ...
>> Sounds like a possible culprit.
>>
>> Adrian
>>
