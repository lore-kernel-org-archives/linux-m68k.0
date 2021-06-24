Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0549AC49EA6
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 20:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA57613B3
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Jun 2021 20:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbhFXUN5 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Jun 2021 16:13:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbhFXUN5 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Jun 2021 16:13:57 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF4EC061574
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Jun 2021 13:11:37 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j4so12340864lfc.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Jun 2021 13:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QdsTxdbLy6OAQCJe+BxLmLcw7gNCvC1VuxBL+c/EdBc=;
        b=CN50qFEZiM/KC40ZFphsMGum7u0fgQ/7PSKkzLv3Imv2qoT+m2I4xle85ef/hnSBmd
         jQ7V9plRVWmia3duLG9JtlwtA8gRKNqUguKYIy9mayOSyo2ct58AmgGxinOrbYWP7B9+
         tKraksvFmL2Pf/jciosSyTRbQSZ6FxNlrKsF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QdsTxdbLy6OAQCJe+BxLmLcw7gNCvC1VuxBL+c/EdBc=;
        b=eE5qU3OYNcjiQyx09EHxMI5RmscWw7aYqQ0oRuP+z9E8L3Jes7jsPCbY7AtRRC5WEn
         T70Tb5kxXHnc/EY4nuGUnfzgegYjgp1THszkm2km+w5YTc7nkRSI/JPhaQtZTXEcl9q8
         RIKhI7HiZueWeqgb2uCz0YxvjM+aK5Ku6rUx5cPCa5dXpiJ4lF7Diw7mVArTEeZ3l+CZ
         rnMp/ZmSE7gOxYwob3dXW6n9bTDKGc+MIA1sohlp6/9RYiO0s0vIauZ0Irqo4B7aQQtb
         1qNlxby1lJPUpz8xxeuJQ6krbEhHLglVgMXNlTD53eSCJNgCvFbuR6/vMLNva9Ut0DJi
         nEIg==
X-Gm-Message-State: AOAM532w+ysKL7rgFVjk8TA+YgZ8CfmkpLpmtN4DKxB5Ro1qkTT0/eEK
        tN6Z7J8O7buoG1U+UGzbcAEQAFs1r47vFx9tA44=
X-Google-Smtp-Source: ABdhPJxWpm9J0pTmWyV1vapZ+cUz9A4CZqvB2MxvscyiUBDwY0rfa2kA0tHGkApyhmpY+gYENZzt/Q==
X-Received: by 2002:a05:6512:3f81:: with SMTP id x1mr5407110lfa.426.1624565495479;
        Thu, 24 Jun 2021 13:11:35 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id j2sm222067lfb.212.2021.06.24.13.11.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 13:11:35 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id h15so12280297lfv.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Jun 2021 13:11:34 -0700 (PDT)
X-Received: by 2002:a05:6512:baa:: with SMTP id b42mr4974557lfv.487.1624565494034;
 Thu, 24 Jun 2021 13:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wgdO5VwSUFjfF9g=DAQNYmVxzTq73NtdisYErzdZKqDGg@mail.gmail.com>
 <87sg1lwhvm.fsf@disp2133> <CAHk-=wgsnMTr0V-0F4FOk30Q1h7CeT8wLvR1MSnjack7EpyWtQ@mail.gmail.com>
 <6e47eff8-d0a4-8390-1222-e975bfbf3a65@gmail.com> <924ec53c-2fd9-2e1c-bbb1-3fda49809be4@gmail.com>
 <87eed4v2dc.fsf@disp2133> <5929e116-fa61-b211-342a-c706dcb834ca@gmail.com>
 <87fsxjorgs.fsf@disp2133> <CAHk-=wj5cJjpjAmDptmP9u4__6p3Y93SCQHG8Ef4+h=cnLiCsA@mail.gmail.com>
 <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk> <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133> <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133> <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133> <875yy3850g.fsf_-_@disp2133> <87y2az5bmt.fsf_-_@disp2133>
In-Reply-To: <87y2az5bmt.fsf_-_@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 24 Jun 2021 13:11:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg16ZBqtLngzE2edV8e68Qxje2kFehnKTrBBe5opcsj-w@mail.gmail.com>
Message-ID: <CAHk-=wg16ZBqtLngzE2edV8e68Qxje2kFehnKTrBBe5opcsj-w@mail.gmail.com>
Subject: Re: [PATCH 7/9] signal: Make individual tasks exiting a first class concept.
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

On Thu, Jun 24, 2021 at 12:03 PM Eric W. Biederman
<ebiederm@xmission.com> wrote:
>
> Implement start_task_exit_locked and rewrite the de_thread logic
> in exec using it.
>
> Calling start_task_exit_locked is equivalent to asyncrhonously
> calling exit(2) aka pthread_exit on a task.

Ok, so this is the patch that makes me go "Yeah, this seems to all go together".

The whole "start_exit()" thing seemed fairly sane as an interesting
concept to the whole ptrace notification thing, but this one actually
made me think it makes conceptual sense and how we had exactly that
"start exit asynchronously" case already in zap_other_threads().

So doing that zap_other_threads() as that async exit makes me just
thin kthat yes, this series is the right thing, because it not only
cleans up the ptrace condition, it makes sense in this entirely
unrelated area too.

So I think I'm convinced. I'd like Oleg in particular to Ack this
series, and Al to look it over, but I do think this is the right
direction.

           Linus
