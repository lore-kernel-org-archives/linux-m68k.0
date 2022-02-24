Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C50FC433EF
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Feb 2022 08:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiBXImi (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Feb 2022 03:42:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231588AbiBXImh (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Feb 2022 03:42:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2048583AA
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 00:42:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B222B81C4A
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 08:41:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7623C340F0
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645692117;
        bh=3OZhY8JjlWpvQtjxNVEtkpMscELhOM136ShyKCOjsEU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WCrlgzEskrMg705+E53zyoLTgyGprZinWCLgH+YvW3/ISb9PE3VXE54pMfp460HAr
         lADIYJ+ATkIVR/Hv3rGkZPvcZqJX4KqZQHRbZykvJkt4Rp+HqhP3l8xRFXb5eEu26D
         tHW0xS10C1E5ztM+9dE98NI6Z+gh2QEMUXwXvQBcQxsjASnq9SCvExZS9UBAdYV0su
         CUTj8BeohJ6g9PTjFB0K3v+SykUbVHep9vfY9YS5tv0xXNMBbR3NxVLBD76ZO09tT8
         hDI/VeWHJIdZtXWIdRgIsANIH54OctHaeT3Wpw0127yoHhtIB8Aqsw+55S8yv0uXbh
         Ng/AINlfx1zvw==
Received: by mail-lj1-f170.google.com with SMTP id r20so1814003ljj.1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 00:41:57 -0800 (PST)
X-Gm-Message-State: AOAM533OalidF33Q2A0kvFbcQI/C5s65YiHQSG3X7C2vdXGDWN59Oer8
        gEFvR65+gSGoxDtvEoU3cto2JDRUbv076lUED/o=
X-Google-Smtp-Source: ABdhPJzneL/9b5VqISjziF71opYqNdlSHnzAsafkxFgpoEqKa+f7LCyuasR/zxK7OReD5OXFM6yWvfz7KIyaMqF7hrc=
X-Received: by 2002:a5d:59aa:0:b0:1ed:9f45:c2ff with SMTP id
 p10-20020a5d59aa000000b001ed9f45c2ffmr1312686wrr.192.1645692105823; Thu, 24
 Feb 2022 00:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-14-arnd@kernel.org>
 <YhdB7tNDvtsYLUzr@antec>
In-Reply-To: <YhdB7tNDvtsYLUzr@antec>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 24 Feb 2022 09:41:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3Q6=yzX5hKX45=U80SoUXLU59sFqz-tN6U=Fr5t1m96Q@mail.gmail.com>
Message-ID: <CAK8P3a3Q6=yzX5hKX45=U80SoUXLU59sFqz-tN6U=Fr5t1m96Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To:     Stafford Horne <shorne@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
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
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
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
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Feb 24, 2022 at 9:29 AM Stafford Horne <shorne@gmail.com> wrote:

> > -
> > -#define access_ok(addr, size)                                                \
> > -({                                                                   \
> > -     __chk_user_ptr(addr);                                           \
> > -     __range_ok((unsigned long)(addr), (size));                      \
> > -})
> > +#include <asm-generic/access_ok.h>
>
> I was going to ask why we are missing __chk_user_ptr in the generic version.
> But this is basically now a no-op so I think its OK.

Correct, the type checking is implied by making __access_ok() an inline
function that takes a __user pointer.

> Acked-by: Stafford Horne <shorne@gmail.com> [openrisc, asm-generic]

Thanks!

       Arnd
