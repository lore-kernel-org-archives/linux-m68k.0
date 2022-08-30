Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36282ECAAA1
	for <linux-m68k@archiver.kernel.org>; Tue, 30 Aug 2022 07:36:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiH3HgS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 30 Aug 2022 03:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbiH3HgQ (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 30 Aug 2022 03:36:16 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CD43BC133
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2022 00:36:14 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id h21so7926097qta.3
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2022 00:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=qxu3hTQcVVpo5MRrhmCRPN8+zQ2zkvFzo2BoQvXTgE4=;
        b=8Ja+LT9KHJDP3gmW5JQz/wayQfR3kqR7C0DI64OYoZK+CQ8w5RU05cVX1coIHibPRy
         L5TVo7sWjSbD1irCX2A4wLQd7c0SAJFEQ1eeSvY54ysPmeqR+vhtvJhI3ELdUqRsCXcD
         tMmBONmvyWWKxJ1KDvZsBA0id/j/HCafll4XhY7vToOqKyEr4U/rovQrND4l82yk/88e
         3mLHK7QZTOIbsEtlz2d3Xq9S5KtJAN0ZYXEoGPO82crShKi0prCBnDt0Xih3gwzyN9L/
         tcp7u7jZUMp5lz9ZG5MwcD2J07RX+F81rfEMPonlT5ZRa+pqnhhZsIQtKj7pad8Dtm0N
         yBVw==
X-Gm-Message-State: ACgBeo3XrTK70ujOae08JCDh77zD5HgjbCBsynkf6WuoJ3AtDI35CNYj
        v9rwBAmltnBLxaleDdcHftinRo+tT7sHaA==
X-Google-Smtp-Source: AA6agR6JHvLFSnOatdEn6Rqfil4kN/Gr+tXN+VkOBtQGdfpZP5nLdNuonxkxrNTy/nvVEdDmDpe+dA==
X-Received: by 2002:ac8:7c56:0:b0:344:24c1:60ff with SMTP id o22-20020ac87c56000000b0034424c160ffmr13018776qtv.437.1661844972372;
        Tue, 30 Aug 2022 00:36:12 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006bb7ccf6855sm7866340qkp.76.2022.08.30.00.36.11
        for <linux-m68k@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 00:36:12 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3378303138bso252533267b3.9
        for <linux-m68k@vger.kernel.org>; Tue, 30 Aug 2022 00:36:11 -0700 (PDT)
X-Received: by 2002:a81:f47:0:b0:31f:434b:5ee with SMTP id 68-20020a810f47000000b0031f434b05eemr12857647ywp.383.1661844971725;
 Tue, 30 Aug 2022 00:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220826040302.3455339-1-gerg@linux-m68k.org> <20220826040302.3455339-3-gerg@linux-m68k.org>
 <CAMuHMdWRjG6n9MpLG+rZtyrTPdj6sGLt7LehHo+i0P9aHach+Q@mail.gmail.com> <337d70c9-5257-a9d4-5ec1-a43b8ade1a14@linux-m68k.org>
In-Reply-To: <337d70c9-5257-a9d4-5ec1-a43b8ade1a14@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 30 Aug 2022 09:36:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEbfjpKtsE-AFa8t9eVYaxkuCsn89Q+sL4O4pFhg2PrQ@mail.gmail.com>
Message-ID: <CAMuHMdUEbfjpKtsE-AFa8t9eVYaxkuCsn89Q+sL4O4pFhg2PrQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] m68k: allow kexec on all MMU enabled CPUs
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Greg,

On Tue, Aug 30, 2022 at 9:23 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 26/8/22 17:44, Geert Uytterhoeven wrote:
> > On Fri, Aug 26, 2022 at 6:08 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> >> The configuration setting for 68k kexec support limits it to only
> >> the classic 68k CPU types (so no ColdFire). However the underlying
> >> support can handle any 68k CPU that is MMU enabled - and that includes
> >> ColdFire. (Of course that support is only as good as mentioned in
> >> the current configuration help).
> >>
> >> None of the no-MMU CPU types (classic or ColdFire) have support for
> >> kexec yet, so the configuration as it stands is not quite right, and
> >> it will fail to compile on them.
> >>
> >> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> >
> >> --- a/arch/m68k/Kconfig
> >> +++ b/arch/m68k/Kconfig
> >> @@ -87,7 +87,7 @@ config MMU_SUN3
> >>
> >>   config KEXEC
> >>          bool "kexec system call"
> >> -       depends on M68KCLASSIC
> >> +       depends on MMU
> >>          select KEXEC_CORE
> >>          help
> >>            kexec is a system call that implements the ability to shutdown your
> >
> > Don't you need changes to arch/m68k/kernel/relocate_kernel.S,
> > which supports 68020+ only?
>
> I suspect so looking at that now. It compiles ok, but without a
> check for MMU type specific to ColdFire it will likely fail.
> I didn't dig into it too deeply, my primary goal with to fix compilation
> for the non-MMU targets.
>
> I started out testing it with this:
>
>      depends on M68KCLASSIC && MMU
>
> And that works and fixes the problem I was most interested in.
> But then I figured that perhaps it is better to allow if for ColdFire with MMU enabled.
>
> I didn't want to go down the rabbit hole of trying to get it working
> on non-MMU platforms (and ColdFire with MMU enabled either really).
>
> So I would be just as happy to limit it to M68KCLASSIC and MMU for now?

That sounds fine to me.
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
