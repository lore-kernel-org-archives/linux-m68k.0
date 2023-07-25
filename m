Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8512C001DF
	for <linux-m68k@archiver.kernel.org>; Tue, 25 Jul 2023 07:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbjGYHB0 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 25 Jul 2023 03:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbjGYHBZ (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 25 Jul 2023 03:01:25 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A49EBD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:01:24 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-579dfae6855so62180757b3.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690268483; x=1690873283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wrV8BENYnGORKdS4vgD7b+lqOUrC2yAH0JZ96wBatHs=;
        b=U0sBFZPwLwRpAbWzsMjZzuf1tA2/sw/jyHnoyYltntp+yvzDk32uUDUMNpuisc94ma
         JAU0rHxwoZH1YeRXmZmNJAATQqolw/9dGXSnW1jbipulXEUkPoKyCIM8XaJBbm2jPTOP
         gEsy+bimeF9Dpw/7iOUdFkESpnO3P1VZ1of1YrE/uVHSnqV+fH4E+sgV0GuRSj6p3KI7
         KSAk7sGxzQSY17cBHptRwE3OnLMN5Zq5lFv0AHc/Ip7VbGGasli3TS1HhqWlPdBQE+tl
         8w1lNgkEDcwDtMKeKPHNXrXVP9D4RF83GLwtUp0YQAnRnmlyoKpW4i/R97TImKnJgUs6
         ii+g==
X-Gm-Message-State: ABy/qLbDvHc9kC3AiXrvgJkfV6ALJfLaj8lj5UIgMMahnn+SLD1Iw7Z+
        Ty93NP8hmxxdhBCPrMiaHjVYw7KOtRPXcg==
X-Google-Smtp-Source: APBJJlEkvg0FKiOn6E0BL6M/UMX0N7ILPx4JQtdQVSUgaQVEk6DVZeNw4D1eqOIk5RYi2rivqXUGFQ==
X-Received: by 2002:a0d:cb08:0:b0:579:efbb:cbe3 with SMTP id n8-20020a0dcb08000000b00579efbbcbe3mr9299268ywd.43.1690268482842;
        Tue, 25 Jul 2023 00:01:22 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id y128-20020a81a186000000b0058419c57c66sm608721ywg.4.2023.07.25.00.01.22
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 00:01:22 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d075a831636so3565601276.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 25 Jul 2023 00:01:22 -0700 (PDT)
X-Received: by 2002:a25:e7ca:0:b0:d0c:753:11d0 with SMTP id
 e193-20020a25e7ca000000b00d0c075311d0mr5880999ybh.64.1690268481914; Tue, 25
 Jul 2023 00:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <ZIyBaueWT9jnTwRC@decadent.org.uk> <CAMuHMdW4deu65FdW7qGSYoQDLWmjqcz_oReQY+GKS-EtxERFJQ@mail.gmail.com>
 <c828c0f32beec48e9f7c628fc8cbe2dcfb19cea1.camel@decadent.org.uk>
In-Reply-To: <c828c0f32beec48e9f7c628fc8cbe2dcfb19cea1.camel@decadent.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jul 2023 09:01:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEGPpLWUGm5OoyVOqs3JPrrX+0WcNsivH5yWNBB-XCuA@mail.gmail.com>
Message-ID: <CAMuHMdWEGPpLWUGm5OoyVOqs3JPrrX+0WcNsivH5yWNBB-XCuA@mail.gmail.com>
Subject: Re: [PATCH] m68k: Fix invalid .section syntax
To:     Ben Hutchings <ben@decadent.org.uk>
Cc:     linux-m68k@lists.linux-m68k.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Ben,

On Mon, Jul 24, 2023 at 7:37 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> On Mon, 2023-07-24 at 14:58 +0200, Geert Uytterhoeven wrote:
> > On Fri, Jun 16, 2023 at 5:47 PM Ben Hutchings <ben@decadent.org.uk> wrote:
> > > From: Ben Hutchings <benh@debian.org>
> > >
> > > gas supports several different forms for .section for ELF targets,
> > > including:
> > >     .section NAME [, "FLAGS"[, @TYPE[,FLAG_SPECIFIC_ARGUMENTS]]]
> > > and:
> > >     .section "NAME"[, #FLAGS...]
> > >
> > > In several places we use a mix of these two forms:
> > >     .section NAME, #FLAGS...
> > >
> > > A current development snapshot of binutils (2.40.50.20230611) treats
> > > this mixed syntax as an error.
> [...]
> > I verified there is no difference in the generated object files with my
> > current toolchain (GNU assembler version 2.38 (m68k-linux-gnu)
> > using BFD version (GNU Binutils for Ubuntu) 2.38).
> >
> > Do you think it's worthwhile to fast-track this for v6.5, or is it fine to
> > queue this for v6.6?
>
> The new version of binutils has been in Debian unstable for over a
> month now.  I think this should be fast-tracked.

OK, PR sent.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
