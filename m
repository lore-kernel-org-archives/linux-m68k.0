Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972B2C00140
	for <linux-m68k@archiver.kernel.org>; Tue, 26 Jul 2022 18:18:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239238AbiGZSSk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 26 Jul 2022 14:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239517AbiGZSSj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 26 Jul 2022 14:18:39 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C4932D8E
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 11:18:38 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id g1so11587707qki.7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 26 Jul 2022 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PcIy1IoVeLTA5pN4xjHqrFFTOjRrYaH1roVxozVFMOY=;
        b=gFaqEJ7fu4l4IvYNN6/B/g21zWrCb0Po5DuLzh4FB2bv8EQkApW3NQtaVWNVbYoDiL
         mG/lo7cuHAs80ggJwHBf4cXxt5lueFCZ62jFgpUGvfcV8SuK7/3/L0mT22jQprZ6ptlS
         6mVeIE31mmdnkD03RZ4MfxqqMMQ0Ql6pd5uwrzHgBosNl9QoHxp+cjA7K9zmtuZUfMxv
         fIoadGHGBXyTYyheNoQ/z8z7JCs8c/FBvBsj8LJDPlIzx09wZeKq1L+wffcM7mMOvQTt
         vJiZtfQCB3SVie4xZ1bWsm49CMN8vojXf1vzbV/rFwFtEyLzxmjfZNrYG86Lo3OG5It0
         aRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PcIy1IoVeLTA5pN4xjHqrFFTOjRrYaH1roVxozVFMOY=;
        b=IJVI5xwuSyDATtZJFmx+eVhUnGXka6bG7PiJT9NqBI1D3Fg1RzwBCwUR3QBF3vArIo
         D+8xaz4fyeH1EQW/G4fYsnG0L5pLglomO5vA6mW0I4Rn+tT0uTcHIA6McM1B8sPT2Xkj
         Hxdq6RRl1DkiefW9jB8rFj5r0tP04VttvGjwGVBDUWRMxqKlQtNId7X8VJ5Vvo0i+PqU
         6UDLq/u9Lq1CJMVnBnZeNFQnEZmt4rAZd+GmGaCENAoBXtqAZq/P1nnX/x/nB/ATsHOD
         0faCABldmsZ4QmOZgVpf9sdWnoq4bFNakGv1L3NahVSn9uFlQKS3/rjiRwakZOKD4Mbn
         XeWQ==
X-Gm-Message-State: AJIora+IHRniUKSzgapIWODY0ylpM5nBN7LtEa7JD7UHw6rVnSkKeaOC
        d+G47XXqLUiDCLn7sckeWSA=
X-Google-Smtp-Source: AGRyM1shIaNZWVK8sA3rDaCMoqXb6+vBPULuR/BA8pNVD+CuraDYlrtLnXxnboyxMZXsFBItME9fSA==
X-Received: by 2002:a05:620a:488a:b0:6b6:b45:d85c with SMTP id ea10-20020a05620a488a00b006b60b45d85cmr13748258qkb.453.1658859516951;
        Tue, 26 Jul 2022 11:18:36 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:8203:dece:781e:a773])
        by smtp.gmail.com with ESMTPSA id u22-20020a05620a431600b006af147d4876sm11881274qko.30.2022.07.26.11.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 11:18:36 -0700 (PDT)
Date:   Tue, 26 Jul 2022 11:18:34 -0700
From:   Yury Norov <yury.norov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Dennis Zhou <dennis@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k@lists.linux-m68k.org
Subject: Re: Linux 5.19-rc8
Message-ID: <YuAv+lV324G7pmlk@yury-laptop>
References: <CAHk-=wiWwDYxNhnStS0e+p-NTFAQSHvab=2-8LwxunCVuY5-2A@mail.gmail.com>
 <20220725161141.GA1306881@roeck-us.net>
 <CAHk-=whtGUwJwHUSNsXd4g7cok=n0Zwje7nACp8skh1fa2NtJA@mail.gmail.com>
 <YuAm5h1B6bsrR/9q@fedora>
 <CAHk-=wgYpJTMMxmfbpqc=JVtSK0Zj4b15G=AvEYk6vPNySDSsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgYpJTMMxmfbpqc=JVtSK0Zj4b15G=AvEYk6vPNySDSsA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

+ Geert Uytterhoeven <geert@linux-m68k.org>
+ linux-m68k@lists.linux-m68k.org

On Tue, Jul 26, 2022 at 10:51:01AM -0700, Linus Torvalds wrote:
> On Tue, Jul 26, 2022 at 10:39 AM Dennis Zhou <dennis@kernel.org> wrote:
> >
> > Are we okay with adding the contract find_*_bit() operations must handle
> > asking for past size properly? FWIW, we'd have to modify most of the
> > iterators in find.h.
> 
> So I think we're ok with it, if only it makes the macros simpler.
> 
> I also think we should probably look at the m68k case, because while
> that one seems to not have the bug that the arm case had, if we remove
> the arm case the m68k code is now the only non-generic case remaining.
> 
> And it just makes me go "maybe we should get rid of the whole
> 'override the generic code' thing entirely?"
> 
> I don't think that inlining the first word (like the m68k code does)
> is worth it, but it *is* possible that the architecture-specific
> functions generate better code for some common cases,

We have find_bit_benchmark to check how it works in practice. Would
be great if someone with access to the hardware can share numbers.

> so I think this
> is a "needs looking at the generated code" and not just a blind
> removal.
> 
>               Linus
