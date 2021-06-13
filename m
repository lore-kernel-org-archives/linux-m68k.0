Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23880C48BDF
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 20:26:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3731610A0
	for <linux-m68k@archiver.kernel.org>; Sun, 13 Jun 2021 20:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhFMU2p (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 13 Jun 2021 16:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhFMU2o (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 13 Jun 2021 16:28:44 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9EDC061574
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:26:27 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id p17so17497909lfc.6
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XoxaxoB26KFydlJxQzuZvQHGdzSalMGqJq/x7smY/qY=;
        b=Gp7j+VvfY/4cuumVaNyAmX8ySEzBlwhHdWraceOv8BOU+XYEAbhNbgTKhOsOZb0bO+
         ye/TCZI/fSfKUkGaStZ8Ds5Q9amNYicT7CY3sXFFJsSx8ywQRQuLTtKlflHkJEfYFuAy
         Dnp/jNycuDBJOpKvXmPpO5TtTzK6A36x2uVHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XoxaxoB26KFydlJxQzuZvQHGdzSalMGqJq/x7smY/qY=;
        b=d1VlJMM/MkC6Te8Tf//Wxo4ZzsFhmf609LaSaT0If2XMyGrmlQwOAdNLHlZ7xx/1o4
         ZbkmlfUp68CuesNW+j0bE113w7OS5l/5v2e3GO8kJd06r1GJ1plbw9IyNa6l1nBX0j60
         mAbNR1GuMVWabXNFTGBrzwWC8Ba1uv8xaycIaeFG7kopejmLVNyUMwZN+LRUyycxJ64O
         plNmjzrr/XtbFdjY1VHD4wSehGUtuuDqp+MTdiyq5/HOVA0pYY6lTPqc3csh4gOwHppv
         VZTFLBUiv5qRZO+MNoQh9AO9Ml/PyX9wfDDzVKu8nBqpFn74Y9H6/4+d0KxM6ZoY60d1
         V/kw==
X-Gm-Message-State: AOAM530UKZ3RP2Yi/yGGbbo5LCEnNTv93YP7yYxW5jckGaDbp3cEzMyw
        8wBYkDJrJeuQv9mKHNN2Pz8YMcWW9P1PRHk2
X-Google-Smtp-Source: ABdhPJxif4t3kpvJOuvrZ83NMq/+xSIzBk4qhNONSScLNj8TlpKYeasNmlO8+0iyF3pKGkT/ZpHIvw==
X-Received: by 2002:a05:6512:c1c:: with SMTP id z28mr9539501lfu.71.1623615985794;
        Sun, 13 Jun 2021 13:26:25 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id t13sm1265866lff.255.2021.06.13.13.26.25
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jun 2021 13:26:25 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id n17so17231621ljg.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 13 Jun 2021 13:26:25 -0700 (PDT)
X-Received: by 2002:a2e:964f:: with SMTP id z15mr7499352ljh.251.1623615984931;
 Sun, 13 Jun 2021 13:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133> <1623541098-6532-1-git-send-email-schmitzmic@gmail.com>
 <CAHk-=wi2KnsPbv2BOKHa+hb3CmyxsWRQBmSrzqzNezZ=vxH6bg@mail.gmail.com> <0a96ad37-dedb-67f3-3b27-1ff521c41083@gmail.com>
In-Reply-To: <0a96ad37-dedb-67f3-3b27-1ff521c41083@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 13 Jun 2021 13:26:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whO6fK4xCuEYDmDMVg_WKxP8cu429x7qjEO_k5sYVoMhg@mail.gmail.com>
Message-ID: <CAHk-=whO6fK4xCuEYDmDMVg_WKxP8cu429x7qjEO_k5sYVoMhg@mail.gmail.com>
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

On Sun, Jun 13, 2021 at 1:07 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> I'd love that, too. My test rig doesn't allow dumping of registers by
> strace, but someone else may have that capacity.

I think doing it manually with gdb should be fairly straightforward.

Something like

        gdb /bin/true

and then in gdb you just do

        b main
        run

and then

        catch syscall group:process
        c

and it should stop at the exit_group or exit system call.

At that point you can just do

        info registers

and see if they match what user space *should* be. They'll probably be
complete garbage without the fix.

I do not have an alpha or m68k machine to test (and not the
energy/inclination to set up some virtual environment in qemu either).
But it should be easy if you already have that environment.

             Linus
