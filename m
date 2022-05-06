Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010DAC43217
	for <linux-m68k@archiver.kernel.org>; Fri,  6 May 2022 13:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392257AbiEFNMw (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 6 May 2022 09:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379958AbiEFNMq (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 6 May 2022 09:12:46 -0400
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF0185537F
        for <linux-m68k@lists.linux-m68k.org>; Fri,  6 May 2022 06:09:02 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id s4so5845012qkh.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 May 2022 06:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2s+AM5Z/cEWfKtZbdmffBUO5M791JT3EdrRSPC+WgI=;
        b=AH/ljfvOn3DRVIxqM3HNK+n4sWzHpdoySOCh0txAyF/PctFVjlbUUa1QeWYmtplzgW
         1UUz55n4KofZc8RMm94E5Swa1+JxNjXrOCma84ftS6S2U2Mh6c/Ejc8g8WFDtb+l35TT
         v4I/VSrPiNVQ1HuN4JRqTrQvfMmuE6aIbwmHjfJajFsapvLamEfB8+VdRer2P7s18HEU
         e0jIKebk1nwECddFZM83nP+Dpfbdqy/tyRtUdA+cnw946A7WNy+xiquKMRy4V4S3MlAb
         RY5NIh0qGDm1qIYZRK87Tb5OwqotGwkpmWSbqvBUJw549BZmJJAE4+kCh4v/T5dDkEoT
         KZWw==
X-Gm-Message-State: AOAM533N0DwbcvENI4glAi7EUuTXuMyOwZNOHPcFtAM74tKQWETcpDqG
        vrvb2/q19Sm+6V12RGBvn+JxcgEfqrTCrg==
X-Google-Smtp-Source: ABdhPJxj04841R7H3cpMadn/BTZhcm7aSJ6+e+uDF554nZrePEo/TPGvvJRCAuRQb6fFfJCJxSsbTg==
X-Received: by 2002:a05:620a:3724:b0:6a0:162e:48c0 with SMTP id de36-20020a05620a372400b006a0162e48c0mr2159370qkb.720.1651842541579;
        Fri, 06 May 2022 06:09:01 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id bq10-20020a05620a468a00b0069fc13ce1f1sm2280465qkb.34.2022.05.06.06.08.58
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 06:08:59 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id y76so12788082ybe.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 06 May 2022 06:08:58 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr2250498yba.380.1651842538339; Fri, 06
 May 2022 06:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas> <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk> <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk> <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
In-Reply-To: <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 May 2022 15:08:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
Message-ID: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To:     David Laight <David.Laight@aculab.com>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Arnd Bergmann <arnd@kernel.org>, Rich Felker <dalias@libc.org>,
        "open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "open list:SPARC + UltraSPARC (sparc/sparc64)" 
        <sparclinux@vger.kernel.org>,
        "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Helge Deller <deller@gmx.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        linux-pci <linux-pci@vger.kernel.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        Richard Henderson <rth@twiddle.net>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" 
        <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, May 6, 2022 at 2:56 PM David Laight <David.Laight@aculab.com> wrote:
> From: Maciej W. Rozycki
> > Sent: 06 May 2022 13:27
> > On Fri, 6 May 2022, Arnd Bergmann wrote:
> > > >  If this is PCI/PCIe indeed, then an I/O access is just a different bit
> > > > pattern put on the bus/in the TLP in the address phase.  So what is there
> > > > inherent to the s390 architecture that prevents that different bit pattern
> > > > from being used?
> > >
> > > The hardware design for PCI on s390 is very different from any other
> > > architecture, and more abstract. Rather than implementing MMIO register
> > > access as pointer dereference, this is a separate CPU instruction that
> > > takes a device/bar plus offset as arguments rather than a pointer, and
> > > Linux encodes this back into a fake __iomem token.
> >
> >  OK, that seems to me like a reasonable and quite a clean design (on the
> > hardware side).
> >
> >  So what happens if the instruction is given an I/O rather than memory BAR
> > as the relevant argument?  Is the address space indicator bit (bit #0)
> > simply ignored or what?
>
> You don't understand something...
>
> For a memory BAR pci_ioremap() returns a token that can be used with readl().
> On most architectures readl() is just a memory access.
> This all fails on an I/O BAR.
>
> For an I/O BAR you want a similar pair of functions.
> On x86 the access function would need to use the 'in/out' instructions but
> there is no requirement for the token to be the native io port number.
> On many non-x86 architectures the access function would be a simple memory
> access - but a specific system (eg many ppc) may never actually allow
> such mappings to succeed.
>
> You might also want a third PCI mapping function that can map a memory
> BAR or an I/O BAR - with a suitable access function.
> On x86 this would need something like ioread8() for accesses.
> Except that function uses small integers for io port numbers
> (which is inherently dangerous).
>
> Nothing except the architecture specific implementation of the function
> to access an io BAR would ever go near a function called inb().
>
> The same is really true for other bus type - including ISA and EISA.
> (Ignoring the horrid of probing ISI bus devices - hopefully they
> are in the ACPI tables??_
> If a driver is probed on a ISA bus there ought to be functions
> equivalent to pci_ioremap() (for both memory and IO addresses)
> that return tokens appropriate for the specific bus.
>
> That is all a different load of churn.

A loooong time ago,  it was suggested to add register accessor
functions to struct device, so e.g. readl(dev, offset) would call
into these accessors, which would implement the bus-specific behavior.
No more worries about readl(), __raw_readl(), ioread32b(), or whatever
quirk is needed, at the (small on nowadays' machines) expense of
some indirection...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
