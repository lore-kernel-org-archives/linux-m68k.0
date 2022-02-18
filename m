Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DF6C433F5
	for <linux-m68k@archiver.kernel.org>; Fri, 18 Feb 2022 09:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiBRJFg (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 18 Feb 2022 04:05:36 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbiBRJFf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 18 Feb 2022 04:05:35 -0500
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F3C72B3AF4
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Feb 2022 01:05:12 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id l73so7274342pge.11
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Feb 2022 01:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PuyWdNt7E53vPgI1lZLvKTUut2bNACfNkxpc83Dke5E=;
        b=L/Da7MOHXSQzAhZYzix5CIrQgghVTMJHRclHBu/zT8/mjJn1aaWm1sRwgHnRO5Wgfo
         qqD++OxfsrOlVMIcfrJM8SbcH1XOs0fSHmMpm+fjUN+F9gH8i/W4669YVnCJP6jP2Nkd
         n7i+nY9uz0qnv6Au5ygqMjYHNWScpxkXNLSuCuLwAzJIVKYtq1Uffdxl6EKon72eKNgB
         Q1OFmwPOppO/Z9mgsuVaC48FouvyuV0F4JI9teiUG9LB8C9aA8zi6ZHfJkrOkSFJJOm+
         Xy03Q0KraM/z9tIWV1Kz7vayd7bMEdMs/+ZQCc2vp/2mW9fnMdf9xCeQ4fsTrzt+emBl
         fY3w==
X-Gm-Message-State: AOAM530dG3D1tn932ReT/0qSZTBglhzb9eosei66PBAaJn0csu4zv1oU
        Fcba+9qnKkTqBa6r/55PsspOdJGEor1wVg==
X-Google-Smtp-Source: ABdhPJwsob9QkqULEdl9pvsha/bF0We3PiMCG/Eat07DQfviXfhHRYSYlh6m5m4ssVszNy5xJzKCAg==
X-Received: by 2002:a63:4509:0:b0:372:8235:b060 with SMTP id s9-20020a634509000000b003728235b060mr5631221pga.92.1645175111434;
        Fri, 18 Feb 2022 01:05:11 -0800 (PST)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com. [209.85.216.48])
        by smtp.gmail.com with ESMTPSA id t14sm10652196pgo.19.2022.02.18.01.05.11
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 01:05:11 -0800 (PST)
Received: by mail-pj1-f48.google.com with SMTP id v8-20020a17090a634800b001bb78857ccdso9474824pjs.1
        for <linux-m68k@lists.linux-m68k.org>; Fri, 18 Feb 2022 01:05:11 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr3285076vse.57.1645175099822; Fri, 18
 Feb 2022 01:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org> <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Feb 2022 10:04:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfiuYEMQhtscwt4xCm1Dfw0M_qEmQ4pof59eB4jZFOPg@mail.gmail.com>
Message-ID: <CAMuHMdVfiuYEMQhtscwt4xCm1Dfw0M_qEmQ4pof59eB4jZFOPg@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
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
> There are many different ways that access_ok() is defined across
> architectures, but in the end, they all just compare against the
> user_addr_max() value or they accept anything.
>
> Provide one definition that works for most architectures, checking
> against TASK_SIZE_MAX for user processes or skipping the check inside
> of uaccess_kernel() sections.
>
> For architectures without CONFIG_SET_FS(), this should be the fastest
> check, as it comes down to a single comparison of a pointer against a
> compile-time constant, while the architecture specific versions tend to
> do something more complex for historic reasons or get something wrong.
>
> Type checking for __user annotations is handled inconsistently across
> architectures, but this is easily simplified as well by using an inline
> function that takes a 'const void __user *' argument. A handful of
> callers need an extra __user annotation for this.
>
> Some architectures had trick to use 33-bit or 65-bit arithmetic on the
> addresses to calculate the overflow, however this simpler version uses
> fewer registers, which means it can produce better object code in the
> end despite needing a second (statically predicted) branch.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Mark Rutland <mark.rutland@arm.com> [arm64, asm-generic]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig.cpu                 |  1 +
>  arch/m68k/include/asm/uaccess.h       | 19 +--------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
