Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB15C433F5
	for <linux-m68k@archiver.kernel.org>; Thu, 17 Feb 2022 08:59:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiBQI7b (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 17 Feb 2022 03:59:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238280AbiBQI7a (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 17 Feb 2022 03:59:30 -0500
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 17 Feb 2022 00:59:16 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFA582A7970
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Feb 2022 00:59:16 -0800 (PST)
Received: from mail-lf1-f53.google.com ([209.85.167.53]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M3D7V-1nHa9O3xgD-003dzC for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Feb
 2022 09:54:12 +0100
Received: by mail-lf1-f53.google.com with SMTP id g39so8591220lfv.10
        for <linux-m68k@lists.linux-m68k.org>; Thu, 17 Feb 2022 00:54:11 -0800 (PST)
X-Gm-Message-State: AOAM531Z3IkZSZXgNEiAbhU+omToIl369RGS4oRJ3xvdhYkaZxYI4uAZ
        B6kEtBE/mYh3Nc/j+4Bk7py6Uob4Jl8GrB8d7d4=
X-Google-Smtp-Source: ABdhPJwQLFNR2EKsG8wmZOAHPh9E9pyoICR3LxZT862dIjr2W4W3Sw6yF+ayzR5i5e/QGR8IN4+3KhdYVHoGFF4fNyc=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr1268592wrm.317.1645084364936; Wed, 16
 Feb 2022 23:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 17 Feb 2022 08:52:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>
Cc:     Russell King - ARM Linux <linux@armlinux.org.uk>,
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
X-Provags-ID: V03:K1:176PAAQspzP+k4ftrq+vElBZCUzKOR2BC7+qHeYOzJj7Oni1kEw
 7YZ3IFLmtHPZa1Xj4YVAnOM8hhABezGa04GVABj2r4qm6TVCzy+i4JLcOdLNKEfvuCCCpxc
 Ly+zVygaTQFyrBxITWpVkaNk5Y+iHS64iECtAOXw9HNL5f+Q+A9n8iVrBUyWWedtbVb3myi
 YyZJ4SOKyjvy+T690JAHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ebN5bhSj06o=:yKVcS9GHJ6qSrO87dB2nRC
 HX1/Adpy/eFlpYiS4uZyH2psI9/PpP2EBOc57FcEmNe9USe2zZyMub5e1rn5KkTN0WrCpJ1ug
 s0Ku6vmLLTZSx5JDCCP61PEOdX5cOaBFBfkjrJq3LWQaekGBdR4QQtZIM46dz1MZsOlpsj59y
 Vu2kI91eVM44j3k4WJzc4q5krMkL24e5JnthajV6yYzqkIATQ3cOhqgQoX37WkJNovUxn0HN5
 qn4EyJRemf20gpQbO6fv54ybn/XuzmxS7p4AuXYkpTaBfRYyTmfj/97qR17L5iTRx0Af9Lhbq
 qPn1rVYvSFh2sFVyj1IBDokoAasFrUSHuWinMU6cpkV7i/5rw2L+XLZDV7eHRLSQtDsIsZ1o6
 ESdd9Y5Zy27SyDeeCRTG2526+dUJdQDzKovVQ4W6j67ikwSesihhVwCJ0F0lCsIHNZxszHz8O
 X5JafYAWXGszY7evFpBi39odIAFkA1zYCB9Kbe3hupjhGlpjcWti98GjGUHLirP1o8zBB+EJv
 fpLQ+EdE7bCuQnOtGgQ6ZhlxWH0jsu8LLSkziPpCFR+yUmv+DiADt+7VahEjaRu3XZKuIVLi9
 sH19AwJXyH6kij/nyleiGffRqDtiYt7ua2AZj8EZ9/yeW8ndfsHyeVTG2uYlH2d8n/KxW72uz
 bRWkmtACtTENzYU6R/oHKifQ1ruiLZJ4PzD4lPU44rq1lHduvCk4EMwBPfR5lhRICzyFAyvpZ
 DkrGAoHcnemBRjarfHvCF4NXCrLSw5nxc0GsgHNnkdlYxN/QAazhZqqAMRwg46qoW+2uNq4/I
 STlFIFUjYzvSXvx96gEBROp6PfwI27IlLfydwc2PRBx535I034=
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:

> + * limit and catch all possible overflows.
> + * On architectures with separate user address space (m68k, s390, parisc,
> + * sparc64) or those without an MMU, this should always return true.
...
> +static inline int __access_ok(const void __user *ptr, unsigned long size)
> +{
> +       unsigned long limit = user_addr_max();
> +       unsigned long addr = (unsigned long)ptr;
> +
> +       if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE))
> +               return true;

I noticed that I'm missing the check for !CONFIG_MMU here, despite
mentioning that in the comment above it. I've added it now.

        Arnd
