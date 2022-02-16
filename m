Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A0EC43217
	for <linux-m68k@archiver.kernel.org>; Wed, 16 Feb 2022 13:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbiBPNHn (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 16 Feb 2022 08:07:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233705AbiBPNHm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 16 Feb 2022 08:07:42 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3B619E73E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 05:07:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 696E86160E
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 13:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB2AC340F5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 13:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645016849;
        bh=1AijW/WQHr1DB1sxEAf5u6qv337FtGM78rBteqtJsFc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bfJJnO4aXeMDViG0AVJwrKbSfS3MBdvx50dtLUx+tulFHQibd86W6ODedsXMEGSqw
         zU3Rmq9NRnYzRQYbS8VFT7bLHvKkB6iELdMtg1/t0u1faiGaYDN6FhpWljeb/2zoB6
         D3fSViVT18elKeiXoCTvFT1QOC1mSxiR7Z2VBJfhnxiu05PJC4UVolBwHW32LRklFQ
         syTv9tNYaD+jcSDc8/GPgxZKMj4jBFh8bYb9VUk3RP2a1DkBeB9Um77SRUG2E9FZ8C
         hXD+FJBQxfrjCHX00ouFpVARoKjvNlSURrd2rTzPc3nNxvCDN+oIwKdoryrQRvl9LR
         Pq8qgymk/kOhA==
Received: by mail-wm1-f53.google.com with SMTP id i19so1151046wmq.5
        for <linux-m68k@lists.linux-m68k.org>; Wed, 16 Feb 2022 05:07:29 -0800 (PST)
X-Gm-Message-State: AOAM533b+4Q6vMK/yqn/qpK3wAd02GqhDFFGVIuOXJDuYy3Ub0w0zdg/
        tiHw23wJW+Tm6DcUIVmhs56qEou2+qh6CHfO5Ow=
X-Google-Smtp-Source: ABdhPJwloTGuyJt/Hdm31OFklwbHVE+n23OzkTYnWy+HDNvimUM0g1FM9pYMdMLaGtlr03PBtziLgSkYqMH3Naa88b4=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr1594630wms.82.1645016837028; Wed, 16
 Feb 2022 05:07:17 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-12-arnd@kernel.org>
 <Ygr4Q2/KxfF86ETa@zeniv-ca.linux.org.uk>
In-Reply-To: <Ygr4Q2/KxfF86ETa@zeniv-ca.linux.org.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 16 Feb 2022 14:07:00 +0100
X-Gmail-Original-Message-ID: <CAK8P3a30supB-MNzhoELOerOemxwTfDFFqZrzmNDQA=WW+VLbw@mail.gmail.com>
Message-ID: <CAK8P3a30supB-MNzhoELOerOemxwTfDFFqZrzmNDQA=WW+VLbw@mail.gmail.com>
Subject: Re: [PATCH 11/14] sparc64: remove CONFIG_SET_FS support
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
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

On Tue, Feb 15, 2022 at 1:48 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:49PM +0100, Arnd Bergmann wrote:
>
> > -/*
> > - * Sparc64 is segmented, though more like the M68K than the I386.
> > - * We use the secondary ASI to address user memory, which references a
> > - * completely different VM map, thus there is zero chance of the user
> > - * doing something queer and tricking us into poking kernel memory.
>
> Actually, this part of comment probably ought to stay - it is relevant
> for understanding what's going on (e.g. why is access_ok() always true, etc.)

Ok, I've put it back now.

       Arnd
