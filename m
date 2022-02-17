Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70BDC433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Feb 2022 09:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbiBQJSQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Feb 2022 04:18:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238519AbiBQJSP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 17 Feb 2022 04:18:15 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E93DB27DF2B
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Feb 2022 01:17:56 -0800 (PST)
Received: from mail-wm1-f54.google.com ([209.85.128.54]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MCbVD-1nTBVg1PFb-009fGY for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Feb
 2022 10:17:55 +0100
Received: by mail-wm1-f54.google.com with SMTP id x3-20020a05600c21c300b0037c01ad715bso3521110wmj.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Feb 2022 01:17:55 -0800 (PST)
X-Gm-Message-State: AOAM530+9x4YZqUdOedFyYBN9pwfV7f2b+qDxhaYenILdcERMwKs5Qgy
        xig59rDns/8BDQaoEzQy25TnqwrizdZj0nEIHsg=
X-Google-Smtp-Source: ABdhPJwu2NVHGHLxx29UDj0eC2QtTDz9ABoGgqvKd5FtPXFo3D/c1j3IHxwDsslquGRbQQhg+y3kZFZQ6qJy+rJ75Go=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr4990966wms.82.1645085639420; Thu, 17
 Feb 2022 00:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 17 Feb 2022 09:13:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
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
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>, linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SYqsWBLXR63jw9p4sBFrwyG9+s+FYkxyLctKc+48t3NEzNRxEaQ
 4GRgAuCHbTXZKDVBCiLn4ACjWnfHATXMjz2/EAXmnJyyXLV7xtcJSx3StEhqcCt8/A/ycxq
 /gycmSpJmP5UpQL6+UFhXFcXbvlwOLsN/CSX70Sii127wrJIFPWhrBflPEDPTfRUHyd234K
 4lPAt0Py8u2KoaV+htSrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AMazmrPA9Os=:QJUpgABhXEJDVtD/IhTJ9Q
 PaE1/Z0WFXSBtvNqeVCKAdZs3P8jh1r/jxA2nbiR0HnibcrpZyabFWQZ2luG044dc5DyK8XiP
 5FxcmQEfPLlkf8doqejprFkg3Xp+pPQc+6RdEL7rJAmyr8tkhR2Bc+5ESVZRoWlMUjoBh+aLd
 J1bOPm2mqWNQFnh1vmmg2H3tyKpQIOAQqj2432gjvMSIGGwRynrK82JWcjn+hshCj4WQ/jwLT
 JiKVDmGJMdTWkcpzqwbw7ktAwDtM0WSrXm336/Y2eD0nUtZBWxJDOATiNfGZPnJ9Ce202cUnc
 wac1NXxqLRn1QlP3b4gfKLlu0KmdiLGq+eUb0dAI8pkyDkTyOtiDA643zyMknqSbWyVFsRawf
 PU04aWmp+NAbiJS5VVyyVUW+e4sEifs6O9spEM7LKGyfdfdEQG+mxXZeH6BLd0s3DJC6893O1
 23801vjHUKmpYtQvlM0U7prvf5jFlnkoQR3eitELFHC/O4kLIxObhpOURephENZWNGZTb4eKB
 Ua7yWeW09XkxNsAlajK3NgaoPNE5Z+KFTXfGaOJYqtkvXe30l5l3CP4fQr88VPB6NKUm1XRl9
 uRg76gMmoHogiOUH+XCBc5xWrC8tkIn1JapnyTBAzM0A2uSJWqkh2ZES1MxUvPtdO5H8luiwr
 eiRcUhpS1mM4FZAVWomk95S8btxHw8ajcNbFJJpUwppHLn3pywY0gV7h0g0Tf7UFcSiuo1LFT
 g/EazwqPKqKpTRgofiiluSyjme4dwr+6TSKnKD+aUFah+dGFyq7zo1FohlRnNWJKZqlmYUORv
 WPjnJDWY4B3IfzhJWmcgZ/y3sAIaW1+9+kRZh3wqpk6Tl/hFG4=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Christoph Hellwig and a few others spent a huge effort on removing
> set_fs() from most of the important architectures, but about half the
> other architectures were never completed even though most of them don't
> actually use set_fs() at all.
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().
>
> Three architectures (sparc64, ia64, and sh) needed some extra work,
> which I also completed.
>
> The final series contains extra cleanup changes that touch all
> architectures. Please review and test these, so we can merge them
> for v5.18.
>
> The series is available at
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=set_fs-2
> for testing.

I've added the updated contents to my asm-generic tree now to put them
into linux-next.

         Arnd
