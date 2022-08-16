Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB071C32771
	for <linux-m68k@archiver.kernel.org>; Tue, 16 Aug 2022 08:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233206AbiHPImp (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 Aug 2022 04:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233222AbiHPImM (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 Aug 2022 04:42:12 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7B022B09
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Aug 2022 23:46:47 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-10ec41637b3so10684611fac.4
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Aug 2022 23:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mQKxHhlVCpHcdp8dQEIScJFQsrh06tzn535mwalxKj0=;
        b=LynzNpvPgez8vjN8GRb1vDlqeyGWwksKxIi86SGZcxlz5nKh1FDMrqKcx4qwQcKtkt
         ze6EMPQV5jUNaGtvAsCq/nO6xWRpum1dOoQ6pg4Ik2sXAKlM8Qh9gveTWOu8JDsNfGRH
         EB7qZxLbWaqLkvdv88Q2ZR83XeKKR1lO8/8DSXZjfr3m1JmfkPOJAKzOaUESdF2nzZBp
         e/LAuvDkLLhWWGDO/ncFN+4buk9qpzzpwtTzxwZ3w/CL32l97AdYZ/Xq4SUXYBzPfnIO
         j3MqyjDHFiGVEV3omoUceTItpsmCT1xEVFPKCqlqwRvDFCLGjNCg6au6y9d5l8XDvGyX
         EOfQ==
X-Gm-Message-State: ACgBeo2/81+WYoPgfo1zaI2Uy9331gL5jAJQhR3lO9vlquiR63Rhl0fz
        HWMWLtgWIIQbvUrQxqB8Ondm5D/bDLC0rg==
X-Google-Smtp-Source: AA6agR5uTnMCaYoDtWfKrLiMjH86+E7sQPkiK8iqNlHPVNMHc81GGPYHcq9M8xCP0pyNmGb1HltItw==
X-Received: by 2002:a05:6871:9b:b0:10b:c5d0:4377 with SMTP id u27-20020a056871009b00b0010bc5d04377mr12582109oaa.197.1660632406389;
        Mon, 15 Aug 2022 23:46:46 -0700 (PDT)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id l35-20020a0568302b2300b00638ac7ddb77sm985080otv.10.2022.08.15.23.46.41
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 23:46:44 -0700 (PDT)
Received: by mail-ot1-f54.google.com with SMTP id q6-20020a05683033c600b0061d2f64df5dso6863425ott.13
        for <linux-m68k@lists.linux-m68k.org>; Mon, 15 Aug 2022 23:46:41 -0700 (PDT)
X-Received: by 2002:a05:6902:100a:b0:676:ed53:25b0 with SMTP id
 w10-20020a056902100a00b00676ed5325b0mr13356288ybt.365.1660632391068; Mon, 15
 Aug 2022 23:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 Aug 2022 08:46:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Message-ID: <CAMuHMdWohdUZxi3A=H1wqY4rYrLD-ME6mmhWb6Z-udovd=1BhQ@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To:     Zi Yan <ziy@nvidia.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        David Hildenbrand <david@redhat.com>,
        Matthew Wilcox <willy@infradead.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Yang Shi <shy828301@gmail.com>,
        David Rientjes <rientjes@google.com>,
        James Houghton <jthoughton@google.com>,
        Mike Rapoport <rppt@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Qin Jian <qinjian@cqplus1.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Guo Ren <guoren@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>,
        Ley Foon Tan <ley.foon.tan@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        arcml <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-oxnas@groups.io, linux-csky@vger.kernel.org,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        loongarch@lists.linux.dev,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Aug 15, 2022 at 4:40 PM Zi Yan <zi.yan@sent.com> wrote:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>

>  arch/m68k/Kconfig.cpu                        | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
