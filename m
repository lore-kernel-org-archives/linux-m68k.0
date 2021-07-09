Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C75C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 21:19:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3A7C613B7
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 21:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhGIVVw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 17:21:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGIVVv (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 17:21:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1C1C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 14:19:06 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id t30so10153553ljo.5
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 14:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Fbl3aehi5+4hjFv3qRcaRtr1cDEqlTP7TGMVZiIb5s=;
        b=YXYIB+NiNaeYFkiJghjozAgmQ9MVhWyt4fekRsIthacDzJuSZFUWAvbWlXzhYM+sE1
         rstAsMiNFjSud09RxecsTeCQJiFokZ+xlzFRZ6CmxSU5ZUDjmd5naEjubf9lHCsia9xj
         c6nzITo+lVktYetB4u/lOKhhzFgd+LSgZA6Xw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Fbl3aehi5+4hjFv3qRcaRtr1cDEqlTP7TGMVZiIb5s=;
        b=XyX9uVLhV6QJOW/vU3U7w/zjnfc9h/VnbQkdmP2f7u3uMb+rrDzCdhQjE80bPv3m6V
         SZVrazFiqcctxaYuRlFlOEpDM/XVMNBCHL0OXY6E7qSik2GDod37+v0TzOCde30/OJyI
         V3wPmv/KnWIBSvVi1UjBgHvHAwATYuk0Qir6dg/sQtlO5L5PBpocuMnDz7lTJlxWu86z
         D0oT1jzynRVatteXuPOC7wyudp1eSXKS/GRfvCJP5TDOY+VGuMPv/4c8WHnPV0/GtOvu
         UQd6VF31gPvnm1ax9EQMUP/aD2bn3tMssGkiUsZbB9aRsx8ZihucQ1FK1NPTUaNhr+gq
         GSsw==
X-Gm-Message-State: AOAM533tUzcYalWJzvDKP/aYVEGZ5s8QNtpdVoMdXwcPDLVfYuMC3s4F
        PaVLQlak0EahtigN19SjrWkD/Hu2Iqujk6e9
X-Google-Smtp-Source: ABdhPJy0SGmww0Xk1I1D05EMLtn5asJgA4i1SMuOMCwenc+1RJLcu8eeEUatIVW0moO2LMdjSlgP6g==
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr30241955ljj.411.1625865544708;
        Fri, 09 Jul 2021 14:19:04 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id e12sm715048lji.90.2021.07.09.14.19.03
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 14:19:04 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id y42so25931147lfa.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 14:19:03 -0700 (PDT)
X-Received: by 2002:a19:7d04:: with SMTP id y4mr29766556lfc.201.1625865543757;
 Fri, 09 Jul 2021 14:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com> <20210709085324.GA23590@lst.de>
 <061de3e3-91df-2c23-116f-250f579a664e@gmail.com> <CAMuHMdVWuHfHdNjMLq1LG0cQ0jq2w-XodvJPOK+Q4Dhy807fuA@mail.gmail.com>
 <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com> <CAHk-=whZOcS31_rKL6BBg7Ln5hqvO=ZiFm8MCmvAHZe8F_Acrg@mail.gmail.com>
 <144440f4-741e-c305-2a8f-b9c1a02e1aa7@gmail.com>
In-Reply-To: <144440f4-741e-c305-2a8f-b9c1a02e1aa7@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 9 Jul 2021 14:18:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjNcVijop--SC6XABVH675jr8oZ0XACbeXZX-j5QTtxjQ@mail.gmail.com>
Message-ID: <CAHk-=wjNcVijop--SC6XABVH675jr8oZ0XACbeXZX-j5QTtxjQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 9, 2021 at 2:08 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> The 8 byte copies are by far the majority.

llseek might actually not be unusual. And the timeval structure is - I
think - 8 bytes on 32-bit architectures and common for select timeouts
etc. And select/poll can be one of the most common system calls out
there depending on loads (usually graphical programs).

But again - I don't think it's even worth worrying about in
architecture code. If you actually can measure it, I think we should
fix it in generic code rather than have architectures work around some
issue one by one.

I think the main issue for m68k should be "is it stable and works". At
least first. And then worry about copy_to/from_user() with a constant
size as a very very distant second concern.

              Linus
