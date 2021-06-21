Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E36DC49EA3
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 02:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2896960FDC
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 02:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbhFUCUd (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 20 Jun 2021 22:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhFUCUc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 20 Jun 2021 22:20:32 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A72FC06175F
        for <linux-m68k@lists.linux-m68k.org>; Sun, 20 Jun 2021 19:18:17 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id d2so22890393ljj.11
        for <linux-m68k@lists.linux-m68k.org>; Sun, 20 Jun 2021 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZejXSKJots0a5Xk5qseqeRM6JTbTp59SHNg6hTQH+o=;
        b=MAhMZqudZsSxZ/7jbtmYhk1RV1H9tJShm//WrMFiOV2ya/PC4lyBw53NovX2z0W3UQ
         lVW5QcVk8O7fSzPpRXICb0URT/gxy4ajlbBr3HqIyZlMxRX6b08rhnK5f1HRSHzKKYIK
         QB0Eqv+7FA7Oe20guNcwkG9wa52yJ/I7XOJfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZejXSKJots0a5Xk5qseqeRM6JTbTp59SHNg6hTQH+o=;
        b=YVQ52ZLVBLHycX9NeyAbXlWksmeZIiNyj0QGKVI7xLZ1hY2KlbNJujJiFQd5YzDQpA
         uocoXfw3SBgeotpCUizvOUe52ppML41WJLc4P2/sZ92kFzi2Ki2QhZXPbPJgIUgNwdG2
         iRbZ8pwtGN6HIt2W7F76KXvJrfSDtkcTHD97zA1KDZhO2w+KLEFKuhaloVTOrRCmWNal
         5oiNmqijzB3qrws2r+Qxh12aoeg+Ss7Efxh7H2L9vLXhXkEVGvyN71jyKe0yJ/vUl25z
         tp0jksdJaS9q1lx0sbnA9uilw91QSZ3ae+jhtOXaZP5F+1o4Hwj2mwffUMngrpyazQKr
         75eA==
X-Gm-Message-State: AOAM531wl41g3ltlsMbpKccLA2CphwRxRKT4piBxI1b7ya/JA2sYRaN5
        qyhZ/kOcoJsFelyVHcSlgW3EtawMPAuBCTCH
X-Google-Smtp-Source: ABdhPJwexXNGK4Rie+l3Kq7pqAsAJO+fzFyEACSuhhhiYL4TD8u44reRpxVFylZpYgALzadLePdzEg==
X-Received: by 2002:a2e:898c:: with SMTP id c12mr8748098lji.298.1624241894954;
        Sun, 20 Jun 2021 19:18:14 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id i5sm1708123lfe.113.2021.06.20.19.18.13
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Jun 2021 19:18:13 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id u13so8169981lfk.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 20 Jun 2021 19:18:13 -0700 (PDT)
X-Received: by 2002:a05:6512:557:: with SMTP id h23mr7348506lfl.253.1624241893502;
 Sun, 20 Jun 2021 19:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
 <87pmwsytb3.fsf@disp2133> <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <87zgvqor7d.fsf_-_@disp2133> <CAHk-=wir2P6h+HKtswPEGDh+GKLMM6_h8aovpMcUHyQv2zJ5Og@mail.gmail.com>
 <87mtrpg47k.fsf@disp2133> <87pmwlek8d.fsf_-_@disp2133> <87k0mtek4n.fsf_-_@disp2133>
 <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com>
In-Reply-To: <393c37de-5edf-effc-3d06-d7e63f34a317@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 20 Jun 2021 19:17:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wip8KgrNUcU68wsLZqbWV+3NWg9kqqQwygHGAA8-xOwMA@mail.gmail.com>
Message-ID: <CAHk-=wip8KgrNUcU68wsLZqbWV+3NWg9kqqQwygHGAA8-xOwMA@mail.gmail.com>
Subject: Re: [PATCH 1/2] alpha/ptrace: Record and handle the absence of switch_stack
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-arch <linux-arch@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Oleg Nesterov <oleg@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
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

On Sun, Jun 20, 2021 at 7:01 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> instrumenting get_reg on m68k and using a similar patch to yours to warn
> when unsaved registers are accessed on the switch stack, I get a hit
> from getegid and getegid32, just by running a simple ptrace on ls.
>
> Going to wack those two moles now ...

I don't see what's going on. Those system calls don't use the register
state, afaik. What's the call chain, exactly?

           Linus
