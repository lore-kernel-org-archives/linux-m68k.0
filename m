Return-Path: <SRS0=YN9G=ZD=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016AAC43331
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:10:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFB4621783
	for <linux-m68k@archiver.kernel.org>; Mon, 11 Nov 2019 10:10:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfKKKK1 (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Mon, 11 Nov 2019 05:10:27 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:40007 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfKKKK1 (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Mon, 11 Nov 2019 05:10:27 -0500
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MStGi-1iKnoV0pm2-00UNoC for <linux-m68k@lists.linux-m68k.org>; Mon, 11
 Nov 2019 11:10:25 +0100
Received: by mail-qt1-f176.google.com with SMTP id i17so3516717qtq.1
        for <linux-m68k@lists.linux-m68k.org>; Mon, 11 Nov 2019 02:10:25 -0800 (PST)
X-Gm-Message-State: APjAAAWSZQdacJ2pWsLN9HgXtaD0wxlL7EghedwQFCyod12q13oB1P7v
        MiZOYCWOyflxHxDmheUDsmMt3dWBB4BAJMqFBoo=
X-Google-Smtp-Source: APXvYqyqP0GEnKlLDcc3YXGxYPpIsc43oy+/l9orRIfJHYpq8HDGEADC0l7WhZk0kMzg516CeAScWIBjk4MnQDDCwV4=
X-Received: by 2002:ac8:1908:: with SMTP id t8mr24584774qtj.18.1573467024165;
 Mon, 11 Nov 2019 02:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-1-hch@lst.de> <20191029064834.23438-13-hch@lst.de>
In-Reply-To: <20191029064834.23438-13-hch@lst.de>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Nov 2019 11:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28UDPEP7Bqu_wEXsfwSpT-5i30STB2iX3RfxdvbfzrNQ@mail.gmail.com>
Message-ID: <CAK8P3a28UDPEP7Bqu_wEXsfwSpT-5i30STB2iX3RfxdvbfzrNQ@mail.gmail.com>
Subject: Re: [PATCH 12/21] arch: rely on asm-generic/io.h for default
 ioremap_* definitions
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
X-Provags-ID: V03:K1:n4+C2BRKfXIw1XMDfLdssrrsDQD8lvR48TFYBzYaTqt92FryTQX
 vC5fmiCBuQdPw/OXd5vmlYJhaSdO3sDvkoxCRMSJpcJAOqSkhhnlWS/SP+2M8BlhpReua+V
 msj5gHRt7txKq9nP5g5RpZuShQD1HPdzMX6v3XzpBcmtx/fcdPhp57Nht3lym6iuSDaPOP9
 H+F4vH9roAmtrVwomGrag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cpzNCuauKyU=:GYwml7QUrDwVK+Aq8ck7Gy
 egUwRI2VQ5TZeqjllhUwFlrPb6FvMvvw2MYx/LxcOyuSofbyKM4E792zRYJU5wa2vn0CtOom0
 Bu31vkbX76SLeC8BP0n7+nz6AM6pgzxATwf/PAefz7lBg+GYQeIlFBfzJckAayL0FUe6dX8Mf
 JUigXobCg2fSpg+AGToOBDuWFmI90sow4gm/eJ3OJZZGWYdHE55Rk638saYpr9uxqr+ge4cT/
 L9GYmkuRHdB9YV46iekMFgJqsKY1lumUqwS5O5WtadKMV4rWIyueSNAjg+n+A55uXjg1VyrfS
 oxjsR5AsVYuVYk4zLTp+Sga0ZO5AkpGF2w1iGSgUJL1SA3vmWZn4bo8PU1OOxKdpukCAzBVBD
 SJwgkuGisSv0HIeC6iY9iGQZeCr1/taF6EMP4Yi1c3DP2vqHyPqAQ0jVm3Uk4abb1owlW3pLo
 9l6KJt3yQNKw67/v5oBmRAH0ZzjF4ZScZ7MH3zmNjGYYaKB2KHH2xLZnYVdEmWjeTl6iD+LuZ
 4SihsC2hmAggUjoFhGHP9w9ms/ol5APrOAdCkuF+uUK8MfBOfmHGMv9dnRpezkBR53jvEgTc4
 ZAE06q00yK7fkwkfU9P901lRN+MiTuel8/AmRn09hk4KmoKzzKZeyODd0gktE83DjdPfHz71G
 D/v8yJV/dMiLBjE1ovHpNqWYeDolDsHemurSp0rCm5EQENL8atNg2klmsnuy3itRbLwuavXAX
 XZwLiL8+pV5jJHZilE4PAfFX70chzZgPQGVUqT/SWNDxuvAbD9QVToUNbJaWazZZtW0n+FytP
 wtFa8ODiuKgC46iYks0yKd9vqtsSFxQtbnCfVo4R9Rhs3wgLUIK5ixeoWSsLd802cfhhyqc3N
 BFGQvLCrFVCK6eUNLtWg==
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Tue, Oct 29, 2019 at 7:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Various architectures that use asm-generic/io.h still defined their
> own default versions of ioremap_nocache, ioremap_wt and ioremap_wc
> that point back to plain ioremap directly or indirectly.  Remove these
> definitions and rely on asm-generic/io.h instead.  For this to work
> the backup ioremap_* defintions needs to be changed to purely cpp
> macros instea of inlines to cover for architectures like openrisc
> that only define ioremap after including <asm-generic/io.h>.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
