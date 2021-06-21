Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C66AC4743C
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 23:21:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A0A160249
	for <linux-m68k@archiver.kernel.org>; Mon, 21 Jun 2021 23:21:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231130AbhFUXXz (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 21 Jun 2021 19:23:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230438AbhFUXXz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 21 Jun 2021 19:23:55 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88AFC061574
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 16:21:38 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ji1so25370913ejc.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stNy8kLF5vctj8WXK363X+Ab+aWkvJsrhuAKRgNlaFY=;
        b=IL1c66HdRAXSPTueb6HvT7WAQ+hVTgraIpPVGrRtYIIPrdMk6idOyB+d7hgkhCbE/J
         WSDn2K6/KFlAr4ZepO/VZSbAHdCjsBoc9mInrjOrnW0t0J2Sklo0eRJQKmRh1FXkY2rP
         httftVRSDPt4omCrZhGPE4bzB66yBCzHc25jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stNy8kLF5vctj8WXK363X+Ab+aWkvJsrhuAKRgNlaFY=;
        b=U2qaePGpYaVjatyTKzC686/oXyG8UmthbHsYyQCpRcrqD9rEmbWyKbbNw9Jw/IALVD
         ODDO8H0VjZzJFXoGe4p2IvhEGjA9VcESY5SMdx7TgNXTgHEe/T9tJJAo+/ma395uPwmy
         xDVv+0vZSme5VRhNUJ9w+KjWzwAKdX3QqcAOvpyEiCYOAPHF86V3/1fbZwn8YKP/+G4F
         WfUVJIHM+GTEm83ibyjXpMFwxwB4BGg6nC8U3MSSEwq2TCVKLxxLeb27yrwPhIarBy+T
         qiOyyUUPzMdeXB+YmRZks3I8TuGBkRGcsO1FUFQd377VicnYN6N0Bn/MjV51OCMwaveg
         GCow==
X-Gm-Message-State: AOAM531dSDSApcKsWJG7dEY8tnjAmNE7U3mRX8Buao2UxI0Bi9xrGwlb
        WG9vQn175vDFwwyALMstzbHha5tp4lcbiabQSfM=
X-Google-Smtp-Source: ABdhPJxIVDm4XcbbQe9WcO1VJrGSt6i9kaES78koo8BAhDGkKDi+ynX67oJ+t5BdNfXlJWjS9MM+ew==
X-Received: by 2002:a17:907:9da:: with SMTP id bx26mr578193ejc.262.1624317697468;
        Mon, 21 Jun 2021 16:21:37 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id z19sm11178997edc.90.2021.06.21.16.21.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 16:21:37 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id y7so21351362wrh.7
        for <linux-m68k@lists.linux-m68k.org>; Mon, 21 Jun 2021 16:21:37 -0700 (PDT)
X-Received: by 2002:a05:6512:15a2:: with SMTP id bp34mr498972lfb.40.1624317352941;
 Mon, 21 Jun 2021 16:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com> <87a6njf0ia.fsf@disp2133>
In-Reply-To: <87a6njf0ia.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 16:15:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
Message-ID: <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
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

On Mon, Jun 21, 2021 at 1:04 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> For other ptrace_event calls I am playing with seeing if I can split
> them in two.  Like sending a signal.  So that we can have perform all
> of the work in get_signal.

That sounds like the right model, but I don't think it works.
Particularly not for exit(). The second phase will never happen.

              Linus
