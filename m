Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92C4C07E99
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 19:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9159C613CA
	for <linux-m68k@archiver.kernel.org>; Fri,  9 Jul 2021 19:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGIT4p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGIT4o (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 9 Jul 2021 15:56:44 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE416C0613DD
        for <linux-m68k@lists.linux-m68k.org>; Fri,  9 Jul 2021 12:53:59 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id s18so9816211ljg.7
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HZ2TvzeuxI7330WegmtMIRZBCthwaftQ6md9Y6mXrJw=;
        b=drhqQvk4wPEsmsN9Z6Hbs6M9f+f9nnUgApkeJK5iPKOcQ0U2mJe+tSTLyK7FOk4Gmm
         /Fd6zjNNE46i0sOVTRL3Oba3THu44ZO693/sBYhb+lb/mRqfbznY8In0SrxuFwNlIJvU
         a/GWWoyeTyHydqi3c+eqymE6aIv2MmUuAqzJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HZ2TvzeuxI7330WegmtMIRZBCthwaftQ6md9Y6mXrJw=;
        b=mKwgkdlZ8/Ftwon/qesw/FBj5efUbMOaqqlxGpBBxhkViigKmO+5JJPprSiwbBIz+b
         L2QF0PEEL1z8rqlMecU2uQIhKjWyEI6gdxN9L3pzIFck5Y+CJma2RNZ3C9KwR6BaGxnF
         3xr3/brDpPfChgm0IZC6mGpgLwAcbuCyM2noL7IRr6IpWQ2bgcBHgQesPVioswNQSbex
         6gcuA5MPFykG1IGwjcTxKAUkToDDYGSBtwEUMvLAwZ2lVdA+CHf69Mb2B2uYmYvaUCHP
         Tfufh7XIt9Iq+wxvKPDljaIJllToFD/mWluoy9FVthtKeC0pjPKGDOf7bpQVg4S/ZyJE
         5NRA==
X-Gm-Message-State: AOAM531kPC2ZWSUKMsHOnIV0oZyopHqSGm1pgU2SBt5i6NQR5XoApzo4
        BqQUwta+0Ujw/ZIkp+iuYdRPxhsn9OinpFeb
X-Google-Smtp-Source: ABdhPJw1FMM5SAFUGha2Bjgy/xrF5Qfl9tUsoFt+N5KW3Hm04Bv/7XTtGLTUWgTp2vqVUQ4u2E+zPQ==
X-Received: by 2002:a2e:9dc8:: with SMTP id x8mr29852331ljj.483.1625860438003;
        Fri, 09 Jul 2021 12:53:58 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id t24sm520151lfb.76.2021.07.09.12.53.57
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jul 2021 12:53:57 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id z9so9810805ljm.2
        for <linux-m68k@lists.linux-m68k.org>; Fri, 09 Jul 2021 12:53:57 -0700 (PDT)
X-Received: by 2002:a2e:b55b:: with SMTP id a27mr20002127ljn.251.1625860437081;
 Fri, 09 Jul 2021 12:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210708043145.GB17672@lst.de> <38991687-7b33-994b-b7d3-22400872a45a@gmail.com>
 <20210708045804.GA18249@lst.de> <147ffcbd-f946-bb6c-b7bc-35c0672572ce@gmail.com>
 <20210708125751.GA11898@lst.de> <bf4ad0a4-5cd4-4e82-8513-64ab47d5e522@gmail.com>
 <21557cf4-e1a7-69c3-7c67-c7d4e5a6fbf7@gmail.com> <20210709042219.GA13558@lst.de>
 <CAMuHMdVu-GU55bR60yEfWunGm1NiGL6bxS2eM5hHJtWyKxiW9Q@mail.gmail.com>
 <1a3c9c70-1858-0f95-56a4-b0bd82fc7045@gmail.com> <20210709085324.GA23590@lst.de>
 <061de3e3-91df-2c23-116f-250f579a664e@gmail.com> <CAMuHMdVWuHfHdNjMLq1LG0cQ0jq2w-XodvJPOK+Q4Dhy807fuA@mail.gmail.com>
 <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com>
In-Reply-To: <d3f23781-1968-d936-2a1a-6d964dbcb860@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 9 Jul 2021 12:53:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZOcS31_rKL6BBg7Ln5hqvO=ZiFm8MCmvAHZe8F_Acrg@mail.gmail.com>
Message-ID: <CAHk-=whZOcS31_rKL6BBg7Ln5hqvO=ZiFm8MCmvAHZe8F_Acrg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] m68k: remove get_fs()/set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 9, 2021 at 12:26 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> WARNING: CPU: 0 PID: 854 at ./arch/m68k/include/asm/uaccess.h:303
> vt_do_kdsk_ioctl+0x38/0x28a

It's apparently the

        if (copy_from_user(&kbe, user_kbe, sizeof(struct kbentry)))

which is 4 bytes in size.

Honestly, it could be done with a get_user(), but it could also just
be ignored. We're not talking performance-sensitive code here.

x86 got rid of the constant-sized user copy games not because they
don't exist, but because they just weren't worth the pain.

If somebody really wants to do it, then I suspect it would be better
to special-case the 1/2/4/8 byte case in generic code, than have
architectures special-case the odd sizes.

But it really shouldn't matter.

On x86, we found that

 (a) inlining get_user() was bad, because it just caused lots of
duplicated code for the range checks.

 (b) turning copy_to_user() into get_user() didn't really matter and
caused tons of duplicated code

 (c) the (few) places that cared about performance should use neither,
and should use "uaccess_begin() + unsafe_get_user() + uaccess_end()"
because the reason they mattered was that they ended up doing multiple
accesses and the overhead was elsewhere.

Of course, on x86, the big reason for (c) is that the biggest cost
often ends up being the "enable/disable user space accesses" overhead,
which is about security and a feature that m68k doesn't have.

So the trace-offs are certainly a bit different on x86, but on the
whole I suspect the lessons from x86 are not wrong.

               Linus
