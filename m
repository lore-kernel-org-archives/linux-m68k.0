Return-Path: <SRS0=WB/I=7O=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695B2C433DF
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 09:13:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 440F8206E2
	for <linux-m68k@archiver.kernel.org>; Mon,  1 Jun 2020 09:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgFAJNG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 1 Jun 2020 05:13:06 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37111 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFAJNF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 1 Jun 2020 05:13:05 -0400
Received: by mail-ot1-f66.google.com with SMTP id v13so609210otp.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 01 Jun 2020 02:13:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlOPT56h6/JCVyC/ykPNuYWjyEpIi1l0BN1rPEqbUPk=;
        b=dIshVq9k/rMljR+e1KZiydvGgyKgBBG6E6+stjDb3E9bDYCLWiug5zGaJwQp0dQEcb
         /E4Ci2mHV1racUyfJMI0KlH9wew+w0cz/qlDOhnAYqTY3DOAPUE0m39RRQBXkJKFIiDf
         +x/vV/Gd2zAJpBT8n2ASN5c9SSTZxRL00txDi/ueZ3B5Hg2dXjMmxdZp8xrOQldLwMl0
         fQnFY3v2LvDavzf2m5wUsk6NNScLWQt8AwpND+CFxOrm8y4g97d4vtPCId1VLbRRmicf
         Czr8BCMwAjyutxC+Ic4uFtFdemFZkwN/75vCdr3xOCbpsT5iJibf4OB1OfzvutzryVHm
         gKHg==
X-Gm-Message-State: AOAM530IN7GKBlkuLOQYLNuBpuvKu0Y/ZbXAW/YjTbpdlRLYorVH3x1T
        YaU7MwV7npb671C4gv0934NrmlXQfiXAZCvKYHI=
X-Google-Smtp-Source: ABdhPJycnrO6S08ZVNAUz71DZKIbHz0tp5g1FNVtTPGR441oaBdHIHUOnsXiHZ992Gann3uIDUPazeuir0lHRiVw2fo=
X-Received: by 2002:a9d:7e92:: with SMTP id m18mr15598801otp.145.1591002784675;
 Mon, 01 Jun 2020 02:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590880623.git.fthain@telegraphics.com.au>
 <0fb7fdcd99d7820bb27faf1f27f7f6f1923914ef.1590880623.git.fthain@telegraphics.com.au>
 <CAMuHMdUjrFDob01EWC4e04tAkj5JTm_2Ei5WsPqN1eGDz=x3+Q@mail.gmail.com> <alpine.LNX.2.22.394.2006011006080.8@nippy.intranet>
In-Reply-To: <alpine.LNX.2.22.394.2006011006080.8@nippy.intranet>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 1 Jun 2020 11:12:52 +0200
Message-ID: <CAMuHMdVs8ur9pWWEFbYmPLRgdH67coSSrPO0QE8RqFvKjhgyYg@mail.gmail.com>
Subject: Re: [PATCH 8/8] macintosh/adb-iop: Implement SRQ autopolling
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joshua Thompson <funaho@jurai.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Finn,

On Mon, Jun 1, 2020 at 2:15 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> On Sun, 31 May 2020, Geert Uytterhoeven wrote:
> > On Sun, May 31, 2020 at 1:20 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > >  arch/m68k/include/asm/adb_iop.h |  1 +
> > >  drivers/macintosh/adb-iop.c     | 32 ++++++++++++++++++++++++++------
> >
> > As this header file is used by a single source file only, perhaps it
> > should just be absorbed by the latter?
>
> Sure, it could be absorbed by both asm/mac_iop.h and
> drivers/macintosh/adb-iop.c but I don't see the point...

asm/mac_iop.h doesn't include asm/adb_iop.h (at least not in my tree,
but perhaps you have plans to change that?), so there's only a single
user.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
