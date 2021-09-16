Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EF0C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 00:55:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3D5B610D1
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 00:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233405AbhIPA47 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 15 Sep 2021 20:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233284AbhIPA47 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 15 Sep 2021 20:56:59 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3EECC061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 17:55:39 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id r2so4517479pgl.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 17:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=SWJ+O7xTSzypvU9MJRBc08IDjBowgyZWTz1sphL3dYk=;
        b=akkR7UKwuWbMnFjhU5j2rkW9tCSFFFsih8pI/4GPU6sdGhgBHOFHvI+75b58PWtfQd
         Gn1M66O0oKXvkBY1qXCgd+EhfSBIYLywKhfyMOz98nKpjKb7emKwwGoi7OwuCwj9zY0q
         KDOJVvIStgpLe7QFRDKZfeFVU+93/xOPEG9n43cStar8KrjQtxtUt5FPdeBrDhUnRurZ
         HrWsw9nNo1YwjRoXThjRZamAFCS3vYlcpNAx3T72DobiW2oFlIPCXiyxSFLnV01EgIeO
         Ayqfgu9pzWaYu/jarNyNmmFp+kpQf3A8JjvfOeSbUCjuqe6epqIF/gy28yVZRP6efcwg
         nUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=SWJ+O7xTSzypvU9MJRBc08IDjBowgyZWTz1sphL3dYk=;
        b=Bx78cN1k3kJT8+lN8IiGnuCpqjxH9mPmHPf1+9DMuQ8znJsUQDJ1tsO+QMMLNnvLTK
         8Y/Yaqrk/RdVuPzyLkkRJ42KPkrO2MTTKJzDy1c4LNN9L2CPGL6hLlJyGtY4BTaA3f9G
         Enzk1STIRV57T524Uto2RjcIDs6UsOFJMNEZ6xzjyvhian7tWIVXVna4+SixrbMYmLbb
         6z6cQV7CNjK1ouulE18Vm05xL+mhDX4lDThXUjUFfWZDceIpnyMaX0to8gY+542L9kRt
         Q65a2yq3lKDSaFeqXAIpIjNlv38FoCoQd2YGFkLJAMqPodQxgTIb0yh++KCxdwaN1H0R
         zTCQ==
X-Gm-Message-State: AOAM532cRJL33mCXC5XfCiKr5iw9eiq/TfaZSq/I8h9tCdOxJ0+AEFaO
        mogVRbm7TIMNv9QmcsQyYAA=
X-Google-Smtp-Source: ABdhPJwioxc8JaG7f5o3726IurGWuN9u1wbkngYQCOiO2ErIDSougiTuAcaoEc9EgAOmZbZN0gV4vw==
X-Received: by 2002:a63:7a0e:: with SMTP id v14mr2450023pgc.466.1631753739076;
        Wed, 15 Sep 2021 17:55:39 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id m18sm706514pjq.32.2021.09.15.17.55.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Sep 2021 17:55:38 -0700 (PDT)
Subject: Re: [PATCH 3/3] m68k: leave stack mangling to asm wrapper of
 sigreturn()
To:     Al Viro <viro@zeniv.linux.org.uk>
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
 <YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk>
 <08183665-f846-0c5e-a8c7-d0a65e78a3da@gmail.com>
 <YUKNn3erTbH+ytpM@zeniv-ca.linux.org.uk>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <48dafad1-4f0c-4ab7-792c-b34a81d26799@gmail.com>
Date:   Thu, 16 Sep 2021 12:53:53 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <YUKNn3erTbH+ytpM@zeniv-ca.linux.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Al,

On 16/09/21 12:19, Al Viro wrote:
> On Thu, Sep 16, 2021 at 11:35:05AM +1200, Michael Schmitz wrote:
>
>> This one's a little harder - you use a 84 byte gap on each sigreturn, no
>> matter what the frame size we need to restore. The original
>> mangle_kernel_stack() only makes room on the stack when it has no other
>> option (using twice as much size - correct me if I'm wrong).
>>
>> Ideally, we'd only leave a gap for mangle_kernel_stack() to use if the frame
>> size requires us to do so. Working that out in asm glue would be
>> sufficiently convoluted as to cancel out the benefits of cleaning up the C
>> sigreturn part. Probably not worth it.
>
> You'd need to
> 	* load the frame type from sigcontext (and deal with EFAULT, etc.)
> 	* make decision based on that
> 	* pass the type down into sigreturn(), so we wouldn't run into
> mismatches.
>
> And all that just to avoid a single "subtract a constant from stack pointer"
> insn.  We are on a very shallow kernel stack here - it's a syscall entry,
> after all.  And the stack footprint of do_sigreturn() is fairly small - e.g.
> stat(2) eats a lot more.

Thanks, that's what I was wondering. Not worth the extra complexity then.

>
> We are not initializing the gap either - it's just reserved on stack; we only
> access it if we need to enlarge the stack frame.
>
> IOW, what would be the benefit of trying to avoid unconditional gap there?

Avoiding a kernel stack overflow - there are comments in the code that 
warn against that, but those may be largely historic...

Cheers,

	Michael
