Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 276CEC636D4
	for <linux-m68k@archiver.kernel.org>; Tue, 31 Jan 2023 21:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbjAaVUV (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 31 Jan 2023 16:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbjAaVUU (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 31 Jan 2023 16:20:20 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874EA552A7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 13:20:19 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id cw4so10620619edb.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 13:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=Dpi5P8qHqM77HLr6Rm7qlkY2hnNNuC+GOleUP2NCen/4mi28taFHpUtYN0cOaJeZqx
         TB+exnjSVIKaLaZsJwKH3MCWKlHsO2N7zm25f17K7ur8C/IEegLECG6U0Z6AXLDaZrfK
         1kGvyREHSxwc1BrFIiYNgaqGXrqrtBtRmci5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lhMaGcwmHnowthLDK6+cq9UUV5li22+d5YjfiOKs0xk=;
        b=OSqPiJLTfQheZJ89wXnIcIfhW+kny4SWGlcea6QNcUo8SF+BigU4NlogJPP2GVNGxx
         +AaIrNCYlY3ZN9zFY2yPSRjjxgeELU3iiBc2x8rfyN8lk1MjK0nBpX6fyM+jBImRrQGg
         t5hamvVH7AyvjqqKAAN6/Qb5fMpXyFYobuuTugXRh0inVlb8gib5sAP5m/CRhi9POARx
         sh6b8FwCzmW56W5duitgb35Q6qis4zFqGOD2rRDz7+0RcOhW0LZaSXtuKP9pEWN5o8pE
         l6gp7j8NT8Df87pw+llo02AK2udE5Soh8Juyq3IH+FJj1oFzd5nStvruYs9CUpTJMzA5
         fqtQ==
X-Gm-Message-State: AO0yUKUV1Iac6oJnqi2wnZRAmjSVnxZAyZOD8AP+j7IdUsJlbVDQER0Z
        CkhQXnNqmLmaKvOt0CQMXLXJpU5pIiJFUI1WoSY=
X-Google-Smtp-Source: AK7set+FMJTKmgpGmg7L7DQpRHNFZPYQ6esgm73H++tIJBLswd3CqaUtlsQLaGfZzIlkz/s2Pgat0A==
X-Received: by 2002:a05:6402:385:b0:4a3:43c1:842c with SMTP id o5-20020a056402038500b004a343c1842cmr74329edv.0.1675200017711;
        Tue, 31 Jan 2023 13:20:17 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id lc10-20020a170906f90a00b0088cdb05f1d5sm1004546ejb.113.2023.01.31.13.20.16
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:20:16 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id bk15so45534568ejb.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 31 Jan 2023 13:20:16 -0800 (PST)
X-Received: by 2002:a17:906:1e94:b0:889:2908:a9c8 with SMTP id
 e20-20020a1709061e9400b008892908a9c8mr2233010ejj.82.1675200015978; Tue, 31
 Jan 2023 13:20:15 -0800 (PST)
MIME-Version: 1.0
References: <Y9lz6yk113LmC9SI@ZenIV> <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
In-Reply-To: <Y9mD1qp/6zm+jOME@ZenIV>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 31 Jan 2023 13:19:59 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Message-ID: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        Michal Simek <monstr@monstr.eu>,
        Dinh Nguyen <dinguyen@kernel.org>,
        openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
        linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> Umm...  What about the semantics of get_user() of unmapped address?
> Some architectures do quiet EFAULT; some (including alpha) hit
> the sucker with SIGBUS, no matter what.

I think we should strive to just make this all common.

The reason alpha is different is almost certainly not intentional, but
a combination of "pure accident" and "nobody actually cares".

> Are we free to modify that behaviour, or is that part of arch-specific
> ABI?

I'd just unify this all, probably with a preference for existing
semantics on x86 (because of "biggest and most varied user base").

That whole "send SIGBUS even for kernel faults" is certainly bogus and
against the usual rules. And I may well be to blame for it (I have
this memory of disliking how EFAULT as a return code didn't actually
return the faulting address). And realistically, it's also just not
something that any normal application will ever hit.  Giving invalid
addresses to system calls is basically always a bug, although there
are always special software that do all the crazy corner cases (ie
things like emulators tend to do odd things).

I doubt such special software exists on Linux/alpha, though.

So I wouldn't worry about those kinds of oddities overmuch.

*If* somebody then finds a load that cares, we can always fix it
later, and I'll go "mea culpa, I didn't think it would matter, and I
was wrong".

         Linus
