Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C728C77B7F
	for <linux-m68k@archiver.kernel.org>; Thu, 11 May 2023 12:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbjEKMgJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 11 May 2023 08:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjEKMgI (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 11 May 2023 08:36:08 -0400
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7FE049C0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 05:36:05 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-559debdedb5so129815747b3.0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 05:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683808564; x=1686400564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bccEgTIv+NuBZ7b0m7HvDAcmdwRNosK16KRrDt/LqxI=;
        b=aw685TvSDkNFKqyBwln5BYFnmN1S6J18NNbjW18I0/MnXR6JYJFjpxS9TYaYJiIuqi
         HYG890CkuhUc/JUX/l5ITOmz//mYiS2wbNYI2pZavKsE3Zn7IKjKkuONC3Ub8a4Xs3YL
         ObPJaSnbadGx0Gc6xtR0bBqZJXdjwggWj890XHjQmWSPRKXFFOluHQE+4WAbZxH+GFYQ
         LRvRQ1f2uwtS+Ner8NeKi2YMkpt2biDXF6b1NpSilCo2c/St36AzSjYvKUR78qU8bMM9
         S4dCJIXSTk8ykbbEuM20Nz/Zxx0b4YeQtiehltzclmWAUIwUEV2Oxq7335MT1535e8z5
         /jyA==
X-Gm-Message-State: AC+VfDz48a6FoOuXiKgBe0BusqWyXTTsq2cbkq7whPyi6FEqnhb+y/AE
        X/VK7uOf9PkxNkdoyqQMGZYgrRdVN48IjA==
X-Google-Smtp-Source: ACHHUZ5RDEKyCvgWEcrPlpeA9OLhOBlgicO5z/463fzrvhJ9TWMk95xv1f7r8vcRtpIzs+aTxJvCPw==
X-Received: by 2002:a81:9c10:0:b0:559:e974:82 with SMTP id m16-20020a819c10000000b00559e9740082mr23814682ywa.20.1683808564538;
        Thu, 11 May 2023 05:36:04 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id m188-20020a0de3c5000000b00560c648ef1esm1898110ywe.72.2023.05.11.05.36.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 05:36:04 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-559eae63801so129597057b3.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 11 May 2023 05:36:03 -0700 (PDT)
X-Received: by 2002:a81:8a05:0:b0:556:1b32:343b with SMTP id
 a5-20020a818a05000000b005561b32343bmr19413336ywg.45.1683808563363; Thu, 11
 May 2023 05:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230510110557.14343-6-tzimmermann@suse.de> <202305102136.eMjTSPwH-lkp@intel.com>
 <f6b2d541-d235-4e98-afcc-9137fb8afa35@app.fastmail.com> <49684d58-c19d-b147-5e9f-2ac526dd50f0@suse.de>
 <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
In-Reply-To: <743d2b1e-c843-4fb2-b252-0006be2e2bd8@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 11 May 2023 14:35:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Message-ID: <CAMuHMdVvR1jdbZS8KoMf4R3zhLRWKv9XbG61iBGOGGZPHB+taA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        kernel test robot <lkp@intel.com>,
        Helge Deller <deller@gmx.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Vineet Gupta <vgupta@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        "David S . Miller" <davem@davemloft.net>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Sam Ravnborg <sam@ravnborg.org>, suijingfeng@loongson.cn,
        oe-kbuild-all@lists.linux.dev,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
        loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Artur Rojek <contact@artur-rojek.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

CC Artur, who's working on HP Jornada 680.

On Wed, May 10, 2023 at 5:55 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, May 10, 2023, at 16:27, Thomas Zimmermann wrote:
> > Am 10.05.23 um 16:15 schrieb Arnd Bergmann:
> >> On Wed, May 10, 2023, at 16:03, kernel test robot wrote:
>
> >> I think that's a preexisting bug and I have no idea what the
> >> correct solution is. Looking for HD64461 shows it being used
> >> both with inw/outw and readw/writew, so there is no way to have
> >> the correct type. The sh __raw_readw() definition hides this bug,
> >> but that is a problem with arch/sh and it probably hides others
> >> as well.
> >
> > The constant HD64461_IOBASE is defined as integer at
> >
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/hd64461.h#L17
> >
> > but fb_readw() expects a volatile-void pointer. I guess we could add a
> > cast somewhere to silence the problem. In the current upstream code,
> > that appears to be done by sh's __raw_readw() internally:
> >
> >
> > https://elixir.bootlin.com/linux/latest/source/arch/sh/include/asm/io.h#L35
>
> Sure, that would make it build again, but that still doesn't make the
> code correct, since it's completely unclear what base address the
> HD64461_IOBASE is relative to. The hp6xx platform code only passes it
> through inw()/outw(), which take an offset relative to sh_io_port_base,
> but that is not initialized on hp6xx. I tried to find in the history
> when it broke, apparently that was in 2007 commit 34a780a0afeb ("sh:
> hp6xx pata_platform support."), which removed the custom inw/outw
> implementations.

See also commit 4aafae27d0ce73f8 ("sh: hd64461 tidying."), which
claims they are no longer needed.

Don't the I/O port macros just treat the port as an absolute base address
when sh_io_port_base isn't set?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
