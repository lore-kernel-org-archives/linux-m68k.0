Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55780C6FD1D
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Mar 2023 12:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbjC3M7e (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 30 Mar 2023 08:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjC3M7e (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 30 Mar 2023 08:59:34 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B3C9020
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 05:59:33 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id y85so8216155iof.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680181172; x=1682773172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=db58zgLapT4+5eM+e2dEcRQMOxpl02qLJJqJynMawPw=;
        b=gvyLOSrV5NqLHUuxidIYczTpyccsUd898Kt8qAjGZCJm8EQYH5JcTmwLqg57uC0cvB
         j7U0x9dcm2RsX8dLxVGcboGq4Pdvm6cDFGIifVhW5LUG0BZhpnkLq+12fDfUITmPUgDN
         KJqbUWD1A1NNvcxlD8Va+DklQ7yRgA9v4iGNa+yDzNCF8hz/BAHOp1sivo3m/ett+i3j
         AtVwEXoZrtByosb2V89SvT6DgwFv0o1YJU+4lunFRTh6XWRbkQcRhcsLjusSr3Liunwq
         utzWcTAPvMsNoessMz8HZ9Y6dfPH5hnImowquLEBicF67L5RSN3ovwZ4QUhqVrtpFGVk
         CyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680181172; x=1682773172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=db58zgLapT4+5eM+e2dEcRQMOxpl02qLJJqJynMawPw=;
        b=RtEAQLvTZLtaOs2MIyU53rRQ+8cz6PUk//QpJ9lrGg3cOYb0DYHIbeRZNB9IjZbB6d
         mZpBfoGDI5ACoRRL6bqbCf3Qcrt8z6KeAVkkMZsL5XtrnAgvg+VDFnshTAjxfbKjMlMR
         za0uEwk9rA/XAxOrlens8uJwO9yF9EYr2UObgjw8XFs8xMAsaqP1ds9eElVhrnr6CKHZ
         R2QCJSwd5I3nctPKsBYODq0T1O9i91/B76pGt+F2oe6LzIre0ojlAvcio9zmtRdHDsLp
         k+Vf7+bPCKZYVbgyieFL2l8pN8tvuhd6sUmDldvLJKlK2mTqrdauM4T9Sx4sTHAinil6
         xstQ==
X-Gm-Message-State: AAQBX9cpACdgpyUlyyANTq7dxQnzCR+xDdqm+F1QF4anLmhXC+ShSG9f
        PXWUPeCsYs1kABNuIKd8IR636Di/RAjxeNTA5rU=
X-Google-Smtp-Source: AKy350Yt7w4HDnt8ZzJ1OA1g5OCPUWPp6heQMoQ57xTct+y1JPFpMNsPMtx4N97vitPklV5i5ccLJReO6yCW0ia7/Oo=
X-Received: by 2002:a02:95c3:0:b0:3eb:3166:9da4 with SMTP id
 b61-20020a0295c3000000b003eb31669da4mr2710421jai.2.1680181172425; Thu, 30 Mar
 2023 05:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-9-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Thu, 30 Mar 2023 13:59:06 +0100
Message-ID: <CA+V-a8v--RqxFJYTZ04vVgiA69VJsFWk=r=TvRvokhpAV-famg@mail.gmail.com>
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not flush
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
        Brian Cain <bcain@quicinc.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Stafford Horne <shorne@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S. Miller" <davem@davemloft.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
        linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, Mar 27, 2023 at 1:16=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>                 break;
>         case DMA_FROM_DEVICE:
>         case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>                 break;
>         default:
>                 break;
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
