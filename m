Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71CAC433EF
	for <linux-m68k@archiver.kernel.org>; Thu,  5 May 2022 17:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382813AbiEERoF (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 5 May 2022 13:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382846AbiEERnz (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 5 May 2022 13:43:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1185D666
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 May 2022 10:40:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C82B461EFD
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 May 2022 17:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998C3C385A8
        for <linux-m68k@lists.linux-m68k.org>; Thu,  5 May 2022 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651772411;
        bh=2IoE4BfEuAg77WmuhMuImyNDvTFHhyYDFxiBCowXMW0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gDuRGk4UTOFgyiPRSSXBtXdg7RapyCYPQMe3RDG1agV2g91eoA8Rc96OoXhcxZktS
         iUqVfHohjgqHBdDDtxw5t6xJ9Nhm9sSAdlyGvUTs6m+xZUhtZqKl1GSzm0PLJcqji6
         Zwu22sg5c8SYB8EGXGM0c7T9GFi09LU2w9lyRv2qYfUyzADinYvcwB9oYxIjNKRSXB
         rJbPM+FqCEOPUai83HD9yI1FPF1fml1W/bN4kUJP38WtlPPBBIi5VUu91BjitmDOp7
         5K3I4ZAYpbF0sj+30Pw4r5dr3PVF7qz49AwnJbcV/PZGH4xcfoqBLRAey6ism0Mvsj
         /lk9y6IRiCqfg==
Received: by mail-wm1-f50.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso3057777wml.5
        for <linux-m68k@lists.linux-m68k.org>; Thu, 05 May 2022 10:40:11 -0700 (PDT)
X-Gm-Message-State: AOAM531FcA8Tc2qTtDGJoEhsr6f8Elb/tjbbGfFRpj/QJmAirGEXCHSV
        IGkFlgvTTiWor6Ee8AIoQqjTVcuTySa7ydjCC5s=
X-Google-Smtp-Source: ABdhPJxtMhUha7a+dwpeZyyg5w+ON9JC8vKB6RB8veyDWjdr1D7VRDLkqvJBk615pYcXmnWu5kgj+KPCSrbSxhVU2uo=
X-Received: by 2002:a7b:cc93:0:b0:394:2622:fcd9 with SMTP id
 p19-20020a7bcc93000000b003942622fcd9mr6321312wma.20.1651772399229; Thu, 05
 May 2022 10:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
In-Reply-To: <20220505161028.GA492600@bhelgaas>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Thu, 5 May 2022 19:39:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Message-ID: <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     Niklas Schnelle <schnelle@linux.ibm.com>,
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

On Thu, May 5, 2022 at 6:10 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Wed, May 04, 2022 at 11:31:28PM +0200, Arnd Bergmann wrote:
> >
> > The main goal is to avoid c), which is what happens on s390, but
> > can also happen elsewhere. Catching b) would be nice as well,
> > but is much harder to do from generic code as you'd need an
> > architecture specific inline asm statement to insert a ex_table
> > fixup, or a runtime conditional on each access.
>
> Or s390 could implement its own inb().
>
> I'm hearing that generic powerpc kernels have to run both on machines
> that have I/O port space and those that don't.  That makes me think
> s390 could do something similar.

No, this is actually the current situation, and it makes absolutely no
sense. s390 has no way of implementing inb()/outb() because there
are no instructions for it and it cannot tunnel them through a virtual
address mapping like on most of the other architectures. (it has special
instructions for accessing memory space, which is not the same as
a pointer dereference here).

The existing implementation gets flagged as a NULL pointer dereference
by a compiler warning because it effectively is.

powerpc kernels generally map the I/O space into a section of the
physical address space, where it gets mapped into a fixed virtual
address and accessed through pointer dereference. This works on
any powerpc CPU as long as it is implemented in the PCI host
bridge in the usual way. The only difference between powerpc and
arm here is that there are fewer implementations, so one can
make assumptions about which PCI host bridge is used based on
a CPU core.

     Arnd
