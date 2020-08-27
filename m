Return-Path: <SRS0=O3TF=CF=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4B4C433E1
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 09:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C72E72080C
	for <linux-m68k@archiver.kernel.org>; Thu, 27 Aug 2020 09:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgH0JTY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 27 Aug 2020 05:19:24 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44721 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgH0JTX (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 27 Aug 2020 05:19:23 -0400
Received: by mail-oi1-f193.google.com with SMTP id h3so4033943oie.11
        for <linux-m68k@vger.kernel.org>; Thu, 27 Aug 2020 02:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sx5z9IOu3I+5D9BI9vMhr/6kFwAqRh7irYeujSwbebA=;
        b=YBpgvaUhBFoI2QSFvK/Fh8Ey+odqlyBj0dCOJLggGLx7eXbd4iXNR8c8GpwvN9GYv+
         b78VrQqfewRj1QWrcWlf8Hx32W3s4NFwjkSXqRRK856JPseb2ScQf2ItQ2VlWMMzFkOH
         4pJhKaD68G0PFv4CbstqLxosWEvRAIVcS6q98VLe+WIa72xhr5+dcYo0aNe8l7WTL+XI
         jTzNQuILbrtLMeY+ceyWMaxkSzCce0P6KflV6lpbVfG3bn4yYHK5UwHLAL7Ac6j50gFI
         WPRsW++jqvMu+rjI1vIbKOsejDplGmad9DMPmzKfCUTP8DgDmLExxDTMuu+vADpWEnAM
         MYaA==
X-Gm-Message-State: AOAM532/PV1luyr68Iqj4LfGLp2c9OjVfx8THysi+flLD+QOreGMFSpB
        8vgj/uuvJz7YgEuCcbFZRvfVkVuBOzb06y4BeGl/RCG+
X-Google-Smtp-Source: ABdhPJyUXc0SSJkVC7ncP//DYQ8DP8s7glLEwzFdWmIS63lhV8sqoSlJXQT1ghZ8Ff7qamvPDX0NFXHQHAhIuGuActE=
X-Received: by 2002:a05:6808:575:: with SMTP id j21mr6210058oig.54.1598519962335;
 Thu, 27 Aug 2020 02:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <f0c9edc0-e596-c483-b9a6-f67778bd297c@physik.fu-berlin.de>
 <1595823555-11103-1-git-send-email-schmitzmic@gmail.com> <CAMuHMdVNqgG_6LSSuzMZekE1q7i_V4YisDJQUsjptLDejNGaRw@mail.gmail.com>
 <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
In-Reply-To: <855486ab-736a-19ad-35c2-174b5eb59898@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Aug 2020 11:19:11 +0200
Message-ID: <CAMuHMdWM0pMetDVKqtBUEHeyiD-_M6VsOQMr9WU4+xm1WdU=_g@mail.gmail.com>
Subject: Re: [PATCH] m68k/kernel - wire up syscall_trace_enter/leave for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "Linux/m68k" <linux-m68k@vger.kernel.org>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Thu, Aug 27, 2020 at 2:08 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 26/08/20 11:23 PM, Geert Uytterhoeven wrote:
> > As your email subject didn't contain "v3", b4[*] insists on picking up
> > RFC v2, and refuses to pick up the latest version, even when forced
>
> Argh - I thought that since the first two were tagged 'RFC', I could
> just restart with v1.
>
> Never heard of b4, sorry.

It's the new tool to download patches and patch series, adding
automatically any received *-by tags, and the Link: tag.  Makes my life
easier ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
