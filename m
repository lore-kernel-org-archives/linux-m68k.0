Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 521A0C43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:30:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FCD0214DB
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:30:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbfKKK37 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:29:59 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:49091 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfKKK37 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:29:59 -0500
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mc02T-1huE2b0PD5-00dXXM for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:29:58 +0100
Received: by mail-qv1-f43.google.com with SMTP id g12so4630605qvy.12
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:29:57 -0800 (PST)
X-Gm-Message-State: APjAAAUeg67W2eMnBzhcaXOgqZ9QM+mZbEA50IsyVe3BZChKE/ABR0JM
        7C1a0dr/zIta3lYUTEL16lTVrCVlR1DLUH20Iuk=
X-Google-Smtp-Source: APXvYqx3dRDA2rmaPEW4UpY0UEoKLtstJlcCKLowXnTab550quUX1o9OqysLm43EJTh/MA4389FmX1Acn21s2dCCBDI=
X-Received: by 2002:a0c:d0e1:: with SMTP id b30mr23068710qvh.197.1573468197026;
 Mon, 11 Nov 2019 02:29:57 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-12-hch@lst.de>
In-Reply-To: <20191029064834.23438-12-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:29:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a36-afn--XqG0ddj6VSPCzA_cfZqRxQXDuan7yk8CKg4w@mail.gmail.com>
Message-ID: <CAK8P3a36-afn--XqG0ddj6VSPCzA_cfZqRxQXDuan7yk8CKg4w@mail.gmail.com>
Subject: Re: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
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
X-Provags-ID: V03:K1:HnObCd4/1HLLMkyVag3fhA8SNWcTRj7aDlcjV0Vl1HwBnR3MUQw
 4H1P6JS/IftTH3Wb6AaiiiQJtzN/ayr0T1gUCDPUkzg2lCkj4NJVywtEW7hJd0MLypBnBf0
 Bn/IdFj14GIO/q5slT/dFkCjZ70ALLiV5wnogTiu7wEqwakswbRqBK+B851z0zUyDJt6iAD
 QpA1Iuc6/bRoMUq9uiyLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:enKy+N2bZpw=:oL3a0xhccTbRCeHZ+OMYQW
 ZoLryPeo/VR1hoO6ZPy/00i9Jqp+21I5CX1Y6rHOinMalJf9PzaNfwF7AlrLOucS8b0pGX9CU
 v2OTXFcRDeOZ/O77XZZeINQIZQ8Jw0/rMugPl31JwRVrjSKxSyEQBAe+2hkCPDz4GyNIl4CIU
 S2I7Hqm3B9KwckTMFxWzNTjQFk0O6rGkhA7Sg0BkMN+wrJ+zuF7bAVqYe/4WUNb9lzZpUv9+u
 8Xwm3PXDzYK6kDz4RRUGORKA/IAj/eYnZdxopoqM0Q27pp1V5LZeRiWOsfMRovz5on3oou41X
 q7nyM6ubQcJTmJJM1iHWsazXlJfUpaxTlHlNIOKUQyyQZw//Yhmiw683Eki/qF3s5TS1dabXw
 NEWxWnYXIjoohV5oaZv3rIZFMBt517tezmBxclmos2w5E8RjXpklhACTLgQcIsKXTKGNCb9Zb
 adddD3OaQWZlZEupp7D9MKrr1e+eWtdm2efqAwazh9oDH0t2Bg/3kK/vl/WN15y0p798gGaJL
 YRx49EGhthUzVbw1EG12MMYMNP1drU/8r7PpjEv3W7C2qHr9NbUcAqG21hNd07wrDosmReQek
 PFqlPz/f06Tg1zLDohicTl9YeKuTjfaorNuC4TOW8bSOE7jfXt7fZvBsJjlGxA0j88GDnIxA5
 GV+9qGZKVjqOl1Rcml72qtpFtNEOYiwZ4G4hZtrRprrhzdxogm19eNODrNhPm45F+LO/Wvh/P
 9lD1YqUc2h6Z+lzcuoozmUeS5ZDGWtku2dpNV3uAhJKdrVr9FfcNUcXHXOlX/Upgc/mF96xfv
 o/ADlcSZ4ocbbp1uRIBFOCwCa7by2CvigLbPWrhqukAfVDV5Atso7U/e/PDW3dYJ4U30/pjYF
 YYZY66pGEcvrot3+hHzQ==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 29, 2019 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> All MMU-enabled ports have a non-trivial ioremap and should thus provide
> the prototype for their implementation instead of providing a generic
> one unless a different symbol is not defined.  Note that this only
> affects sparc32 nds32 as all others do provide their own version.
>
> Also update the kerneldoc comments in asm-generic/io.h to explain the
> situation around the default ioremap* implementations correctly.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
