Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3481DC48BD1
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Jun 2021 22:06:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CCCB613F5
	for <linux-m68k@archiver.kernel.org>; Thu, 10 Jun 2021 22:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhFJWIH (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 10 Jun 2021 18:08:07 -0400
Received: from mail-lf1-f53.google.com ([209.85.167.53]:39688 "EHLO
        mail-lf1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhFJWIG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 10 Jun 2021 18:08:06 -0400
Received: by mail-lf1-f53.google.com with SMTP id p17so5535857lfc.6
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Jun 2021 15:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IH1SveIFJ5wJ6kocsX0s8v3WiB0uqtridXReuF2KUMY=;
        b=Qzof8FNEW2Ba5XPZGpDfZSR6rdtd6WGsu717h8Er0yjM+Qrz/xmDEYF47olKQxMaDV
         /WuPvFIxyme1vchmGP1HhMrAqH5OzNDJ6D669STTMCTBS8PPP8U2SeAmmSAiNv3xHWUT
         sYS5gTDilCKxc+IrHBQDdFNyeZ8axOedobMUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IH1SveIFJ5wJ6kocsX0s8v3WiB0uqtridXReuF2KUMY=;
        b=rScI6s8Pj6JMKVs/htzkWzVuThqtr46CBCQHZDowtXSKtPPLbMHdv27d5jSYZai9Pa
         QhUZmmPV54useW5KaVufU0cv2jVe18baFwHRYf0a7QgcVTekF+ztiuWuIMAf4RM5W3Hb
         i2aEMdWpiQJr/pYXL+9wnV9SMhdpvxASUnPbPboXIfsp0RLoHt2kbLBdd0kzPEYPY/1W
         5mkdToqNuXGBK8Vwwy4TXBJ2+nFax5nue+KM58zmIOx3vr04CDm2MZAJO9XD8vb1k9Ti
         Exez5VCkxIOEW6xwt2SGyJMv1R6IuQ2dMZYwOXKQbMbqWg15yDSamwpoOdiwdpZt0LSE
         O8NA==
X-Gm-Message-State: AOAM5323PjxyTmPdtRTZHNh01GU0EslwELqXnDYTElzvNi3P7mrrbMn2
        XzJxL+LZ+xqj33q1jrTkYYRMTZ6D1Ie32ArKtKQ=
X-Google-Smtp-Source: ABdhPJxewfaxe6F/239nQ77CBHSsOsi6ijzi3nzYzdT1ZhtP1q/+/6LewXwnR1drPgzQi9hDrbADpA==
X-Received: by 2002:ac2:551d:: with SMTP id j29mr563685lfk.319.1623362692118;
        Thu, 10 Jun 2021 15:04:52 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id x15sm409438lfa.156.2021.06.10.15.04.49
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 15:04:50 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id r5so5542156lfr.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 10 Jun 2021 15:04:49 -0700 (PDT)
X-Received: by 2002:ac2:43b9:: with SMTP id t25mr578806lfl.253.1623362689248;
 Thu, 10 Jun 2021 15:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <87sg1p30a1.fsf@disp2133>
In-Reply-To: <87sg1p30a1.fsf@disp2133>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 10 Jun 2021 15:04:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
Message-ID: <CAHk-=wjiBXCZBxLiCG5hxpd0vMkMjiocenponWygG5SCG6DXNw@mail.gmail.com>
Subject: Re: Kernel stack read with PTRACE_EVENT_EXIT and io_uring threads
To:     "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     linux-arch <linux-arch@vger.kernel.org>,
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
        Tejun Heo <tj@kernel.org>,
        Daniel Jacobowitz <drow@nevyn.them.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jun 10, 2021 at 1:58 PM Eric W. Biederman <ebiederm@xmission.com> wrote:
>
> The problem is sometimes we read all of the registers from
> a context where they are not all saved.

Ouch. Yes. And this is really painful because none of the *normal*
architectures do this, so it gets absolutely no coverage.

> I think at this point we need to say that the architectures that have a
> do this need to be fixed to at least call do_exit and the kernel
> function in create_io_thread with the deeper stack.

Yeah. We traditionally have that requirement for fork() and friends
too (vfork/clone), so adding exit and io_uring to do so seems like the
most straightforward thing.

But I really wish we had some way to test and trigger this so that we
wouldn't get caught on this before. Something in task_pt_regs() that
catches "this doesn't actually work" and does a WARN_ON_ONCE() on the
affected architectures?

               Linus
