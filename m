Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1E0C49360
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 20:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9626A6128B
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 20:33:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232075AbhFMUfn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Jun 2021 16:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232052AbhFMUfm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Jun 2021 16:35:42 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45629C061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:33:24 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id s22so17202125ljg.5
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VC5cDZGWEYWXdqFfbXDpqSf2zZYlr3PKXrJxtfAkz2M=;
        b=cd5cBp/Yn7qqbIqUiv2KvlvBMaJ5y5QFxGvkESukJAqrMM4dzGnqOa91I9VnWf3Fjo
         /OioPPbJRTvwXRUkb+EEK4PA61DyFEcGBYFDAujv6jWzpVc3aN5rGCrtGE411PZs1nqv
         Ek2jx/dgIpb6/RQbggoVhe9JasBuxKt2UD2Zw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VC5cDZGWEYWXdqFfbXDpqSf2zZYlr3PKXrJxtfAkz2M=;
        b=FruHU9L52HLfUmhm/PV1tzbMizKQQiMl84J0MfHXxsX3PL/KSKbJzuWcCxwt8GThUB
         bFjIUSX/pqCIwS/2/WEdDtADqRy7YPeIcAGK6OLvJ9pvnn7NlDbuUK7cviT/DnJiydsO
         s5LzXJ6tBtme+qxHprb9SIuWL2DItBwZHkoOPdK9LH4eXgOu1gbqqPj8SeArhHf6w4Ac
         Jps0XPY9FzrQ153Uqfq7Ja2dqbB4ZIZrnP13jRgd0CxTwjwWY/tUGHrDbooZ3pL8fzbk
         YEGXF49eU15qtGroutQdGNgvaRidZjAvCOU5OgPLKQOqvHPMUaDq8gQrplunHxDYrTK3
         0AQg==
X-Gm-Message-State: AOAM533DBF0ATHmfueZsblB3udEa4qITpti4dAcwO3sQi7QGDvhwA6rZ
        8dMui1Wu5ADq7ot0C7RI6QoJv5e8yxnxlIui
X-Google-Smtp-Source: ABdhPJx/ihbxJ74kNdDiXhUCZYQdtCdpomtoD8gutUhkh2OyREW0imtHvBHj5W1N50WDPnko3zQUVw==
X-Received: by 2002:a2e:9a87:: with SMTP id p7mr11275989lji.477.1623616402223;
        Sun, 13 Jun 2021 13:33:22 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id s26sm1333458ljd.128.2021.06.13.13.33.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jun 2021 13:33:21 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id d13so5063999ljg.12
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:33:21 -0700 (PDT)
X-Received: by 2002:a2e:b618:: with SMTP id r24mr6031999ljn.48.1623616401345;
 Sun, 13 Jun 2021 13:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=wi2KnsPbv2BOKHa+hb3CmyxsWRQBmSrzqzNezZ=vxH6bg@mail.gmail.com>
 <0a96ad37-dedb-67f3-3b27-1ff521c41083@gmail.com> <CAHk-=whO6fK4xCuEYDmDMVg_WKxP8cu429x7qjEO_k5sYVoMhg@mail.gmail.com>
In-Reply-To: <CAHk-=whO6fK4xCuEYDmDMVg_WKxP8cu429x7qjEO_k5sYVoMhg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 13 Jun 2021 13:33:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wje1Y3hVoQX-jZNQcscUuXO7Fe9tNQBcfyLJNUDMegT4g@mail.gmail.com>
Message-ID: <CAHk-=wje1Y3hVoQX-jZNQcscUuXO7Fe9tNQBcfyLJNUDMegT4g@mail.gmail.com>
Subject: Re: [PATCH v1] m68k: save extra registers on sys_exit and
 sys_exit_group syscall entry
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andreas Schwab <schwab@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Jun 13, 2021 at 1:26 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> and then in gdb you just do
>
>         b main
>         run

Btw, this extra stage is unnecessary, but if I just do that "catch
syscall group:process" before the process has even started, gdb gets
confused at the start.

You could skip this and just do "catch syscall exit_group" and then "run".

I used that "group:process" just to catch both the legacy "exit" and
the new "exit_group", but then it catches fork/execve too, and I think
that's what confuses gdb when it happens as you start the process.

Just to clarify why I did that odd thing.

             Linus
