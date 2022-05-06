Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF85C433F5
	for <linux-m68k@archiver.kernel.org>; Fri,  6 May 2022 11:33:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1391408AbiEFLhe (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 May 2022 07:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1391366AbiEFLhc (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 May 2022 07:37:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71265DA4D
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 May 2022 04:33:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3D455B8358F
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 May 2022 11:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22F2C385A9
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 May 2022 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651836809;
        bh=mPb8Q8Ok2oNk7WAjedaRk8DoRYKS47EIw5ypxOHVuLY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FI96os8TxsWVMFTQSum8umj3WdMc96n2WVUOe9ARBaEtOvySLqfpyXR+DyA/iSqqu
         mnFbdkC1lKH7nhZrORbfDrum1xYD1A2tcY17RFJ3Zw0Ey8jJDn8N1zqBoLjxnP5QCH
         URup4sVXBq1IWIe3HT5KuOb+9qUGK/p/Cw+B91+CX8KJeHP3bJDTFKrRdooXgblm4i
         StdzVcr1z/R8Aahq3cjaqRaNSR1MH8sFi5g5ZCInjGiXopsbuDbQh/0l2NoVyEsbGG
         24NhZFnCi3hsKjAzwyXux3gCZ59FITGo7b5nXpfzc6F541PmkKwmhVND5zzHUMc3fs
         BXoOASfeZYPSw==
Received: by mail-ot1-f44.google.com with SMTP id m6-20020a05683023a600b0060612720715so4721775ots.10
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 May 2022 04:33:29 -0700 (PDT)
X-Gm-Message-State: AOAM532TDVHmTDBLAYf1ettumxICxUJlPpkmmwX7rk65r1lufP+rmAl2
        yS5i6DNL7CB3oQeLnSfU1iEl/UFAkgN13uzKjWk=
X-Google-Smtp-Source: ABdhPJy5Vv8YTgA/+Yk25Xv8xMKQhcEw8LiqaQy/3bb0wg6KVBd/5y4hLeqVF7Zu5FslZtdBqz1tOtNTiterOIoDfDE=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr1886331ybf.394.1651836798896; Fri, 06
 May 2022 04:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas> <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Fri, 6 May 2022 13:33:02 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
Message-ID: <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Bjorn Helgaas <helgaas@kernel.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" 
        <linuxppc-dev@lists.ozlabs.org>,
        "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:SPARC + UltraSPARC (sparc/sparc64)" 
        <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 6, 2022 at 12:20 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
> On Thu, 5 May 2022, Arnd Bergmann wrote:
>  I think I'm missing something here.  IIUC we're talking about a PCI/PCIe
> bus used with s390 hardware, right?
>
>  (It has to be PCI/PCIe, because other than x86/IA-64 host buses there are
> only PCI/PCIe and EISA/ISA buses out there that define I/O access cycles
> and EISA/ISA have long been obsoleted except perhaps from some niche use.)
>
>  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> pattern put on the bus/in the TLP in the address phase.  So what is there
> inherent to the s390 architecture that prevents that different bit pattern
> from being used?

The hardware design for PCI on s390 is very different from any other
architecture, and more abstract. Rather than implementing MMIO register
access as pointer dereference, this is a separate CPU instruction that
takes a device/bar plus offset as arguments rather than a pointer, and
Linux encodes this back into a fake __iomem token.

>  If anything, I could imagine the same limitation as with current POWER9
> implementations, that is whatever glue is used to wire PCI/PCIe to the
> rest of the system does not implement a way to use said bit pattern (which
> has nothing to do with the POWER9 processor instruction set).
>
>  But that has nothing to do with the presence or absence of any specific
> processor instructions.  It's just a limitation of bus glue.  So I guess
> it's just that all PCI/PCIe glue logic implementations for s390 have such
> a limitation, right?

There are separate instructions for PCI memory and config space, but
no instructions for I/O space, or for non-PCI MMIO that it could be mapped
into.

       Arnd
