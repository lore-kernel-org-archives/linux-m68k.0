Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF307C433F5
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 09:13:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbiBOJNY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 04:13:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235718AbiBOJNW (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 04:13:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D45226105
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:13:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E92B9B817FF
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 09:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94E91C340EC
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 09:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916388;
        bh=nPLs5v71E/xzzKRq/jdD2UxtX1DBSgxHKB2i8EHy1KY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CLHePkmHVvog2B9hZC9aG4LabFSm7MI26At0uDw7kKPNYpb3lXWOmUP31vrn/n3jp
         21c83PolyTPYs5hRtHSTmetuMdjz8MVwbtB9QE4JUqwfDE9UaiWLco96WTCCiREXeo
         ierknOIrVYt+cFHPhwjyPUqaAdv+eYt2hib0l9mVhvFWKgaTt9gitGLgKmM8vAP2ER
         AePVXGloKhok6IjT1wO1H+WVX/SWPGV2/x59O7cRGdhpYbEJd41Qa4hwZk6q55miTE
         kziCS4wP1Lkxi5K05R+6K/1DypZ1QzcheN727Vb2P8JghtAuyZKDU7SLg9/rJcHwJ6
         ZWZc1SanLSgow==
Received: by mail-wr1-f54.google.com with SMTP id o24so28281663wro.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:13:08 -0800 (PST)
X-Gm-Message-State: AOAM532i2HPjeK80e5o4F5Tf4oyrVtr0Me9KbDGcvkE9qX1rf9a/SPTE
        bzlfu/ILwzx8G4u+LxROHmkFzBUmOuOJSEOo4R8=
X-Google-Smtp-Source: ABdhPJwP302M1cXBE3IXsZS/v83gWi9XJR2q13sQJhY9b6tnSpJCd4099durtVh9QEm0yhQ4WeUq4MKNAAS9P/JPfzc=
X-Received: by 2002:adf:f6ce:: with SMTP id y14mr2380558wrp.219.1644916376776;
 Tue, 15 Feb 2022 01:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Feb 2022 10:12:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
Message-ID: <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
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
        "David S. Miller" <davem@davemloft.net>,
        Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Openrisc <openrisc@lists.librecores.org>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" 
        <linuxppc-dev@lists.ozlabs.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:S390" <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SPARC + UltraSPARC (sparc/sparc64)" 
        <sparclinux@vger.kernel.org>,
        linux-um <linux-um@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 15, 2022 at 9:17 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
>
> With set_fs() out of the picture, wouldn't it be sufficient to check
> that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
> That would also remove the need to strip the tag from the address.
>
> Something like
>
>     asm goto("tbnz  %0, #55, %2     \n"
>              "tbnz  %1, #55, %2     \n"
>              :: "r"(addr), "r"(addr + size - 1) :: notok);
>     return 1;
> notok:
>     return 0;
>
> with an additional sanity check on the size which the compiler could
> eliminate for compile-time constant values.

That should work, but I don't see it as a clear enough advantage to
have a custom implementation. For the constant-size case, it probably
isn't better than a compiler-scheduled comparison against a
constant limit, but it does hurt maintainability when the next person
wants to change the behavior of access_ok() globally.

If we want to get into micro-optimizing uaccess, I think a better target
would be a CONFIG_CC_HAS_ASM_GOTO_OUTPUT version
of __get_user()/__put_user as we have on x86 and powerpc.

         Arnd
