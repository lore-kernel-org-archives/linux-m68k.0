Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296D9C64EC7
	for <linux-m68k@archiver.kernel.org>; Tue, 28 Feb 2023 08:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbjB1IIl (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 28 Feb 2023 03:08:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjB1IIk (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 28 Feb 2023 03:08:40 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED3A93F4
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 00:08:39 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id c3so5275848qtc.8
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 00:08:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WL/jrQNKXvTvaZY1BaF93G6j0wS69LVbNQ25PHOYZx8=;
        b=CjAvwIgCdzZ+g84KPqJH/2GplEPNKYmjcxm5CEcSn7TcZieW6rt7vsDDDTpuz77yW2
         83LfF3mB17J/eOZgLsa6sfKB0jKoAV+KfUNXQJxNjOI7bCga/JOEZYuvsT2aCd9LKllq
         Y9pwB/+KwHh4VALG2YeBikmv7cjHp4ILME8GhA3EZSRYNfszWd4SqxijGLauBAeCh3WN
         rqjVRs7M6dSSaQDaA/SeZB7qjQNQS4u4dbnzV1W/X6FX5YzL7EsbaN3pfq2WsWtSXeXI
         l2E1yMsuz5MpPXvIkxbBWjKNk3MrSJ3K3O1Kai/BHRm29gFXZgaRL2/WrQmOwNjwfsni
         RQ4w==
X-Gm-Message-State: AO0yUKV30ITyD9BXMzwATrl9S2wJau8q8zWRhjjHw9HOLPDtk0HYliaS
        rhHRF0KmRgrzlYF/a5DsqunaosBYfAkA8w==
X-Google-Smtp-Source: AK7set/RzY95fWCzZqvllLszobdX5JrvI7fvC35jCVIvTIzlQmhgrJK+Q3+lpxMTy9K4+QKD/LpEFw==
X-Received: by 2002:a05:622a:40d:b0:3bf:d258:c151 with SMTP id n13-20020a05622a040d00b003bfd258c151mr3507839qtx.12.1677571718337;
        Tue, 28 Feb 2023 00:08:38 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id e7-20020ac80107000000b003b9bf862c04sm6046894qtg.55.2023.02.28.00.08.37
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 00:08:38 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-536cb25982eso247464727b3.13
        for <linux-m68k@vger.kernel.org>; Tue, 28 Feb 2023 00:08:37 -0800 (PST)
X-Received: by 2002:a81:4410:0:b0:532:e887:2c32 with SMTP id
 r16-20020a814410000000b00532e8872c32mr1070687ywa.5.1677571717612; Tue, 28 Feb
 2023 00:08:37 -0800 (PST)
MIME-Version: 1.0
References: <20230222195021.6683-1-schmitzmic@gmail.com> <CAMuHMdWm9yJaHGF-EGVmn69iKXLAh3G9PZer6WJUi-ZJPHDRJQ@mail.gmail.com>
 <f716ab75-1523-db03-1615-41ec1b9ae6cf@gmail.com>
In-Reply-To: <f716ab75-1523-db03-1615-41ec1b9ae6cf@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 28 Feb 2023 09:08:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW+fsDdOAr=zBuf0k=zO=FEfjFhHsMPbd6inOk=8DFS2g@mail.gmail.com>
Message-ID: <CAMuHMdW+fsDdOAr=zBuf0k=zO=FEfjFhHsMPbd6inOk=8DFS2g@mail.gmail.com>
Subject: Re: [PATCH RFC v1] m68k: kernel/traps.c - only force 030 bus error if
 PC not in exception table
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     linux-m68k@vger.kernel.org, Eero Tamminen <oak@helsinkinet.fi>,
        Finn Thain <ftain@linux-m68k.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Feb 28, 2023 at 12:28 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 28/02/23 09:19, Geert Uytterhoeven wrote:
> > On Wed, Feb 22, 2023 at 8:52 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> Link: https://lore.kernel.org/r/daca2f68-19fa-a2b6-97c6-16b5b7e26afe@helsinkinet.fi
> > 404
> >
> > I assume that a message from debian-68k?
>
> No, oddly enough that is a message that I have received with CC to
> linux-m68k (but not from vger!). And mail-archive.com has it:
>
> https://www.mail-archive.com/linux-m68k@vger.kernel.org/msg13081.html
>
> And also on marc.info:
>
> https://marc.info/?l=linux-m68k&m=155477039405576&w=2

That one has a different Message-ID:
alpine.LNX.2.21.1904141327340.130@nippy.intranet

> Later one with an experimental patch of mine:
>
> https://marc.info/?l=linux-m68k&m=155494864731013&w=2
>
> None of these messages show up on a search of lore...

Indeed, and I did receive them through vger.

> What source do you prefer - marc.info or mail-archive.com?

Let's keep the lore link with the actual Message-ID.
Missing emails on lore can be backfilled later...

Upon closer look, this predates lore collecting emails, so perhaps
something went wrong while importing my old archives I sent
to kernel.org. To be investigated...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
