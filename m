Return-Path: <linux-m68k-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B590C6FD1D
	for <linux-m68k@archiver.kernel.org>; Thu, 30 Mar 2023 11:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjC3LxK (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Thu, 30 Mar 2023 07:53:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbjC3LxG (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Thu, 30 Mar 2023 07:53:06 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF03B447
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 04:52:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0AFDDB8287C
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 11:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 962BEC433A1
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 11:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680177147;
        bh=Lg8Woq7ScP2NFdPayLKkYeMtRMZwMJRAR9+KtXakJhE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MpfjvNz3QVNu+fY1rMmWZnxdA+hNa8jPOs57jjlAv+SbX6ELS7K81oGiVcqhRDjg+
         eoBMkaBtle7odj6vdzhQadnDpKZgZ+Yn1tY1qLnfFhhyIhVXwZhcOGt8ZJYYUyHtOF
         OxpJG1M7N+qBiqHBKE3WNoTlZm50smzwFbXAxe1gIoOMFrl6VFP48vMRbNGTwqoaVO
         5jBSzrN/ss+0Rb18/EOm4KhLPCW5PD/38A5D0oyLDRXlDYfCY5FW5uMBIo564e9NDz
         kU2dVxcG9LdL4/Y2D/xqBi2HPaK0rAiqFTRkuz8bnLAT5XIx/km8y9fN8xybvX+vOt
         3oOylnX04Wbjw==
Received: by mail-ed1-f42.google.com with SMTP id eg48so75252515edb.13
        for <linux-m68k@lists.linux-m68k.org>; Thu, 30 Mar 2023 04:52:27 -0700 (PDT)
X-Gm-Message-State: AAQBX9dGUe9VPDUTSlaeu1xU4tsGkqtlqXxebehljcRbnD1J0OzAuOm/
        xkfRp4HBHv6zN2F4flrartWEOcYPJjpmkIQEifg=
X-Google-Smtp-Source: AKy350aaxBOgSqlP959KpS9cfZAsDCsvbSuFf+7QcLc+VlamdgSrDzoUdXNjAn81KSsW2remp6yjeVooIQhT3qtniP0=
X-Received: by 2002:a19:f007:0:b0:4db:b4:c8d7 with SMTP id p7-20020a19f007000000b004db00b4c8d7mr1755725lfc.2.1680177124990;
 Thu, 30 Mar 2023 04:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-19-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-19-arnd@kernel.org>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 30 Mar 2023 13:51:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGNjrmTr1R+-09UYtHSgvT6fSgZxvpbEOfeTFxhWtgGcQ@mail.gmail.com>
Message-ID: <CAMj1kXGNjrmTr1R+-09UYtHSgvT6fSgZxvpbEOfeTFxhWtgGcQ@mail.gmail.com>
Subject: Re: [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
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
        linux-xtensa@linux-xtensa.org, Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Mon, 27 Mar 2023 at 14:18, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The cache management operations for noncoherent DMA on ARMv6 work
> in two different ways:
>
>  * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>    DMA buffers lead to data corruption when the prefetched data is written
>    back on top of data from the device.
>
>  * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>    is not seen by the other core(s), leading to inconsistent contents
>    accross the system.
>
> As a consequence, neither configuration is actually safe to use in a
> general-purpose kernel that is used on both MPCore systems and ARM1176
> with prefetching enabled.
>
> We could add further workarounds to make the behavior more dynamic based
> on the system, but realistically, there are close to zero remaining
> users on any ARM11MPCore anyway, and nobody seems too interested in it,
> compared to the more popular ARM1176 used in BMC2835 and AST2500.
>
> The Oxnas platform has some minimal support in OpenWRT, but most of the
> drivers and dts files never made it into the mainline kernel, while the
> Arm Versatile/Realview platform mainly serves as a reference system but
> is not necessary to be kept working once all other ARM11MPCore are gone.
>
> Take the easy way out here and drop support for multiprocessing on
> ARMv6, along with the CONFIG_DMA_CACHE_RWFO option and the cache
> management implementation for it. This also helps with other ARMv6
> issues, but for the moment leaves the ability to build a kernel that
> can run on both ARMv7 SMP and single-processor ARMv6, which we probably
> want to stop supporting as well, but not as part of this series.
>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Daniel Golle <daniel@makrotopia.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-oxnas@groups.io
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Ard Biesheuvel <ardb@kernel.org>
