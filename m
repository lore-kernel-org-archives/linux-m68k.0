Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D641C48BE5
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 07:38:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 369C56109E
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Jun 2021 07:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhFPHkj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Jun 2021 03:40:39 -0400
Received: from mail-vk1-f177.google.com ([209.85.221.177]:42522 "EHLO
        mail-vk1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231245AbhFPHkj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Jun 2021 03:40:39 -0400
Received: by mail-vk1-f177.google.com with SMTP id h19so407006vkh.9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Jun 2021 00:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oYkI/zG40URv+m/LERapdYdXE8mdGOgDXjJQ7nWdKJQ=;
        b=RIlWtDALgFLz+jyrXo1YzkCp840vGOnwMMwzTTbWmQdrxqhwJKP909Z6PsFeV+yEo8
         nO2nQxfX7oQ0Yjwz+ksYHQMQIlkkMC8asKZMNUnT6HE7qeEnGJcGlqKczBVbAxfEjriH
         bV9GOQ2AqbWmhHmBg0z/nLA5nrSTzbkpvkjIsEFWss0xn56FsB+PkW6EB2YghtytQ/Xc
         8yIZa7MVc+wMPjoG0qE+TunuoRbE7fiBd4xvjQEhbstO/aRk08IH6NaUc/27al2laMsr
         oOMPwXPioPui9LFBKI1CCqdxUtY7nj5+A9Jag+mUWUYKu5NW5O11y2M5Tf2qhN48vRon
         VdBg==
X-Gm-Message-State: AOAM533JWjboJ0b42vicLEP3o+rmKdRulO56ov+WllPxkjuRWTBKciTn
        hHvvi/jDTFWA23OBycCEMUN/V0ydw4TvS9/f2fg=
X-Google-Smtp-Source: ABdhPJzufbJykYOmxZN0p1SAxGmJWo5X7VotLxBsWJYFnoUcAIbLyiwJ2blqdHa1Jr10POv3l3B1Oi8N3GGoHXROasQ=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr8101727vkd.6.1623829113459;
 Wed, 16 Jun 2021 00:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com> <87fsxjorgs.fsf@disp2133>
In-Reply-To: <87fsxjorgs.fsf@disp2133>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jun 2021 09:38:22 +0200
Message-ID: <CAMuHMdUkhbq+tOyrpyd5hKGGcpYduBnbnXKFBwEfCGjw5XGYVA@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Tejun Heo <tj@kernel.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Eric,

On Tue, Jun 15, 2021 at 9:32 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
> Do you happen to know if there is userspace that will run
> in qemu-system-m68k that can be used for testing?

There's a link to an image in Laurent's patch series "[PATCH 0/2]
m68k: Add Virtual M68k Machine"
https://lore.kernel.org/linux-m68k/20210323221430.3735147-1-laurent@vivier.eu/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
