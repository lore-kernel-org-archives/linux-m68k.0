From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: add KMAP definitions for non-MMU definitions
Date: Sun, 11 Nov 2012 10:28:11 +0100
Message-ID: <CAMuHMdXbbpQ7KGTybs3fZDMBUPhEFM0ZmuRQ7H=rqLce3_4UWA@mail.gmail.com>
References: <1350885152-20537-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:64986 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751423Ab2KKJ2M (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 11 Nov 2012 04:28:12 -0500
Received: by mail-vc0-f174.google.com with SMTP id fk26so5187999vcb.19
        for <linux-m68k@vger.kernel.org>; Sun, 11 Nov 2012 01:28:11 -0800 (PST)
In-Reply-To: <1350885152-20537-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Mon, Oct 22, 2012 at 7:52 AM,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> To be consistent with the set of MMU definitions we should define KMAP_START
> and KMAP_END. Future common m68k code will use their values.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/m68k/include/asm/pgtable_no.h |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/include/asm/pgtable_no.h b/arch/m68k/include/asm/pgtable_no.h
> index bf86b29..037028f 100644
> --- a/arch/m68k/include/asm/pgtable_no.h
> +++ b/arch/m68k/include/asm/pgtable_no.h
> @@ -64,6 +64,8 @@ extern unsigned int kobjsize(const void *objp);
>   */
>  #define        VMALLOC_START   0
>  #define        VMALLOC_END     0xffffffff
> +#define        KMAP_START      0
> +#define        KMAP_END        0xffffffff
>
>  #include <asm-generic/pgtable.h>
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
