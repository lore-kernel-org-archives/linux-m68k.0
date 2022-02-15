Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15DCC4332F
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 09:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbiBOJSq (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 04:18:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbiBOJSo (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 04:18:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EFC2C10C
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:18:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A7D660AC8
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 09:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9883C36AE2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644916712;
        bh=auvbexz8OfCE17jezkrwExlxQUSMdLXG0OAD2bmLs8A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WkCGrtyaPGx2lCQmidRf50Nww49rtYKXGqhrb3/C0e99NEVq0x4+WE9foIS4kUwTy
         Mg2PS200LzaF04kA9XIMm+68B/HWgDxXUTEMDmtFuo/vuZCLa1nzhj77kQBMW/PnbX
         ukG7A6NTl1LhUebF+egxWGXBS1bclOmuETqe5/P7P8hYCPMJV01ML09i4Dj7Oc4eam
         qPGV0kiOvw/HrhOoUIvvr9kVOKBBLAKePRDoLhNMD5z9l8zC/MfMs684bQIAPICifC
         JNi2hHWCbvRfB0irmZRpMndHoBz4k0WZn3sUQdjIzkz5H4VhtCg1X21uy/aeXseCev
         i16v7OHaWl0OQ==
Received: by mail-wr1-f51.google.com with SMTP id w11so30959394wra.4
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 01:18:32 -0800 (PST)
X-Gm-Message-State: AOAM532wyhmK23InTCEslpPYCWJsxL1z3XVRoBEi6e8GM7HlK0hT+oFc
        UtrWZVNCxhybd01hRBpe2z53elaCC1T+9tJZhtQ=
X-Google-Smtp-Source: ABdhPJytLoTfipZUwnG73E442/QjIxHnERGjQ2aeR9o7LjnpbatwjsLI+Mk7641j6VpHXtVWtwvDTIufUdUsOw5At+o=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr2390801wrv.12.1644916711299;
 Tue, 15 Feb 2022 01:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-4-arnd@kernel.org>
 <YgqK1ihlJvRFHJ9h@infradead.org>
In-Reply-To: <YgqK1ihlJvRFHJ9h@infradead.org>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Feb 2022 10:18:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] nds32: fix access_ok() checks in get/put_user
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
        "# 3.4.x" <stable@vger.kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Richard Weinberger <richard@nod.at>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        David Miller <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Feb 14, 2022 at 6:01 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:41PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The get_user()/put_user() functions are meant to check for
> > access_ok(), while the __get_user()/__put_user() functions
> > don't.
> >
> > This broke in 4.19 for nds32, when it gained an extraneous
> > check in __get_user(), but lost the check it needs in
> > __put_user().
>
> Can we follow the lead of MIPS (which this was originally copied
> from I think) and kill the pointless __get/put_user_check wrapper
> that just obsfucate the code?

I had another look, but I think that would be a bigger change than
I want to have in a fix for stable backports, as nds32 also uses
the _check versions in __{get,put}_user_error.

If we instead clean it up in a separate patch, it should be done for
all eight architectures that do the same thing, but at that point,
the time seems better spent at coming up with a new set of
calling conventions that work with asm-goto.

         Arnd
