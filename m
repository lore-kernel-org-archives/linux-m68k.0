Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2832C17445
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 19:33:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4FD0222C6
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 19:33:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbfKKTdh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 14:33:37 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:56433 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727349AbfKKTdg (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 14:33:36 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MaInF-1iQgZ94B1h-00WBaX for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 20:33:35 +0100
Received: by mail-qk1-f174.google.com with SMTP id d13so12234741qko.3
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 11:33:34 -0800 (PST)
X-Gm-Message-State: APjAAAXEmg36yN3W8DXA4GjCWhSJBUv5+Fr+0vHZzipWt3q8Q0qxNY8O
        7TalcCMFFHQkr+BkfwwxWeHAx2WaKkmbBLQGbHM=
X-Google-Smtp-Source: APXvYqzRT3LvGe5JvZLYKm1upZpHxk2xc9ns43ZUwTpi/JlFXD7dYhA8+4Mt4XVDG2f3/qLjEL/Ms2I9EThmbgvV8Jg=
X-Received: by 2002:a37:58d:: with SMTP id 135mr2321779qkf.394.1573500813881;
 Mon, 11 Nov 2019 11:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-11-hch@lst.de>
 <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
 <20191111101531.GA12294@lst.de> <CAK8P3a0rTvfPP2LUMw8EC0xz5gfZP5+NUkoaZBJrtYYfr6YRig@mail.gmail.com>
 <20191111102923.GA12974@lst.de>
In-Reply-To: <20191111102923.GA12974@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 20:33:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2b=td4JhYOcK1jUshh8Mp-5_w4v+dAr_JjnH783=ptBQ@mail.gmail.com>
Message-ID: <CAK8P3a2b=td4JhYOcK1jUshh8Mp-5_w4v+dAr_JjnH783=ptBQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] asm-generic: ioremap_uc should behave the same with
 and without MMU
To:     Christoph Hellwig <hch@lst.de>
Cc:     Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        "moderated list:NIOS2 ARCHITECTURE" 
        <nios2-dev@lists.rocketboards.org>, openrisc@lists.librecores.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:zvLar+3tH1XL0ypAT7phC5Uev7dWVVWv1XeLHbheHXIeBGvIlSp
 xRmc2nApGopo28JC4bLrpJHUKBIFmJeGOLp+oT5kgWXYlOgX0VLZGZLcgaCIAioziwAsK2c
 0FAWmUdIcAu+J9cC4ZoqondMCor1xZx/1Ti2Mxu+00WD3oD5CiRKiMrvslTkM7AfF/PpieK
 lezmJ8WkGbcK1dxbBy66Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:txGQPgFcYOs=:Z7wBVcPEEs8Klg9OvAHflT
 hpaT2F7w7Sn7mKw7/qhdooliswUscloyKU1QQWvnxQ01drOmejpoMKImsTga4O7I+pIml4/c1
 rgq4HYGAnCQcH7RI1u1XHxXaHEP3F85dGURC5d8vCd8ni9v9lOkHoxRBN09sy/fInTG0SaS+E
 livKXGY1xNeActKAanJUAKeVvxoJGjjyMR3hkH4XBgxS+2XpuiKgbZpmE/weJwvxoPvvg8/yI
 3MaXQctMhjNZpvkPvO5biGM8X/gtOz+RcxRtIbjhmQbMLe2WDk0+50JNnjBrJI0k/NDo24xf7
 xda8nFwIbNG5ExCwEwPFKQfJmMtGstV5GB19BukJJPArEWSya7Zl+lD07dBHC5jw+a0qNuPBN
 tMIpMUs6yQHM+o86NcjsVt5eEEy5X626oK6jVMv8Nvi3C8YvYZStGXCkmb8y8aZVyBVQi2T6H
 OdKJGWda5ZquO24df4YHsCjSKJsmUHQi2WSA4RaM0jcj9F0p+9b8JPkbYSShe2nY7P7a+z05r
 y+rZwX7ocLrqSgDwRQrcL7s7Tg/7Brx079lnC8Hi9ltJNr4VidR+UbxER3YMCtx0X2+RwFjUg
 SD4HAmJDA9SQ7PpDn8s/9QhkTnkknwaQY+WGVN5CvEAtXWMNANm6WJzUHlOq67b87hJ3Km4R1
 qyEI6p8ocx+hg62y1MHQUEtvHMdcRWX5OvNczcwx2Hz7X0S2M0xcu1rNGlmuZeg0trfMhm8GS
 /mqZCM+NLHpyw0v6ZIpL5n7SkdY2ubDXQgzd8zRgc5Rtq6w9DWGzRj2jSdJ4FJYW3vjB/fef1
 11cnRV5+ZC4SKONIv/kTkdvsFhsMDFfokE15EkJCHe90Yi02yOppLKRyHbYVNVkgYe/ZuWHAg
 u6FKce4fvaholemfH2Sw==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Nov 11, 2019 at 11:29 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Nov 11, 2019 at 11:27:27AM +0100, Arnd Bergmann wrote:
> > Ok, fair enough. Let's just go with your version for now, if only to not
> > hold your series up more. I'd still suggest we change atyfb to only
> > use ioremap_uc() on i386 and maybe ia64. I can send a patch for that.
>
> I don't think we even need it on ia64.  But lets kick off a dicussion
> with the atyfb, x86 and ia64 maintainers after this series is in.
> Which was kinda my plan anyway.

I missed your reply and already sent my patch now. I guess it doesn't
hurt to discuss that in parallel. Anyway I think that this patch is the
last one you want an Ack from me for (let me know if I missed one), so

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
