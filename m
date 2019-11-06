Return-Path: <SRS0=kyu6=Y6=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3F9C5DF63
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Nov 2019 18:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B923C20663
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Nov 2019 18:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732533AbfKFSQu (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Nov 2019 13:16:50 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:39445 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732522AbfKFSQu (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Nov 2019 13:16:50 -0500
Received: by mail-ot1-f66.google.com with SMTP id e17so13130142otk.6
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Nov 2019 10:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=15BA2o2ULwBaZdW2cSXzi/G8aVSlqB+lkO94w9/s3/8=;
        b=A041talc2+WAFCuZUznD0tEjK/yz+QSd4WtmfiHt+isxGxAEASERxrxlfr74r0DTIP
         h8/mipS1AGqQJbPor0hkUPCRD6A8ZQVWuGIK+DUV17K2quq0cXHfYe2g9k1vVuBB5iQ+
         NOSjsee9Npx3ms2oRm5C7oDxD/l7I9RSuT54gkgcwQ/0ZaKsJhAf5hECu/A7BSKJtddf
         MC1/HxoX652UZHx6UUuRjKgoXOYEoT2VY/kJ3NSfSW1ohuYFIsPnWiD2fPBDIXz9LQJU
         C39M0s1fIicj2g6VNf7qtJDlH0ZiEriU800vk/Bkb2hkB73XvG1rqVxjSxcscBOvrKeK
         AdAQ==
X-Gm-Message-State: APjAAAUVnc7JAxPUqPFXeOj2z1AGbdBruiNmLuBkfQA9JGPP0NqL3Ap7
        XMhezsHgQsMMDN2cm8upw/Rs2r5zBCpVEJ/qQSs=
X-Google-Smtp-Source: APXvYqyJzH2QJnGyQxa9UcvqsSRwLOqnLR39MniE098RrjM8S3f0LW/gsjuzU8BhMp3pbPwutON3uAZxVc/hg56lCG0=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr2894554ota.297.1573064209066;
 Wed, 06 Nov 2019 10:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20191029064834.23438-12-hch@lst.de> <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
In-Reply-To: <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Nov 2019 19:16:38 +0100
Message-ID: <CAMuHMdVuDp_8UDeWv8tdPAH5JS84=-yfwZjOk-YQcoYKM9za+w@mail.gmail.com>
Subject: Re: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guo Ren <guoren@kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        Vincent Chen <deanbo422@gmail.com>,
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Greentime Hu <green.hu@gmail.com>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Michal Simek <monstr@monstr.eu>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linux-mips@vger.kernel.org, alpha <linux-alpha@vger.kernel.org>,
        nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

Hi Palmer,

On Wed, Nov 6, 2019 at 7:11 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> It looks like the difference in prototype between the architectures is between
>
>     void __iomem *ioremap(resource_size_t, size_t)
>     void __iomem *ioremap(phys_addr_t, size_t)
>     void __iomem *ioremap(phys_addr_t, unsigned long)
>     void __iomem *ioremap(unsigned long, unsigned long)
>
> shouldn't they all just be that first one?  In other words, wouldn't it be
> better to always provide the generic ioremap prototype and unify the ports
> instead?

Agreed. But I'd go for the second one.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
