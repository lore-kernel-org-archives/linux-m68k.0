From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/3] m68k: Return directly after a failed capable() in sys_cacheflush()
Date: Thu, 9 Feb 2017 12:06:57 +0100
Message-ID: <CAMuHMdWwtHtLeKwxkc8RTSZDgPshpqkpZQmDRorHxF3HyYgRag__32902.795499149$1486645051$gmane$org@mail.gmail.com>
References: <558ff501-7440-a97f-4494-f48591644092@users.sourceforge.net> <71513091-bc01-ce70-893f-3f376062d833@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <71513091-bc01-ce70-893f-3f376062d833@users.sourceforge.net>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Markus,

On Wed, Jan 18, 2017 at 5:47 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 18 Jan 2017 16:30:36 +0100
>
> Return directly after a call of the function "capable" failed
> at the beginning.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/m68k/kernel/sys_m68k.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
> index 9aa01adb407f..62bfeb3716a7 100644
> --- a/arch/m68k/kernel/sys_m68k.c
> +++ b/arch/m68k/kernel/sys_m68k.c
> @@ -384,9 +384,8 @@ sys_cacheflush (unsigned long addr, int scope, int cache, unsigned long len)
>
>         if (scope == FLUSH_SCOPE_ALL) {
>                 /* Only the superuser may explicitly flush the whole cache. */
> -               ret = -EPERM;
>                 if (!capable(CAP_SYS_ADMIN))
> -                       goto out;
> +                       return -EPERM;

Given there is another "goto out" before this, I won't take this patch as-is.

>         } else {
>                 struct vm_area_struct *vma;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
