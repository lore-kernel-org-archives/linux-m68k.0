Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A66C433F5
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Oct 2021 06:59:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9CFD610CB
	for <linux-m68k@archiver.kernel.org>; Wed, 13 Oct 2021 06:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbhJMHBS (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 13 Oct 2021 03:01:18 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:47048 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbhJMHBS (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 13 Oct 2021 03:01:18 -0400
Received: by mail-ua1-f45.google.com with SMTP id u5so2456424uao.13
        for <linux-m68k@lists.linux-m68k.org>; Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLmWoWym/1fKiJu7c9gpS1cDGT+57poTvw7kTscrC00=;
        b=frlvhoLLEhRi/vPBFclig/XSmNyP9RPEbtcEPw99Subg5+PkoZY4FaipemsYIYtDnz
         d8Ak3Lsit+qSFj7JrkQQmO0XjP1LlLCqqE75+TP6idxHXcRQN/kl2nNRustSD+Q6YehY
         Kf0SbI/rpa9k5LtePQ3T5x4r8BVKTzOJOa7eBjauj1aR7DKUstU+AGs3Z+cCE3U3CAPW
         Ht8i7v6nWrOdZ+DcvY0TdHMnS4vB880iuaRSu/ZiVuw/sMgvUGUsB4XDfsLOIQBt4f8R
         9tM5p/ZGrM9OuUJ6SiC89OxUb7bJZ8BThWnzX10T2VAbSMZKZsi3Ed2PWXTDmgL+PsN/
         +zNw==
X-Gm-Message-State: AOAM5326Im610KWRpdiUB9aUxuBxw0zlfegY2/clpMa7HeYP6L/gXMHp
        aTZAnCuNoTa5yZLnSSibss7vmMzQIqEu8Ywgns4=
X-Google-Smtp-Source: ABdhPJzwsQvQy07KzSSKF36slqOOCBmzhi7G4XFKh+MxO1aqVfgv6UylAsUlKqrZrwFEymqmWaysD4XtAMh8gSFAJlY=
X-Received: by 2002:a67:d583:: with SMTP id m3mr36353545vsj.41.1634108355035;
 Tue, 12 Oct 2021 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211013063622.548590-1-masahiroy@kernel.org> <20211013063622.548590-2-masahiroy@kernel.org>
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 08:59:03 +0200
Message-ID: <CAMuHMdUQVpvvq=ZqjL97gV6AxS5eGm4mRS=gL4PPwWiBS-v5AA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Chris Zankel <chris@zankel.net>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Greentime Hu <green.hu@gmail.com>, Guo Ren <guoren@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Jonas Bonn <jonas@southpole.se>,
        Jonathan Corbet <corbet@lwn.net>,
        Julien Thierry <jthierry@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Michal Simek <monstr@monstr.eu>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Hu <nickhu@andestech.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rich Felker <dalias@libc.org>,
        Richard Henderson <rth@twiddle.net>,
        Rob Herring <robh@kernel.org>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sami Tolvanen <samitolvanen@google.com>,
        Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Will Deacon <will@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Openrisc <openrisc@lists.librecores.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Oct 13, 2021 at 8:43 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> Documentation/kbuild/makefiles.rst suggests to use "archclean" for
> cleaning arch/$(SRCARCH)/boot/.
>
> Since commit d92cc4d51643 ("kbuild: require all architectures to have
> arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
> all architectures. This can take advantage of the parallel option (-j)
> for "make clean".
>
> I also cleaned up the comments. The "archdep" target does not exist.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

>  arch/m68k/Makefile                 |  4 +---

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
