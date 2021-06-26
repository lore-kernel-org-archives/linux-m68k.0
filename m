Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D833C49EA7
	for <linux-m68k@archiver.kernel.org>; Sat, 26 Jun 2021 03:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B2246194B
	for <linux-m68k@archiver.kernel.org>; Sat, 26 Jun 2021 03:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbhFZDWy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Jun 2021 23:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhFZDWx (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 25 Jun 2021 23:22:53 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E38B1C061768
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Jun 2021 20:20:31 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id x22so5690043pll.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Jun 2021 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m/r2jKnf6mzXHGS0+mY6tO8kdxoIVifevnwrBMvWaHk=;
        b=k5evDFcu122UMvrbb5kz6pJG46rSJobzAashV394QfzBP+VFZW1qcemLOWIMTqTwnO
         KhX0VgfKs97JSqirj7NxmKbJhyY7pwgk8AjhjA15rr2M34TyDxxbjmKofm2KW8+ZtL0q
         Wq8LJ8oNzBFS43JDygd5Msv1UzewtYzPIfmIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m/r2jKnf6mzXHGS0+mY6tO8kdxoIVifevnwrBMvWaHk=;
        b=enm3huneSUD4hLSYdSsKBh0xTndwAD51ULXPwACS9K9AI9verG6g0QP0fWyHex4HhD
         8FeWhdDiNz+W4riwzlyKBjxbXdeRNClCbZWu4rsutpstFTGFrg8ldKussYIhVw2/fYrs
         wl9uOpxD+kHI4kcIGQyeDmgttuyKQp9e0gPC0EboW/I4a++fvCntxdHaXdV/CUYGstLN
         c8NL5MUsKy4KqXbtQI8VmqF+12mwzIp97cYZg//mTxp27M4TXJErUz1f1h2XPQExxWe1
         5KrEDzyD896nKs3JjZw4pR+J32aFWFqAtl41QaERtPfw86a4H0b3na/oQBDBlLZzSuSE
         FMOg==
X-Gm-Message-State: AOAM533POZEb7iFEcacaY8R3xtmy9ufVI2e8mzhbG2fyKjfKckwnFvxJ
        6/GYPK1W/a0MvDRBORtWwHzK5g==
X-Google-Smtp-Source: ABdhPJx6GLx4csCnOZlukBXZovccTKxSC/6UVhMJK8OX54jANvNUvIHSf9UYkCV8OtkrYu2Hzi1FWg==
X-Received: by 2002:a17:90a:3d09:: with SMTP id h9mr23591717pjc.78.1624677631208;
        Fri, 25 Jun 2021 20:20:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h18sm6660549pgl.87.2021.06.25.20.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 20:20:30 -0700 (PDT)
Date:   Fri, 25 Jun 2021 20:20:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
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
        Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 3/9] signal/seccomp: Dump core when there is only one
 live thread
Message-ID: <202106252018.0EC329C@keescook>
References: <YNCaMDQVYB04bk3j@zeniv-ca.linux.org.uk>
 <YNDhdb7XNQE6zQzL@zeniv-ca.linux.org.uk>
 <CAHk-=whAsWXcJkpMM8ji77DkYkeJAT4Cj98WBX-S6=GnMQwhzg@mail.gmail.com>
 <87a6njf0ia.fsf@disp2133>
 <CAHk-=wh4_iMRmWcao6a8kCvR0Hhdrz+M9L+q4Bfcwx9E9D0huw@mail.gmail.com>
 <87tulpbp19.fsf@disp2133>
 <CAHk-=wi_kQAff1yx2ufGRo2zApkvqU8VGn7kgPT-Kv71FTs=AA@mail.gmail.com>
 <87zgvgabw1.fsf@disp2133>
 <875yy3850g.fsf_-_@disp2133>
 <87lf6z6qbd.fsf_-_@disp2133>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf6z6qbd.fsf_-_@disp2133>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jun 24, 2021 at 02:00:22PM -0500, Eric W. Biederman wrote:
> Replace get_nr_threads with atomic_read(&current->signal->live) as
> that is a more accurate number that is decremented sooner.

Okay, seems fine to me. :)

-- 
Kees Cook
