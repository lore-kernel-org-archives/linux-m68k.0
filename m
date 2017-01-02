From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RESEND 10/10] m68k/mac: Replace via-maciisi driver with
 via-cuda driver
Date: Mon, 2 Jan 2017 11:26:21 +0100
Message-ID: <CAMuHMdWFaaZdKa7+T6nruEv1sB8yYAm9yZLgy-UwefxM4b8MaA@mail.gmail.com>
References: <cover.1483055859.git.fthain@telegraphics.com.au> <b44eec45f78cd84d9e3d6ff6c2d303ced19b0eca.1483055859.git.fthain@telegraphics.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34219 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751208AbdABK0W (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jan 2017 05:26:22 -0500
In-Reply-To: <b44eec45f78cd84d9e3d6ff6c2d303ced19b0eca.1483055859.git.fthain@telegraphics.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Linux/m68k <linux-m68k@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Finn, Ben,

On Sun, Jan 1, 2017 at 1:56 AM, Finn Thain <fthain@telegraphics.com.au> wrote:
> Change the device probe test in the via-cuda.c driver so it will load on
> Egret-based machines too. Remove the now redundant via-maciisi.c driver.
>
> Tested-by: Stan Johnson <userm57@yahoo.com>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

I guess this will go in with the rest of the series through Ben's
macintosh tree?

> ---
>  arch/m68k/include/asm/macintosh.h |   2 +-
>  arch/m68k/mac/config.c            |  18 +-
>  arch/m68k/mac/misc.c              |  72 +---
>  drivers/macintosh/Kconfig         |  24 +-
>  drivers/macintosh/Makefile        |   1 -
>  drivers/macintosh/adb.c           |   4 -
>  drivers/macintosh/via-cuda.c      |   8 +-
>  drivers/macintosh/via-maciisi.c   | 677 --------------------------------------
>  8 files changed, 30 insertions(+), 776 deletions(-)
>  delete mode 100644 drivers/macintosh/via-maciisi.c

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
