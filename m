Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C05C433EF
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Feb 2022 22:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236198AbiBPWCC (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Feb 2022 17:02:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbiBPWCB (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Feb 2022 17:02:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A70580D8
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 14:01:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 888BC61B4A
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 22:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDD0C340F0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 22:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645048905;
        bh=3GAgFKFSz4rrd4LtvDFKA/i0kbB+vNidxSnLES7CC90=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fDBP7Mkdj63wKfurqDVyYf13ViT6TEUnhig97uW+IsB/gSvVjcPnPDWnNfq57X7f7
         2Suucc5sE+/m6dQ46qoh2dUuLuG7hXYighvzH6H9ARTdBIliLsmD1UopXH6CxFmWoN
         UPk5m0/iEtgdySNxIBVnaJK/O5z79ZosLIwarBtKYOVy5ynsvwoL6XZ9KSYfLz+dRk
         xXdnASrldM7jFmP3+mA4sB9sbQAt8Gch3ENDKzjuM3u3ZwUVUcK5tOZLPc9eGKSCXe
         MSSs9xC5Zpku8duLHjnR2lHCT8eqzWuqP6CAhPBjI/s4mvClUIWOMR7kSUK98aUHwP
         h1vuxqjFH9uIg==
Received: by mail-wm1-f45.google.com with SMTP id i19so1966698wmq.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 14:01:45 -0800 (PST)
X-Gm-Message-State: AOAM532rFdet/uRFnBI16jDslpvcHp0E67pPjuRTDunfF6R22LvLVJU6
        R6kBp9Kmo2KUGlPDSdRVJD7E1hWYV9VvISLjbfE=
X-Google-Smtp-Source: ABdhPJyTINkf1ZMgp+ijDiSYfGY6PCVSFYe6JpwLrHI4jPiDeP7SC/Zo0zGySiauKL0SyOBYxrfLHIczbDoJsvG/Low=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr3428429wms.82.1645048892813; Wed, 16
 Feb 2022 14:01:32 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-16-arnd@kernel.org>
 <Yg1D08+olCSGmnYU@ravnborg.org> <Yg1FRZcrhlh5C//V@ravnborg.org>
In-Reply-To: <Yg1FRZcrhlh5C//V@ravnborg.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 16 Feb 2022 23:01:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1kV=0G9WYkdjYCiBu=fuT1fbPGHVD9cgHX3ht6J3MFEw@mail.gmail.com>
Message-ID: <CAK8P3a1kV=0G9WYkdjYCiBu=fuT1fbPGHVD9cgHX3ht6J3MFEw@mail.gmail.com>
Subject: Re: [PATCH v2 15/18] sparc64: remove CONFIG_SET_FS support
To:     Sam Ravnborg <sam@ravnborg.org>
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
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Feb 16, 2022 at 7:41 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Feb 16, 2022 at 07:34:59PM +0100, Sam Ravnborg wrote:

> >
> > I think you somehow missed the Kconfig change, and also the related
> > sparc32 change which continue to have set_fs() after this patch.

Right, thanks for pointing out the issue.

> I now notice the sparc32 bits are in the last patch.
> To avoid breaking bisect-ability on sparc64 I think you need to merge
> the sparc32 changes with this patch, unless the sparc64 changes can
> coexist with CONFIG_SET_FS continue to be set.

I originally had them in the reverse order and broke bisectability during my
rebase. The end result is still fine, but now I need to move the 'select
SET_FS' from CONFIG_SPARC to CONFIG_SPARC32 in this patch
and then remove it again from there in the last step.

I've done that in my local copy now.

         Arnd
