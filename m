Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D672C433FE
	for <linux-m68k@archiver.kernel.org>; Tue, 15 Feb 2022 08:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbiBOILA (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:11:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235281AbiBOIKq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 15 Feb 2022 03:10:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0442DAAA
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 00:10:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3B91EB81800
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 08:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9218C340F2
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644912633;
        bh=SSSBFam0X7wa1ZiCw7Mbgc9666G5ScJGR2eDM1GsaRo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=su/tgX/Pf6DAuOvSKjs8FDN0CfBLee9I1b0B8T0UBjC2jO9pqn8CKB0Eq1FtCb4n/
         MDIGy89SMZjU5pR1c4liC7lJMIrwvZj+ONXiRlVtgLONOfDPOXzAAKaJzo9kxFOo5d
         wJrHUyScBcsRvgh+GY7F24Ke+exUGcssydi/sOoS/BOTxuSw0hwE/zZeYG2LgvUsRe
         c5Yn8cvAFAENKVz0Ku/EfwqJgn1ISH/jSi36pAiyPWcpPzOpN59HOJkjeUaLNubz4g
         +dTXaxYMCsUp0FF+CC2g2ryAiR/Pn6VDL/RtVIY3JFUOjC5sMuaH64woDgGkbMpGtg
         mq5H8fq/oyzHw==
Received: by mail-wr1-f44.google.com with SMTP id s10so17133342wrb.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 15 Feb 2022 00:10:33 -0800 (PST)
X-Gm-Message-State: AOAM531O/v9gkwUV6ukASqU5tCkW6NfmkQHA3YADzZEVY5bZs7O1DkLa
        o7/RAlTcqwioB1maK4qB6V5n5iHCOCSgvH4dAJc=
X-Google-Smtp-Source: ABdhPJykY+dvL+1GXmktnHDS2zXI387Vsr5YXEveY1d8rit1tT/hQTTS9CD1dDWxxX5ce3jmiS7RoOoUcfODSGZmbh0=
X-Received: by 2002:a5d:58d1:: with SMTP id o17mr2237862wrf.407.1644912621613;
 Tue, 15 Feb 2022 00:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org> <20220214163452.1568807-15-arnd@kernel.org>
 <YgsYD2nW9GjWJtn5@zeniv-ca.linux.org.uk> <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
In-Reply-To: <215c0ddc-54b1-bcb1-c5aa-bd17c6b100a8@gmx.de>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Feb 2022 09:10:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DPxgti+aRVUABQFZz-yT0KNU9QZpB9iGNCPkBHnv_xg@mail.gmail.com>
Message-ID: <CAK8P3a1DPxgti+aRVUABQFZz-yT0KNU9QZpB9iGNCPkBHnv_xg@mail.gmail.com>
Subject: Re: [PATCH 14/14] uaccess: drop set_fs leftovers
To:     Helge Deller <deller@gmx.de>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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

On Tue, Feb 15, 2022 at 8:46 AM Helge Deller <deller@gmx.de> wrote:
>
> On 2/15/22 04:03, Al Viro wrote:
> > On Mon, Feb 14, 2022 at 05:34:52PM +0100, Arnd Bergmann wrote:
> >> diff --git a/arch/parisc/include/asm/futex.h b/arch/parisc/include/asm/futex.h
> >> index b5835325d44b..2f4a1b1ef387 100644
> >> --- a/arch/parisc/include/asm/futex.h
> >> +++ b/arch/parisc/include/asm/futex.h
> >> @@ -99,7 +99,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> >>      /* futex.c wants to do a cmpxchg_inatomic on kernel NULL, which is
> >>       * our gateway page, and causes no end of trouble...
> >>       */
> >> -    if (uaccess_kernel() && !uaddr)
> >> +    if (!uaddr)
> >>              return -EFAULT;
> >
> >       Huh?  uaccess_kernel() is removed since it becomes always false now,
> > so this looks odd.
> >
> >       AFAICS, the comment above that check refers to futex_detect_cmpxchg()
> > -> cmpxchg_futex_value_locked() -> futex_atomic_cmpxchg_inatomic() call chain.
> > Which had been gone since commit 3297481d688a (futex: Remove futex_cmpxchg
> > detection).  The comment *and* the check should've been killed off back
> > then.
> >       Let's make sure to get both now...
>
> Right. Arnd, can you drop this if() and the comment above it?

Done.

       Arnd
