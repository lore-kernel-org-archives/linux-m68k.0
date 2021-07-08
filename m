Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3C1C07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:14:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D028161CD5
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 04:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhGHERa (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 00:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbhGHERa (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 00:17:30 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EE9C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 21:14:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id p21so10856702lfj.13
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=smnbtIEm8n0eqG2DpuQUo/OM6a9OzPGT6CIyftc/7n8=;
        b=V0SLORR0teJA4Vc8Lqasx9xrAKWw55gv+iml7Okg+bxIOLwhdawW/DQeN+vzNMdZYG
         gnYkfxV1hMv6MvUL8B2lRhHMg9Jby6BROO/f0dURAdeELes5qy8yA38qNIZtA4DYqFL/
         2DAlySA4+05UTTyDgc0ag4PDUgKNDR90dq+qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=smnbtIEm8n0eqG2DpuQUo/OM6a9OzPGT6CIyftc/7n8=;
        b=n5GJu5Q36OEAfg9K3JkS2lcxT7OXpqjxDgr/itWYumi8liQIvAX9UfqusU0/35GPQL
         MC5xpQ3sXWdwqQksmdCQqZ/tQq3dhoQ3ikCiOpVouYL5e8GaCyri90faUpnE6rOU4+7n
         CwWe1+MAMpiZBbdI9WsPx0dCeXwoIuwTpagAAFR4YPJhCO7PyTBYwspmpu5ncSr51PmE
         EOWaB2NyxopzhQORaE2TUalM0zeK1BFfN4EiXS8XrXUJPDvBBLUUo3xAwW5Am2brIpdP
         jtcRQPVaPXepqENROuoRPVY1RAVN0DemDuPPmIm8Yh6zjXZ3nOELyStsXlapMjOgJKaE
         HEQA==
X-Gm-Message-State: AOAM532J3zjDUPILXKrexSovgNsPevqPRKbWZtglIrY6y/+dnvVOC4z+
        ygeSJVe903enMQlQGDQv/49Rt/TYEWH9l/M+6Ek=
X-Google-Smtp-Source: ABdhPJzvuZ7h65uejRvjus/JJC2qooZqiNSfPWYFZTzam5K24/JxNgbpmuUkkcy299q3jHez4Cluyg==
X-Received: by 2002:ac2:5e8d:: with SMTP id b13mr21149389lfq.452.1625717686137;
        Wed, 07 Jul 2021 21:14:46 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id n17sm75278lft.74.2021.07.07.21.14.45
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 21:14:45 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id y42so10944359lfa.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 21:14:45 -0700 (PDT)
X-Received: by 2002:a05:6512:3f82:: with SMTP id x2mr21306375lfa.421.1625717685406;
 Wed, 07 Jul 2021 21:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210705055719.949875-1-hch@lst.de> <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
 <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com> <3c736dc7-dd0c-0691-ece4-e7dc9aaa3a54@gmail.com>
In-Reply-To: <3c736dc7-dd0c-0691-ece4-e7dc9aaa3a54@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 7 Jul 2021 21:14:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjPcjY0TUNeh1pwC2s4xk=MPJGu_66+ywJ3SbmrEW5Yxg@mail.gmail.com>
Message-ID: <CAHk-=wjPcjY0TUNeh1pwC2s4xk=MPJGu_66+ywJ3SbmrEW5Yxg@mail.gmail.com>
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Michael Schmitz <schmitzmic@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 7, 2021 at 8:40 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>
> going back to this one, I missed that bit earlier - the last three hunks
> of your patch replaced KERNEL_DS by USER_DATA, everywhere else it's
> replaced by SUPER_DATA. Typo, or something too subtle for me to grasp?

So I think the old KERNEL_DS was purely legacy, and isn't what I think
it's really supposed to be. It didn't _matter_, because then execve()
will set it to USER_DS by the time you run any user program, but I
didn't like it.

So I decided that in the new world order, the rules should be really
straightforward and simple:

 - SFC/DFC is always USER_DATA normally, which is how get_user/put_user want it.

 - special functions that actually use SFC/DFC for some temporary
override will set it to that temporary value, and then restore it to
USER_DATA after use.

and that's what I wrote my patch for.

BUT! And this is the important part:

My patch was completely untested garbage. I may have had opinions, I
may have had a plan, but the reality is that without testing (and
fixing things up for the things I had missed - like the code in
mm/maccess.c) that plan is just so much hot air.

In other words, take the above with a big pinch of salt.

And I want to stress once more time: if any of the SFC/DFC
modifications are done in interrupt handlers, that whole "set it back
to USER_DATA" is _wrong_. If they can happen in interrupts, then those
functions that modify SFC/DFC need to save the old value, and restore
it at the end, because otherwise you might have

 - function that uses SFC/DFC:

   set new 'value A'

        <- get interrupt here
           nested function that uses SFC/DFC
           set new value B
           .. do whatever special op
           set SDC/DFC to USER_DATA
        <- interrupt returns

   original SFC/DFC function now has SFC/DFC with USER_DATA
   it _wanted_ to have it with 'value A'

See the problem?

So if nesting can occur - due to interrupts - then all the things that
set a different SFC/DFC really need to save/restore the old one,
rather than set it back blindly to USER_DATA.

Also, finally: my patch had that "preempt_disable/preempt_enable"
around the SFC/DFC modifications. That was hot garbage. Christoph
correctly pointed out that switch_to() will save/restore SFC/DFC, so
there's no real reason to.

Except now that I think about it, I worry about getting scheduled away
*between* the instruction that sets SFC and the one that sets DFC. And
then switch_to() will save just SFC to the thread-struct. And then
restore the (new thread) SFC value to _both_ SFC and DFC.

So task switching doesn't actually save and restore SFC and DFC. It
only really saves SFC, and then it restores both SFC and DFC with the
same value.

Which should be ok, if the m68k code that modifies DFC will _always_
have modified SFC to the new value first. So even if we then schedule
away and back in between the two instructions, it only means that
we'll set DFC then to the value that it will soon be assigned anyway.

But it's all a tiny bit subtle and somewhat confusing.

                  Linus
