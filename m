Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3D4C4332F
	for <linux-m68k@archiver.kernel.org>; Wed,  8 Nov 2023 20:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjKHUm5 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 8 Nov 2023 15:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjKHUm4 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 8 Nov 2023 15:42:56 -0500
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1727213A
        for <linux-m68k@lists.linux-m68k.org>; Wed,  8 Nov 2023 12:42:54 -0800 (PST)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5845a94dae1so86523eaf.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Nov 2023 12:42:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699476174; x=1700080974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYbfzdavLbBO2X96qC9Jj/xBig9KkpEQ+EQytSx8qtw=;
        b=uuIRD8MixjuiBAqdwsYCTV0zykIViThDSRMSDD/Dd/clx90qgBzJ7sq6/S2Yzvq/Uv
         WtpkQMZF8jhrgxkbLJ6//HHe94sBDk/qLemGmS2v7QUu8zVy1DV1s788yDIHjNQYbyQB
         ERTEAtL3dvvWJrylk7Ro/ppfCjeEXtgi8sNiOr1bLJ6tFn6/QPuTzeek82i1ODsVg0Nf
         pf8muK2yIqHUT/EWpQO2+ZIHbbEnMEm2pTi8wd/z0KlWQqX5J8fr86uMw3o77y9hBwG0
         pmT7PmJHrLkQAbDBpKvqJbayiXMfo5gPUKt/GkF9IwkmfWjzu5raR+JvzdhTfhvdQMt1
         Q4fA==
X-Gm-Message-State: AOJu0Yx7WIUk3C0LXf1223wz112cvc7mWrEmo/xaDexFmp5f2YbQ+Zb0
        4IrL7rr7wQVWKUydzzAsZ9Q+q17nRYsxxg==
X-Google-Smtp-Source: AGHT+IEBo76kL7QmGDFX35RLdHbpH38/G1NPwsrZFGxstcx8vGDZtsmCIfPtuMrhxGCXvMTVS12u5g==
X-Received: by 2002:a05:6808:2013:b0:3a8:8ea0:c6b with SMTP id q19-20020a056808201300b003a88ea00c6bmr1789120oiw.9.1699476173598;
        Wed, 08 Nov 2023 12:42:53 -0800 (PST)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com. [209.85.167.179])
        by smtp.gmail.com with ESMTPSA id t4-20020a05680800c400b003b2f369a932sm2016950oic.49.2023.11.08.12.42.52
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 12:42:52 -0800 (PST)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3b2e308a751so89612b6e.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 08 Nov 2023 12:42:52 -0800 (PST)
X-Received: by 2002:a81:4756:0:b0:59f:699b:c3b3 with SMTP id
 u83-20020a814756000000b0059f699bc3b3mr5987326ywa.0.1699476150732; Wed, 08 Nov
 2023 12:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20231108125843.3806765-1-arnd@kernel.org> <20231108125843.3806765-11-arnd@kernel.org>
In-Reply-To: <20231108125843.3806765-11-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Nov 2023 21:42:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Message-ID: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init() prototype
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Guo Ren <guoren@kernel.org>,
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
        "David S. Miller" <davem@davemloft.net>,
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
        Al Viro <viro@zeniv.linux.org.uk>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-bcachefs@vger.kernel.org,
        linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Arnd,

On Wed, Nov 8, 2023 at 2:01 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Microblaze runs into a single -Wmissing-prototypes warning when that is
> enabled:
>
> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
>
> Include the right header to avoid this.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

>  arch/alpha/kernel/traps.c      | 1 +
>  arch/csky/include/asm/traps.h  | 2 --
>  arch/csky/kernel/traps.c       | 1 +
>  arch/m68k/coldfire/vectors.c   | 3 +--
>  arch/m68k/coldfire/vectors.h   | 3 ---

Ah, so this is where the m68k changes listed in the cover letter are
hiding ;-)

>  arch/microblaze/kernel/traps.c | 1 +
>  arch/sparc/kernel/traps_32.c   | 1 +
>  arch/sparc/kernel/traps_64.c   | 1 +
>  arch/x86/include/asm/traps.h   | 1 -
>  arch/x86/kernel/traps.c        | 1 +
>  10 files changed, 7 insertions(+), 8 deletions(-)
>  delete mode 100644 arch/m68k/coldfire/vectors.h

Obviously the non-microblaze changes should be spun off in separate
patches.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
