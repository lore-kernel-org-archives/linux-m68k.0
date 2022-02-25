Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC353C433FE
	for <linux-m68k@archiver.kernel.org>; Fri, 25 Feb 2022 17:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239421AbiBYRiD (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 25 Feb 2022 12:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243963AbiBYRh6 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 25 Feb 2022 12:37:58 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5B11706B
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Feb 2022 09:37:24 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id o26so4582951pgb.8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 25 Feb 2022 09:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=02IWQGflWXjYwUX29jDdu/P28RFJb4bHYd+IQuUew8g=;
        b=kUgfr+BUSyJkVMN/Doh8ZyiibLenLl15zo6bOy4rWBJYX17usBgH/o8iJTHO5XKZdv
         FIRoxVZBZpjCBE2RUff++qJBIi09y14ofiD3ly3QeSlZp5xJscoOCHa7IsD8lgTU/o1J
         xO0CrtIahGKQzcczYaERI0DLYTA+5L/usaOtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=02IWQGflWXjYwUX29jDdu/P28RFJb4bHYd+IQuUew8g=;
        b=jB4VA7zWSKWweWBbPnz3VnLOON+PVvva8+vJCagSmrDPAd+J2KIA4PuhiFXaqlWtcy
         r3KTmQK2SWJS8qhq3KkP4KulP5jkb4uGml+2BB6HTh7PiIFvM7H3Tru9mVKWdOdRBKM4
         giLBq9VylsaAxBEmPlaQlcqn2HkJNok+z9t4PTfiAaxezskcAc1aH6j/P9DQXbIv1r2D
         /0S5BscZZfhl5IxKue1iQnBMlnIF6KaEXQyrbN7VFQxq2bUnQkzYzRxiEMmR7O4otk7m
         4FcJo3mffa8rEG1JgarfKZ11ktAPRi8cx5gaRxSOqWUju5SKoBxCN/fpW6Emhpu2Spu1
         oQPA==
X-Gm-Message-State: AOAM531cdSlxq2pWohbbwsEztGLbT3MMJRpL+zWNmeerVYIds6NRjdm1
        wONCT/cUckl2rD8KPX9UfnRQew==
X-Google-Smtp-Source: ABdhPJxa8cWp+caZT/XsGUM3pG14CnQKF4h0alaujNsw9OZoKX05Fs4iuNMYG7vu03MfC/TBygUB5w==
X-Received: by 2002:a63:8543:0:b0:35e:3bd9:3798 with SMTP id u64-20020a638543000000b0035e3bd93798mr7089608pgd.73.1645810644059;
        Fri, 25 Feb 2022 09:37:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id az22-20020a17090b029600b001bc6500625asm9681173pjb.45.2022.02.25.09.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 09:37:23 -0800 (PST)
Date:   Fri, 25 Feb 2022 09:37:23 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     David Laight <David.Laight@aculab.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] m68k: Implement "current_stack_pointer"
Message-ID: <202202250936.BA139C4@keescook>
References: <20220224060448.1856091-1-keescook@chromium.org>
 <CAMuHMdVioQLy_T2LimgWdfWM=j=fomfpayuS1mbXnBLZj4gGQA@mail.gmail.com>
 <d75f1259c3e64387a161ebcb0448d594@AcuMS.aculab.com>
 <CAMuHMdWtQ+B-01ZOwZNvgQ7pndNsP3V90_jHdR=RS4K7O3Vk9g@mail.gmail.com>
 <95b9c3e8227a4892b26cc0384d1782c2@AcuMS.aculab.com>
 <CAMuHMdU6msvi0j=mS28GFYbm+uMRk7PkYe+zOM4sDmOVxeibLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU6msvi0j=mS28GFYbm+uMRk7PkYe+zOM4sDmOVxeibLQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Feb 24, 2022 at 10:56:09AM +0100, Geert Uytterhoeven wrote:
> Hi David, Kees,
> 
> On Thu, Feb 24, 2022 at 10:54 AM David Laight <David.Laight@aculab.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: 24 February 2022 09:17
> > >
> > > On Thu, Feb 24, 2022 at 10:12 AM David Laight <David.Laight@aculab.com> wrote:
> > > > From: Geert Uytterhoeven
> > > > > Sent: 24 February 2022 08:59
> > > > ...
> > > > > > +register unsigned long current_stack_pointer __asm__("sp");
> > > > >
> > > > > I don't know what HARDENED_USERCOPY does, so I don't know if you need
> > > > > "usp" (see rdusp()) or "sp"?
> > > >
> > > > HARDENED_USERCOPY significantly slows down some systems calls
> > > > (especially things like sendmsg()) by trying to run-time verify
> > > > that the kernel buffer doesn't overrun a stack frame or kmalloc()ed
> > >
> > > Kernel stack frame of user stack frame?
> >
> > Kernel, the kernel doesn't care if the user stack gets trashed.

Right, this is strictly a kernel-side check in mm/usercopy.c:
https://lore.kernel.org/linux-hardening/20220225173345.3358109-1-keescook@chromium.org/

> 
> OK.
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Kees: Do you want me to queue this in the m68k for-v5.18 branch, or do
> you want to take it yourself, together with the HARDENED_USERCOPY work?
> In case of the latter:
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Please let me know. Thanks!

Yeah, I'll take it via my tree, just so it's all together.

Thanks!

-Kees


-- 
Kees Cook
