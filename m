Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F215DC4167D
	for <linux-m68k@archiver.kernel.org>; Mon,  4 Apr 2022 21:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236747AbiDDVk1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:40:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380648AbiDDUu2 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 16:50:28 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131E1D5C
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 13:48:29 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id b24so12536224edu.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 13:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hwk8wNBo32OmqYHy/lorDp6jxAIWbUvyfxVID6NQWMs=;
        b=MgQmlEUX2awo9FGSPrgoUcYWe7XJZtfBcbV29fxnVVbjc3fXXrfVTWrbf2FEFcWonc
         f0aKsGNt8xLswvAf+ZPhMd5j5QzbyREtH5EG01bJE669ZjjMFoCvsLGPKRLoJVuom9dZ
         kYDVGColrzu6iRkzxv5ZReRUd9ML2sggd3BMjTtGMEkH1295xZhX2QGenYIfKlQxetMx
         wEl7pjgvYdNikY+mO/2Nm0tMPt7LhohPkX3Rwa6Aslkud3EOtvKb96eSd5wNJblieh0R
         40OeE78e2N7TGKbSRYTN0wXN/vb0WgldQS9luj+/MJkrgEZ2kqq3FNMc4ahhO48f2+pr
         C7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hwk8wNBo32OmqYHy/lorDp6jxAIWbUvyfxVID6NQWMs=;
        b=kzKX8GF6hmeRWEkGQj8UreYJSzC+z72+/TBvoDt1+A/Oajryvr6kExlkk/9CPNYYFn
         m63nDexcOuefXYBn5pMwDzINL+DYOTcH1fC+aN/mqdg60GQUSJmPKX0h0+7x8XTtKyvx
         MFL89sDDbVsTk+TdpNyUn4V+n2GEdn1D8WbONG8JmlE/61D1PkIumoqcQKo+bPW/uiYH
         zE0E13cd4HR8OAaXytK1DozPym7JsAjZgyhH2SEWaqPg1lOh4oJXEJtvMFsyjvhJ1Z7d
         NSrxFEmGkCajPPmglFL1NRQShg5uLq/+qVmYi0sSuhplcRGuqnbDVKz2q/zAwEatS4q1
         teDQ==
X-Gm-Message-State: AOAM533ZPzdJJ7InbTggzHW371ja4XmuCmlsq6HrnSyD/lxtZttRZ6MC
        7myScYtWDGAuRaXp2PnkfaMwY0aMWxGI2B9EaSA=
X-Google-Smtp-Source: ABdhPJwcTZ56W4jcHhaPz18ivbz2Gd1BIwaysH0yZIitWtcgDhHrV8MgH68GVFQRRYpSZqIgJE5hbn6sHjvo6V1CGTw=
X-Received: by 2002:a05:6402:27d0:b0:419:5184:58ae with SMTP id
 c16-20020a05640227d000b00419518458aemr4939ede.314.1649105307534; Mon, 04 Apr
 2022 13:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <CAMo8BfKgn0T5RtUTb89fPvygNJJYLy7r1=RZTmTTm=jiDfx1hQ@mail.gmail.com>
 <CAK8P3a0J1--WSyWY+TptFa0nn5d-mOxapadCE1csGRkfhSPbVw@mail.gmail.com>
 <CAMo8BfLT8vMw3aGQPs1+9ry7W63SQphmDc4Tt4A3JvADHJhxiQ@mail.gmail.com> <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
In-Reply-To: <CAK8P3a3iFb+ZacZ40d8PC_xcJpLVFXT0Qc-oYEZNkFqXdsfNZw@mail.gmail.com>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Mon, 4 Apr 2022 13:48:15 -0700
Message-ID: <CAMo8BfJJXTTbeiUSgU=FLoDMM89fjybjKO+sPz2wu4f=2obAxg@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Apr 4, 2022 at 12:36 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Apr 4, 2022 at 9:14 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > On Mon, Apr 4, 2022 at 12:01 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Mon, Apr 4, 2022 at 7:57 PM Max Filippov <jcmvbkbc@gmail.com> wrote:
> > > > Please let me know if you observe any specific build/runtime issues.
> > > xtensa-linux-gcc-11.1.0 -DKCONFIG_SEED=
> > ...
> > > /git/arm-soc/arch/xtensa/kernel/head.S: Assembler messages:
> > > /git/arm-soc/arch/xtensa/kernel/head.S:87: Error: invalid register
> > > 'atomctl' for 'wsr' instruction
> >
> > Sure, one cannot use an arbitrary xtensa compiler for the kernel
> > build, the compiler configuration must match the core variant selected
> > in the linux configuration. Specifically, for the nommu_kc705_defconfig
> > the following compiler can be used:
> >
> > https://github.com/foss-xtensa/toolchain/releases/download/2020.07/x86_64-2020.07-xtensa-de212-elf.tar.gz
> >
> > If you build the toolchain yourself using crosstool-ng or buildroot they
> > accept the 'configuration overlay' parameter that does the compiler
> > customization.
> >
> > Perhaps the documentation for this part is what needs to be improved.
>
> It sounds like a bug in the kernel Makefile. On all other architectures,
> you can generally just pick any (recent) compiler and build any kernel,
> as the compiler arguments set the exact target machine type based
> on the kernel config. You can't normally rely on the compiler defaults
> for kernel builds.

It's not just the defaults. The binary instruction encoding is configurable
on the xtensa architecture, configuration overlay replaces parts of
the toolchain that do that.
The additional CPU state is configurable and the kernel gets customized
with the code that loads and stores this state when someone builds it for
a specific xtensa core.
These customizations are done by the users of the xtensa architecture and
there are hundreds of configurations in existence. The toolchain has never
been supposed to support all of them at once.

-- 
Thanks.
-- Max
