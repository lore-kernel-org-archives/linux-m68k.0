Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51CFAC4338F
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 21:00:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CA4B60EB4
	for <linux-m68k@archiver.kernel.org>; Sun, 25 Jul 2021 21:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhGYUUG (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:20:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbhGYUUF (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 25 Jul 2021 16:20:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7560EC061757
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 14:00:32 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id a26so11672496lfr.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 14:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s93PjnjW9/K/rkkoUe5HsggZSZ91WNZAKZYrclvIW4A=;
        b=UTAwUwmhVz95UmUWDa3BHDUg8VUs6qWZrq/JmP5to1aZRfT9wZ7yNVF+c7li4IejL2
         EWiocEUV/85e+2z0tMFMFMdN5il1kbITG6F9oelwaVncnfbS5Gyg9ijjkunjn2sbfVxN
         6PR1uH9IegTiTxnIQHMzsQSRej8GvmsAvkOgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s93PjnjW9/K/rkkoUe5HsggZSZ91WNZAKZYrclvIW4A=;
        b=F4Dkfjk4kgSKnb7cCK+HgDT9E/4P+67APbm4FEl6Ls3EHAextbLoi2KXICMewerep/
         mDQZfRlr3KI70ln6IBJm43oGcO9iX0VPkCQOQF5vhMYcE56uwLTtLHXXRbBlYTs2CN8D
         i8550AaxZ08+hew9RDiWPk+CA3gbSkhEmg27RTM15tGrkKA9U09kH91gBUxUplXmf+JU
         J6j26ug/vw/LoSMmZkhgKvmriZ/RDpvdpinAfKf/S98mVVt0D55GKKGr81uGnuk74ciH
         F5jRDYneqvhReSP8LdRAh99c95FXcfUBztaYaA8a4MPwiNpln/veW/dGrnMJH5OdyC8B
         hnFw==
X-Gm-Message-State: AOAM531gY8ku35BzwFGNPjXe1MUZQHqEfGK9HaLvF4Af78hx45BHS5AK
        zs+PdVDgpzHOVfGo3uPwiAv6e6WrVHh+QnsO
X-Google-Smtp-Source: ABdhPJy3b8WYMTPIEBkYk0Bx6EcqRTqu/2bWmzphPZkgd6KfWsu21XVOWeXiBI9ayXJopQuich0PHw==
X-Received: by 2002:ac2:5299:: with SMTP id q25mr10329145lfm.373.1627246830604;
        Sun, 25 Jul 2021 14:00:30 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id h25sm2835541lfv.167.2021.07.25.14.00.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 14:00:30 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id m9so8842166ljp.7
        for <linux-m68k@lists.linux-m68k.org>; Sun, 25 Jul 2021 14:00:30 -0700 (PDT)
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr9937992ljj.411.1627246829850;
 Sun, 25 Jul 2021 14:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <1624407696-20180-1-git-send-email-schmitzmic@gmail.com>
 <1624407696-20180-4-git-send-email-schmitzmic@gmail.com> <CAMuHMdVA5d7z6awGrpJ+Tb3PRxz7Nczd_SLXZ=cAwsS8tFU_vg@mail.gmail.com>
 <f99d3d82-150b-62fc-3b38-141710a4826e@gmail.com>
In-Reply-To: <f99d3d82-150b-62fc-3b38-141710a4826e@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 25 Jul 2021 14:00:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgVFUJAD62jtpbbKddu1ZeGF+nR4VuTGzQjS_ncCa5nQQ@mail.gmail.com>
Message-ID: <CAHk-=wgVFUJAD62jtpbbKddu1ZeGF+nR4VuTGzQjS_ncCa5nQQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] m68k: track syscalls being traced with shallow
 user context stack
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jul 25, 2021 at 1:48 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> Just out of interest - what would be the correct way to set/clear a
> single bit on Coldfire? Add/subtract the 1<<bit value?

I think BSET/BCLR are the way to go.

Or, alternatively, put the constant in a register, and use a longword
memory access. The arithmetic ops don't do immediates _and_ memory
operands in Coldfire, and they don't do byte ops.

Or something like that.

              Linus
