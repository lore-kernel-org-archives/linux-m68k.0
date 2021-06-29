Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A8D5C11F66
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Jun 2021 07:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDA4D61DB6
	for <linux-m68k@archiver.kernel.org>; Tue, 29 Jun 2021 07:31:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbhF2Hdt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 29 Jun 2021 03:33:49 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:46976 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbhF2Hdt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Tue, 29 Jun 2021 03:33:49 -0400
Received: by mail-vs1-f53.google.com with SMTP id l68so4520645vsc.13
        for <linux-m68k@vger.kernel.org>; Tue, 29 Jun 2021 00:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6JucUtidh2r4HE3ZMi8MJo1NsY2sxT41a9QP74J3wKc=;
        b=kw3F8O3Z9v5AHhil6Hzn6lS+AulROfRFmISzWIGV/AXthH+Z/SZ0PRVOA42Z83JGDS
         Rr/SKVD1141lruLBBNSxoRyx8kh+N/4GytZfl8qi4wuwxaahL01HB1XR0XXw3cVGetiS
         F+dmccMeHmda69HS2LZ2kWY2kEWMjEiR72vevt7mEJgyGUuwg7ffPgBHsfrW6i/cnJbm
         KR6qQyVZjLY3hoimbxQ3jq6zaLZMlCv00vZNFyakyC4FeqgqprOJDcAFMCU+1uNUmfuQ
         BU0qjDqhJDsBGI3R4HopFNq94QqvVVBxQNzqzCt0zWU4x46fUvZYZ09mh2R1J//3bdbu
         NYGA==
X-Gm-Message-State: AOAM531bwQ/PbRlXQEv/21H0dXfpki+Qaxt/DwtvkwpKZ9aoHCbYWOUl
        RPFW0EYauacyMnDfTgm8Y85TU2lqzOlDzM/770oB+yBiHTI=
X-Google-Smtp-Source: ABdhPJxwHAJCsbEx9NoHkLgz/L6IgG8BntftHI2n9uD/xMIW89l1ujS7aDga6nkyheyXZCFWLhNgBc6CbuDSDnG+4Mk=
X-Received: by 2002:a67:770d:: with SMTP id s13mr10257799vsc.40.1624951882208;
 Tue, 29 Jun 2021 00:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <1624495560-6351-1-git-send-email-schmitzmic@gmail.com>
 <1624495560-6351-2-git-send-email-schmitzmic@gmail.com> <CAMuHMdWoX=6Yf7MZXR92Q3APYixY5MDM6MW_UUf0DO2+oDkHAQ@mail.gmail.com>
 <aeac601a-a6ff-678b-83dc-48dacb430ec3@gmail.com>
In-Reply-To: <aeac601a-a6ff-678b-83dc-48dacb430ec3@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 29 Jun 2021 09:31:11 +0200
Message-ID: <CAMuHMdXJMuCGv7O8oPLG9YL-VZPzs5ZrrJU769Ks8YRh14c+FA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] m68k/kernel - wire up syscall_trace_enter/leave
 for m68k
To:     Michael Schmitz <schmitzmic@gmail.com>,
        Greg Ungerer <gerg@linux-m68k.org>
Cc:     "Linux/m68k" <linux-m68k@vger.kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Michael,

On Tue, Jun 29, 2021 at 12:16 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> On 28/06/21 7:25 pm, Geert Uytterhoeven wrote:
> > On Thu, Jun 24, 2021 at 2:46 AM Michael Schmitz <schmitzmic@gmail.com> wrote:
> >> m68k (other than Coldfire) uses syscall_trace for both trace entry
> >> and trace exit. Seccomp support requires separate entry points for
> >> trace entry and exit which are already provided for Coldfire.
> >>
> >> Replace syscall_trace by syscall_trace_enter and syscall_trace_leave
> >> in preparation for seccomp support. Check return code of
> >> syscall_trace_enter(), and skip syscall if -1. Return code will be
> >> left at what had been set by ptrace or seccomp (in regs->d0).
> >>
> >> No regression seen in testing with strace on ARAnyM.
> >>
> >> Signed-off-by: Michael Schmitz <schmitzmic@gmail.com>
> > b
> > Thanks for your patch!
> >
> >>   arch/m68k/kernel/entry.S  |  8 +++++---
> > We need similar changes to arch/m68k/68000/entry.S and
> > arch/m68k/coldfire/entry.S
>
> Do you have a current defconfig for 68000? I've test compiled my patch
> with two coldfire defconfigs, but could not find one for m68kclassic ...

Unfortunately not.
Greg?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
