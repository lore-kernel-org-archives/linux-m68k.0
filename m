From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] m68k: Increase initial mapping to 16MB if possible
Date: Mon, 26 May 2014 13:28:09 +1200
Message-ID: <CAOmrzkL1==KCAyEQE04EApdy3eEU4_G3v7Ug9YKtxG+Tw+iX-A@mail.gmail.com>
References: <87ppk7m3db.fsf@igel.home>
	<loom.20140429T121132-254@post.gmane.org>
	<8738gwxw53.fsf@igel.home>
	<CAMuHMdU50FnSD0K896b7aJN-RPXWpUoW46oiOFy-9AsYP2LGGQ@mail.gmail.com>
	<87sioww0gb.fsf@igel.home>
	<5360A881.7040107@gmail.com>
	<alpine.DEB.2.02.1405251846540.6045@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:49552 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381AbaEZB2L (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 May 2014 21:28:11 -0400
Received: by mail-ob0-f180.google.com with SMTP id va2so7481131obc.39
        for <linux-m68k@vger.kernel.org>; Sun, 25 May 2014 18:28:09 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1405251846540.6045@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Thorsten Glaser <tg@debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Geert,


>> > You can't map more than is available.
>> >
>> How about trying for 16, then 8, then 4? Would help my 14 MB ST-RAM Falcon.
>>
>> I had a patch half prepared for that which I forgot to send ...
>
> And thus I never saw it ;-)

Sorry - I just didn't want to send out assembly code patches I never
attempted to compile. Happy to do that for C code, but that's bad
enough for me.

> Andreas, I amended your patch like below, and plan to queue it for 3.16.

Definitely more elegant than my version :-)

Cheers,

  Michael


> This allows me to boot a multi_defconfig kernel on ARAnyM, with 14 MiB
> ST-RAM in the first chunk, which didn't work with your 16 MiB-only version.
>
> >From fac30ceba841cd5e076f4c0e83b05ca3ba9d3eb2 Mon Sep 17 00:00:00 2001
> From: Andreas Schwab <schwab@linux-m68k.org>
> Date: Thu, 24 Apr 2014 12:24:48 +0200
> Subject: [PATCH] m68k: Increase initial mapping to 8 or 16 MiB if possible
>
> If the size of the first memory chunk is at least 8 or 16 MiB increase the
> initial mapping to 8 resp. 16 MiB instead of 4 MiB.
> This makes it possible to
>   1. Map more memory in the first node without running out of space for the
>      page tables,
>   2. Boot kernels that don't fit in 4 MiB (e.g. multi_defconfig).
>
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
>
>   - Add support for 8 MiB,
>   - Store initial mapping size in head.S for later reuse,
>   - Add comment about large kernels.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/kernel/head.S | 19 +++++++++++++++++--
>  arch/m68k/mm/motorola.c | 10 ++++++----
>  2 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/arch/m68k/kernel/head.S b/arch/m68k/kernel/head.S
> index 145bc3d5b3da..9745156b1db8 100644
> --- a/arch/m68k/kernel/head.S
> +++ b/arch/m68k/kernel/head.S
> @@ -292,6 +292,7 @@
>
>  .globl kernel_pg_dir
>  .globl availmem
> +.globl m68k_init_mapped_size
>  .globl m68k_pgtable_cachemode
>  .globl m68k_supervisor_cachemode
>  #ifdef CONFIG_MVME16x
> @@ -907,10 +908,21 @@ L(nocon):
>   *
>   *     This block of code does what's necessary to map in the various kinds
>   *     of machines for execution of Linux.
> - *     First map the first 4 MB of kernel code & data
> + *     First map the first 4, 8, or 16 MB of kernel code & data
>   */
>
> -       mmu_map #PAGE_OFFSET,%pc@(L(phys_kernel_start)),#4*1024*1024,\
> +       get_bi_record BI_MEMCHUNK
> +       movel   %a0@(4),%d0
> +       movel   #16*1024*1024,%d1
> +       cmpl    %d0,%d1
> +       jls     1f
> +       lsrl    #1,%d1
> +       cmpl    %d0,%d1
> +       jls     1f
> +       lsrl    #1,%d1
> +1:
> +       movel   %d1,m68k_init_mapped_size
> +       mmu_map #PAGE_OFFSET,%pc@(L(phys_kernel_start)),%d1,\
>                 %pc@(m68k_supervisor_cachemode)
>
>         putc    'C'
> @@ -3729,6 +3741,9 @@ func_return       console_plot_pixel
>  __INITDATA
>         .align  4
>
> +m68k_init_mapped_size:
> +       .long   0
> +
>  #if defined(CONFIG_ATARI) || defined(CONFIG_AMIGA) || \
>      defined(CONFIG_HP300) || defined(CONFIG_APOLLO)
>  L(custom):
> diff --git a/arch/m68k/mm/motorola.c b/arch/m68k/mm/motorola.c
> index cf4dfc7eeb29..3bdc56a882fd 100644
> --- a/arch/m68k/mm/motorola.c
> +++ b/arch/m68k/mm/motorola.c
> @@ -45,7 +45,7 @@ EXPORT_SYMBOL(mm_cachebits);
>  #endif
>
>  /* size of memory already mapped in head.S */
> -#define INIT_MAPPED_SIZE       (4UL<<20)
> +extern __initdata unsigned long m68k_init_mapped_size;
>
>  extern unsigned long availmem;
>
> @@ -273,10 +273,12 @@ printk("*** m68k_virt_to_node_shift = %d\n", m68k_virt_to_node_shift);
>          */
>         addr = m68k_memory[0].addr;
>         size = m68k_memory[0].size;
> -       free_bootmem_node(NODE_DATA(0), availmem, min(INIT_MAPPED_SIZE, size) - (availmem - addr));
> +       free_bootmem_node(NODE_DATA(0), availmem,
> +                         min(m68k_init_mapped_size, size) - (availmem - addr));
>         map_node(0);
> -       if (size > INIT_MAPPED_SIZE)
> -               free_bootmem_node(NODE_DATA(0), addr + INIT_MAPPED_SIZE, size - INIT_MAPPED_SIZE);
> +       if (size > m68k_init_mapped_size)
> +               free_bootmem_node(NODE_DATA(0), addr + m68k_init_mapped_size,
> +                                 size - m68k_init_mapped_size);
>
>         for (i = 1; i < m68k_num_memory; i++)
>                 map_node(i);
> --
> 1.9.1
>
> Gr{oetje,eeting}s,
>
>                                                 Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                                             -- Linus Torvalds
