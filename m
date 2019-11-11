Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04ADC43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA038214E0
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726804AbfKKKJY (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:09:24 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:44745 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfKKKJY (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:09:24 -0500
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M8xwu-1ia8m439Ko-0064Sy for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:09:22 +0100
Received: by mail-qt1-f170.google.com with SMTP id n4so10462933qte.2
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:09:22 -0800 (PST)
X-Gm-Message-State: APjAAAXgfSwSPIBRfCf3qDLlF9vmQeUYRB/1SSyT1515ZRikXWszC6mx
        1jLrrBe2Y4hecjVbFzOvw2DShL50hg14fDNCrEg=
X-Google-Smtp-Source: APXvYqwUFI9CNnIwrAVKasmsTd09tLHKshCq1NYJLSrtULcDmOA+h22x7/m2tzlDDqS3Yhkmt+6zqdhU/D75oBqf0Ro=
X-Received: by 2002:aed:3e41:: with SMTP id m1mr16150881qtf.142.1573466961656;
 Mon, 11 Nov 2019 02:09:21 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-11-hch@lst.de>
In-Reply-To: <20191029064834.23438-11-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:09:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
Message-ID: <CAK8P3a2o4R+E2hTrHrmNy7K1ki3_98aWE5a-fjkQ_NWW=xd_gQ@mail.gmail.com>
Subject: Re: [PATCH 10/21] asm-generic: ioremap_uc should behave the same with
 and without MMU
To:     Christoph Hellwig <hch@lst.de>
Cc:     Guo Ren <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        "moderated list:NIOS2 ARCHITECTURE" 
        <nios2-dev@lists.rocketboards.org>, openrisc@lists.librecores.org,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org,
        linux-mtd <linux-mtd@lists.infradead.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:AtvPekmsKLd/QQDHhkQCRgR5zxx6SnWdsFef7PC/fqHDZFg3hYD
 3Igy3OZ88AlXAumsMeMcC+2iT7Ae2a9ZtqXYPc0eWnWSuzUJzcYN+bSLZdsgJLx68JFqHit
 7F86haepKrHb/02UrYgWY861vb0y6qCdKf9w+vgHtiKQgEUH+jdm3jarvVjywarHqccL241
 eZPI70jLLn3Bi+AAxagxQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:P17D9ce5xeA=:IGbpGmZOBybO9XnE8xP23z
 /u/MQoASxBBhcu9l6mNCFu4NJ17brinuEbp4HIaiK6FIJCoJp+xk5x6oX3147K1Mc5SkFLFPk
 qXGR26KcoKgAtYe053AmKd3XSIztOSh0YzS3C2ZI0dg4lweu0Gm6gOKwuxhgcTi/BRFTDbaCv
 18uvJlEjceVmcsiUyyP8Qc5YfH88aIZnEmZRNBWGOym24ezdoaUVac9nPjAdbBgZO/Wgm33JI
 cyrO6ZujpGjGFpN4OOSJyivxeeNbm2K5GuLGRFI72M79aoKk3BCm3yRFGv397My2/2n2hNNbD
 Rptv31C+QJUyREtCghIOpji9QotkXS0hXoFkxSvRT8qwp0ORfadDfee8NUnKd1CG60pTmsGpI
 sD/G3Oynwv/bg0czzW9QHwNEL/QCmmthH4U4p04VKw4C9NyLA0AaqZMpWwrjYw8gY24L/B8wM
 ZOVNz9LavbvonXsH/shlz5RKm7HUnlxHXCclehfKEG0P1qqMYZ3t169ZUtstQ943fDKJOZP6/
 C8bQOCgrfzjd9gtPMkFBASt08iiQv59AaoABIJKNml3ERnPGsNJb6+pPluu4Tu9a3xT+dlU+O
 Q6KDnyWpuzaPkCXAUfuFrzVhYel+xpS+nVdAfpB3YVuf55CmU97iPg+Sr0EKUcmwTqPBxqbdt
 8cUI9f1YCWXc1Y8lNFOsNxRVUjp2SVkdGsYfJ9g1jxrnFfoIAC1bMAEIJfDi4tUo//GegUW/5
 TUqxivmDQmEyrG8LkNxH9EuXibR5X+En9Hv8ZwAAhrwXM+JbryftedbP8/IrAlTTXUNxzM7UJ
 Q15tmYeMxI1rXUdepnTS2OH1ESBlQf1LwZR1fDLz1OPFpAnRhxCit4F34WcYkiFi7mh8GinnV
 IelQrvHeuFbhZUJ9S8jA==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 29, 2019 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Whatever reason there is for the existence of ioremap_uc, and the fact
> that it returns NULL by default on architectures with an MMU applies
> equally to nommu architectures, so don't provide different defaults.

Makes sense.

> In practice the difference is meaningless as the only portable driver
> that uses ioremap_uc is atyfb which probably doesn't show up on nommu
> devices.



> +/*
> + * ioremap_uc is special in that we do require an explicit architecture
> + * implementation.  In general you do now want to use this function in a
> + * driver and use plain ioremap, which is uncached by default.  Similarly
> + * architectures should not implement it unless they have a very good
> + * reason.
> + */
> +#ifndef ioremap_uc
> +#define ioremap_uc ioremap_uc
> +static inline void __iomem *ioremap_uc(phys_addr_t offset, size_t size)
> +{
> +       return NULL;
> +}
> +#endif

Maybe we could move the definition into the atyfb driver itself?

As I understand it, the difference between ioremap()/ioremap_nocache()
and ioremap_uc() only exists on pre-PAT x86-32 systems (i.e. 486, P5,
Ppro, PII, K6, VIA C3), while on more modern systems (all non-x86,
PentiumIII, Athlon, VIA C7)  those three are meant to be synonyms
anyway.

      Arnd
