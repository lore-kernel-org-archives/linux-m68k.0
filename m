Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7403C433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 05:04:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7996E6103B
	for <linux-m68k@archiver.kernel.org>; Thu, 16 Sep 2021 05:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234201AbhIPFF3 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 16 Sep 2021 01:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbhIPFF3 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 16 Sep 2021 01:05:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187C1C061574
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 22:04:09 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id j1so3695200pjv.3
        for <linux-m68k@lists.linux-m68k.org>; Wed, 15 Sep 2021 22:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=bNiWf9Qx2imX/YcNH8RlmyCW0vUQMoavZKqD+Jf5RmY=;
        b=GDVTW6CsD48MbgHnM3bpwPe+iOpZM1SWdd3GYBRRL4mAplEpWcA4JVZ2oCfY1r4sCH
         8sCe/fdEiVzz7SCKtZ1PJGq3DW4O8suiVbPc05v0CdOZhx7Blq+mJaRGaN8OrjDVhwWA
         XuBQU0kRgBMhurRdEAwTqXrJ+dWKIJ1fKeSU/S7gAFpL/IGCQYuuImy/g3W8W/dAxT/9
         yU6c82787OZYlp6b7eDdVQTO2lABAg+r3Q4KDsXxGd142ZW37FkJS/HO7WRcD3z6uEWb
         mxduj+AqOHIolzyOJ/NGYJRmUKxUvnZ7f6yVTpNmJn3cHSDOMWNu63DUUK9QvWC37S+M
         tLSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=bNiWf9Qx2imX/YcNH8RlmyCW0vUQMoavZKqD+Jf5RmY=;
        b=DhUc4fU7xbIHFHC2U7otVZc51qgjX5yY8i+4fPC7epJKtKJMoBdfn3onCl++lajYu+
         miFb1H0RJ0oCVL+I0EN3f/JOxPGc5Bx/ZR4cz1y/Qr2T5y24pwbQQMCYcdt9AlsAHkPI
         nmdxR8wxp6uGn45E+QEkyD3784egPm6eIe4BYVw80nR2sK4hIbKDmzeCY/Tz2d79Av+a
         OQLZ7TKIdfUdkr0kAGWug7jmfaByMFIgFOs+RnMRyg7BEZahzE+4Agccaog7uAwFCm1D
         MJ5vvvKwi18xMeLzr0PRmIArBc+rXHqBb1z/NnTSl8kVAOx/OvbK+cW5q5cTxYGwRkH5
         ScPg==
X-Gm-Message-State: AOAM533Xq8BcNKpK/W5K3HbzmQGm6sT2zo3roQDIe0FCsliBrP4VbUWH
        IKlnotUYh0Iy3K1lfXPuIko=
X-Google-Smtp-Source: ABdhPJxWGczot1vRtTzuXPUQ78kg7N51wpA0Jm8gGIRGNjgfbIyKgaWNPFrBiG8LwIwPIQXiXFCjUw==
X-Received: by 2002:a17:902:ab0a:b0:13c:9801:a33b with SMTP id ik10-20020a170902ab0a00b0013c9801a33bmr2929998plb.54.1631768648261;
        Wed, 15 Sep 2021 22:04:08 -0700 (PDT)
Received: from [10.1.1.26] (222-155-4-20-adsl.sparkbb.co.nz. [222.155.4.20])
        by smtp.gmail.com with ESMTPSA id n41sm1476030pfv.108.2021.09.15.22.04.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Sep 2021 22:04:07 -0700 (PDT)
Subject: Re: [PATCH 3/3] m68k: leave stack mangling to asm wrapper of
 sigreturn()
To:     Al Viro <viro@zeniv.linux.org.uk>
References: <YP2c1xk9LJ0zE3KW@zeniv-ca.linux.org.uk>
 <YP2dTQPm1wGPWFgD@zeniv-ca.linux.org.uk>
 <08183665-f846-0c5e-a8c7-d0a65e78a3da@gmail.com>
 <YUKNn3erTbH+ytpM@zeniv-ca.linux.org.uk>
 <48dafad1-4f0c-4ab7-792c-b34a81d26799@gmail.com>
 <YUK4MWzI73lwRq0W@zeniv-ca.linux.org.uk>
Cc:     linux-m68k@lists.linux-m68k.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        linux-kernel@vger.kernel.org
From:   Michael Schmitz <schmitzmic@gmail.com>
Message-ID: <59a44e17-bff8-041e-b704-2b1d97601ce7@gmail.com>
Date:   Thu, 16 Sep 2021 17:02:22 +1200
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <YUK4MWzI73lwRq0W@zeniv-ca.linux.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Al,

On 16/09/21 15:21, Al Viro wrote:
> On Thu, Sep 16, 2021 at 12:53:53PM +1200, Michael Schmitz wrote:
>>> IOW, what would be the benefit of trying to avoid unconditional gap there?
>>
>> Avoiding a kernel stack overflow - there are comments in the code that warn
>> against that, but those may be largely historic...
>
> This is syscall entry; moreover, it critically relies upon the fixed stack
> layout - type 0 exception frame + pt_regs + switch_stack + (now) gap.

AFAIR, the concerns in the comments I saw were about interrupts - come 
to think of it, back in the early days, we used to have 'fast' and 
'slow' interrupt handlers, with much of the heavy lifting done in the 
handler, and slow interrupts allowed to lower the IPL. Probably no 
longer relevant.

> Followed by fairly shallow C call chain.  I suspect that the deepest you
> can get there is when you get an unmapped page when reading the sigframe
> and go into page fault handling, with call chain going into some filesystem's
> ->readpage().  If it was that close to stack overflow, we'd see them all
> the time in e.g. random net ioctl doing copy_from_user() - that's going
> to be deeper.  Or in stat(2), for that matter.

Your points are well taken - I can see now that my concerns are without 
merit.

The only question that remains is whether the third patch can also go to 
-stable. Most of my testing was with all three patches applied, I can 
drop the third one and retest if you're worries the third one is not 
appropriate for -stable.

Cheers,

	Michael

