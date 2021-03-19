Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE9EC4332B
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 14:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69B4964F18
	for <linux-m68k@archiver.kernel.org>; Fri, 19 Mar 2021 14:55:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhCSOzQ (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Fri, 19 Mar 2021 10:55:16 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:36558 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhCSOyl (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Fri, 19 Mar 2021 10:54:41 -0400
Received: by mail-ua1-f52.google.com with SMTP id c2so3127973uaj.3
        for <linux-m68k@lists.linux-m68k.org>; Fri, 19 Mar 2021 07:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t7iwM5Al+GjmpcCXrO+/PoTF1eT3fOyyCJF+hEmDRuY=;
        b=TohH3CSUpVenMcW+u3rMEkzsV/kE6qdtCs1v7QIpUx0TDqTrkk9DRxI8Kpl+8kzRh5
         SCcGJWfX2CpAK5CmqEMjs3/0niq5uc3J24V+PiMOxQoWcQsyTFrnKOhQsEV4GCMp9YKe
         PpZvG6i+CRTZhqaMqW5WRrB894YO41o/l5dnSeMwxCNWNsVMd/IXlTJ7ZB64DOrgbsv6
         G1Xu648twLOKExAObtElOEs8F7TafWjfF/cTpjQ6TuRiAgYEclyeRYRyxt56MW9Jm/Zn
         /51mRonsJ71asMl5/X/udup2CPSQo3q/WhJ1ptFnBCV2ShBLdB0RLz1PwnoYo3Agl5lh
         od/w==
X-Gm-Message-State: AOAM533PBFNvAYrH7Yup/yLKZPEE2mQEsrF4u68+PXjPWZojCxz5fjV0
        irqfJdsyb7ajqsoQMkbeMa0HEqPhEr2qe7NqB3o=
X-Google-Smtp-Source: ABdhPJws2Ktj9BbIiCJ2GEgAVHw5Jy7feW23SDXRGODsXxsWn+4cet7pHOPZfquztis6cg4P7dw2c+QmSRw/42z1U4s=
X-Received: by 2002:a9f:35a1:: with SMTP id t30mr5801449uad.106.1616165680697;
 Fri, 19 Mar 2021 07:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210319143452.25948-1-david@redhat.com> <20210319143452.25948-3-david@redhat.com>
In-Reply-To: <20210319143452.25948-3-david@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 Mar 2021 15:54:29 +0100
Message-ID: <CAMuHMdVP433iVhyaweDd8G6p3ZCgSDq6M_ACko_BTgm+5m0qnA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] mm: remove xlate_dev_kmem_ptr()
To:     David Hildenbrand <david@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Brian Cain <bcain@codeaurora.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Greentime Hu <green.hu@gmail.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Ingo Molnar <mingo@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Arch <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Fri, Mar 19, 2021 at 3:36 PM David Hildenbrand <david@redhat.com> wrote:
> Since /dev/kmem has been removed, let's remove the xlate_dev_kmem_ptr()
> leftovers.

> Signed-off-by: David Hildenbrand <david@redhat.com>

>  arch/m68k/include/asm/io_mm.h   |  5 -----

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
