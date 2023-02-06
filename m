Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D92AC63797
	for <linux-m68k@archiver.kernel.org>; Mon,  6 Feb 2023 12:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjBFMIi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 6 Feb 2023 07:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjBFMId (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 6 Feb 2023 07:08:33 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4310222F8
        for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Feb 2023 04:08:23 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id z5so12404720qtn.8
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Feb 2023 04:08:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=02Ztaz85YCyWse0OOUudyylXWESo7R0bW8bc2JlaDZc=;
        b=p5jOW4FMtMUPpZzZQIGzjxfrW+gJYE2iP2IrvtFk3hOufPeNmGOwjwRmJautl0mxjH
         bLfe6RUn/Iu7J2wjjRiWm4UhIRpA2SjSmx7dyOGCzah9lqVFRI8BVitiXnh/IChS1B9S
         MTDnWutO9OfE0fXVDTEinXlaeGavu0nrCAZwljKW2U8MD4cGV7MlIdra6GcenA4nRHFA
         PUmpGMNXV3G6DV7k2ET6z8cBK1Uz19D5cV1zBCKnvHxIm3oFj9BbyCU0bv9rbdp9Ilwc
         KTBfqF4N+sBV9fRUFZqpgmNsKcZAWW2mosZSrk5FBIWRnzVYwAEjRnXax4qzNYGhzXW+
         ivkg==
X-Gm-Message-State: AO0yUKW1Vlb5oqRvxnbx8grPe9mZIpXF++lNlGhtBIhlRwza8MHSaKF1
        n5WXYndlOi7M+mOwa+Tuy1nmQVGIiAQ6Tg==
X-Google-Smtp-Source: AK7set9rMLuzQtUevK2c49aE7TEMYEM615D0xBNjF7wNQG/z6Lt3+QvxG4V9FY9VIb5Tu0zJxNfRQQ==
X-Received: by 2002:a05:622a:1aa1:b0:3a9:8842:5860 with SMTP id s33-20020a05622a1aa100b003a988425860mr36201152qtc.45.1675685302026;
        Mon, 06 Feb 2023 04:08:22 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id b13-20020ac801cd000000b003a6a19ee4f0sm7125924qtg.33.2023.02.06.04.08.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 04:08:21 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id q4so9464807ybu.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 06 Feb 2023 04:08:21 -0800 (PST)
X-Received: by 2002:a25:e912:0:b0:8a0:2a4:a96c with SMTP id
 n18-20020a25e912000000b008a002a4a96cmr214639ybd.380.1675685301223; Mon, 06
 Feb 2023 04:08:21 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <Y9pD+TMP+/SyfeJm@FVFF77S0Q05N>
In-Reply-To: <Y9pD+TMP+/SyfeJm@FVFF77S0Q05N>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Feb 2023 13:08:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtU=2Uq2QDu+eiBLve=uwJ4byU_1K2dKuUTH8wDUHoaw@mail.gmail.com>
Message-ID: <CAMuHMdWtU=2Uq2QDu+eiBLve=uwJ4byU_1K2dKuUTH8wDUHoaw@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Mark,

On Wed, Feb 1, 2023 at 11:52 AM Mark Rutland <mark.rutland@arm.com> wrote:
> On Tue, Jan 31, 2023 at 08:02:51PM +0000, Al Viro wrote:
> > On x86 it had been noticed and fixed back in 2014, in 26178ec11ef3 "x86:
> > mm: consolidate VM_FAULT_RETRY handling".  Some of the other architectures
> > had it dealt with later - e.g. arm in 2017, the fix is 746a272e44141
> > "ARM: 8692/1: mm: abort uaccess retries upon fatal signal"; xtensa -
> > in 2021, the fix is 7b9acbb6aad4f "xtensa: fix uaccess-related livelock
> > in do_page_fault", etc.
> >
> > However, it never had been done on a bunch of architectures - the
> > current mainline still has that bug on alpha, hexagon, itanic, m68k,
> > microblaze, nios2, openrisc, parisc, riscv and sparc (both sparc32 and
> > sparc64).  Fixes are trivial, but I've no way to test them for most
> > of those architectures.
>
> FWIW, when I fixed arm and arm64 back in 2017, I did report the issue here with
> a test case (and again in 2021, with maintainers all explciitly Cc'd):
>
>   https://lore.kernel.org/lkml/20170822102527.GA14671@leverpostej/
>   https://lore.kernel.org/linux-arch/20210121123140.GD48431@C02TD0UTHF1T.local/
>
> ... so if anyone has access to those architectures, that test might be useful
> for verifying the fix.

Thanks a lot! This showed the problem on m68k, and confirmed Al's fix.

I'll give it a try on a few more systems later...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
