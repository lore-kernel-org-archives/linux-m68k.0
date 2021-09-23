Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62B8C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:43:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A082E610C9
	for <linux-m68k@archiver.kernel.org>; Thu, 23 Sep 2021 14:43:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241734AbhIWOpY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 23 Sep 2021 10:45:24 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:41717 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241731AbhIWOpX (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 23 Sep 2021 10:45:23 -0400
Received: by mail-vs1-f54.google.com with SMTP id az15so6760695vsb.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 23 Sep 2021 07:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocmWBy5EYqhzDku3sEqRq+XF89g3KCCaraUmmsxvZxA=;
        b=oq+hIt02FQ5t38yWs2tbVP3dPpLP7n6NopPr7aTJCygzaXuX4Nn69cOZoRLT9henNJ
         sdomOARPBEA6CpC7V5STbfl2adEvZ7piTnLqHFxPnwKiKjKlWZQVDNbfCr7zyQ24FTNv
         iNcxpxPktqA0mm3vOOfElHhURcbcGKvVnnNcpmvA2dli67BjNbux65axFkTKMGfPU6Wh
         mXHiiaaH3C5SHOcHKwxSy/Sh7S1jgcPtnOP3JPO3lpBvMIN45FEJ8+jvQ0HytNRAKM4X
         XsbGBrdxbgi0qnVNy+CkFEyYkFmsDAdSwpgm42Foqya3v4MG6ayQmDWnOUC8bKAWEyek
         FRMA==
X-Gm-Message-State: AOAM530GQdvjcnJ+3g23zgxmrBmfQu50JbCyOwqYXAiZBas0p95MGq7B
        3s3tDPeSX70HicGywJrB9QDhMd+qYzUlKV/6qQ8=
X-Google-Smtp-Source: ABdhPJxVhNFaORbf/Sq8uI+nB2u48TKxPHs/r33zxy4poRdxsbqJ+ea+JNouH2QmknckwzzAzeQwY/bmL25nCKAEo7c=
X-Received: by 2002:a05:6102:2086:: with SMTP id h6mr4418320vsr.50.1632408230604;
 Thu, 23 Sep 2021 07:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk> <89b7f0e5-21a5-5828-1eb8-5119fb8e2d58@linux-m68k.org>
In-Reply-To: <89b7f0e5-21a5-5828-1eb8-5119fb8e2d58@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 23 Sep 2021 16:43:39 +0200
Message-ID: <CAMuHMdVMbo5868XxW5Lk6tiX3qY0drevfjv9TjMNmbrLrbAPig@mail.gmail.com>
Subject: Re: [RFC][CFT] signal handling fixes
To:     Finn Thain <fthain@linux-m68k.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Thu, Sep 16, 2021 at 11:03 AM Finn Thain <fthain@linux-m68k.org> wrote:
> On Sun, 25 Jul 2021, Al Viro wrote:
> > ...
> >
> > PS:  FWIW, ifdefs in arch/m68k/kernel/signal.c are wrong - it's not !MMU
> > vs. coldfire/MMU vs. classic/MMU.  It's actually 68000 vs. coldfire vs.
> > everything else.  These days it's nearly correct, but only because on
> > MMU variants of coldfire we never see exception stack frames with type
> > other than 4 - it's controlled by alignment of kernel stack pointer on
> > those, and it's under the kernel control, so it's always 32bit-aligned.
> > It used to be more serious back when we had 68360 support - that's !MMU
> > and exception stack frames are like those on 68020, unless I'm
> > misreading their manual...
> >
>
> I don't claim to understand this code but CPU32 cores appear to be
> unsupported on either #ifdef branch: the MMU branch due to CACR and CAAR
> used in push_cache(), and the !MMU branch due to frame format $4 used in
> adjust_format().
>
> The CPU32 Reference Manual appendix says these chips only supports control
> registers SFC, DFC, VBR and stack frame formats $0, $2, $C.
> https://www.nxp.com/files-static/microcontrollers/doc/ref_manual/CPU32RM.pdf

As of commit a3595962d82495f5 ("m68knommu: remove obsolete 68360
support"), nothing selects MCPU32 anymore.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
