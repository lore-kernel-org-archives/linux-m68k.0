From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Restore symbol versions for symbols exported from assembly
Date: Wed, 19 Jul 2017 10:59:54 +0200
Message-ID: <CAMuHMdVGE2SEo5rtvzjRL_e=c0suw-6Qb-yQxxwDNet4Vyb_8g@mail.gmail.com>
References: <20170719000324.GE18698@decadent.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170719000324.GE18698@decadent.org.uk>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Ben Hutchings <ben@decadent.org.uk>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Ben,

On Wed, Jul 19, 2017 at 2:03 AM, Ben Hutchings <ben@decadent.org.uk> wrote:

I'l add

    WARNING: EXPORT symbol "__divsi3" [vmlinux] version generation
failed, symbol will not be versioned.
    WARNING: EXPORT symbol "__umodsi3" [vmlinux] version generation
failed, symbol will not be versioned.
    WARNING: EXPORT symbol "__mulsi3" [vmlinux] version generation
failed, symbol will not be versioned.
    WARNING: EXPORT symbol "__modsi3" [vmlinux] version generation
failed, symbol will not be versioned.
    WARNING: EXPORT symbol "__udivsi3" [vmlinux] version generation
failed, symbol will not be versioned.

here

> Add <asm/asm-prototypes.h> so that genksyms knows the types of
> these symbols and can generate CRCs for them.
>
> Fixes: d13ffb563044 ("m68k: move exports to definitions"
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> This is build-tested only (m5475evb_defconfig + MODVERSIONS=y).

Looks good:

--- Module.symvers.bad 2017-07-19 10:54:05.384703370 +0200
+++ Module.symvers 2017-07-19 10:54:47.688589137 +0200
@@ -719,7 +719,7 @@
 0x422a24c3 iget5_locked vmlinux EXPORT_SYMBOL
 0x3dcb88a0 irq_set_handler_data vmlinux EXPORT_SYMBOL
 0x3697548b yield_to vmlinux EXPORT_SYMBOL_GPL
-0x00000000 __udivsi3 vmlinux EXPORT_SYMBOL
+0xfb7d9c45 __udivsi3 vmlinux EXPORT_SYMBOL
 0xa8aeb247 sk_page_frag_refill vmlinux EXPORT_SYMBOL
 0xc10b4ba4 user_revoke vmlinux EXPORT_SYMBOL
 0x946d56b0 dcache_dir_lseek vmlinux EXPORT_SYMBOL
@@ -1700,7 +1700,7 @@
 0xba79bf8b seq_open vmlinux EXPORT_SYMBOL
 0x833feac5 mnt_drop_write vmlinux EXPORT_SYMBOL_GPL
 0x6c209eab __alloc_percpu_gfp vmlinux EXPORT_SYMBOL_GPL
-0x00000000 __umodsi3 vmlinux EXPORT_SYMBOL
+0x8320bea8 __umodsi3 vmlinux EXPORT_SYMBOL
 0xf84eb949 simple_readpage vmlinux EXPORT_SYMBOL
 0x5eac9dcc __page_frag_cache_drain vmlinux EXPORT_SYMBOL
 0xa7441ace __lock_page vmlinux EXPORT_SYMBOL
@@ -2587,9 +2587,9 @@
 0x94eea794 getnstimeofday64 vmlinux EXPORT_SYMBOL
 0x36907c9c __siphash_aligned vmlinux EXPORT_SYMBOL
 0x0c051022 __udp_enqueue_schedule_skb vmlinux EXPORT_SYMBOL_GPL
-0x00000000 __modsi3 vmlinux EXPORT_SYMBOL
-0x00000000 __mulsi3 vmlinux EXPORT_SYMBOL
-0x00000000 __divsi3 vmlinux EXPORT_SYMBOL
+0x594e1317 __modsi3 vmlinux EXPORT_SYMBOL
+0x497aef78 __mulsi3 vmlinux EXPORT_SYMBOL
+0x211331fa __divsi3 vmlinux EXPORT_SYMBOL
 0x3e9110fa __hw_addr_unsync vmlinux EXPORT_SYMBOL
 0xb874b87a __clzsi2 vmlinux EXPORT_SYMBOL
 0xed9f9a20 __ctzsi2 vmlinux EXPORT_SYMBOL

Will apply and queue for v4.14.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
