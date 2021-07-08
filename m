Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9FBC07E95
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 03:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E680561C40
	for <linux-m68k@archiver.kernel.org>; Thu,  8 Jul 2021 03:40:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhGHDnh (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 7 Jul 2021 23:43:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhGHDnh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 7 Jul 2021 23:43:37 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59792C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed,  7 Jul 2021 20:40:55 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id u14so4513044pga.11
        for <linux-m68k@lists.linux-m68k.org>; Wed, 07 Jul 2021 20:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=s3lhWDsAp0c7FeLsyyjAH1Z6u2dhZHW6Zov46WdH7JE=;
        b=jEOYgWXyNPdyipqRFD2u5bC/E4WKueR2qjmnbuHTLrUw9eN71aUE9PQO4gLi+TGG8D
         jSksLhpuTdi6ESLawOelX4fi/O8jzzsuQ6LaCW9RYcV9/mEk4+3P9nzSefJMCe40ao7T
         r2xZKDj70GTZ27biDvkpyHxnljamM2TruJWCXEV9j/vipqO++VsYpRNYSuHJDQZ4LUfG
         C72pWAYL/6APXmmttSy8Y55lHAI1s4biisstOP+exoXPA0GiiSGVH89385VkLS7f9PjR
         S9Q1+OCcZObZ/XEmiOgPqxEmfCnJKg/8vdr8PdZIDGRV+8StGKlR+6GmOIRfseeZE/c1
         OYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=s3lhWDsAp0c7FeLsyyjAH1Z6u2dhZHW6Zov46WdH7JE=;
        b=rtqVbhOvdLdy7iisBXcK1cG+gnGhmp8ZCPRkrn8Bshwxyj/yLdM45NQlVRLcj/Pdkt
         ohAlhmipCmHh0AVsAXe7pz5qUNhrX8pBKVzEOBMOQ+21TJ1w1AeBp0CoB1q3OcuyRSHy
         GQn9j5goYR+jsNvYDnecSM1cFS8T7nZ7rauyaycKzq/1QO+ioSDq5Ms57GkJybDwRc+9
         bl5PIyzmbYQhhl/E7FOMa7cm53yhWDi4rlfdz3LpJW3DyET3wxKXUbVdAZD33o2+E/mE
         h4qzxkA/fNQoxLwgUL/o5MbwtgvhbR9RY744vnfGFsbiJh1u0ERxw6RSDqfo2sPJyRwI
         O4iA==
X-Gm-Message-State: AOAM531g/3DFQTyqpr+IOeMyEBlDkwGowWV55vRJ4nXJ2AmYZECkUlPt
        NssZOk4Ojor1l1mjTEsoNnA=
X-Google-Smtp-Source: ABdhPJxptZe2FVkrpw79LN5bs8FtAV1PlMogmva2kuqGcmTFDnzJblExdIB7hyo2ZEnAVn3QrguDxQ==
X-Received: by 2002:a05:6a00:23d0:b029:2de:c1a2:f1e with SMTP id g16-20020a056a0023d0b02902dec1a20f1emr29067522pfc.60.1625715654918;
        Wed, 07 Jul 2021 20:40:54 -0700 (PDT)
Received: from Schmitz-MacBook-Pro.local (222-152-189-137-fibre.sparkbb.co.nz. [222.152.189.137])
        by smtp.googlemail.com with ESMTPSA id e2sm859289pgh.5.2021.07.07.20.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 20:40:54 -0700 (PDT)
Subject: Re: [PATCH] m68knommu: remove set_fs()
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        uClinux development list <uclinux-dev@uclinux.org>
References: <20210705055719.949875-1-hch@lst.de>
 <20210705055719.949875-2-hch@lst.de>
 <CAMuHMdV4UQaKE7fn0_HhPfHzwEMwouPvqoeW6_V13yebe7ZSQQ@mail.gmail.com>
 <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <3c736dc7-dd0c-0691-ece4-e7dc9aaa3a54@gmail.com>
Date:   Thu, 8 Jul 2021 15:40:49 +1200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgjWebav7K_F7WS7KiwOAYr8KktsZiaV+jYP5LU5RB3Sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Linus,

going back to this one, I missed that bit earlier - the last three hunks
of your patch replaced KERNEL_DS by USER_DATA, everywhere else it's
replaced by SUPER_DATA. Typo, or something too subtle for me to grasp?

Cheers,

    Michael


Am 06.07.21 um 08:39 schrieb Linus Torvalds:
> On Mon, Jul 5, 2021 at 1:46 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> Probably this should be
>>
>>     select SET_FS if CPU_HAS_ADDRESS_SPACES
> Actually, I don't think m68k has a single real "set_fs()" at all, and
> it should just be converted as-is to not use CONFIG_SET_FS.
>
> Yes, there is a "set_fs()" function, but none of the remaining uses
> actually are the traditional kernel style of "use kernel addresses as
> user addresses". So as far as the *kernel* is concerned, m68k already
> looks like a no-SET_FS architecture, and "set-fs()" is purely a
> syntactic thing.
>
> So I think the right thing to do looks something like this:
>
>  - make the rule be that SFC/DFC is always normally USER_DATA
>
>  - the special m68k sequences that need to play with special segments
> will always do
>
>         preempt_disable();
>         set_segment(..whatever segment they need..);
>         .. do the special operation ..
>         set_segment(USER_DATA);
>         preempt_enable();
>
>  - set_fs() goes away entirely, because the user access functions
> always work on USER_DATA and SFC/DFC is always right for them.
>
> Anyway, I'm attaching a COMPLETELY UNTESTED AND ALMOST CERTAINLY VERY
> VERY BROKEN patch that is likely not at all correct, but shows what I
> think the solution should be.
>
> The important thing is really just the removal of SET_FS entirely, the
> rest is me winging it.
>
> NOTE! The above very much assumes that all the special non-USER_DATA
> accesses can always be done with preemption disabled. Why? Because I
> also made the context switching always just save USER_DATA as the
> segment. I didn't *remove* the segment switching - because I'm not
> sure if that "just disable preemption across things that do segment
> games" is actually valid.
>
> So *if* that preempt_disable/enable is ok, then the segment switching
> can just be removed entirely at context switch time.
>
> And if it is *not* ok, then the preempt_disable/enable should go away,
> and the context switch should save/restore the actual SFC/DFC value.
>
> Again - let me be very very clear: the only m68k I've ever used was a
> 68008. It didn't have segments. This patch is COMPLETE GARBAGE. Do not
> trust it. Do not use it for anything but a "Linus suggests maybe
> something along these lines could work".
>
> This has not even been build-tested, and I'm pretty sure it won't
> build as-is. It really is a "Linus did some pattern matching and a few
> grep's".
>
> Oh, and if the magical SFC/DFC games can happen in interrupts, then
> the "preempt_disable/enable" actually needs to be a full interrupt
> disable/enable, or the code needs to re-introduce that "save old
> value, restore it". So that's another assumption this example patch
> makes - that the SFC/DFC games only happen in process context. Which
> may be complete garbage too.
>
> Did I mention that I think this patch is garbage? Because it really is.
>
>                 Linus
