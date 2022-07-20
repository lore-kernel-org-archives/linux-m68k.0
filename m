Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD5BC43334
	for <linux-m68k@archiver.kernel.org>; Wed, 20 Jul 2022 17:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240842AbiGTRko (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 20 Jul 2022 13:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240794AbiGTRkk (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 20 Jul 2022 13:40:40 -0400
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE4543E46
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jul 2022 10:40:39 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id k7so11268694qkj.2
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jul 2022 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmcZJKXW5L1h76Y7jDvbkfD3n85Nfb/cTZUz3jaZfpo=;
        b=bUea5rvgDON9mL8r75Y8AXquwn3VMoF+KrMkiNVtvk9ir8A0YPey/1+m1JzFUls6lQ
         miq+EM3VsTWu8UrBeG4gipVM2QVp5VFHCVqobPGwtti7SXKyKE3YGwCFQrq+ynjzRWv2
         IK26ZMsx3qc9VwJorsZt2Fcd9Wv6X1RyCECv02tYclebECGrJazAv/MfbIptyt6hYgo1
         u1m26RGLY1LlMtLhsuhj0lCzm4G+jjAesGxj2NkyHkYeiJCvhv4BAfHwqRHRh61y/vyl
         vNSWKB5/gcI51/EQYmuv7uewqecKFQJrX6j4aix+kaQmMdhil1pweRbVLtrJ83lmjFal
         5M7w==
X-Gm-Message-State: AJIora+6VxQdR82bzP49KJ7komhriRwE9fi7JB4LL18awqb+BOK9JcMg
        ERgWaq0lyLySYunWxMZbpKBw0dDj3g5Kf5cU
X-Google-Smtp-Source: AGRyM1s1Ot9Vl8mKqgvr7T9I6MS+CIzmE6VJmnh/UN9Hr+ZMyTn8l0bAAvh94M+GhkixiWXpIdwWhg==
X-Received: by 2002:a05:620a:4610:b0:6b5:eab2:8342 with SMTP id br16-20020a05620a461000b006b5eab28342mr10864340qkb.261.1658338838750;
        Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id v21-20020ac873d5000000b0031ee1f0c420sm9258928qtp.10.2022.07.20.10.40.38
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i14so33359698yba.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr36151263ybq.543.1658338827759; Wed, 20
 Jul 2022 10:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131934.373932-1-shorne@gmail.com> <20220720131934.373932-3-shorne@gmail.com>
In-Reply-To: <20220720131934.373932-3-shorne@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Jul 2022 19:40:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7_CSQd14tGPfL7R7V0h6AwNi7bVDCWhcdNoZV_md4bw@mail.gmail.com>
Message-ID: <CAMuHMdX7_CSQd14tGPfL7R7V0h6AwNi7bVDCWhcdNoZV_md4bw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] PCI: Move isa_dma_bridge_buggy out of dma.h
To:     Stafford Horne <shorne@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@infradead.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Ian Abbott <abbotti@mev.co.uk>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jul 20, 2022 at 3:20 PM Stafford Horne <shorne@gmail.com> wrote:
> During recent PCI cleanups we noticed that the isa_dma_bridge_buggy
> symbol supported by all architectures is actually only used for x86_32.
>
> This patch moves the symbol out of all architectures limiting usage to
> only x86_32.  This is possible because only x86_32 platforms or quirks
> existing in PCI devices supported on x86_32 ever set this.  A new global
> header linux/isa-dma.h is added to provide a common place to maintain
> the definition.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v3:
>  - New patch.

>  arch/m68k/include/asm/dma.h            |  6 ------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
