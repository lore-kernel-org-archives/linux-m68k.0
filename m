Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D73CC07E95
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 20:32:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36B1261CBB
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 20:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232456AbhGGUfR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 16:35:17 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:45599 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231266AbhGGUfR (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 16:35:17 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLAZe-1lj96W1B0U-00IBUU for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul
 2021 22:32:34 +0200
Received: by mail-wr1-f46.google.com with SMTP id v5so4572753wrt.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 13:32:34 -0700 (PDT)
X-Gm-Message-State: AOAM533ip87M9vkZiMuU1mNcuPH0w8LnU9wYOX/Jd0XOI32CYRRkgSye
        eFv0m5rnfI+0QQtZZKa4iyNNhXmW7g+kY0MkstY=
X-Google-Smtp-Source: ABdhPJy5VJu6z99q3WHol0nhDN/0Tj/f1dApJZX2WjGYW0msrEn7r8yPypCRoa8aEUTZStmiUyCIyFYosfATXOPW91Q=
X-Received: by 2002:adf:e107:: with SMTP id t7mr30232628wrz.165.1625689953891;
 Wed, 07 Jul 2021 13:32:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210704230137.28915-1-rdunlap@infradead.org> <024360ce-41b2-c072-f399-7e87f516bfd0@linux-m68k.org>
In-Reply-To: <024360ce-41b2-c072-f399-7e87f516bfd0@linux-m68k.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Jul 2021 22:32:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3sqC4nFsP=3cnz-zYjKRLHun5NSgSF31ZJErsYX7yP=g@mail.gmail.com>
Message-ID: <CAK8P3a3sqC4nFsP=3cnz-zYjKRLHun5NSgSF31ZJErsYX7yP=g@mail.gmail.com>
Subject: Re: [PATCH] m68k/coldfire: change pll var. to clk_pll
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uclinux-dev@uclinux.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:8T+dh4twiwzTPF9l429JOuCRsfL3LM/zWXiCRpnpPiy76CphBWP
 JI0yCOUbdzzjFWE++gCC3sr38wmmIRrbJYvri679H4SWXJR24R81IlIze+J5/PaIZu8maes
 1/pR9aDYKalQnFLorztoNZc07pbKY5WLQUAQhPTMdbRzpvCcN34sTsY+2+GsKtxoNmW27lI
 R1cVB4R5N+NkOPjfcQRcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BzEJ72hjk+w=:U2v51JfoDazKaK9L9M1s2F
 tKL1tRr63A+vWlUsVpLDzHP5h8lpMmMnbQlJLn5HRumgP/xGQHefR/KkDp68oNm1NiaGBeLg6
 BIQnGWCdD7Qgcrrk4x44aunxK8FpUHbAWniXh6lap7z6d70qMztB2QqzfRHLtwziZaL2N8MtM
 K5+c+ZskAkps1E0VCfivNQXs8CEx053FMIip/MosAwe0e8lUalpeMcSlBs07lUafwhfP2tk7O
 b/xBDToGzq39DneD1pxMlqmRYo7EWu5b3/YhVCXtW1Xo4NSRqlyj8WfwuKEgkx2q83hODI/xq
 a4RzQDjGSIuD5S20MIIVBHFhDONI5r6jc5+qNo78cBwRNu5ddKCbQ9KfQsOjWklW5KwrtC900
 IhuKCe6sooIZr6DyY8ETXZaK7ykZYNqPz32z4cxqF9EkSAZABKkC25tY66THkqAl2DXcnZ/jQ
 9PKpKeh51GASHXcyQCPZ+l9IsZT5KhIO/RRJuYQZHqE+JhuvYRV7IUN+/xcWDCJtBR/5PVltC
 t7E/11n2J/f7S3ROfIxE2PBDk148rcdOr2K9r1py5LavQglEgzs63J6IzaQjiJELU768/Almk
 62K9CJfgi9HcQ2vs9jz1iFfAAGBVB0Dqyen2/geZpK9aWIShu57kOs1kGtWJg/sgI3ggNNm5T
 hxbLS6gcSSIEtbXzTYbFdDcrKJRC4cyK2/vNpMoVQSbo2sfapR4V1T/hhsVF0/w1VwwgDjI5z
 dgaibh4th0w6GRmpMIK0EYI8/kNJcMGB/A+11BoSLJ/6ZBnx+adioSkC7hSkXft+9aJGj6f+k
 LSVlJ8Tzkn+S1bhhQjvzF+fn1G9vDnVyKMwByE3F4DtCXxehLYadJkfhuUAoc3IRNtKabcW
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 7, 2021 at 2:30 PM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 5/7/21 9:01 am, Randy Dunlap wrote:
> > DEFINE_CLK() makes the variable name be clk_xyz, so variable
> > 'pll' should instead be 'clk_pll'.
> >
> > In file included from ../arch/m68k/coldfire/m525x.c:12:
> > ../arch/m68k/coldfire/m525x.c:29:30: error: 'pll' undeclared here (not in a function)
> >     29 |  CLKDEV_INIT(NULL, "pll.0", &pll),
> >        |                              ^~~
> > ../include/linux/clkdev.h:30:10: note: in definition of macro 'CLKDEV_INIT'
> >     30 |   .clk = c, \
> >        |          ^
> > In file included from ../arch/m68k/coldfire/m525x.c:21:
> > ../arch/m68k/include/asm/mcfclk.h:43:27: warning: 'clk_pll' defined but not used [-Wunused-variable]
> >     43 |         static struct clk clk_##clk_ref = { \
> >        |                           ^~~~
> > ../arch/m68k/coldfire/m525x.c:25:1: note: in expansion of macro 'DEFINE_CLK'
> >     25 | DEFINE_CLK(pll, "pll.0", MCF_CLK);
> >        | ^~~~~~~~~~
> >
> > Fixes: 63aadb77669a ("m68k: coldfire: use clkdev_lookup on most coldfire")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Greg Ungerer <gerg@linux-m68k.org>
> > Cc: linux-m68k@lists.linux-m68k.org
> > Cc: uclinux-dev@uclinux.org
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> Thanks Randy.
>
> Arnd: since this has hit mainline do you want me to pick it up
> in the m68knommu git tree and push to Linus from there?

Yes, that would be good. Sorry I completely missed the bug report and the
earlier fix.

        Arnd
