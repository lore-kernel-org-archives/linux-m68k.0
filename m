Return-Path: <SRS0=eDfy=5V=vger.kernel.org=linux-m68k-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE81C2D0F4
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Apr 2020 12:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8881120719
	for <linux-m68k@archiver.kernel.org>; Sun,  5 Apr 2020 12:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgDEMpk (ORCPT <rfc822;linux-m68k@archiver.kernel.org>);
        Sun, 5 Apr 2020 08:45:40 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:50307 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726609AbgDEMpj (ORCPT
        <rfc822;linux-m68k@lists.linux-m68k.org>);
        Sun, 5 Apr 2020 08:45:39 -0400
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MStT6-1jktlX3DYM-00UMC7 for <linux-m68k@lists.linux-m68k.org>; Sun, 05
 Apr 2020 14:45:37 +0200
Received: by mail-qk1-f180.google.com with SMTP id l25so5186427qkk.3
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Apr 2020 05:45:37 -0700 (PDT)
X-Gm-Message-State: AGi0PuaaqMG3+liC/HSu6JRtTVCC6AeH2kHPAdQEXumKC/tM2zsgv4bu
        DpvHpdks8rW/dqti1PefP/P9Imdle+by2UBiES0=
X-Google-Smtp-Source: APiQypKlKm5u3myZf/GwFpSyF6fIiqJOxT5moUwM4gaZfAI+KUBEWYbYQYwZh31yY3jPs9ZHIBimRXzXSm0vY+Q4Zqk=
X-Received: by 2002:a37:6455:: with SMTP id y82mr17373098qkb.286.1586090736480;
 Sun, 05 Apr 2020 05:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200405025123.154688-1-sboyd@kernel.org> <20200405025123.154688-7-sboyd@kernel.org>
In-Reply-To: <20200405025123.154688-7-sboyd@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sun, 5 Apr 2020 14:45:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2M54quhRNK4xvwjz9O9oZwgrobc_wtkGaeA2PMYwOUdg@mail.gmail.com>
Message-ID: <CAK8P3a2M54quhRNK4xvwjz9O9oZwgrobc_wtkGaeA2PMYwOUdg@mail.gmail.com>
Subject: Re: [PATCH 6/9] clk: Allow the common clk framework to be selectable
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-c6x-dev@linux-c6x.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2j5yCRpmUgMN8CvyTmGu8cLxTeO2fOCqGCt1P4Bs1LiPJtXFhRa
 Cw4/o0I0CelYcf08jWUEeocfFyA4W9LEjojZjLQkZ/psLwR1caUXhDDCrolHKXE10WSm2os
 +4dQGck3ONnLX4pdnqmT1gUxT4M8QwXAk12iI6vx0mskl/+YkgXBo+nREHQhjoGo8I8MZpr
 M9Bw78tPhIArA0xk7/BPg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3SzDqqQUZSY=:vltQxd7BqQONxr+W6xXytF
 OydTft9Eg41h9YhTmOfsY8DnpG8MzOBTDEdPiE+nukrSKOwvUyZdtmhzsMuz8Caxm4aoSD6dL
 jAFWbQlIDDay2dV8/sMw/LR0C/N6K1wzON/FIvH+abeaFy7JBllRxGYhdoWVOPB/KI2/itjLe
 9HSeMgpNalecZ4C9eETfmH3J3Okxh/X08S6l4s+GNVDMDqLmY+xZw+zvEKeMsA4wgD2zIe9Cq
 u/l584KS52nYnZVBX6VQkoBSQ51YVT1Hb+4FDMgFzpnCkPhXtAkJ3saDIR+00N2TR96Zy/7Jx
 yhO4lr84VcWTWRKh2MoFC+2unhWSYXs8Ar9qjlPRLYfmRfCJyVUZ+qeBpYzDlQqYnzjoeoJlU
 /GIpSCC0qOUjZbfWeVOtZ10WVGJV98dtYbQujY8Ou+ceN++ELggG9Ewr7gg3vZxrVBGck+ftW
 4nqdrhFvC2z4QRuzI6M8EyVACfeBHzzz1my/VbVmOOwVRulswXI77lAbFFoiUUj4z0knuwtdy
 u7Q4MV09nAr3y+VNE6WUXEgqGmnKOD4KG5iCJ3IuLKbL5eDzdPWbO+0Ts349DYagWBCY6P1yh
 hZ+1IXL+Rr+AgAJlf9oytUBgNYYousXLKbU3c+/ns8iNk6XSv81aAdZED2XxMKdvFdkM3a9vz
 wokCqLkyoBDhiMU7Sq/6tfj+kPblleuwrJnoX2nZSxIrfJmRjmY1SaKXhsIi418wiqQgsAkfm
 e5IyGlzV1IuH5bDSyFEHrvJzzfeEI4xDpoayRhisPuO9lOXxBaZ4mcnesGtIIYcYRMmoCQmW4
 nFPOy7fB7RFvWRxcq+hHXctqEwuwMa367WEeW0G/LaVEAaPy1o=
Sender: linux-m68k-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-m68k.vger.kernel.org>
X-Mailing-List: linux-m68k@vger.kernel.org

On Sun, Apr 5, 2020 at 4:51 AM Stephen Boyd <sboyd@kernel.org> wrote:
> There's one snag with doing this, and that's making sure that randconfig
> builds don't select this option when some architecture or platform
> implements 'struct clk' outside of the common clk framework. Introduce a
> new config option 'HAVE_LEGACY_CLK' to indicate those platforms that
> haven't migrated to the common clk framework and therefore shouldn't be
> allowed to select this new config option. Also add a note that we hope
> one day to remove this config entirely.

Good idea!

I've looked through the individual ones and commented a bit on
what I think may or may not happen with them.

ralink SOC_MT7621 is the only one that I think you got wrong,
as it already has common-clk support.

>  arch/arm/Kconfig              |  2 ++
>  arch/c6x/Kconfig              |  1 +
>  arch/m68k/Kconfig.cpu         |  2 +-
>  arch/mips/Kconfig             |  6 ++++--
>  arch/mips/loongson2ef/Kconfig |  2 +-
>  arch/sh/boards/Kconfig        |  5 +++++
>  arch/unicore32/Kconfig        |  2 +-
>  drivers/clk/Kconfig           | 17 +++++++++++++----
>  8 files changed, 28 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index eeabdc5a3dd2..0606e1bbd7b6 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -364,6 +364,7 @@ config ARCH_EP93XX
>         select CPU_ARM920T
>         select GENERIC_CLOCKEVENTS
>         select GPIOLIB
> +       select HAVE_LEGACY_CLK
>         help
>           This enables support for the Cirrus EP93xx series of CPUs.
>
> @@ -522,6 +523,7 @@ config ARCH_OMAP1
>         select GENERIC_IRQ_MULTI_HANDLER
>         select GPIOLIB
>         select HAVE_IDE
> +       select HAVE_LEGACY_CLK
>         select IRQ_DOMAIN
>         select NEED_MACH_IO_H if PCCARD
>         select NEED_MACH_MEMORY_H

Ah nice, I thought there were more than two implementations
left. I need to refresh the series for OMAP1 that I did last year
and debug the regression that caused. I think Linus Walleij
has looked into the ep93xx one at some point.

> diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
> index e65e8d82442a..6444ebfd06a6 100644
> --- a/arch/c6x/Kconfig
> +++ b/arch/c6x/Kconfig
> @@ -11,6 +11,7 @@ config C6X
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         select GENERIC_ATOMIC64
>         select GENERIC_IRQ_SHOW
>         select HAVE_ARCH_TRACEHOOK

This was last touched in 2012 when TMS320C6678 support
was added. It seems to be based on the original same code
as omap1 and omap2 that eventually turned into the common
clock subsystem, so it would clearly be possible to do a
step-by-step conversion like I did for omap1, but I suspect
we can wait for all of c6x-linux to become obsolete enough.

> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 60ac1cd8b96f..bd2d29c22a10 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -28,7 +28,7 @@ config COLDFIRE
>         select CPU_HAS_NO_MULDIV64
>         select GENERIC_CSUM
>         select GPIOLIB
> -       select HAVE_CLK
> +       select HAVE_LEGACY_CLK
>
>  endchoice

The coldfire clock implementation looks rather simple compared
to chips from the 2010s: most chips have only fixed clocks,
and three of them have one of two registers of clock gates.

It shouldn't be hard to convert, but enabling common-clk will
cause a noticeable kernel size increase on the fairly limited
hardware.

Simply enabling COMMON_CLK in m5475evb_defconfig
results in a 1.7% or 40KB growth in kernel size, plus there
would be additional dynamic memory usage:

   text    data     bss     dec     hex filename
1934726 263616   83284 2281626 22d09a obj/vmlinux-before
1971989 266192   83308 2321489 236c51 obj/vmlinux-after

> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index e53a8dd5c19b..fa02c715ab25 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -181,7 +181,7 @@ config AR7
>         select SYS_SUPPORTS_ZBOOT_UART16550
>         select GPIOLIB
>         select VLYNQ
> -       select HAVE_CLK
> +       select HAVE_LEGACY_CLK
>         help
>           Support for the Texas Instruments AR7 System-on-a-Chip
>           family: TNETD7100, 7200 and 7300.

I suspect this platform is fairly dead, OpenWRT dropped support for it,
and the known machines have at most 16MB of RAM, which limits
the number of use cases that also want to build recent kernels.

> @@ -296,9 +296,9 @@ config BCM63XX
>         select SYS_HAS_EARLY_PRINTK
>         select SWAP_IO_SPACE
>         select GPIOLIB
> -       select HAVE_CLK
>         select MIPS_L1_CACHE_SHIFT_4
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         help
>           Support for BCM63XX based boards
>
> @@ -419,6 +419,7 @@ config LANTIQ
>         select SWAP_IO_SPACE
>         select BOOT_RAW
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         select USE_OF
>         select PINCTRL
>         select PINCTRL_LANTIQ
> @@ -656,6 +657,7 @@ config RALINK
>         select SYS_SUPPORTS_MIPS16
>         select SYS_HAS_EARLY_PRINTK
>         select CLKDEV_LOOKUP
> +       select HAVE_LEGACY_CLK
>         select ARCH_HAS_RESET_CONTROLLER
>         select RESET_CONTROLLER

All three of these are older platforms that still have a number of machines
supported in OpenWRT, so there is hope that someone would do the work
to add common-clk support. Both Lantiq and Ralink have been converted
to device tree not too long ago.

I think the RALINK entry needs to be changed, as this includes
SOC_MT7621, which already uses COMMON_CLK.

> diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
> index 595dd48e1e4d..c9ec43afde73 100644
> --- a/arch/mips/loongson2ef/Kconfig
> +++ b/arch/mips/loongson2ef/Kconfig
> @@ -46,7 +46,7 @@ config LEMOTE_MACH2F
>         select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
>         select DMA_NONCOHERENT
>         select GENERIC_ISA_DMA_SUPPORT_BROKEN
> -       select HAVE_CLK
> +       select HAVE_LEGACY_CLK
>         select FORCE_PCI
>         select I8259
>         select IRQ_MIPS_CPU

For all I can tell, this driver only uses the clock interface for
its cpufreq driver, and the actual API definition looks bogus.

Half of it could be folded into the cpufreq driver, and the rest
of it removed, along with arch/mips/include/asm/clock.h

> diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
> index cee24c308337..fb0ca0c1efe1 100644
> --- a/arch/sh/boards/Kconfig
> +++ b/arch/sh/boards/Kconfig
> @@ -7,6 +7,11 @@ config SOLUTION_ENGINE
>  config SH_ALPHA_BOARD
>         bool
>
> +config SH_CUSTOM_CLK
> +       def_bool y
> +       depends on !SH_DEVICE_TREE
> +       select HAVE_LEGACY_CLK
> +
>  config SH_DEVICE_TREE
>         bool
>         select OF

It's going to be hard to find anyone willing to touch this, as the code
is very large but has few users these days.

drivers/sh/clk/ is basically a generic clk subsystem on its own, and
there are at least 28 different arch/sh SoCs with drivers for it.

       Arnd
