Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A510C49EAB
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:18:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D51D361A1D
	for <linux-m68k@archiver.kernel.org>; Mon, 28 Jun 2021 07:18:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhF1HVR (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 28 Jun 2021 03:21:17 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:43855 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbhF1HVQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Jun 2021 03:21:16 -0400
Received: by mail-vs1-f44.google.com with SMTP id v12so9457624vsg.10
        for <linux-m68k@vger.kernel.org>; Mon, 28 Jun 2021 00:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pQTiz8mNUlRUP/7Td0W7VFbZEzMuG+2NhXQt4QEzLhY=;
        b=FhkbAQdIL/G6zgGOiWGzcqVkbM0pQlax42BuCGj6FqCz0YlZfkQSbpmgXRzyV5iBAa
         TH4yK3uBo8SEM6UGFOAmAILI44hawdZmTAtYx4nuxERklg8skxgLh9mCkI2dOz5wdIww
         rFxW5+dQZBLHhYD+kCQQfcnPCrkaDY5C0MJm2qWAwTVsyJWqJAJbDrxZSXhebhpOZVM0
         E4XQW5CXq5xNWUz7PPgfpVRlPBs5yrP1a8f4Dc3DnFXST2uEXiX6a39v0pe2m1FRUagi
         6CkZ32Cmpjs7IaH17O3XQP5lQhK6bJkl1GgeuDuvH9q+MgaVTGoCXyc85lKDkZz9oiTz
         GN1g==
X-Gm-Message-State: AOAM533fKdpmjo2RYl5yAwIl9LG8cmlGvHutyyZrQqxaEJa8eeeIfhgs
        cWo9+QKHnbtL6BrJ3S+KFsxTBMb3S2UDkfj9OQI=
X-Google-Smtp-Source: ABdhPJy21VdRXJFSv5Vv3Or9vdzWCilexkF7POqWZw1NTYkU7uqUUcWiryVA9VdtZadLOiyOto8SiRm8j+n3I/7kJ5U=
X-Received: by 2002:a67:770d:: with SMTP id s13mr4275774vsc.40.1624864729955;
 Mon, 28 Jun 2021 00:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <1623908361-29837-1-git-send-email-schmitzmic@gmail.com>
 <1623908361-29837-2-git-send-email-schmitzmic@gmail.com> <CAMuHMdX-JBTAWDvFQg7nVGwwxu8o6sX1GYVF0ha6JpZxOxuG8g@mail.gmail.com>
 <78dee109-3714-073c-110b-3d023f66f815@gmail.com> <CAMuHMdVtyTyC0L-LZPZCdNsaaxqcVLXky4dsd3m8uyyLUm9drg@mail.gmail.com>
 <3c7cb5b1-4a31-2802-dc60-021c67aa06d3@gmail.com> <53a462f0-bb89-00fa-76f6-3c615ddf4711@gmail.com>
In-Reply-To: <53a462f0-bb89-00fa-76f6-3c615ddf4711@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 28 Jun 2021 09:18:38 +0200
Message-ID: <CAMuHMdVvQB_m8dv97wPdfqxouFVgh9Zjrwjn1D0c_7rMK9W_FQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] m68k: add kernel seccomp support
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Fri, Jun 25, 2021 at 11:15 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 26.06.2021 um 06:42 schrieb Michael Schmitz:
> > Am 25.06.2021 um 19:31 schrieb Geert Uytterhoeven:
> >> On Thu, Jun 24, 2021 at 11:20 PM Michael Schmitz
> >> <schmitzmic@gmail.com> wrote:
> >>> On 23/06/21 7:35 pm, Geert Uytterhoeven wrote:
> >>>> BTW, there was also "[PATCH] [WIP] selftests/seccomp: Add m68k support"
> >>>> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261315050.25325@ramsan.of.borg/
> >>>>
> >>>>
> >>>> I kept on up-porting it, but haven't exercised it recently.
> >>>
> >>> See attached for test results on my ARAnyM image (Laurent's qemu image,
> >>> essentially).
> >>>
> >>> Is that any different from what you got in your earlier tests?
> >>
> >> Fortunately lore has a better memory than I do ;-)
> >>
> >> https://lore.kernel.org/linux-m68k/alpine.DEB.2.21.2008261612360.2926@ramsan.of.borg/
> >>
> >>
> >> mine: FAILED: 35 / 86 tests passed
> >> yours: FAILED: 35 / 87 tests passed
> >>
> >> So one new test, and it fails?
> >
> > Looks like it. I must be missing some mail in my mail archive, can't
> > recall ever seeing that one.
> >
> > There's one new test added after your mail was sent - KILL_unknown. I
> > suppose it's that one.
> >
> > Anyway, both much better than without seccomp support. And going back
> > over the archive, I found your patch where you added seccomp.h - and
> > added a line in Kbuild as well, which I forgot. Will fix that.
>
> Hmm - after that change, I get:
>
>    SYSHDR  arch/m68k/include/generated/uapi/asm/unistd_32.h
>    SYSTBL  arch/m68k/include/generated/asm/syscall_table.h
>    UPD     include/config/kernel.release
> scripts/Makefile.asm-generic:25: redundant generic-y found in
> arch/m68k/include/asm/Kbuild: seccomp.h
>    WRAP    arch/m68k/include/generated/asm/seccomp.h
>    UPD     include/generated/utsrelease.h
>
> in the build log.
>
> None of the other archs do add seccomp.h to their include/asm/Kbuild
> script. I'll leave it at v6 then.

Indeed, not needed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
