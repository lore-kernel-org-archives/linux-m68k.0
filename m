Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E28C4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Nov 2023 21:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjKHVKm convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Nov 2023 16:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjKHVKl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Nov 2023 16:10:41 -0500
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 552FB2583
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Nov 2023 13:10:39 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6cd1918afb2so63324a34.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Nov 2023 13:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699477838; x=1700082638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bav5/FGayyEQonBNC4kdS6ICDtnFE4p01QngumR4dg4=;
        b=fKmqeOMm3D9jE0SoezH/y4joanEBN+H5HXBgvIk//VDVdS1yeL0sXXVi0y9RZfUcRU
         ig/VxD+GmdizfUFoE7kprwPcXI2KDvRJHeoD6Ldb4zVys86Kn41vVbN9HF2E15236nMv
         I41o45t+9QlLJtpSUyLk4lrrZGa25L4KVQ6NqD/Zl4CYHY0h4pz7VUOlqqZjmiT9G23s
         ie90Bb5HPPCGI7SHAtlIC9LDyB5UJwb70fssiwukjKXqnATexh2T8SRuUQFYJk2Zauig
         GxXnmkvyyVf4AFIo7dc7JK3osOSWxEYCpvSNvcWRsGvW3qFpR6DwEM1dJ1pBJIWee+h7
         k25g==
X-Gm-Message-State: AOJu0YwXZffmYta0HhI/l3/lZYZELP+ownDx+e2eAS4ysuVPEt5x6JrE
        PlBIzxjkRzraGCT5P7sA57kM3AYSRKU85A==
X-Google-Smtp-Source: AGHT+IFet43gUEzcO9AOY+EmJBFkeOfPUv19dlo5Kn0yAS8lwKYqZRYWUGnh3eivkP/aHp4mEw6Zig==
X-Received: by 2002:a05:6830:441f:b0:6b9:1af3:3307 with SMTP id q31-20020a056830441f00b006b91af33307mr3868261otv.17.1699477838012;
        Wed, 08 Nov 2023 13:10:38 -0800 (PST)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id c4-20020a9d6844000000b006cd0a56c406sm1991825oto.60.2023.11.08.13.10.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 13:10:37 -0800 (PST)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1ef370c2e1aso53584fac.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Nov 2023 13:10:37 -0800 (PST)
X-Received: by 2002:a0d:f3c2:0:b0:59b:54b5:7d66 with SMTP id
 c185-20020a0df3c2000000b0059b54b57d66mr2960037ywf.34.1699477816210; Wed, 08
 Nov 2023 13:10:16 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com> <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Nov 2023 22:10:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Message-ID: <CAMuHMdV7VfiSA9+wSJYYQkBN2=4E9HsFJRV6j8ffioe0=MFd8A@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Arnd Bergmann <arnd@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        guoren <guoren@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Geoff Levand <geoff@infradead.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
        Helge Deller <deller@gmx.de>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Timur Tabi <timur@kernel.org>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        David Woodhouse <dwmw2@infradead.org>,
        "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
        Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-trace-kernel@vger.kernel.org,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        Netdev <netdev@vger.kernel.org>, linux-parisc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
        linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Wed, Nov 8, 2023 at 10:07 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Wed, Nov 8, 2023, at 21:42, Geert Uytterhoeven wrote:
> > On Wed, Nov 8, 2023 at 2:01 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> Microblaze runs into a single -Wmissing-prototypes warning when that is
> >> enabled:
> >>
> >> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
> >>
> >> Include the right header to avoid this.
> >>
> >> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Thanks for your patch!
> >
> >>  arch/alpha/kernel/traps.c      | 1 +
> >>  arch/csky/include/asm/traps.h  | 2 --
> >>  arch/csky/kernel/traps.c       | 1 +
> >>  arch/m68k/coldfire/vectors.c   | 3 +--
> >>  arch/m68k/coldfire/vectors.h   | 3 ---
> >
> > Ah, so this is where the m68k changes listed in the cover letter are
> > hiding ;-)
> >
> >>  arch/microblaze/kernel/traps.c | 1 +
> >>  arch/sparc/kernel/traps_32.c   | 1 +
> >>  arch/sparc/kernel/traps_64.c   | 1 +
> >>  arch/x86/include/asm/traps.h   | 1 -
> >>  arch/x86/kernel/traps.c        | 1 +
> >>  10 files changed, 7 insertions(+), 8 deletions(-)
> >>  delete mode 100644 arch/m68k/coldfire/vectors.h
> >
> > Obviously the non-microblaze changes should be spun off in separate
> > patches.
>
> I messed up one of my rebases here and accidentally sent
> the wrong changelog text. My intention was to have the
> combined patch but with this text:
>
>     arch: include linux/cpu.h for trap_init() prototype
>
>     some architectures run into a -Wmissing-prototypes warning
>     for trap_init()
>
>     arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
>
>     Include the right header to avoid this consistently, removing
>     the extra declarations on m68k and x86 that were added as local
>     workarounds already.
>
>     Signed-off-by: Arnd Bergmann <arnd@arndb.de>

That makes sense, although it's hard to combine this with "my preference
would be for the patches to make it through the respective subsystem
maintainer trees"...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
