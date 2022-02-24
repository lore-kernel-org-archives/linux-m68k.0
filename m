Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2100C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 24 Feb 2022 07:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiBXHGu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 24 Feb 2022 02:06:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbiBXHGt (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 24 Feb 2022 02:06:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9AE26A3BF
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Feb 2022 23:06:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 589FDB8248A
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 07:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8315AC340F3
        for <linux-m68k@lists.linux-m68k.org>; Thu, 24 Feb 2022 07:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645686376;
        bh=d3iTCnmjiWI2WfX8T3i0lRHp9N81t6Yh8Z7V7FwGN/U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qRHA5NqUEplN9pIxZqIsW0kBn4+MBilYUh4ACzsMgXUXNRVhSeH8k99rVs+VguAdz
         S6nw5jZeA2U0sfghJtI+av1c041361/u33OVFn034lG4nfre1v86nWYuQmM7joS4ks
         Agm8jI646/XZqBZpm2KUVxpK4cH1m93Yam+wbo2huzzTMAz3INUDtPU8ZxedY0sjkR
         Q0blhmmZF3gCmqsSyWTbjENBVylQ/UtE3IYK+1xeZimaMKGdlOrqKnMJ1W0pixwOSS
         2onkioItET0unfSCYSyvkdtjTxUNN6BpQw2svjAg1a0ZTXaFUQp1iqBJgsEQrsP26v
         H7DkLDPiyrc0w==
Received: by mail-lf1-f50.google.com with SMTP id u20so2292028lff.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Feb 2022 23:06:16 -0800 (PST)
X-Gm-Message-State: AOAM5314570XL/F8S4+Sj0T8yWFfxIlE50vnvfx3LZP6StwBz5L4D2iw
        GRZCSZ3YiuTfunXRWrTOPFi1HlbqR0uFQc585J0=
X-Google-Smtp-Source: ABdhPJyN7vOmEPkorPTffJc1X7o++TFchfjh5Aum2nyP+tyYB62T97KqiFOhsVfqhaexAyBFN29agtP9qBPfezDsID0=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1075883wra.407.1645686364180; Wed, 23
 Feb 2022 23:06:04 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-8-arnd@kernel.org>
 <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
In-Reply-To: <c6f461f1-1dd9-aec1-2c85-a3eda478a1be@kernel.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 24 Feb 2022 08:05:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a34OBFhncvg32hO3qb1uH8cvwFb0ro1jEMT4bdOLrtfdw@mail.gmail.com>
Message-ID: <CAK8P3a34OBFhncvg32hO3qb1uH8cvwFb0ro1jEMT4bdOLrtfdw@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] nios2: drop access_ok() check from __put_user()
To:     Dinh Nguyen <dinguyen@kernel.org>
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

On Thu, Feb 24, 2022 at 12:30 AM Dinh Nguyen <dinguyen@kernel.org> wrote:
> On 2/16/22 07:13, Arnd Bergmann wrote: From: Arnd Bergmann <arnd@arndb.de>
> >
> > Unlike other architectures, the nios2 version of __put_user() has an
> > extra check for access_ok(), preventing it from being used to implement
> > __put_kernel_nofault().
> >
> > Split up put_user() along the same lines as __get_user()/get_user()
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>

Thanks! Could you also have a look at patch 2 (uaccess: fix nios2 and
microblaze get_user_8)? That one is actually more critical, and should
be backported to stable kernels.

       Arnd
