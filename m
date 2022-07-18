Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881DBC43334
	for <linux-m68k@archiver.kernel.org>; Mon, 18 Jul 2022 08:22:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbiGRIWo (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 18 Jul 2022 04:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233831AbiGRIWm (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 18 Jul 2022 04:22:42 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C4019020
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jul 2022 01:22:38 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id l14so5852683qtv.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jul 2022 01:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EQibuB+HRd3lrCPdCHjd5Kptvz7t3wE5RCUTUbzpTH8=;
        b=C70ZzG7m4AQw4mamCelcEOALnYKxSDtktQ8AJ/9Ob9jk94wB27ZwCBDCHemr3n4FPw
         resGtjH2zTdz1QORgpjywmmKJRNiQgwCvfExvH85xPRMh+UPFfbyB2Xju85cqu/6GQnC
         b2XyyJwE88QhcbER7cLBgiXOTGKPG2SytSJAl9c1zMDwVXCzzxLBZKihHLEOYfTafuD5
         +Id3SaDNOKnibN+OOdUvLsbkXvvjJLHUBW3tKAh634R3Gzv0vuqqwkVNkXOZyVHP7O65
         N2TbiisYV0aU3waMMAnZwFE9ChNUury1rNCoY1U+eYT0E76qAFh+2IJqY3TfwLVrPbMr
         R4bA==
X-Gm-Message-State: AJIora/aq337aodn5y4sfRNGRvCW7q8isOU53NXl8J5nhhCvvrPYRRbI
        JugzS60LYy07mMXkZ1MVPjNvi7ulkahz3w==
X-Google-Smtp-Source: AGRyM1tSP6qRfKTD2GnWPDAHR2aaoYQaqI5hIbi88jPEUDddQX9Z+wmOKdrCRLcmRjaXQjlPT7Y4gQ==
X-Received: by 2002:a05:622a:349:b0:317:c7df:690e with SMTP id r9-20020a05622a034900b00317c7df690emr20443171qtw.276.1658132556889;
        Mon, 18 Jul 2022 01:22:36 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id bj12-20020a05620a190c00b006b5f68bc106sm252359qkb.110.2022.07.18.01.22.36
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 01:22:36 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id c131so18822779ybf.9
        for <linux-m68k@lists.linux-m68k.org>; Mon, 18 Jul 2022 01:22:36 -0700 (PDT)
X-Received: by 2002:a81:5404:0:b0:31c:c24d:94b0 with SMTP id
 i4-20020a815404000000b0031cc24d94b0mr28386378ywb.502.1658132545091; Mon, 18
 Jul 2022 01:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220718004114.3925745-1-shorne@gmail.com> <20220718004114.3925745-2-shorne@gmail.com>
In-Reply-To: <20220718004114.3925745-2-shorne@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Jul 2022 10:22:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVP=1ovo62oXaOXT4ipA9Qb61XQ1e4XVVi1gEi+s+wtTQ@mail.gmail.com>
Message-ID: <CAMuHMdVP=1ovo62oXaOXT4ipA9Qb61XQ1e4XVVi1gEi+s+wtTQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] asm-generic: Remove pci.h copying remaining code
 to x86
To:     Stafford Horne <shorne@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
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
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Nick Child <nick.child@ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Jul 18, 2022 at 2:41 AM Stafford Horne <shorne@gmail.com> wrote:
> The generic pci.h header now only provides a definition of
> pci_get_legacy_ide_irq which is used by architectures that support PNP.
> Of the architectures that use asm-generic/pci.h this is only x86.
>
> This patch removes the old pci.h in order to make room for a new
> pci.h to be used by arm64, riscv, openrisc, etc.
>
> The existing code in pci.h is moved out to x86.  On other architectures
> we clean up any outstanding references.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v2:
>  - Remove pci_get_legacy_ide_irq in m68k
> Since v1:
>  - Remove pci_get_legacy_ide_irq for most architectures as its not needed.

>  arch/m68k/include/asm/pci.h    |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
