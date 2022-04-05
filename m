Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61B3C4332F
	for <linux-m68k@archiver.kernel.org>; Tue,  5 Apr 2022 03:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbiDEDZu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 4 Apr 2022 23:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbiDEDZt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 4 Apr 2022 23:25:49 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7DB4474E
        for <linux-m68k@lists.linux-m68k.org>; Mon,  4 Apr 2022 20:23:50 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id t7so9449371qta.10
        for <linux-m68k@lists.linux-m68k.org>; Mon, 04 Apr 2022 20:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qApr9GrihVbOuWIYXrsrRfMhvE7Z9/nCtDMkcpQr1HA=;
        b=OUL2erKbptx3OSEXn+FNiSDEclLx26+4Q9s4Yc0HFFg2NowwbEnAZPwFjtfFoQXFSD
         HGr3WZcWj0bwCYYGq+VQH3lNm19kHiCLCcgHpy3MWFLUkJdqXzzsA6T3FCzHLz4UT2GP
         u+NVUKCBFvqmXaoDydp6uOSzgkS3i+tqmaGAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qApr9GrihVbOuWIYXrsrRfMhvE7Z9/nCtDMkcpQr1HA=;
        b=fZbYAkLayaypeV49+cYftVYb+kMB2B3fK6m3Y0W25eQ9IVVZwCisr4l1lGMdBTIVU/
         c2b8+1oZi2M6NjRKWEpsb4x+NsKV0h7zNFGXmLkSNnumb27YFwAdS5VL/O3lbRlsmum6
         qhgP6cUVYwWejznyskhhtfPMA0VhFqi9fWaHCVWPDD2AAjvmDuLqeZFo9bffNpQM+bFN
         OwZtIW1oaRyY7M7Cvecj3ikvT2Sbg1P3ie4Z5h8M9ZRJFaUCq3rh/gGu/NceP3SzYlHD
         U0LFOyYpnypxoBMU9TWUWc/AFm5XZt9e27G6hDHWsRVPZYQkb7nZI/hSOK825Vfvu6pz
         qcqA==
X-Gm-Message-State: AOAM530DdpLm/8YnOqHzMVBsN9EGkkXZoSEL8bU1SaCNVPdMoCsrO9L5
        UV4fbJpafsE4FoJUEGZufUTT7HwCCUyCko5bgg73qg==
X-Google-Smtp-Source: ABdhPJwynqhZqs8C04npxIC6XvYVeW6E//MMWg7Ai+dGctLoCRwKSkiHu3j/uCEqqA2vWJ4U1/uhkuomufhsrlhjYio=
X-Received: by 2002:a05:622a:110c:b0:2e1:fe6b:2f26 with SMTP id
 e12-20020a05622a110c00b002e1fe6b2f26mr1251546qty.201.1649129029903; Mon, 04
 Apr 2022 20:23:49 -0700 (PDT)
MIME-Version: 1.0
References: <Yib9F5SqKda/nH9c@infradead.org> <CAK8P3a1dUVsZzhAe81usLSkvH29zHgiV9fhEkWdq7_W+nQBWbg@mail.gmail.com>
 <YkmWh2tss8nXKqc5@infradead.org> <CAK8P3a0QdFOJbM72geYTWOKumeKPSCVD8Nje5pBpZWazX0GEnQ@mail.gmail.com>
 <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
In-Reply-To: <6a38e8b8-7ccc-afba-6826-cb6e4f92af83@linux-m68k.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Tue, 5 Apr 2022 12:23:39 +0900
Message-ID: <CAFr9PXkk=8HOxPwVvFRzqHZteRREWxSOOcdjrcOPe0d=9AW2yQ@mail.gmail.com>
Subject: Re: [RFC PULL] remove arch/h8300
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Max Filippov <jcmvbkbc@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Mon, 4 Apr 2022 at 22:42, Greg Ungerer <gerg@linux-m68k.org> wrote:
> But we could consider the Dragonball support for removal. I keep it compiling,
> but I don't use it and can't test that it actually works. Not sure that it
> has been used for a very long time now. And I didn't even realize but its
> serial driver (68328serial.c) was removed in 2015. No one seems too have
> noticed and complained.

I noticed this and I am working on fixing it up for a new Dragonball
homebrew machine.
I'm trying to add a 68000 machine to QEMU to make the development
easier because I'm currently waiting an hour or more for a kernel to
load over serial.
It might be a few months.

It looked like 68328serial.c was removed because someone tried to
clean it up and it was decided that no one was using it and it was
best to delete it.
My plan was to at some point send a series to fix up the issues with
the Dragonball support, revert removing the serial driver and adding
the patch that cleaned it up.

Cheers,

Daniel
