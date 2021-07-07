Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E44C07E95
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 17:41:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E180761CC2
	for <linux-m68k@archiver.kernel.org>; Wed,  7 Jul 2021 17:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhGGRoQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 13:44:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhGGRoP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 13:44:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1B7C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 10:41:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r26so6006923lfp.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 10:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YKHQ/rw8LlbQWpNabXm024WWtkQF86zvYrgEkfafFog=;
        b=aRM8KAbfkQSDWPvNa1CKbGMVm9G9iQY1kyF6Z1putF8KlrySN3/lfMSc/DxOwiq1LR
         VA5MFwaAHl+lHSs1AGV05tf0np3O6/58fGxmjkyxzSTpD422ds3KnFAY8PZOoRYm6pZG
         /Rn07mjjAbXrRZo8CmfJ0T7TVdKLOL3Wf6pUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YKHQ/rw8LlbQWpNabXm024WWtkQF86zvYrgEkfafFog=;
        b=fEMksBrZQRoURlY2zwnIfa6fm07uJhtMVGOdLbHE05fZ4NgHf/O/N8Y30CkpbLskIT
         tfyZWz5gdJ5TK2CwVRSNTyTGn8IUrODwfCZg4dssTUopJ3ZpaD5oanB0uFkkCMFZe9F3
         ols3Vc1++ZJDzsIpbtajFATcBRyLTWOYMhax+c/3uh9dp/iM4I4rMzpY3pd3tfULqa1n
         pgomLcWe/+8u1y0qXxrn9jZ9P1gAMp2El9teC4Jx6pvX8HcY6eti3HzSJPSHR/7tsYeU
         Zy5cXi1hoTv/MGFSdaT7qi7GQz8zf9VUzeqUsyqx7dKKczjVollL7eDu0VbI0iyAndUY
         eGbg==
X-Gm-Message-State: AOAM533ayEre2wm0Z9gmBwW1EfP861/aQbxNPu55bLjj8nYYmhDHuNh6
        4C5VVWewminT5oyx5ibsK9ASxrt6YgxhwQuq
X-Google-Smtp-Source: ABdhPJxgW/RxB96I24FNFBel3/rN+5K03/RHojUCHZfEfPSKt4fpbySwOYgQiRR7LfP/8rkRl/1arQ==
X-Received: by 2002:a2e:808d:: with SMTP id i13mr20485324ljg.172.1625679692746;
        Wed, 07 Jul 2021 10:41:32 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id k17sm1762036lfm.282.2021.07.07.10.41.32
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 10:41:32 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id p16so6017359lfc.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 10:41:32 -0700 (PDT)
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr19562341ljj.411.1625679691806;
 Wed, 07 Jul 2021 10:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
 <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
 <20210706041353.GA10889@lst.de> <CAHk-=wjZRs8icwmK4g-XSmY7PB9WUhi3=KGs5NsV7QO=uW_taw@mail.gmail.com>
 <20210707142531.GA26080@lst.de>
In-Reply-To: <20210707142531.GA26080@lst.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 10:41:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh2nz6BdDGoJf9Gb=zsmBtfYyOvQqZptRPuk4WH98JHnQ@mail.gmail.com>
Message-ID: <CAHk-=wh2nz6BdDGoJf9Gb=zsmBtfYyOvQqZptRPuk4WH98JHnQ@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Christoph Hellwig <hch@lst.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>,
        Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 7, 2021 at 7:25 AM Christoph Hellwig <hch@lst.de> wrote:
>
> So I've come up with a whole (compile tested only) series.  We don't
> really need the preempt_disable either given the m68k saves and restores
> the SFC/DFC registers on context switch:

Your commit f349b7ab5f34 ("m68k: hardcode the error value in
__{get,put}_user_asm") is wrong. The fact that
__constant_copy_to_user() passes in a positive "error" value may look
odd, but it is correct.  It's not an error, it's a return value, and
"copy_to_user()" returns not -EFAULT, but the number of characters not
copied (because it needs to be able to restart - think partial
"read/write()" system calls etc).

That said, on x86, we've gotten rid of the small constant cases
entirely, because it just made such a mess of the uaccess.h files, and
we ended up just fixing any performance-sensitive code that used small
constant sizes to do the proper get/put_user() instead.

So one option is to just remove that constant-sized copy code entirely.

Also - can somebody verify that SFC/DFC is never modified in interrupts?

Because if that happens, then the "temporarily modify SFC/DFC"
sequences need to actually save/restore it, rather than just set it
back to USER_DATA.. But yes, you're right that switch_to() will
save/restore it for regular context switches.

Finally, talking about regular context switches - I think this series
should also rename "thread.fs" to "thread.segment" or something like
that.

Apart from those small details, I think that series looks very good.

                   Linus
