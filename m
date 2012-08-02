From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: make sys_atomic_cmpxchg_32 work on classic m68k
Date: Fri, 3 Aug 2012 00:52:44 +0200
Message-ID: <CAMuHMdUUOm7ZbfnV2+wkugrfZEmSP3mc_0xAxtExJtgyCVvWWg@mail.gmail.com>
References: <m2r4rwongt.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:35165 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752810Ab2HBWwp (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 2 Aug 2012 18:52:45 -0400
Received: by vbbff1 with SMTP id ff1so67837vbb.19
        for <linux-m68k@vger.kernel.org>; Thu, 02 Aug 2012 15:52:44 -0700 (PDT)
In-Reply-To: <m2r4rwongt.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org

On Sat, Jul 28, 2012 at 12:20 AM, Andreas Schwab <schwab@linux-m68k.org> wrote:
> User space access must always go through uaccess accessors, since on
> classic m68k user space and kernel space are completely separate.
>
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>

Thanks, applied and queued for 3.6-rc1 and stable.

> ---
>  arch/m68k/kernel/sys_m68k.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
> index 8623f8d..9a5932e 100644
> --- a/arch/m68k/kernel/sys_m68k.c
> +++ b/arch/m68k/kernel/sys_m68k.c
> @@ -479,9 +479,13 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
>                         goto bad_access;
>                 }
>
> -               mem_value = *mem;
> +               /*
> +                * No need to check for EFAULT; we know that the page is
> +                * present and writable.
> +                */
> +               __get_user(mem_value, mem);
>                 if (mem_value == oldval)
> -                       *mem = newval;
> +                       __put_user(newval, mem);
>
>                 pte_unmap_unlock(pte, ptl);
>                 up_read(&mm->mmap_sem);
> --
> 1.7.11.3

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
