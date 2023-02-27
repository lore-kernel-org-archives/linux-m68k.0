Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68400C64ED6
	for <linux-m68k@archiver.kernel.org>; Mon, 27 Feb 2023 02:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbjB0COK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 26 Feb 2023 21:14:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbjB0CNo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 26 Feb 2023 21:13:44 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ECCF1DB80
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 18:11:51 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id c10so1975260pfv.13
        for <linux-m68k@lists.linux-m68k.org>; Sun, 26 Feb 2023 18:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8ctNLwcSYaUIGbRGWSCHJXouJ8nbSVZelm7b62WD6g=;
        b=Pkg2BwoLn0x8020kmvJkprfm8IPzefdYI9nSaKgUVIngJUjxUKJRWg2liF2FI8sHa3
         n1PQmlGdNG1Z1rk91BtlgyIA0xcd9eNO12EjFVkJX3ouilF18puv3zDpR0aagTq+qfif
         IzP/bdL0QswLVyIbQuHu0yeenHhG5nTkonD3KuTuYpBoW+3gUYmTY2QHlmOct9sTge3Q
         JIco2wzjcfFoBONFSNaQA3vd6bPlKPZpCBtOnccgflSaY7Lqvb6W8x4jFrnLPEiLkoMG
         MANlCQ9oh5HF6+EYjVCXAybr3bU++3ukmt6087oESxndye6OPfxFoK+f9htWKZUhEa3D
         u9fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8ctNLwcSYaUIGbRGWSCHJXouJ8nbSVZelm7b62WD6g=;
        b=dB0QgGGfwBEWXpKKw/QvwDiwYe13zYlwHtykk/Tc0+nX8uS0vmJI2phlpEnKQsWabC
         8+S5G35HBEsGuRjScUz7KZuCjGXsb3qSGAtqKCx2Khkn67qV2djtNp0iZS1rF9r6++yg
         kDpqUSD/PS6FtlwT3XX/8Oh779IGmP4UcBHweZFkniT21Gocd9RDfXFLwRrB3qVzOH+D
         Od9nMkNT9l03KNdnwdfdMEBb0MylS+Fu24b646IWmZoBab58FFLtzMLMCL6N/x+f8Onq
         mu1NVrDCb8kiVgkB4Fcf1drdKt4Zo9ZdzjHi9w6Nt1gIqgzaNJHBb524KUzEwF+CoJC0
         +CAw==
X-Gm-Message-State: AO0yUKWyJS/vnXDx0efkyCHt2+sacDciELCWSuzUgC1BxaoAZxzdQVM2
        8ZRQ3u+NXCS0QeBXL7vLd6A=
X-Google-Smtp-Source: AK7set/42IPVCWAaMsYAB9bwDcVcDh7Jksp2mYwNWPWVJ2p+80x6EuBENcFdjhOLfnmn6SzKOtwORA==
X-Received: by 2002:a62:1a49:0:b0:5a8:ae60:eb4a with SMTP id a70-20020a621a49000000b005a8ae60eb4amr18780884pfa.28.1677463801027;
        Sun, 26 Feb 2023 18:10:01 -0800 (PST)
Received: from [10.1.1.24] (222-154-147-142-fibre.sparkbb.co.nz. [222.154.147.142])
        by smtp.gmail.com with ESMTPSA id s23-20020aa78d57000000b00593c1c5bd0esm3016071pfe.164.2023.02.26.18.09.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Feb 2023 18:10:00 -0800 (PST)
Subject: Re: Kernel versions 6.x don't boot on Amiga 4000
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <85b92c15482752ca5bbdff6b5f6a720ebbdd3be6.camel@physik.fu-berlin.de>
 <CAMuHMdVgRdJR+a4tooyacg9Wqc-x_U5Oyxkt_axnrncE+AtrUQ@mail.gmail.com>
 <4f45f05f377bf3f5baf88dbd5c3c8aeac59d94f0.camel@physik.fu-berlin.de>
 <CAMuHMdUwh2PPrE37A+TNviU7HB+hPpFmFocJzGxG_sox1=ZGOQ@mail.gmail.com>
 <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
Cc:     linux-m68k@lists.linux-m68k.org, debian-68k@lists.debian.org,
        Finn Thain <fthain@linux-m68k.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <27ac8574-cec3-b093-b6a9-2afd46b7b3fc@gmail.com>
Date:   Mon, 27 Feb 2023 15:09:54 +1300
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUgPXGCHi3E_08iwnfnjkcUpsCwhG985PoX18RvHTjhMA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Geert,

Am 27.02.2023 um 01:52 schrieb Geert Uytterhoeven:
> On Sun, Feb 26, 2023 at 12:02 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Tue, Feb 21, 2023 at 4:53 PM John Paul Adrian Glaubitz
>> <glaubitz@physik.fu-berlin.de> wrote:
>>> On Tue, 2023-02-21 at 15:55 +0100, Geert Uytterhoeven wrote:
>>>> Looks surprisingly similar to the issue reported by Stan.
>>>> Do the mitigations given in
>>>> https://lore.kernel.org/all/CAMuHMdUtkr2zvZiJfLXvs9d_inJbktSNqQQfO1oxnJHZeoYcHg@mail.gmail.com
>>>> help?
>>>
>>> The kernel actually crashes with a backtrace:
>>>
>>> ABCDGHIJK
>>> [    0.000000] Linux version 6.0.0-6-m68k (debian-kernel@lists.debian.org) (gcc-12 (Debian 12.2.0-9) 12.2.0, GNU ld (GNU Binutils for
>>> Debian) 2.39) #1 Debian 6.0.12-1 (2022-12-09)
>>> [    0.000000] Enabling workaround for errata I14
>>> [    0.000000] printk: bootconsole [debug0] enabled
>>> [    0.000000] Amiga hardware found: [A4000] VIDEO BLITTER AUDIO FLOPPY A4000_IDE KEYBOARD MOUSE SERIAL PARALLEL A3000_CLK CHIP_RAM PAULA
>>> LISA ALICE_PAL ZORRO3
>>> [    0.000000] initrd: 0ef0602c - 0f800000
>>> [    0.000000] Zone ranges:
>>> [    0.000000]   DMA      [mem 0x0000000008000000-0x000000f7ffffffff]
>>> [    0.000000]   Normal   empty
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000008000000-0x000000000f7fffff]
>>> [    0.000000] Initmem setup node 0 [mem 0x0000000008000000-0x000000000f7fffff]
>>> [    0.000000] Unable to handle kernel access at virtual address (ptrval)
>>
>> I see the same issue on my A4000, bisecting...
>
> Bisected to commit 376e3fdecb0dcae2 ("m68k: Enable memtest
> functionality") in v5.17-rc1.  Reverting that on top of latest fixes the

What about instead changing the piece of code that you identified as 
problematic in Kars' case to claim/map the last few bits as well 
(memblock_cap_size() to be precise)?

I wonder whether Finn's memtest patch merely exposed another MM bug that 
we don't hit as easily (not without putting memory under a lot of pressure)?

Cheers,

	Michael


> issue.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
