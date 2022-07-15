Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C3AC433EF
	for <linux-m68k@archiver.kernel.org>; Fri, 15 Jul 2022 07:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbiGOHkv (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 15 Jul 2022 03:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbiGOHko (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 15 Jul 2022 03:40:44 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE8F27C1B8
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Jul 2022 00:40:40 -0700 (PDT)
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MI4cT-1oI3Ll3i2Z-00FEhv for <linux-m68k@lists.linux-m68k.org>; Fri, 15
 Jul 2022 09:40:39 +0200
Received: by mail-ot1-f51.google.com with SMTP id y10-20020a9d634a000000b006167f7ce0c5so3003866otk.0
        for <linux-m68k@lists.linux-m68k.org>; Fri, 15 Jul 2022 00:40:38 -0700 (PDT)
X-Gm-Message-State: AJIora/t1N3OnOWu+/1EMSQT39iUvwPtEssEguljdpEa0tDiaa9FoRkj
        /3my4zeWnkoTsDTipRghodM255qrQj8k/08fQsk=
X-Google-Smtp-Source: AGRyM1uqN7hbJWu1Kc45V1df/TuEhLpRBy0jFrUgJKDcJEoO7ehMJuFR6t3QFdid1eQbrmQCLxECRTpajxA3X2Ob8Ys=
X-Received: by 2002:a81:1e4d:0:b0:31c:86f1:95b1 with SMTP id
 e74-20020a811e4d000000b0031c86f195b1mr14141207ywe.42.1657870826723; Fri, 15
 Jul 2022 00:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220714214657.2402250-1-shorne@gmail.com> <20220714214657.2402250-2-shorne@gmail.com>
 <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
In-Reply-To: <CAMo8BfKkGRHiFq1vu1ZKkURkUqC+Ee7D42yuKrCeDF+578s9cw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 15 Jul 2022 09:40:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3S5crDdUcO0kAgOLVGYgXnkU9D3uo44Wrcu5LdAWCGoQ@mail.gmail.com>
Message-ID: <CAK8P3a3S5crDdUcO0kAgOLVGYgXnkU9D3uo44Wrcu5LdAWCGoQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to architectures
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     Stafford Horne <shorne@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Nick Child <nick.child@ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
        "open list:IA64 (Itanium) PL..." <linux-ia64@vger.kernel.org>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "open list:SPARC + UltraSPAR..." <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:YRpzCqhgJ+2LejSmkHvGTnizd88DiEwRqe+DLr9afNrwbxG6uyh
 NCgl6FqHIdWTy4YjbMjsNRN6dWE2o9OO7g8FUvLMDMWPXH+Y9K0itEQ4FMSwrrITpeidf2K
 HL4sojlhOYgNg+Z+p4TamvGpI55C8icgVCfo8Bivxz6xoMfcAaQi4yD2qRiUrGWKVSb0/V8
 747R2lNfrv/c9Wx7JUoEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sxJOtiBz4CE=:NGZyTopLTD8Zx4mU2Ck8VL
 v3DzhD1SakvPqCUfqJ3PqljV93DyhDBWyuvJSbvV7k2AbDlGzkG8xeq2fyK/1SQjE0Pq4dPvL
 0tQjUGYDfJg+3KToKVAnZIbMDlUEiyAUngmSD9MPVSHqApnDl5A7BZCdBnEGj6+jQTnWNoGHk
 jOYg18RpAh0xs0pNx0PKP1tzA86gFxubEzvzKPanX711xVVNVjBTLrBcX4k6ZDq5w6WdDHj/r
 1ySrF6vxHjz75Z1SBrJ536sVXyjDpIMwssqCfOnHeqE+P/NmXYWdRdaV/5x4mRUEu4mGbEG3K
 ka3k2Oo0GDujBDmGNqXCgP/HXCG+u5NaxKjZJM/8sUfJjIynCmYGqQ6EXE7sL+juccHTASOcO
 RRsKrGeIJ/VjPsZGxTknsfqd/0GvOUQxJjzbAfPE2lI6YxXX+CurKET64Y3iwes1+X5JNIVWL
 Sm9T0y0U+FGT5gAkir18HxtP2n2ZPU8LyJS4oLqDmaewWzuivkyGd2p2Nw4gmNgo+jt/8wUtj
 8y5zmd2A0WqjbeTc+qOUzip33vpjClslrIHntO7Ave8EvIt6/JQsqUCTMZU+IyJlVlsvXQwtQ
 RNOV2Z3L/1wJxaQwfthwOgiMCeAaUPldU2HararGOtrb+zk7NmTnlNqS30b5l8aUMYgss9/v3
 dkvLQnoNKiMUDfBYfb2IMYy2PM5tG3nwqSxPeD3x4iUB1/XHiiKoGPVXVt2+CzBU8+9D4vlc3
 8j6YbDYa5Te5rO39COpgMdnqDzi64w7jcFych/aWgmaMX16E0KjkTYGQqOro7oj09JuDsBn9F
 0bHijKmo0oyUNezZZwWbkKT15GmlX8nSyw79+EkfLj17fafeLojFNXgGf+aPMMOwxZrpsTVBv
 6ZKOomOuICgcKUydyjtQ==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Jul 15, 2022 at 3:45 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
> On Thu, Jul 14, 2022 at 2:47 PM Stafford Horne <shorne@gmail.com> wrote:
>
> > +static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
> > +{
> > +       return channel ? 15 : 14;
> > +}
>
> This addition does not make sense for the xtensa as it isn't even possible
> to enable PNP support (the only user of this function) on xtensa.

Nice catch! I had looked at this function earlier and only tried to infer
which architectures might have this based on who has those interrupt
numbers reserved for ISA devices, but looking at CONFIG_PNP is clearly
better here.

PNP depends on "ISA || ACPI", and this already rules out most
architectures. The remaining ones are:

* x86, ia64, alpha: These clearly use PNP based on-board devices on
   common machines, and use PC-style interrupts

* arm64, loongarch: These select PNP when ACPI is enabled. I don't
   think they actually use PNP, but for the moment the function needs to
  be defined, probably returning 0. Loongarch still lacks PCI support
  though, so asm/pci.h is not yet there.

* arm, mips, powerpc: Only a few older machines in each of these
  support ISA devices, and the function is probably machine specific.
  These all have a custom pci.h already and don't use the asm-generic
  version.

* m68k: there are two that enable CONFIG_ISA and one that enables
  CONFIG_PCI, but nothing that has both, so we don't need this
  function.

In summary, I think only x86 actually uses this function, and it is
correct there, everything else either has its own implementation
or does not need it, so the existing asm-generic/pci.h file can
just be folded into the x86 asm/pci.h. That is a great cleanup.

        Arnd
