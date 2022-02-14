Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B305C433EF
	for <linux-m68k@archiver.kernel.org>; Mon, 14 Feb 2022 22:01:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiBNWBt (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 14 Feb 2022 17:01:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiBNWBs (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 14 Feb 2022 17:01:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACB511628E
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 14:01:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B7A29B81670
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 19:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F460C340F2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 19:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644866752;
        bh=zLWY4rc6tKJzkfOHU66+tSLIxceIVdBozj8MWHl9tz8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HRzznKrxZvfF8qc6VMsf/ITD1M9TWaBX9YM89R9X1RXEMmeyAaIPs1Vu+QiIBCDxP
         PRuAKi7BvugYdr2V/Jy+Awa9saoq7GUCzlyK1n9YY99rbYwOtA4qcNXBNUGLFJx12j
         TMMcMoQZtQ5wGiHA7Z7FyFpd67I1K2Qb4uZjfvO/uPOAWOoFtgFel3d0Zm3rNIUL5b
         zkbhVEcpghza3JUAedGYOCS3qSF8WxhQtz5ZaFf0b87xg7zAY+7XsRB9MSSAcp1ex0
         cTzRm2NltXaiQ+ml8rx5wZlbzkoeBEmkCV1GYuoZC4h2l1GPsh1BS2Vg0MoDOs0E5s
         kK7LeWRoxrFjQ==
Received: by mail-lj1-f178.google.com with SMTP id bx31so23748026ljb.0
        for <linux-m68k@lists.linux-m68k.org>; Mon, 14 Feb 2022 11:25:52 -0800 (PST)
X-Gm-Message-State: AOAM5332h4sIE8tQEOs+szdNMw5QM0dHePEVy4yAP1SQGZeNEDGiWwZV
        kAk/qpAFw9MAAUitvAn3r1+0AzhUqNHHW59lPM8=
X-Google-Smtp-Source: ABdhPJwrOpkav7UeztG9pweW7/OWsS+hZNYg7RZgUDmgoSoPSixwWLgUERuof4XivnroH6SdfUIEp08YoMpfbv7qa3w=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr422520wrv.12.1644866740020;
 Mon, 14 Feb 2022 11:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-8-arnd@kernel.org>
 <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
In-Reply-To: <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 14 Feb 2022 20:25:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36U35DK22UT6id=WawWaJa-2+_W9HFgmwdDJ_tVYE5NQ@mail.gmail.com>
Message-ID: <CAK8P3a36U35DK22UT6id=WawWaJa-2+_W9HFgmwdDJ_tVYE5NQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] uaccess: generalize access_ok()
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

On Mon, Feb 14, 2022 at 6:15 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:45PM +0100, Arnd Bergmann wrote:
>
> > diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
> > index c7b763d2f526..8867ddf3e6c7 100644
> > --- a/arch/csky/kernel/signal.c
> > +++ b/arch/csky/kernel/signal.c
> > @@ -136,7 +136,7 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
> >  static int
> >  setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
> >  {
> > -     struct rt_sigframe *frame;
> > +     struct rt_sigframe __user *frame;
> >       int err = 0;
> >
> >       frame = get_sigframe(ksig, regs, sizeof(*frame));
>
> Minor nit: might make sense to separate annotations (here, on nios2, etc.) from the rest...

Done.

> > -}
> > -
> > -static inline int access_ok(const void __user * addr, unsigned long size)
> > -{
> > -     return 1;
> > -}
> > +#define __range_not_ok(addr, size, limit) (!__access_ok(addr, size))
>
> is really wrong.  For sparc64, access_ok() should always be true.
> This __range_not_ok() thing is used *only* for valid_user_frame() in
> arch/sparc/kernel/perf_event.c - it's not a part of normal access_ok()
> there.
>
> sparc64 has separate address spaces for kernel and for userland; access_ok()
> had never been useful there.

Ok, fixed as well now. I had the access_ok() bit right, the definition just
moved around here so it comes before the #include, but I missed the
bit about __range_not_ok(), which I have now reverted back to the
correct version in my tree.

        Arnd
