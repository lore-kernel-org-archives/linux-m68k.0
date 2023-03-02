Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0673EC6FA8E
	for <linux-m68k@archiver.kernel.org>; Thu,  2 Mar 2023 10:44:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCBKol convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 2 Mar 2023 05:44:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjCBKoi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 2 Mar 2023 05:44:38 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BA4241D4
        for <linux-m68k@lists.linux-m68k.org>; Thu,  2 Mar 2023 02:44:37 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id f1so11288503qvx.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Mar 2023 02:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHoXp6+7/Ivp8TZOu6tqpc5Wq/dN7ibmjBTE7vH9gt0=;
        b=yTHZ/JwoAcRbwENSfRW7tf7HobDHTbVtFRpOhHyidiEQScCo4FvJPFyCqyfjmdY0wj
         II7VH/MXdFD9p8aCi0XvIIxjgVvuIorGm2BsG8wfGkpk5+ilimQQ6I3CergYq5d4pzsc
         p8G51BK9snWVMthjQpcZZuLCdNG3O0sE4HOhnoYYMaArpItQQNxppxRGIupDdYdvxqsQ
         bQB2CoihkngYLpAk0eUBle5w774XWkoQQSP5cwLAmmdCc7NeOilVj3NFT+bqAwEQu2Z0
         S5mQR5kzLuRGjXiDFhE5LjQ1R1eubu8VJwjGcRHarXeAFaAqPY/amdfPhI1C/kgWv9yM
         wi2A==
X-Gm-Message-State: AO0yUKUHwA4hRDPLh2bO2zUUOW7zkB4/zfsIEQvh46ZQb3KRf13QzLI1
        Xu5K/4Tlkq7nWUHEiVV++RcimSqHORGaHw==
X-Google-Smtp-Source: AK7set9n66eWVPCHo+7a4A7s38JJxYFRdJz7Jt/ThkSQ4p6PS3/PSaA3uJ1OutGRe3WW1ucUfT4R8A==
X-Received: by 2002:a05:6214:29eb:b0:56e:aa11:da91 with SMTP id jv11-20020a05621429eb00b0056eaa11da91mr15322407qvb.14.1677753876489;
        Thu, 02 Mar 2023 02:44:36 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id w18-20020a05620a129200b0073b8459d221sm10610337qki.31.2023.03.02.02.44.34
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 02:44:35 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-536cb25982eso418573417b3.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 02 Mar 2023 02:44:34 -0800 (PST)
X-Received: by 2002:a5b:1cf:0:b0:a43:52fe:c36f with SMTP id
 f15-20020a5b01cf000000b00a4352fec36fmr4318975ybp.7.1677753853997; Thu, 02 Mar
 2023 02:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20230302093539.372962-1-alexghiti@rivosinc.com>
 <CAMuHMdVC99kFpS9vL+HEqbXdDRMKVSW_t21X1p37d0oQufxKLw@mail.gmail.com> <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
In-Reply-To: <c0dd1a6e-8e8e-5cdb-bc92-755462704edf@ghiti.fr>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Mar 2023 11:44:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Message-ID: <CAMuHMdVSJADwTSkOD2mG2yU0XeFd0QAUjojQDz5phWhkRcLGOg@mail.gmail.com>
Subject: Re: [PATCH v4 00/24] Remove COMMAND_LINE_SIZE from uapi
To:     Alexandre Ghiti <alex@ghiti.fr>
Cc:     Alexandre Ghiti <alexghiti@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>,
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

On Thu, Mar 2, 2023 at 11:09 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
> On 3/2/23 10:47, Geert Uytterhoeven wrote:
> > On Thu, Mar 2, 2023 at 10:35 AM Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
> >> This all came up in the context of increasing COMMAND_LINE_SIZE in the
> >> RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> >> maximum length of /proc/cmdline and userspace could staticly rely on
> >> that to be correct.
> >>
> >> Usually I wouldn't mess around with changing this sort of thing, but
> >> PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> >> to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> >> increasing, but they're from before the UAPI split so I'm not quite sure
> >> what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> >> asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> >> boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> >> and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> >> asm-generic/setup.h.").
> >>
> >> It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> >> part of the uapi to begin with, and userspace should be able to handle
> >> /proc/cmdline of whatever length it turns out to be.  I don't see any
> >> references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> >> search, but that's not really enough to consider it unused on my end.
> >>
> >> This issue was already considered in s390 and they reached the same
> >> conclusion in commit 622021cd6c56 ("s390: make command line
> >> configurable").
> >>
> >> The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> >> shouldn't be part of uapi, so this now touches all the ports.  I've
> >> tried to split this all out and leave it bisectable, but I haven't
> >> tested it all that aggressively.
> >>
> >> Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-alexghiti@rivosinc.com/>:
> >> * Added RB/AB
> >> * Added a mention to commit 622021cd6c56 ("s390: make command line
> >>    configurable") in the cover letter
> > Thanks for the update!
> >
> >   Apparently you forgot to add your own SoB?
>
> I do not know, should I? Palmer did all the work, I only fixed 3 minor
> things

If you are picking up patches, and submitting them to someone else
for upstream inclusion, you should add your own SoB.
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L419

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
