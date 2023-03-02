Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC030C678D4
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Mar 2023 09:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbjCBJsR convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Mar 2023 04:48:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbjCBJsP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Mar 2023 04:48:15 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 764E71BAD6
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Mar 2023 01:48:04 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id y10so12699110qtj.2
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Mar 2023 01:48:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SFYMa4F5zx6QmdN+xdk9xuKBVfUQIkEC+rLl+xVi7rY=;
        b=2wXcW8maWDZJijtig1iO9w7okTaX2/cZ9K49XftpyJRhcIWkg8Binu2lesxyay4Y+X
         YtG4gGZpFXizQ97EX4u9xlUZoLjkr93xQ6iFmlROvMWGZJISSs18JHl4xgBqPXQTlcVu
         WLbwQEtJPEg997Geht9ZKhF8xYTgQ3dgEVxhy7FhyxoFdGT38XRCZPp4fJCltpCqDLRI
         G720Hz5WqURsfE3YzQmGZ6Ha9owQzpCyjPVuTeP63G8dF6pW7p3H9IMzvo4clO1XK+OB
         fV0mpw/obxbs8kjoVcpjxpbOzCCt36htsKqmKAPWJ9YpTKyFa2FPDMatiSxuqJI609pC
         apOw==
X-Gm-Message-State: AO0yUKVxOSWYN0fbGGM3FrRXlXglOXm/2WZdgYuAvDeY9HUIePrFw3ne
        OBj7TOEUnck0x0nKfAmsXHsVHqESnQdsqQ==
X-Google-Smtp-Source: AK7set8Tkj6vUyRFxnKHGCrQmrBKlTtYJPFgC1W0IZ0//Y/rh4eaWItyt5Fcj7N9dpMbBohF3jz7PA==
X-Received: by 2002:a05:622a:1882:b0:3b6:8b52:1359 with SMTP id v2-20020a05622a188200b003b68b521359mr2746531qtc.0.1677750483106;
        Thu, 02 Mar 2023 01:48:03 -0800 (PST)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id q18-20020ac87352000000b003bfaff2a6b9sm9977626qtp.10.2023.03.02.01.48.02
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:48:02 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id y12so11235915qvt.8
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Mar 2023 01:48:02 -0800 (PST)
X-Received: by 2002:a81:ad43:0:b0:533:91d2:9d94 with SMTP id
 l3-20020a81ad43000000b0053391d29d94mr5972312ywk.5.1677750462713; Thu, 02 Mar
 2023 01:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
In-Reply-To: <20230302093539.372962-1-alexghiti@rivosinc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Mar 2023 10:47:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Message-ID: <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To:     Alexandre Ghiti <alexghiti@rivosinc.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S . Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Alex,

On Thu, Mar 2, 2023 at 10:35 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> maximum length of /proc/cmdline and userspace could staticly rely on
> that to be correct.
>
> Usually I wouldn't mess around with changing this sort of thing, but
> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> increasing, but they're from before the UAPI split so I'm not quite sure
> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> asm-generic/setup.h.").
>
> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> part of the uapi to begin with, and userspace should be able to handle
> /proc/cmdline of whatever length it turns out to be.  I don't see any
> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> search, but that's not really enough to consider it unused on my end.
>
> This issue was already considered in s390 and they reached the same
> conclusion in commit 622021cd6c56 ("s390: make command line
> configurable").
>
> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> shouldn't be part of uapi, so this now touches all the ports.  I've
> tried to split this all out and leave it bisectable, but I haven't
> tested it all that aggressively.
>
> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-alexghiti@rivosinc.com/>:
> * Added RB/AB
> * Added a mention to commit 622021cd6c56 ("s390: make command line
>   configurable") in the cover letter

Thanks for the update!

 Apparently you forgot to add your own SoB?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
