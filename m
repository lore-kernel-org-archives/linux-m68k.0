Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD2DC54E94
	for <linux-m68k@archiver.kernel.org>; Thu, 26 Jan 2023 08:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjAZI1l (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 26 Jan 2023 03:27:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjAZI1j (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 26 Jan 2023 03:27:39 -0500
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E978646162
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jan 2023 00:27:38 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id v19so709637qtq.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jan 2023 00:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iTLUhLqiktW0lQYPPHgLpL0hyET/yRv7DDBqjk/47Fc=;
        b=gx7Xy/9WjTA9BAxeWilYl1PnJtqtTvstBWu/vdC/b1Hpw6qTfLjwPxj05WJagRIY8+
         gyWPCUElws+44acXX8FSt4Glm8Odwv5kBaeMp7jqcGsvXyaOissjwnfCAH67g426BVUd
         S0rqePKHvG4uSF5k26tsRzJ+jdT5rtiKfVlynhPKCdTQgohsw7T1OhCQF5pZMaAQk4lg
         lFVxOQitR8LfKRvCYDcsMukKCWLp2HhalgTdHNiRTY8/YnkbjyxggKPkyEe54mi2XuYb
         s5PR+K5qiklzm+vwIg+MzD3P1M+Ae3cfsKzd3xIlOWG9CKcJAkC1a7yjkw3WXewP6af8
         BtRw==
X-Gm-Message-State: AFqh2koa+q+PrmmqkiBWTZDFd6SDfyOa4zazSu24DxkAgbj0+TQvtq2J
        ViWs05x003Lr2R5cpG9EVJnNJF3a+2J4jw==
X-Google-Smtp-Source: AMrXdXsv57gk2qY2KD4qtoh3mX9igbOd30K1XK/L/mp79vba7i4ktdQ54ZZSVEyzRH6o0yKhiJTtUQ==
X-Received: by 2002:a05:622a:1b28:b0:3a9:763b:4a61 with SMTP id bb40-20020a05622a1b2800b003a9763b4a61mr51115011qtb.28.1674721657697;
        Thu, 26 Jan 2023 00:27:37 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id c12-20020ac84e0c000000b003b697038179sm369677qtw.35.2023.01.26.00.27.37
        for <linux-m68k@lists.linux-m68k.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 00:27:37 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-4c24993965eso13363707b3.12
        for <linux-m68k@lists.linux-m68k.org>; Thu, 26 Jan 2023 00:27:37 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr2761883ybo.543.1674721245117; Thu, 26
 Jan 2023 00:20:45 -0800 (PST)
MIME-Version: 1.0
References: <20230125190757.22555-1-rppt@kernel.org> <20230125190757.22555-2-rppt@kernel.org>
In-Reply-To: <20230125190757.22555-2-rppt@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Jan 2023 09:20:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUeuPgkWVjpZ=OM4ofnoYyv2nY1_FGo0JUZCFXYX=K2vw@mail.gmail.com>
Message-ID: <CAMuHMdUeuPgkWVjpZ=OM4ofnoYyv2nY1_FGo0JUZCFXYX=K2vw@mail.gmail.com>
Subject: Re: [PATCH 1/3] m68k: use asm-generic/memory_model.h for both MMU and !MMU
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Matt Turner <mattst88@gmail.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        Richard Weinberger <richard@nod.at>,
        Stafford Horne <shorne@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vineet Gupta <vgupta@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
        linux--csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
        openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
        x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Wed, Jan 25, 2023 at 8:08 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
>
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
