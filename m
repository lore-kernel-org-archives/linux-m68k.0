Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1540FC433FE
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Feb 2022 08:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232912AbiBRI4a (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Feb 2022 03:56:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232895AbiBRI4Z (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Feb 2022 03:56:25 -0500
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75CC947AC4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Feb 2022 00:56:09 -0800 (PST)
Received: by mail-qk1-f175.google.com with SMTP id b22so7270857qkk.12
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Feb 2022 00:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=acpcDWZvSxDwOAzGTb7O2RMIWdslBDMuoEt9Qz/Phu0=;
        b=gERTGfs9BH/X6EmE9vWQZBc/kPKNt290HZFt7tjzivXdkUPLqKDOSxBiqA0OxAPaOQ
         3TXdYyMWYRsGVwcl7TCdMvlbQjnfdft+0fTOefa7gaFrJPD6qHj5j3rhXYSEXSAd4uop
         lZM+FDZZLPaqwWh9Hs/NwMBqATSyPbka6H7Ne2dtheXlKSbUVpJ7srcjJsFmBc+e4sK2
         inJCGWz/XTVCxv20AODvXn4aplMWSmTHrt8v7mRkzCIeoLfPWoQorkQBebqW2wIjET7E
         SG5jjxRtol8EPB5pkv9GaaPpxvMSnVRE30j5TcXc0Azd4iA1yarxNQFY+KUHjP2Ekj6T
         a2cA==
X-Gm-Message-State: AOAM5324Lhg8Y+Ui2w3IUX9MfCl1IDeoAx2Whd786rK36WnX3uwTotu0
        A8QeDAMAdK26w4I4W2uQIn3mZJiGipbMRQ==
X-Google-Smtp-Source: ABdhPJzpZ9ibfgp+wp2QV8LFFasx/1Tbl/eGj8s6J31zNXpN3ZfSjLil90UbsozQlSlmqoGmJru8nA==
X-Received: by 2002:a37:b884:0:b0:5f1:8ef6:9e9b with SMTP id i126-20020a37b884000000b005f18ef69e9bmr3841448qkf.696.1645174568310;
        Fri, 18 Feb 2022 00:56:08 -0800 (PST)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com. [209.85.219.51])
        by smtp.gmail.com with ESMTPSA id u11sm21904445qkp.21.2022.02.18.00.56.08
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 00:56:08 -0800 (PST)
Received: by mail-qv1-f51.google.com with SMTP id e22so13452603qvf.9
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Feb 2022 00:56:08 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr2916488vsl.77.1645174557092; Fri, 18
 Feb 2022 00:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-9-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-9-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Feb 2022 09:55:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] uaccess: add generic __{get,put}_kernel_nofault
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Russell King <linux@armlinux.org.uk>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@codeaurora.org>,
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
        Richard Weinberger <richard@nod.at>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
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

On Wed, Feb 16, 2022 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Nine architectures are still missing __{get,put}_kernel_nofault:
> alpha, ia64, microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa.
>
> Add a generic version that lets everything use the normal
> copy_{from,to}_kernel_nofault() code based on these, removing the last
> use of get_fs()/set_fs() from architecture-independent code.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/include/asm/uaccess.h     |   2 -

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
