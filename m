From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] mm/m68k: Eliminate memset after alloc_bootmem_pages
Date: Mon, 10 Nov 2014 09:57:45 +0100
Message-ID: <CAMuHMdX46dEKLm6cD3gEEvc_aW52NAKgWG5zNmthCs5jMciU3g__40272.0138583847$1415609895$gmane$org@mail.gmail.com>
References: <20140719113513.GA23586@himangi-Dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20140719113513.GA23586@himangi-Dell>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Himangi Saraogi <himangi774@gmail.com>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Sat, Jul 19, 2014 at 1:35 PM, Himangi Saraogi <himangi774@gmail.com> wrote:
> alloc_bootmem and related functions always return a zeroed region of memory.
> Thus a memset after calls to these functions is unnecessary.
>
> The following Coccinelle semantic patch was used for making the change:
>
> @@
> expression E,E1;
> @@
>
> E = \(alloc_bootmem\|alloc_bootmem_low\|alloc_bootmem_pages\|alloc_bootmem_low_pages\)(...)
> ... when != E
> - memset(E,0,E1);
>
> Signed-off-by: Himangi Saraogi <himangi774@gmail.com>
> Acked-by: Julia Lawall <julia.lawall@lip6.fr>

Thanks, applied and queued for v3.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
