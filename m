Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D267C25B0E
	for <linux-m68k@archiver.kernel.org>; Mon, 15 Aug 2022 15:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230506AbiHOPxy (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:53:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbiHOPxw (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 15 Aug 2022 11:53:52 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B5F18E33
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Aug 2022 08:53:50 -0700 (PDT)
Received: from mail-lf1-f44.google.com ([209.85.167.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MKbPg-1o4q2L0N80-00L0Wd for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Aug
 2022 17:53:49 +0200
Received: by mail-lf1-f44.google.com with SMTP id u1so11189296lfq.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Aug 2022 08:53:49 -0700 (PDT)
X-Gm-Message-State: ACgBeo1laS24fGs62G8qREfo+4JefjuWQ0r0yiKwCnTepgy6koL1/Gn/
        fEQlsG0fTS2vwZDmB42rYzaCHO4FY6W6j3iankY=
X-Google-Smtp-Source: AA6agR4kQH9OPkAoSzw4z/FBPTVCt5TcLJ18r0latd6JdISl5KaD+R3rrNlWHfqDqar+qTRK7WgfYWLgQGqiKgJkzhc=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr10863122ejc.766.1660578818066; Mon, 15
 Aug 2022 08:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 15 Aug 2022 17:53:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To:     Zi Yan <ziy@nvidia.com>
Cc:     linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Yang Shi <shy828301@gmail.com>,
        David Rientjes <rientjes@google.com>,
        James Houghton <jthoughton@google.com>,
        Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qin Jian <qinjian@cqplus1.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
        linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
        loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:sHptwrA9NuFsG2xu4hZc66zCkYVWalxvAeOmUd5ron0GueKddR+
 Kk2DOgzHyXHqDMcU25lqq/CFfcxCSd4QZxnmELmaHSKg8PCZMbQ+fOeWEjo9nFuNZpmS2r9
 9mi67q4NZvzdiS3ikOAI+rSHsDGXorhnguMaMOIvdzKKxFPjNplao1LRN2/OfgCTafdKqtG
 QNZTTEJGlEHdmYl07clMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:/OqOXpMrULU=:AE0Xch5EVrpuAjoyiyFChM
 tyr66ieg60fyVHtM6wz18xKvj+Bii0unE0OjkUV3rgOBZvZBU5qUNAOVTPkbPQClcRjY9AGTY
 6CrifqcUSBxSsUUpNw/gsCQASHZhr5kBiyekYnc6ciHc8IuMyqwHMmYVVs7fjOCVYlPKFTOki
 miHqBgq/qiZpLx9Yl+7wxMjSruIER8fn55FfTb9/3VrptvzeD3d2EWOHirv95FalNtSS3sm/R
 WodrVz5oWXJ6UFwIopgrDrQJA9ToH8aWvj4I/Zf5nw35vyzT9m6W7/SkJocPIgNzHRRS21E9u
 0eW2O529mZ9+YJO3s3sP7Lp+m5F0ASB+tlNwgXuBqZDC+SHyV/OU2liUUfn11kx+1nC0/r0F8
 NXG55BgHUl0APd5jNeF4CnyWswLoNYkvomZim446wLZYokwOe1Hf+K2143QrV3Bqv3kQVLNk6
 /Jy23lPoeiLEKoZlejj1dcZODzIAfGIbEJ+x6k9zpt2NEok1eSm9VcuorrJI/DbtQgdV8wkAj
 B37vEMpSx9HkhoYG0u44cdi7bqWyKJocJzOS5CN5re7/HN64Jl2NI/6jisc4/cnorU/wDI2/a
 X0Q0Kpv4WPjEnkhOLBgcUDS/9liS/eZZ3iIb9f7ngHQI5jOumzQvm51ws2b2pSSc7EAU2cNUf
 L8ZmTbN8EpN8QvGm4yxxAnyTkzy3x1REBBXHr0+JHRI2NtWc68r9rxtcZsDulG/KgnvodAoir
 rWhyTYIaJeS6w5uYIsCxL7iUdqaG5IpsnSVxHOtD/3OnQTV33gai8CXDsdzHBe9usmG7cB9CP
 bEwvyqgvoR1rXJJyB8pVXL2cttZs2MM2ccbSYAraEuZUIoeFGFC8PtTNcfgjx4i5Xs0NsWSaN
 b5GwCqw8u5nLSxWcq7Zw==
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Aug 15, 2022 at 4:39 PM Zi Yan <zi.yan@sent.com> wrote:
>
> ---
>  arch/arc/Kconfig                             | 2 +-
>  arch/arm/Kconfig                             | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
>  arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
>  arch/arm/configs/oxnas_v6_defconfig          | 2 +-
>  arch/arm/configs/pxa_defconfig               | 2 +-
>  arch/arm/configs/sama7_defconfig             | 2 +-
>  arch/arm/configs/sp7021_defconfig            | 2 +-
>  arch/arm64/Kconfig                           | 2 +-
>  arch/csky/Kconfig                            | 2 +-
>  arch/ia64/Kconfig                            | 2 +-
>  arch/ia64/include/asm/sparsemem.h            | 6 +++---
>  arch/loongarch/Kconfig                       | 2 +-
>  arch/m68k/Kconfig.cpu                        | 2 +-
>  arch/mips/Kconfig                            | 2 +-
>  arch/nios2/Kconfig                           | 2 +-
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
>  arch/sh/configs/ecovec24_defconfig           | 2 +-
>  arch/sh/mm/Kconfig                           | 2 +-
>  arch/sparc/Kconfig                           | 2 +-
>  arch/xtensa/Kconfig                          | 2 +-
>  include/linux/mmzone.h                       | 4 ++--

Acked-by: Arnd Bergmann <arnd@arndb.de>
