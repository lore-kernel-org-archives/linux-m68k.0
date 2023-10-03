Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24209E7AD77
	for <linux-m68k@archiver.kernel.org>; Tue,  3 Oct 2023 17:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240045AbjJCRUP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 3 Oct 2023 13:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231392AbjJCRUP (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 3 Oct 2023 13:20:15 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2E1A6
        for <linux-m68k@lists.linux-m68k.org>; Tue,  3 Oct 2023 10:20:12 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7a25040faffso47609139f.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Oct 2023 10:20:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696353611; x=1696958411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDlx4Wu9l39McbXAmxr/aQafR9CqgRAFRsdqHoaziys=;
        b=tPPIJ9fa1fc8Qj8WPUUGg+DomSz47a/OlQXZJptB5jpjXRjuhl47a28plzTiNxxy97
         T9M74FDol6hB9JEbadHvN5h6I5FwdYxpxtqFQwX1jPP80n9zg9olUbUGBJLpKnHml23m
         TMvaKSZNmIa18NEsfajmy0G8zmkN5/XRk3EObGYfiekcc/wJEIa5zZ8liJhR8HwZG9i7
         cqyEvLikU4M/xz2m4fS0HO/m0Xx5MMMxTcLilGGpMGvebFOv05lNgyMJAw8yHPW+ZXaC
         YFimaU7T5vqeAdsa35Cxc8APJSAbCwja0hKgeOyV9c2lnbVRlnOQB/UNPX+xBOqdiF3v
         keFg==
X-Gm-Message-State: AOJu0YzvDNbtn0KTXgAioltEuX8QlX3qCRI90YyglBSM/yv49mukM4uK
        fAVIWkBTAWMvClXTOdMlWNgAY+TIoZpnFw==
X-Google-Smtp-Source: AGHT+IHC8HGYc4l+CxVdaWVJV6XJgtF5IdH+CvEo+6PDvL6LyDjRFSsTeZbgJwGfsngUiJ0CTSjDVg==
X-Received: by 2002:a05:6e02:149:b0:348:ba80:5a37 with SMTP id j9-20020a056e02014900b00348ba805a37mr155600ilr.0.1696353610685;
        Tue, 03 Oct 2023 10:20:10 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id 6-20020a92c646000000b003497ced3fa1sm470394ill.29.2023.10.03.10.20.10
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Oct 2023 10:20:10 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7a25040faffso47608039f.1
        for <linux-m68k@lists.linux-m68k.org>; Tue, 03 Oct 2023 10:20:10 -0700 (PDT)
X-Received: by 2002:a81:a14b:0:b0:583:6db3:a007 with SMTP id
 y72-20020a81a14b000000b005836db3a007mr272837ywg.17.1696353588829; Tue, 03 Oct
 2023 10:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
In-Reply-To: <20230914185804.2000497-1-sohil.mehta@intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 3 Oct 2023 19:19:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDho+vRAnQ3_AWjLcGgrNKNhWGmpdpjipq53QjvRrUJw@mail.gmail.com>
Message-ID: <CAMuHMdWDho+vRAnQ3_AWjLcGgrNKNhWGmpdpjipq53QjvRrUJw@mail.gmail.com>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for
 all architectures
To:     Sohil Mehta <sohil.mehta@intel.com>
Cc:     linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Sergei Trofimovich <slyich@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rohan McLure <rmclure@linux.ibm.com>,
        Andreas Schwab <schwab@linux-m68k.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Brian Gerst <brgerst@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Mark Brown <broonie@kernel.org>,
        Deepak Gupta <debug@rivosinc.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Sep 14, 2023 at 8:59 PM Sohil Mehta <sohil.mehta@intel.com> wrote:
> commit c35559f94ebc ("x86/shstk: Introduce map_shadow_stack syscall")
> recently added support for map_shadow_stack() but it is limited to x86
> only for now. There is a possibility that other architectures (namely,
> arm64 and RISC-V), that are implementing equivalent support for shadow
> stacks, might need to add support for it.
>
> Independent of that, reserving arch-specific syscall numbers in the
> syscall tables of all architectures is good practice and would help
> avoid future conflicts. map_shadow_stack() is marked as a conditional
> syscall in sys_ni.c. Adding it to the syscall tables of other
> architectures is harmless and would return ENOSYS when exercised.
>
> Note, map_shadow_stack() was assigned #453 during the merge process
> since #452 was taken by fchmodat2().
>
> For Powerpc, map it to sys_ni_syscall() as is the norm for Powerpc
> syscall tables.
>
> For Alpha, map_shadow_stack() takes up #563 as Alpha still diverges from
> the common syscall numbering system in the other architectures.
>
> Link: https://lore.kernel.org/lkml/20230515212255.GA562920@debug.ba.rivosinc.com/
> Link: https://lore.kernel.org/lkml/b402b80b-a7c6-4ef0-b977-c0f5f582b78a@sirena.org.uk/
>
> Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>

>  arch/m68k/kernel/syscalls/syscall.tbl       | 1 +

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
