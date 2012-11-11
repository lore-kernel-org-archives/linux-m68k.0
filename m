From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove unused asm/dbg.h
Date: Sun, 11 Nov 2012 10:41:05 +0100
Message-ID: <CAMuHMdWpKVjGH=gSiV1HO7B5cKyxb6ZBEwh9DdAqN3qLTAz8Pw@mail.gmail.com>
References: <1351487761-8476-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:44737 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750785Ab2KKJlH (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Nov 2012 04:41:07 -0500
Received: by mail-vb0-f46.google.com with SMTP id ff1so5303834vbb.19
        for <linux-m68k@vger.kernel.org>; Sun, 11 Nov 2012 01:41:06 -0800 (PST)
In-Reply-To: <1351487761-8476-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Mon, Oct 29, 2012 at 6:16 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The contents of the m68k asm/dbg.h are never used, remove the file and
> remove the one reference to it.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
>  arch/m68k/include/asm/dbg.h      |    6 ------
>  drivers/tty/serial/68328serial.c |    1 -
>  2 files changed, 0 insertions(+), 7 deletions(-)
>  delete mode 100644 arch/m68k/include/asm/dbg.h
>
> diff --git a/arch/m68k/include/asm/dbg.h b/arch/m68k/include/asm/dbg.h
> deleted file mode 100644
> index 27af327..0000000
> --- a/arch/m68k/include/asm/dbg.h
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -#define DEBUG 1
> -#ifdef CONFIG_COLDFIRE
> -#define        BREAK asm volatile ("halt")
> -#else
> -#define BREAK *(volatile unsigned char *)0xdeadbee0 = 0
> -#endif
> diff --git a/drivers/tty/serial/68328serial.c b/drivers/tty/serial/68328serial.c
> index 66c38a3..fa1bc91 100644
> --- a/drivers/tty/serial/68328serial.c
> +++ b/drivers/tty/serial/68328serial.c
> @@ -14,7 +14,6 @@
>   * 2.4/2.5 port                 David McCullough
>   */
>
> -#include <asm/dbg.h>
>  #include <linux/module.h>
>  #include <linux/errno.h>
>  #include <linux/serial.h>
> --

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
