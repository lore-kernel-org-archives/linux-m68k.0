Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EABD3C4167B
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 21:01:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiBNVBU (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 16:01:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiBNVBT (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 16:01:19 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2C427A9A6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 13:01:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 681CA6115D
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 19:46:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD09C340E9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 19:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644867969;
        bh=kZ0Ha+ZttRWbRYErkpKyuJC1dyK+QrO2i6Uu5KgHMvM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XjkcQHKoADicbhy5T7/TEpJ/PjlGKooIhboU4BtneDD9X1yFMmTo2mvqjoht5SzvX
         r2ZUT1ZmdbgfMplWYmAk6uprDbhwE2BuyJ4zb3DHrj7zhWv6K1j+RwiAM3CftsPs4O
         Uzpo35lxWKP5B/hbNxauanow4rAQ6aCh6uMDF0T90tl8w2DOQlSl87+UL0MMgLpb2M
         97l04fN324AzRYaK4MxvZgEb0JNVsVnzzTSyMv1J61QAunhNorK1ubEJ7ZE0lofbUa
         Joq+mxHdKWjHdPPE2l4mUMX1cQ6/spRi6Nxoffj46r3xMz9nbSYZ1BA5/ub3YKohdQ
         DBfRAE9E4ycow==
Received: by mail-wr1-f50.google.com with SMTP id d27so28602675wrc.6
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 11:46:09 -0800 (PST)
X-Gm-Message-State: AOAM532792Cd9IPEgWcadxZ6nJWNNVwpioSFoAfIGU/oNweVobl8in6H
        8C9iMW+X3qZxs+POa1GDGSQtRwc6n22/NAQJ2XE=
X-Google-Smtp-Source: ABdhPJyfeYwWpAfp1t9O1z8BIiteD6oMiQUhUFLNHvAQyjgPbxD0FyJauHtAzbL5TNr8UyIGWRM1U9VPuoeyXIyyYo0=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr445399wrp.219.1644867968239;
 Mon, 14 Feb 2022 11:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
In-Reply-To: <YgqLFYqIqkIsNC92@infradead.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 14 Feb 2022 20:45:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Message-ID: <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
        Helge Deller <deller@gmx.de>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        alpha <linux-alpha@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Greentime Hu <green.hu@gmail.com>,
        Stafford Horne <shorne@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Nick Hu <nickhu@andestech.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Richard Weinberger <richard@nod.at>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        David Miller <davem@davemloft.net>,
        Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Feb 14, 2022 at 6:02 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:42PM +0100, Arnd Bergmann wrote:
> > +#define __range_not_ok(addr, size, limit)    (!__access_ok(addr, size))
> > +#define __chk_range_not_ok(addr, size, limit)        (!__access_ok((void __user *)addr, size))
>
> Can we just kill these off insted of letting themm obsfucate the code?

As Al pointed out, they turned out to be necessary on sparc64, but the only
definitions are on sparc64 and x86, so it's possible that they serve a similar
purpose here, in which case changing the limit from TASK_SIZE to
TASK_SIZE_MAX is probably wrong as well.

So either I need to revert the original definition as I did on sparc64, or
they can be removed completely. Hopefully Al or the x86 maintainers
can clarify.

         Arnd
