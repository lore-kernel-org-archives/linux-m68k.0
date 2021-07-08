Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BCBC07E96
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 06:33:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9047A61C94
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 06:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhGHGf6 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 8 Jul 2021 02:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbhGHGf6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 8 Jul 2021 02:35:58 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5BDC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 23:33:17 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id v7so4928544pgl.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 23:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=f4Q9Jb6cYUuiLYCa64udNdpMNE661MXv1QRiw7kjVfI=;
        b=IW4nMuNnt7p+qgQgShWWw50vWbs2KdISMyRIEpMH0HyyOfBrl2nI8THsrZYuT3wR+K
         z+LZ9uZvdo1ScNGkySe5hspa7q7Xn1rsH3qv3YejBkNud7L10IZl9PP5SsrvHLEOJr9p
         TvPSQ95lYGHNkK6o/lowyVkrNIu2J/uLaswZgGVhqf1JxnMafxCRdODt7nSOcdQRMerr
         J4b4F6F2gZwZIRLxl5UNClVmOWF0R+1I/zdi45b+OHXX73u4Z7rasIsOES7HyeN/iE3N
         rAPFR3XtjT1J5zJdqq8Di7wvijUAGbeDLZhhC/gyDSfhCil9sh8tRIbz5IKufEpjB+JI
         InVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=f4Q9Jb6cYUuiLYCa64udNdpMNE661MXv1QRiw7kjVfI=;
        b=n1YpuQKOfpeXYFChnUhrTdu0oRz8r/R3bSPNk8el4mCbOYJGD8jmQZ0famgrdgplRI
         VkjSsgqs8H6M+3kDTMUmcPADKCvyOK4VZa5fuSLNFvQTUjQSFBFieumh1eI2db+MJ2Py
         K1s2Pw50eZtYOhkcwKr3kUd4kBqhrrvH7aIjPoKZ+lQulfPtbkLr/ciof1K+509suB2I
         RZN7x2lJ37ePmcYJrJH6mVXT9qXvRDPM4m42A8A/VBdjMzew2c7j3YBKEFhw5cIuUpJk
         tMTkr5coJ9d6z0bW87WRczf4avLgYD2XvW+zmYDD044eIysor+8Nx3C3Zos7MM2QBUiz
         ooMA==
X-Gm-Message-State: AOAM530N3+04mbah1h9V5QVvx00btX5sNy+qq4/g70d/muts0aU12K/j
        k3BHn2vEr43ngr4VgW4lddI=
X-Google-Smtp-Source: ABdhPJy92vNC8ocd7zJ6Nb3WFpd9ufYwSRy983QVb6cBiGcvU8YE9Li9jCBLpmrz/3d3sa0fhW877A==
X-Received: by 2002:a62:8802:0:b029:323:605d:8f3a with SMTP id l2-20020a6288020000b0290323605d8f3amr12522943pfd.20.1625725996301;
        Wed, 07 Jul 2021 23:33:16 -0700 (PDT)
Received: from [10.1.1.25] (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.gmail.com with ESMTPSA id f31sm1011460pgm.1.2021.07.07.23.33.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jul 2021 23:33:15 -0700 (PDT)
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Linus Torvalds <torvalds@linux-foundation.org>
References: <20210705055719.949875-1-hch@lst.de>
 <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
 <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
 <3c736dc7-dd0c-0691-ece4-e7dc9aaa3a54@gmail.com>
 <CAHk-=wjPcjY0TUNeh1pwC2s4xk=MPJGu_66+ywJ3SbmrEW5Yxg@mail.gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@lst.de>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <ee534a05-394e-41f1-75be-2fc2b76c286b@gmail.com>
Date:   Thu, 8 Jul 2021 18:33:09 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc; rv:45.0) Gecko/20100101
 Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjPcjY0TUNeh1pwC2s4xk=MPJGu_66+ywJ3SbmrEW5Yxg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

Am 08.07.2021 um 16:14 schrieb Linus Torvalds:
> On Wed, Jul 7, 2021 at 8:40 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
>>
>> going back to this one, I missed that bit earlier - the last three hunks
>> of your patch replaced KERNEL_DS by USER_DATA, everywhere else it's
>> replaced by SUPER_DATA. Typo, or something too subtle for me to grasp?
>
> So I think the old KERNEL_DS was purely legacy, and isn't what I think
> it's really supposed to be. It didn't _matter_, because then execve()
> will set it to USER_DS by the time you run any user program, but I
> didn't like it.
>
> So I decided that in the new world order, the rules should be really
> straightforward and simple:
>
>  - SFC/DFC is always USER_DATA normally, which is how get_user/put_user want it.
>
>  - special functions that actually use SFC/DFC for some temporary
> override will set it to that temporary value, and then restore it to
> USER_DATA after use.
>
> and that's what I wrote my patch for.

OK, got it now.

> BUT! And this is the important part:
>
> My patch was completely untested garbage. I may have had opinions, I
> may have had a plan, but the reality is that without testing (and
> fixing things up for the things I had missed - like the code in
> mm/maccess.c) that plan is just so much hot air.
>
> In other words, take the above with a big pinch of salt.
>
> And I want to stress once more time: if any of the SFC/DFC
> modifications are done in interrupt handlers, that whole "set it back
> to USER_DATA" is _wrong_. If they can happen in interrupts, then those
> functions that modify SFC/DFC need to save the old value, and restore
> it at the end, because otherwise you might have
>
>  - function that uses SFC/DFC:
>
>    set new 'value A'
>
>         <- get interrupt here
>            nested function that uses SFC/DFC
>            set new value B
>            .. do whatever special op
>            set SDC/DFC to USER_DATA
>         <- interrupt returns
>
>    original SFC/DFC function now has SFC/DFC with USER_DATA
>    it _wanted_ to have it with 'value A'
>
> See the problem?
>
> So if nesting can occur - due to interrupts - then all the things that
> set a different SFC/DFC really need to save/restore the old one,
> rather than set it back blindly to USER_DATA.

I can't recall any use of get_user() etc. in interrupt handlers, but 
that certainly warrants a closer look.

> Also, finally: my patch had that "preempt_disable/preempt_enable"
> around the SFC/DFC modifications. That was hot garbage. Christoph
> correctly pointed out that switch_to() will save/restore SFC/DFC, so
> there's no real reason to.
>
> Except now that I think about it, I worry about getting scheduled away
> *between* the instruction that sets SFC and the one that sets DFC. And
> then switch_to() will save just SFC to the thread-struct. And then
> restore the (new thread) SFC value to _both_ SFC and DFC.

I wonder whether we can end up scheduling in the return path from an 
interrupt (interrupts return via ret_from_exception on m68k, and that 
has a test for thread info flags relating to reschedule and signals)...

>
> So task switching doesn't actually save and restore SFC and DFC. It
> only really saves SFC, and then it restores both SFC and DFC with the
> same value.
>
> Which should be ok, if the m68k code that modifies DFC will _always_
> have modified SFC to the new value first. So even if we then schedule
> away and back in between the two instructions, it only means that
> we'll set DFC then to the value that it will soon be assigned anyway.
>
> But it's all a tiny bit subtle and somewhat confusing.

Bit too subtle for me still ...

Cheers,

	Michael

>
>                   Linus
>
