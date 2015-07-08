From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/8] m68k: coldfire: unlink FPU presence from MMU activation
Date: Wed, 8 Jul 2015 16:03:25 +0200
Message-ID: <CAMuHMdXUh0JdQGzrzedskVhAHiBGvXMwJ7=44kDN5Qagj92icA@mail.gmail.com>
References: <1436349092-2214-1-git-send-email-yannick.gicquel@gmail.com>
	<1436349092-2214-2-git-send-email-yannick.gicquel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-oi0-f52.google.com ([209.85.218.52]:33263 "EHLO
	mail-oi0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932599AbbGHOD0 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 8 Jul 2015 10:03:26 -0400
Received: by oiyy130 with SMTP id y130so166289866oiy.0
        for <linux-m68k@vger.kernel.org>; Wed, 08 Jul 2015 07:03:25 -0700 (PDT)
In-Reply-To: <1436349092-2214-2-git-send-email-yannick.gicquel@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Yannick GICQUEL <yannick.gicquel@open.eurogiciel.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Jul 8, 2015 at 11:51 AM, Yannick GICQUEL
<yannick.gicquel@open.eurogiciel.org> wrote:
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 2dd8f63..d704c16 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -14,7 +14,7 @@ config M68K
>         select GENERIC_IOMAP
>         select GENERIC_STRNCPY_FROM_USER if MMU
>         select GENERIC_STRNLEN_USER if MMU
> -       select FPU if MMU
> +       select FPU if MMU && !COLDFIRE

I'm not too fond of having complex dependencies here...

>         select ARCH_WANT_IPC_PARSE_VERSION
>         select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE

(but we already have examples like the above)

>         select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
> index 33013df..3661eb4 100644
> --- a/arch/m68k/Kconfig.cpu
> +++ b/arch/m68k/Kconfig.cpu
> @@ -257,6 +257,7 @@ config M54xx
>  config M547x
>         bool "MCF547x"
>         select M54xx
> +       select FPU

... perhaps the "select FPU" should be added to M68KCLASSIC, too,
so we can get rid of the top one?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
