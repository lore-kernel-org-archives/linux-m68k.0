Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1575C4743C
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 19:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D7D6128C
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 19:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhFUTaI (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Jun 2021 15:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbhFUTaH (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Jun 2021 15:30:07 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A438C061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 12:27:52 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a11so18959927lfg.11
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 12:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UWwkKMPjf9VHxhA/g9kybS/n5fjzQ1lCr96tYKbsWb4=;
        b=OWY9B/m6/Mxc4KE4rlqUmS8up4KOodyzZabkrCDG8PZQO7BOG22XJGJUOTvpEvWYz8
         5PgA6ftqBTHNUdu8z3XpFvF/2p6ZVtR21Nv8hDF/pcwb1wKzuer3Yr3ZrfLh8V5mdy+M
         eKJPw1pfo8vN7QoUHB7TWIVl4z9STd1R+XvlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UWwkKMPjf9VHxhA/g9kybS/n5fjzQ1lCr96tYKbsWb4=;
        b=OKCKDmobljLjSVrZFSS9145cBCZe+GuG+e+U9kPU/mHaWfaqCW3+b+2NdUliRLyDLU
         4F+lDV7j+ZLDyYMoLQj+QucFO0OtdPQT+mUja+3IdBlPVAcWpmxdtY0rXu5jN5FdDyTb
         LRxvZa+fbSnHrBW/mQG14V4lc7gOyrzdvEjOlytDyl8jK/XYyCQosoerKdVysmmjGjUj
         u7LSI0UN5cwFvEqNs1NzZLN4dYKAoh34/YTiVA2s4n1k8aNHMdlzqBqi5UytWwwqT6fK
         pbiXmqlFvAd+nPxbU1fMGWXtHiPpQ+W/XDiG45JLtfRmtpRHgqPEUk0YJzxtiV44IDvL
         6RVg==
X-Gm-Message-State: AOAM530j/iaO7XcczrryCMu5EIdeugk0XOLxyXOwa1oJZKg7v7Rea/b+
        0Tds9UccyGuG9zqNpLPsTHUFNGQYCFc/HQ2yJdI=
X-Google-Smtp-Source: ABdhPJzHL9ZmGOOHL5NDRRS3NPuxUkGriLPvB7dTObIHxCDFZkw8q1VPtIvhYAlxK87hhT2f/UWpoA==
X-Received: by 2002:ac2:5d69:: with SMTP id h9mr14627578lft.603.1624303670442;
        Mon, 21 Jun 2021 12:27:50 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id b13sm736413lfv.89.2021.06.21.12.27.50
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 12:27:50 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id h15so13450551lfv.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 12:27:50 -0700 (PDT)
X-Received: by 2002:a2e:9644:: with SMTP id z4mr23025776ljh.507.1624303342282;
 Mon, 21 Jun 2021 12:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
In-Reply-To: <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 12:22:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
Message-ID: <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jun 21, 2021 at 11:59 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>         There's a large mess around do_exit() - we have a bunch of
> callers all over arch/*; if nothing else, I very much doubt that really
> want to let tracer play with a thread in the middle of die_if_kernel()
> or similar.

Right you are.

I'm really beginning to hate ptrace_{event,notify}() and those
PTRACE_EVENT_xyz things.

I don't even know what uses them, honestly. How very annoying.

I guess it's easy enough (famous last words) to move the
ptrace_event() call out of do_exit() and into the actual
exit/exit_group system calls, and the signal handling path. The paths
that actually have proper pt_regs.

Looks like sys_exit() and do_group_exit() would be the two places to
do it (do_group_exit() would handle the signal case and
sys_group_exit()).

               Linus
