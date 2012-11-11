From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: move to a single instance of free_initmem()
Date: Sun, 11 Nov 2012 11:43:15 +0100
Message-ID: <CAMuHMdX5+gdM+jHEjLLZZJA8_oupeBP4CHbQrVHoE7CRuYBipQ@mail.gmail.com>
References: <1350963636-30424-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:61920 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750969Ab2KKKnQ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Nov 2012 05:43:16 -0500
Received: by mail-vc0-f174.google.com with SMTP id fk26so5210485vcb.19
        for <linux-m68k@vger.kernel.org>; Sun, 11 Nov 2012 02:43:16 -0800 (PST)
In-Reply-To: <1350963636-30424-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 23, 2012 at 5:40 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Currently each sub-architecture has its own implementation if init_freemem().
> There is two different cases that the various implementations deal with.
> They either free the init memory, or they don't. We only need a single instance
> to cover all cases.
>
> The non-MMU version did some page alignment twidling, but this is not
> neccessary. The current linker script enforces page alignment. It also
> checked for CONFIG_RAMKERNEL, but this also is not necessary, the linker
> script always keeps the init sections in RAM.
>
> The MMU ColdFire version of free_initmem() was empty. There is no reason it
> can't carry out the freeing of the init memory. So it is now changed and
> tested to do this.
>
> For the other MMU cases the code is the same. For the general Motorola MMU
> case we free the init memory. For the SUN3 case we do nothing (though I
> think it could safely free the init memory as well).
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>


>  void free_initmem(void)
>  {
> -#ifdef CONFIG_RAMKERNEL
> +#ifndef CONFIG_MMU_SUN3
>         unsigned long addr;
>
> -       /*
> -        * The following code should be cool even if these sections
> -        * are not page aligned.
> -        */
> -       addr = PAGE_ALIGN((unsigned long) __init_begin);
> -       /* next to check that the page we free is not a partial page */
> -       for (; addr + PAGE_SIZE < ((unsigned long) __init_end); addr += PAGE_SIZE) {
> +       addr = (unsigned long) __init_begin;
> +       for (; addr < ((unsigned long) __init_end); addr += PAGE_SIZE) {
>                 ClearPageReserved(virt_to_page(addr));
>                 init_page_count(virt_to_page(addr));
>                 free_page(addr);
>                 totalram_pages++;
>         }
>         pr_notice("Freeing unused kernel memory: %luk freed (0x%x - 0x%x)\n",
> -               (addr - PAGE_ALIGN((unsigned long) __init_begin)) >> 10,
> -               (int)(PAGE_ALIGN((unsigned long) __init_begin)),
> -               (int)(addr - PAGE_SIZE));
> -#endif
> +               (addr - (unsigned long) __init_begin) >> 10,
> +               (unsigned int) __init_begin, (unsigned int) __init_end);

Which is now BTW almost identical to free_initrd_mem(), so the common
parts can be extracted in a helper function.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
