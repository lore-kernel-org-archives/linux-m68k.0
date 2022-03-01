Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5035C433F5
	for <linux-m68k@archiver.kernel.org>; Tue,  1 Mar 2022 19:27:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbiCAT1w (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 1 Mar 2022 14:27:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235139AbiCAT1v (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 1 Mar 2022 14:27:51 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B662D69CF9
        for <linux-m68k@lists.linux-m68k.org>; Tue,  1 Mar 2022 11:27:09 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id z11so5874436pla.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 01 Mar 2022 11:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sjfszq0s6rA1DoiuWgRAAaEXXX3ctOb/kx6v17T7+bs=;
        b=BUf/UxXV9ZTYi6bHIcNSeiVmUkwhpOMtCQdiWC+ay4Z9S5wpiOYuCXCIxzehzgVk+o
         W1Tz6uC//wm7JDPdHnohPUL8ayfoRdAEJXWOuhp93F6AdjS5zhsdIRdXcMl7LoOxgL5S
         cQ30ZduAtMTvuIT0IWAMAwvVyturUwj7e81GnYaWkgLwpGQx/29YuWDIvgD88vu2/cB6
         lIW0y9fMxEHGPAxzIoTAq6cd1acGDgmWfhBtF0rb1zYTJ9wsVCsqlUD6L5WIt+Ny+URQ
         qK/qz8orT5hZdWRoZ/8JDnt+u1fh9VpSE+nS2ipRNMJp4cJoUQCsCZ7QfPYtwzh2NcxW
         Yddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sjfszq0s6rA1DoiuWgRAAaEXXX3ctOb/kx6v17T7+bs=;
        b=ambA44phcXpR7J8lz7Jb4tr5SH6OEtz4mbmJSKot9F0KtH+k6crk4ftDdCq7AtBajs
         VxEPQQ4RrFBKkgxLxUBApdBksx0xvO2SfO/DX1eX//PF/+aVVlycr/iVgAfizxwJXuDO
         urUjVSKoU3UClzJMYQR0rSghr6qLzAQRWkjMbEEni+NYLywO7iBHp3p7Nnf2VeZWgCGO
         t/mMiE8Jg95zGt/J5z0bRW3FvExqJ4yleV/ncLuu1wBv7UhP3YrO15ELLCMhDj7KFUKG
         uuonm0SblP+J3zBo+XzhNmXVhBQP5xkUDQQpGmzDFlolKdasu09UAMtT8LB/3aNw1cqG
         /aIQ==
X-Gm-Message-State: AOAM531VZIAUPz6l7AuZQMVNHgixA8F6njHY8yT4yHqrGaO10SYRVK+O
        fo88Nw8SYnPn3CA9tiybmkE=
X-Google-Smtp-Source: ABdhPJzLhA38IVBgeS0jS6fmXrfvYXbSfkWLFcH+ksuu9OxckKZQpge4EPfXA8PI1btrQvPsQzH6hA==
X-Received: by 2002:a17:90b:4001:b0:1bc:68ec:ce48 with SMTP id ie1-20020a17090b400100b001bc68ecce48mr23182579pjb.133.1646162828937;
        Tue, 01 Mar 2022 11:27:08 -0800 (PST)
Received: from kitty ([12.231.191.170])
        by smtp.gmail.com with ESMTPSA id u9-20020a056a00158900b004de90b164d0sm19309394pfk.9.2022.03.01.11.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 11:27:08 -0800 (PST)
From:   10maurycy10@gmail.com
X-Google-Original-From: mz@kitty
Date:   Tue, 1 Mar 2022 11:27:16 -0800
To:     linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org
Subject: Re: Re: [PATCH RFC v0] random: block in /dev/urandom
Message-ID: <Yh5zA1T9GRBFi5H9@kitty>
References: <20220211210757.612595-1-Jason@zx2c4.com>
 <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcab986b-d0bd-c798-de17-266abcdc7da2@gentoo.org>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sat, Feb 12, 2022 at 06:05:54PM -0500, Joshua Kinard wrote:
> On 2/11/2022 16:07, Jason A. Donenfeld wrote:
> > This is very much an RFC patch, or maybe even an RFG -- request for
> > grumbles. This topic has come up a million times, and usually doesn't go
> > anywhere. This time I thought I'd bring it up with a slightly narrower
> > focus. Before you read further, realize that I do not intend to merge
> > this without there being an appropriate amount of consensus for it and
> > discussion about it.
> > 
> > Ever since Linus' 50ee7529ec45 ("random: try to actively add entropy
> > rather than passively wait for it"), the RNG does a haveged-style jitter
> > dance around the scheduler, in order to produce entropy (and credit it)
> > for the case when we're stuck in wait_for_random_bytes(). How ever you
> > feel about the Linus Jitter Dance is beside the point: it's been there
> > for three years and usually gets the RNG initialized in a second or so.
> >

What about the case where a small amount of entropy is avalable?

> > 
> > As a matter of fact, this is what happens currently when people use
> > getrandom(2).
> > 
> > So, given that the kernel has grown this mechanism for seeding itself
> > from nothing, and that this procedure happens pretty fast, maybe there's
> > no point any longer in having /dev/urandom give insecure bytes. In the
> > past we didn't want the boot process to deadlock, which was
> > understandable. But now, in the worst case, a second goes by, and the
> > problem is resolved. It seems like maybe we're finally at a point when
> > we can get rid of the infamous "urandom read hole".
> >

Why not keep the distinction between /dev/random and /dev/urandom when a
good entropy source is not avalable?

> > 
> > Maybe. And this is why this is a request for grumbles patch: the Linus
> > Jitter Dance relies on random_get_entropy() returning a cycle counter
> > value. The first lines of try_to_generate_entropy() are:
> > 
> > 	stack.now = random_get_entropy();
> > 	/* Slow counter - or none. Don't even bother */
> > 	if (stack.now == random_get_entropy())
> > 		return;
> > 
> > So it would appear that what seemed initially like a panacea does not in
> > fact work everywhere. Where doesn't it work?
> > 
> > On every platform, random_get_entropy() is connected to get_cycles(),
> > except for three: m68k, MIPS, and RISC-V.
> > 
> 
> [snip]
> 
> > 
> > I think what this adds up to is that this change would positively affect
> > everybody, except for _possibly_ negatively affecting poorly configured
> > non-Amiga m68k systems and the MIPS R6000 and R6000A. Does that analysis
> > seem correct to folks reading, or did I miss something?
> > 
> > Are there other cases where the cycle counter does exist but is simply
> > too slow? Perhaps some computer historians can chime in here.
> > 
> > [snip]


This should realy be a config flag. (URANDOM_SECURE_RANDOM?).

> 
> 
> -- 
> Joshua Kinard
> Gentoo/MIPS
> kumba@gentoo.org
> rsa6144/5C63F4E3F5C6C943 2015-04-27
> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
> 
> "The past tempts us, the present confuses us, the future frightens us.  And
> our lives slip away, moment by moment, lost in that vast, terrible in-between."
> 
> --Emperor Turhan, Centauri Republic
