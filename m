From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][M68K] implement futex.h to support userspace robust
 futexes and PI mutexes
Date: Fri, 31 May 2013 11:16:20 +0200
Message-ID: <CAMuHMdVUtwF-fwvg0-cMVKA9+okcZcW+m-LhUXv+riEBt_hj0w@mail.gmail.com>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
	<CAMuHMdV5BCRaoNTX+XT=QVNA0nYSh6ah0Sm3xy7RfhCwHN8O6Q@mail.gmail.com>
	<20886.7458.959080.194716@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:37089 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752925Ab3EaJQV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 31 May 2013 05:16:21 -0400
Received: by mail-pd0-f178.google.com with SMTP id w11so1860527pde.23
        for <linux-m68k@vger.kernel.org>; Fri, 31 May 2013 02:16:21 -0700 (PDT)
In-Reply-To: <20886.7458.959080.194716@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>, Greg Ungerer <gerg@uclinux.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Andreas Schwab <schwab@linux-m68k.org>, uClinux development list <uclinux-dev@uclinux.org>

On Fri, May 17, 2013 at 2:05 PM, Mikael Pettersson <mikpe@it.uu.se> wrote:
>  > > --- linux-3.8/arch/m68k/include/asm/futex.h.~1~ 1970-01-01 01:00:00.000000000 +0100
>  > > +++ linux-3.8/arch/m68k/include/asm/futex.h     2013-02-20 22:07:23.459917612 +0100
>  > > @@ -0,0 +1,94 @@
>  > > +#ifndef _ASM_M68K_FUTEX_H
>  > > +#define _ASM_M68K_FUTEX_H
>  > > +
>  > > +#ifdef __KERNEL__
>  > > +#if !defined(CONFIG_MMU)
>  > > +#include <asm-generic/futex.h>
>  > > +#else  /* CONFIG_MMU */
>  >
>  > Why would you not use the version below on nommu?
>  > It doesn't seem to have any real dependencies on MMU support?
>  > What am I missing?
>
> The only reason I don't handle no-MMU is that I don't know how much
> no-MMU butchers the semantics of the various primitives (mainly the
> user-space accessors).

The userspace accessors shouldn't matter much, I think.

> Does no-MMU pagefault_disable() disable preemption?  This code
> relies on that.

It seems it does.

>  > > +#include <linux/futex.h>
>  > > +#include <linux/uaccess.h>
>  > > +#include <asm/errno.h>
>  > > +
>  > > +static inline int
>  > > +futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>  > > +                             u32 oldval, u32 newval)
>  > > +{
>  > > +       u32 val;
>  > > +
>  > > +       if (unlikely(get_user(val, uaddr) != 0))
>  > > +               return -EFAULT;
>  > > +
>  > > +       if (val == oldval && unlikely(put_user(newval, uaddr) != 0))
>  > > +               return -EFAULT;
>  > > +
>  > > +       *uval = val;
>  > > +
>  > > +       return 0;
>  > > +}
>  >
>  > This is purely generic, so it could move to the asm-generic version,
>  > also fixing blackfin, c6x, metag, openrisc, um, unicore32, and xtensa?
>
> Yes it should be put somewhere generic, but I don't want to have to
> investigate each and every arch to guess if they can safely use this
> version or not.  I'd rather put this somewhere alongside the stub futex.h
> and have other archs opt-in at the discretion of their maintainers.

Anyway, the m68k version is now in mainline, so I'll let the uClinux people
decide the rest...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
