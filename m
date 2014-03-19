From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k/atari - stram: alloc ST-RAM pool even if kernel
 not in ST-RAM
Date: Wed, 19 Mar 2014 08:51:10 +0100
Message-ID: <CAMuHMdXksY0Sfq-AN-1hi42=-yHYqgRnH0RM5z0k2oR-hPcOtQ@mail.gmail.com>
References: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:59996 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757420AbaCSHvL (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 19 Mar 2014 03:51:11 -0400
Received: by mail-pa0-f44.google.com with SMTP id bj1so8609823pad.3
        for <linux-m68k@vger.kernel.org>; Wed, 19 Mar 2014 00:51:10 -0700 (PDT)
In-Reply-To: <1395213784-3249-1-git-send-email-schmitz@debian.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Debian m68k <debian-68k@lists.debian.org>, Michael Schmitz <schmitz@debian.org>

Hi Michael,

On Wed, Mar 19, 2014 at 8:23 AM, Michael Schmitz <schmitzmic@gmail.com> wrote:
> Instead of mucking around with ioremap (which appears to
> rely on the physical area being mappped by mem_init), use

That's not true. E.g. I/O memory is never mapped by mem_init().

> @@ -93,21 +92,54 @@ void __init atari_stram_init(void)
>   */
>  void __init atari_stram_reserve_pages(void *start_mem)
>  {
> -       /*
> -        * always reserve first page of ST-RAM, the first 2 KiB are
> -        * supervisor-only!
> -        */
> -       if (!kernel_in_stram)
> -               reserve_bootmem(0, PAGE_SIZE, BOOTMEM_DEFAULT);
> -
> -       stram_pool.start = (resource_size_t)alloc_bootmem_low_pages(pool_size);
> -       stram_pool.end = stram_pool.start + pool_size - 1;
> -       request_resource(&iomem_resource, &stram_pool);
> +       if (kernel_in_stram) {
> +
> +               stram_pool.start = (resource_size_t)alloc_bootmem_low_pages(pool_size);
> +               stram_pool.end = stram_pool.start + pool_size - 1;
> +               request_resource(&iomem_resource, &stram_pool);
> +
> +               printk("atari_stram pool: kernel in ST-RAM, using alloc_bootmem!\n");
> +
> +               printk("atari_stram pool: size = %lu bytes, resource = %pR\n",
> +                        pool_size, &stram_pool);
> +               printk("atari_stram pool: start = %p, end = %p\n",
> +                         (void *) stram_pool.start, (void *) stram_pool.end);
> +               printk("atari_stram pool: stram_virt_offset = %p\n",
> +                         (void *) stram_virt_offset);
> +       } else {
> +               /*
> +                * Skip page 0, as the fhe first 2 KiB are supervisor-only!
> +                */
> +
> +               printk("atari_stram pool: kernel not in ST-RAM, using ioremap!\n");
> +
> +               stram_pool.start = PAGE_SIZE;
> +               stram_pool.end = stram_pool.start + pool_size - 1;
> +
> +               request_resource(&iomem_resource, &stram_pool);
> +
> +               printk("atari_stram pool: size = %lu bytes, resource = %pR\n",
> +                        pool_size, &stram_pool);
> +               printk("atari_stram pool: start = %p, end = %p\n",
> +                         (void *) stram_pool.start, (void *) stram_pool.end);
> +
> +               /* stram_virt_offset = ioremap(stram_pool.start, pool_size); */
> +               stram_virt_offset = (unsigned long) 0xFF000000;
> +
> +               printk("atari_stram pool: stram_virt_offset = %p\n",
> +                         (void *) stram_virt_offset);
> +       }

If you reorder some lines, you can share more code between the "if" and
"else" cases.

> +void *atari_stram_to_virt(unsigned long phys)
> +{
> +       return (void *)(phys + stram_virt_offset);
>  }
>
> +void *atari_stram_to_phys(unsigned long virt)

This should be "unsigned long atari_stram_to_phys(void *)",
allowing to remove a few casts in the callers...

> +{
> +       return (void *)(virt - stram_virt_offset);
> +}

>  void atari_stram_free(void *addr)
>  {
> -       unsigned long start = (unsigned long)addr;
> +       unsigned long start = (unsigned long) atari_stram_to_phys((unsigned long) addr);

... like here.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
