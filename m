From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 3/3] m68k: Add some spaces for better code readability in sys_cacheflush()
Date: Thu, 9 Feb 2017 12:12:27 +0100
Message-ID: <CAMuHMdVwcDbOQrhkk-vGQjzVNLmWQmqrSJTKJo_bCVEUAYHbsQ__31971.4078134441$1486640488$gmane$org@mail.gmail.com>
References: <558ff501-7440-a97f-4494-f48591644092@users.sourceforge.net> <bbebee4e-b726-348e-66f9-dc4657c4f8df@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <bbebee4e-b726-348e-66f9-dc4657c4f8df@users.sourceforge.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Markus,

On Wed, Jan 18, 2017 at 5:50 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 17:34:29 +0100
>
> * Use space characters at some source code places according to
>   the Linux coding style convention.
>
> * Adjust indentation a bit.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/m68k/kernel/sys_m68k.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
> index 9870d00d2215..5b351f7a6c11 100644
> --- a/arch/m68k/kernel/sys_m68k.c
> +++ b/arch/m68k/kernel/sys_m68k.c
> @@ -436,11 +436,10 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
>              * 040 or 060: don't blindly trust 'scope', someone could
>              * try to flush a few megs of memory.
>              */
> -
> -           if (len>=3*PAGE_SIZE && scope<FLUSH_SCOPE_PAGE)
> -               scope=FLUSH_SCOPE_PAGE;
> -           if (len>=10*PAGE_SIZE && scope<FLUSH_SCOPE_ALL)
> -               scope=FLUSH_SCOPE_ALL;
> +               if (len >= 3 * PAGE_SIZE && scope < FLUSH_SCOPE_PAGE)
> +                       scope = FLUSH_SCOPE_PAGE;
> +               if (len >= 10 * PAGE_SIZE && scope < FLUSH_SCOPE_ALL)
> +                       scope = FLUSH_SCOPE_ALL;
>             if (CPU_IS_040) {
>                 ret = cache_flush_040 (addr, scope, cache, len);
>             } else if (CPU_IS_060) {

What prevented you from correcting the indentation of the comments before,
and the statements after?
Now the lines in the else branch are no longer aligned at all!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
