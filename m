Return-Path: <linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1777ECCA480
	for <linux-m68k@archiver.kernel.org>; Wed,  6 Jul 2022 10:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbiGFKEj (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Wed, 6 Jul 2022 06:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiGFKEi (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Wed, 6 Jul 2022 06:04:38 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA2524F00
        for <linux-m68k@lists.linux-m68k.org>; Wed,  6 Jul 2022 03:04:37 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id k20so10664069qkj.1
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bj57DZQxAwyQ5rJJj/iE7VR9xSo/KE2P6unWd/aXevs=;
        b=3okCKjJqfS4BgkuB8/Yxl2QgsHlS1ay36OE6SgaiRZsTK+pIdZKV2GTSFLXHhRkPNO
         rpm++JdDA9m0YybPz2Ul1su77oXzKtpW7pDKHW/XLntl2ozOrSuW3PTfblNtaZC013Sk
         FDwTrpxZAfBphHudhmrMJIWPiZQthyubx2GJ3r7HrcKxQA5m6SXa6nJpk/gKWiEktKFx
         kukDdNbv8Zs6fSDsqmf7DnudaW/zNfOwrVwJzWXQoTO1JGuDbY2hqZjK9hT+GrblYTM3
         uRw/Eobr7YRtjS7/rDa1kpFb4XmYjeQkvr4iR3wDe3UaQE6lXrzADceODgYJoN0QH69X
         rF7w==
X-Gm-Message-State: AJIora/8qm+i33WBmT7/eHMeyjYWj03zXXMZoHzZMVDHo5xBZrmsVBTu
        pfd3pi7BNLH9PFTcvsbdierPWRCUxUKdWo/L
X-Google-Smtp-Source: AGRyM1vauLoKB8YaJELvDmX8UTvnWlhhBnWqV5w7Et0ag70q64vSQASMdCe1dWtyx4kIlnfzNpi+qQ==
X-Received: by 2002:a37:b03:0:b0:6b4:811d:7bcb with SMTP id 3-20020a370b03000000b006b4811d7bcbmr6049690qkl.572.1657101875882;
        Wed, 06 Jul 2022 03:04:35 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id h9-20020ac85149000000b003050bd1f7c9sm24543087qtn.76.2022.07.06.03.04.35
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 03:04:35 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 76so10871671ybd.0
        for <linux-m68k@lists.linux-m68k.org>; Wed, 06 Jul 2022 03:04:35 -0700 (PDT)
X-Received: by 2002:a25:2b48:0:b0:668:3b7d:326c with SMTP id
 r69-20020a252b48000000b006683b7d326cmr41431788ybr.380.1657101874906; Wed, 06
 Jul 2022 03:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220630051630.1718927-1-anshuman.khandual@arm.com> <20220630051630.1718927-27-anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-27-anshuman.khandual@arm.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Jul 2022 12:04:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVJiS6vm2td-PBH3zpsNZJeeoudS4+yu4JG08sOi+XFdA@mail.gmail.com>
Message-ID: <CAMuHMdVJiS6vm2td-PBH3zpsNZJeeoudS4+yu4JG08sOi+XFdA@mail.gmail.com>
Subject: Re: [PATCH V6 26/26] mm/mmap: Drop ARCH_HAS_VM_GET_PAGE_PROT
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-csky@vger.kernel.org,
        sparclinux <sparclinux@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Christoph Hellwig <hch@lst.de>,
        linux-s390 <linux-s390@vger.kernel.org>,
        "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Christoph Hellwig <hch@infradead.org>,
        arcml <linux-snps-arc@lists.infradead.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>,
        linux-um <linux-um@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Openrisc <openrisc@lists.librecores.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        alpha <linux-alpha@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Thu, Jun 30, 2022 at 7:20 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
> Now all the platforms enable ARCH_HAS_GET_PAGE_PROT. They define and export
> own vm_get_page_prot() whether custom or standard DECLARE_VM_GET_PAGE_PROT.
> Hence there is no need for default generic fallback for vm_get_page_prot().
> Just drop this fallback and also ARCH_HAS_GET_PAGE_PROT mechanism.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

>  arch/m68k/Kconfig       |  1 -

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
