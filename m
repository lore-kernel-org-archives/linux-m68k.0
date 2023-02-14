Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E486DC61DA4
	for <linux-m68k@archiver.kernel.org>; Tue, 14 Feb 2023 09:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjBNJLk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 14 Feb 2023 04:11:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjBNJLS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 14 Feb 2023 04:11:18 -0500
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0072241E7
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Feb 2023 01:09:44 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id a9so17580674ljr.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Feb 2023 01:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo1pwF0Y3+477kchtQyZldRaytGfE/r9ZXPNmjOtQDY=;
        b=ly8vVvWAriWcJqnsEiudQIVvhdvBX+2cEO37euw0YYHXh/Yd9InhZMD9zRXNPKoSVY
         ToBvkAAOWD5fgcqDQ02tKoKirpm8hlhxj84MMZTYEBvahbCBLyAvMTQTEsYMVKlul0LU
         hOfucidJauROb+ZgRktpPZYMP6L3EYxOVXNuCqUT44O2bL50b2c7IEtyiAo4+1wWrXt6
         rsqMSGKDr4K65PG5/84m1fQW9JditdMzg23dSSXK5fskGdyinzlT8EJNlKvcok5iNcZV
         Q1N6xDKjdNIGyYTy196i3tPpscOaToOLDkVvDeBFN4hsdtaL/eFqpIci3DUNyvLFql5N
         TQRg==
X-Gm-Message-State: AO0yUKVfz0b31vHWa2rxKKtUCKF+Uh+pzvcMcX0+Ch9lS9nO+vcWVH8D
        xUFpFVEDo61/yDITULg1Q3C7zteZevHqwqub
X-Google-Smtp-Source: AK7set85A1P8QiCCH+5a8P+6jZ1Loh3gKuDXIwCCKQ8CkGzMz2RtSKZ0hOU7ndk991RLTi0QbnJvhA==
X-Received: by 2002:a2e:b0ce:0:b0:290:629c:2db3 with SMTP id g14-20020a2eb0ce000000b00290629c2db3mr1042540ljl.48.1676365782504;
        Tue, 14 Feb 2023 01:09:42 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e9d44000000b002934b8d115csm1474773ljj.51.2023.02.14.01.09.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:09:41 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id d8so17594088ljq.9
        for <linux-m68k@lists.linux-m68k.org>; Tue, 14 Feb 2023 01:09:41 -0800 (PST)
X-Received: by 2002:a2e:9448:0:b0:293:5264:ad89 with SMTP id
 o8-20020a2e9448000000b002935264ad89mr149971ljh.37.1676365308893; Tue, 14 Feb
 2023 01:01:48 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <20230214074925.228106-16-alexghiti@rivosinc.com>
In-Reply-To: <20230214074925.228106-16-alexghiti@rivosinc.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 14 Feb 2023 10:01:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Message-ID: <CAMuHMdVQeh4ZqSmVXkNJTOCZ_Ywi0b0JiGpg2EQFRWZXzkNeyw@mail.gmail.com>
Subject: Re: [PATCH v3 15/24] m68k: Remove empty <uapi/asm/setup.h>
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
        linux-arch@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Feb 14, 2023 at 9:05 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
