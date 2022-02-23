Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B007EC433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 23 Feb 2022 20:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbiBWUGE (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 23 Feb 2022 15:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiBWUGD (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 23 Feb 2022 15:06:03 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776A44B1F9
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Feb 2022 12:05:35 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id d10so54801174eje.10
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Feb 2022 12:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+S6BFzj6o5ckty5iXSThNrfkPsdFE94/fVb8NP4+aFs=;
        b=F/2f/aEUKxSuzDdCknAbug+t8clrlE0v7gj9NkhphhHftuFg6XGIjvpJXVx+ZHKhn9
         jOIdz4l7lK+/F1JhXkxR/PARyehOhzu1/S93ijWQKe7fGKOKTiRs9R81aIq3OYNVOgnf
         G4UcKLBEtMgH8cssPIzV42vV3R64/Z0YRVhdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+S6BFzj6o5ckty5iXSThNrfkPsdFE94/fVb8NP4+aFs=;
        b=LUwKr2gHPDalL69lW+BoOMbRQgalJKBb/jvKFd5yUNSOo2y2Yx/M9gK/e1Rz8mJ9uQ
         aWjT/ID51x51yhoRJvQK/4uAupCwyjoKxGcV/YFrRcLguw6roPwXxIfcnXgMd/UUyRr4
         ebl+RX4h4ZYcpxjtC5c6HlG/iwv2M516vnj34ywKmUegbRBjLNxfKB/SnJPgqiSourmE
         iNhv1KUqPc1V2gNDqgH1Kfxa/vDTVUmfqYCEetmpflmJaklVKjpCg6b7BVOZcTlwO5MN
         Hv7jl1fFCHnNsK+/lAxWkjheUmtuaZPPVrnYeB0AZ5UuLn4qX0xLADUrrXp7gkv/cnBi
         ltzQ==
X-Gm-Message-State: AOAM533F0nKftJO2mle+fx1mq9QC1pNCAhqOxk3Upft1IBc3U+/KTYuO
        eTXNMUf7BoWd9lRXJknD7fV577MVnViaFJXxxwY=
X-Google-Smtp-Source: ABdhPJzk7NsoFcz2aTPwIyvttUyU7ExLD4XlmMR1KA6UCrj+zs5QkCLOOvZ0MThB2kxHeEWlB/z73Q==
X-Received: by 2002:a17:906:7714:b0:6ba:8a6a:b464 with SMTP id q20-20020a170906771400b006ba8a6ab464mr1010053ejm.613.1645646733644;
        Wed, 23 Feb 2022 12:05:33 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id l1sm264953ejb.81.2022.02.23.12.05.30
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 12:05:31 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id x15so7043698wrg.8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Feb 2022 12:05:30 -0800 (PST)
X-Received: by 2002:a05:6512:130b:b0:443:c2eb:399d with SMTP id
 x11-20020a056512130b00b00443c2eb399dmr822016lfu.27.1645646720244; Wed, 23 Feb
 2022 12:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
In-Reply-To: <20220221132456.GA7139@alpha.franken.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 23 Feb 2022 12:05:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjdHz6OU3M9T5zE9Fc9SNdDs52iOE+eVn-wuUT6UDpBLg@mail.gmail.com>
Message-ID: <CAHk-=wjdHz6OU3M9T5zE9Fc9SNdDs52iOE+eVn-wuUT6UDpBLg@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Rich Felker <dalias@libc.org>,
        David Miller <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>, linux-csky@vger.kernel.org,
        linux-hexagon <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-sparc <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Feb 21, 2022 at 5:25 AM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> With this patch
[ .. snip snip ..]
> I at least get my simple test cases fixed, but I'm not sure this is
> correct.

I think you really want to do that anyway, just to get things like
wild kernel pointers right (ie think get_kernel_nofault() and friends
for ftrace etc).

They shouldn't happen in any normal situation, but those kinds of
unverified pointers is why we _have_ get_kernel_nofault() in the first
place.

On x86-64, the roughly equivalent situation is that addresses that
aren't in canonical format do not take a #PF (page fault), they take a
#GP (general protection) fault.

So I think you want to do that fixup_exception() for any possible addresses.

> Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
> for the 32bit case ?

I would suggest against using a non-constant TASK_SIZE_MAX. Being
constant is literally one reason why it exists, when TASK_SIZE itself
has often been about other things (ie "32-bit process").

Having to load variables for things like get_user() is annoying, if
you could do it with a simple constant instead (where that "simple"
part is to avoid having to load big values from a constant pool -
often constants like "high bit set" can be loaded and compared against
more efficiently).

               Linus
