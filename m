Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E981C77B75
	for <linux-m68k@archiver.kernel.org>; Tue, 16 May 2023 07:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231222AbjEPHPw convert rfc822-to-8bit (ORCPT
        <rfc822;linux-m68k@archiver.kernel.org>);
        Tue, 16 May 2023 03:15:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231253AbjEPHPf (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Tue, 16 May 2023 03:15:35 -0400
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68B935AD
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 May 2023 00:15:23 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-76c73f7443dso513481839f.0
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 May 2023 00:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221323; x=1686813323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTQjfNfGsMfbyHJYnY/d7iucXXNLZgToVmLQABWZsBQ=;
        b=WwWOPiOy34KOTnBH4pqLJC1SCpOv6H+RYuz2kxbp2HL6Bf4lEyVZgMILm8NPnHNqc8
         6GP1xYfbJ1expoV2XIUn2LW/CoQnhKwJ4kklc1M4RK3penstyYvYRDifjfqgPkjfSZlM
         jbGbVTybyb88JtbzF+fxjnF3EZrt+cTA8pQV5qC8DNCLjCBPMAAZ7xiAgDBKi31DvdNY
         8X3Lr/mdxygkwes4Wrs/C3pJJWrtwKpWYEIDEsWsOzF0R6gKXlTOlOdu+F7CH8ujq7Zr
         mq+bjIlAB8i83RPqULhXPnlZp4rUt+vZfWg4ZP5rMUc9ZSGHCxygGMSi5zIIFyyXfpxa
         WPtQ==
X-Gm-Message-State: AC+VfDyfkxGkayqEj7/vYL3GCCYGGslXd8WcALvvSTO9cx65xLSUKcBr
        gADAztxLFzqapbjNDc7LnVek7lR8Z/JF9A==
X-Google-Smtp-Source: ACHHUZ4Uy2Jnl3zu/1KFDIHG8grxfwfv+dEbCFHJDweNHgMy85TOWgpcfYiWx7gxBV70yMqJ4Y9Cqg==
X-Received: by 2002:a05:6602:42c2:b0:76c:69a0:664e with SMTP id ce2-20020a05660242c200b0076c69a0664emr1491732iob.13.1684221322490;
        Tue, 16 May 2023 00:15:22 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id w18-20020a029692000000b0040fb0b1b317sm7458027jai.5.2023.05.16.00.15.21
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:15:22 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-76c636b6306so603027839f.3
        for <linux-m68k@lists.linux-m68k.org>; Tue, 16 May 2023 00:15:21 -0700 (PDT)
X-Received: by 2002:a25:1c6:0:b0:ba7:dcad:9b6 with SMTP id 189-20020a2501c6000000b00ba7dcad09b6mr4131622ybb.40.1684220883815;
 Tue, 16 May 2023 00:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230515090848.833045-1-bhe@redhat.com> <20230515090848.833045-2-bhe@redhat.com>
In-Reply-To: <20230515090848.833045-2-bhe@redhat.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 09:07:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU-bL-khVUN59ku1GwV6i4OC3O9AU1GQU2hfGn+JrsBXg@mail.gmail.com>
Message-ID: <CAMuHMdU-bL-khVUN59ku1GwV6i4OC3O9AU1GQU2hfGn+JrsBXg@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 01/17] asm-generic/iomap.h: remove
 ARCH_HAS_IOREMAP_xx macros
To:     Baoquan He <bhe@redhat.com>
Cc:     linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
        hch@infradead.org, agordeev@linux.ibm.com,
        wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
        David.Laight@aculab.com, shorne@gmail.com, willy@infradead.org,
        deller@gmx.de, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
        netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, May 15, 2023 at 11:14 AM Baoquan He <bhe@redhat.com> wrote:
> Let's use '#define ioremap_xx' and "#ifdef ioremap_xx" instead.
>
> For each architecture to remove defined ARCH_HAS_IOREMAP_xx macros in
> To remove defined ARCH_HAS_IOREMAP_xx macros in <asm/io.h> of each ARCH,
> the ARCH's own ioremap_wc|wt|np definition need be above
> "#include <asm-generic/iomap.h>. Otherwise the redefinition error would
> be seen during compiling. So the relevant adjustments are made to avoid
> compiling error:
>
>   loongarch:
>   - doesn't include <asm-generic/iomap.h>, defining ARCH_HAS_IOREMAP_WC
>     is redundant, so simply remove it.
>
>   m68k:
>   - selected GENERIC_IOMAP, <asm-generic/iomap.h> has been added in
>     <asm-generic/io.h>, and <asm/kmap.h> is included above
>     <asm-generic/iomap.h>, so simply remove ARCH_HAS_IOREMAP_WT defining.
>
>   mips:
>   - move "#include <asm-generic/iomap.h>" below ioremap_wc definition
>     in <asm/io.h>
>
>   powerpc:
>   - remove "#include <asm-generic/iomap.h>" in <asm/io.h> because it's
>     duplicated with the one in <asm-generic/io.h>, let's rely on the
>     latter.
>
>   x86:
>   - selected GENERIC_IOMAP, remove #include <asm-generic/iomap.h> in
>     the middle of <asm/io.h>. Let's rely on <asm-generic/io.h>.
>
> Signed-off-by: Baoquan He <bhe@redhat.com>

>  arch/m68k/include/asm/io_mm.h       | 2 --
>  arch/m68k/include/asm/kmap.h        | 2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
