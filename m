From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][M68K] implement futex.h to support userspace robust
 futexes and PI mutexes
Date: Fri, 17 May 2013 12:04:44 +0200
Message-ID: <CAMuHMdV5BCRaoNTX+XT=QVNA0nYSh6ah0Sm3xy7RfhCwHN8O6Q@mail.gmail.com>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:64757 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919Ab3EQKEo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 17 May 2013 06:04:44 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp6so3396942pab.21
        for <linux-m68k@vger.kernel.org>; Fri, 17 May 2013 03:04:44 -0700 (PDT)
In-Reply-To: <20793.61385.652975.797741@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, Andreas Schwab <schwab@linux-m68k.org>

Hi Mikael,

On Fri, Mar 8, 2013 at 3:03 PM, Mikael Pettersson <mikpe@it.uu.se> wrote:
> Linux/M68K currently doesn't support robust futexes or PI mutexes.
> The problem is that the futex code needs to perform certain ops
> (cmpxchg, set, add, or, andn, xor) atomically on user-space
> addresses, and M68K's lack of a futex.h causes those operations
> to be unsupported and disabled.
>
> This patch adds that support, but only for uniprocessor machines,
> which is adequate for M68K.  For UP it's enough to disable preemption
> to ensure mutual exclusion (futexes don't need to care about other
> hardware agents), and the mandatory pagefault_disable() does just that.
>
> This patch is closely based on the one I co-wrote for UP ARM back
> in August 2008.  The main change is that this patch uses the C
> get_user/put_user accessors instead of inline assembly code with
> exception table fixups.
>
> For non-MMU machines the new futex.h simply redirects to the generic
> futex.h, so there is no functional change for them.
>
> Tested on aranym with the glibc-2.17 test suite: no regressions, and
> a number of mutex/condvar test cases went from failing to succeeding
> (tst-mutexpi{5,5a,6,9}, tst-cond2[45], tst-robust[1-9], tst-robustpi[1-8]).
> Also tested with glibc-2.18 HEAD and a local glibc patch to enable PI
> mutexes: no regressions.

I'm a bit puzzled by this, so see my questions below...

> --- linux-3.8/arch/m68k/include/asm/futex.h.~1~ 1970-01-01 01:00:00.000000000 +0100
> +++ linux-3.8/arch/m68k/include/asm/futex.h     2013-02-20 22:07:23.459917612 +0100
> @@ -0,0 +1,94 @@
> +#ifndef _ASM_M68K_FUTEX_H
> +#define _ASM_M68K_FUTEX_H
> +
> +#ifdef __KERNEL__
> +#if !defined(CONFIG_MMU)
> +#include <asm-generic/futex.h>
> +#else  /* CONFIG_MMU */

Why would you not use the version below on nommu?
It doesn't seem to have any real dependencies on MMU support?
What am I missing?

> +#include <linux/futex.h>
> +#include <linux/uaccess.h>
> +#include <asm/errno.h>
> +
> +static inline int
> +futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> +                             u32 oldval, u32 newval)
> +{
> +       u32 val;
> +
> +       if (unlikely(get_user(val, uaddr) != 0))
> +               return -EFAULT;
> +
> +       if (val == oldval && unlikely(put_user(newval, uaddr) != 0))
> +               return -EFAULT;
> +
> +       *uval = val;
> +
> +       return 0;
> +}

This is purely generic, so it could move to the asm-generic version,
also fixing blackfin, c6x, metag, openrisc, um, unicore32, and xtensa?

> +static inline int
> +futex_atomic_op_inuser(int encoded_op, u32 __user *uaddr)
> +{
> +       int op = (encoded_op >> 28) & 7;
> +       int cmp = (encoded_op >> 24) & 15;
> +       int oparg = (encoded_op << 8) >> 20;
> +       int cmparg = (encoded_op << 20) >> 20;
> +       int oldval, ret;
> +       u32 tmp;
> +
> +       if (encoded_op & (FUTEX_OP_OPARG_SHIFT << 28))
> +               oparg = 1 << oparg;
> +
> +       pagefault_disable();    /* implies preempt_disable() */
> +
> +       ret = -EFAULT;
> +       if (unlikely(get_user(oldval, uaddr) != 0))
> +               goto out_pagefault_enable;
> +
> +       ret = 0;
> +       tmp = oldval;
> +
> +       switch (op) {
> +       case FUTEX_OP_SET:
> +               tmp = oparg;
> +               break;
> +       case FUTEX_OP_ADD:
> +               tmp += oparg;
> +               break;
> +       case FUTEX_OP_OR:
> +               tmp |= oparg;
> +               break;
> +       case FUTEX_OP_ANDN:
> +               tmp &= ~oparg;
> +               break;
> +       case FUTEX_OP_XOR:
> +               tmp ^= oparg;
> +               break;
> +       default:
> +               ret = -ENOSYS;
> +       }
> +
> +       if (ret == 0 && unlikely(put_user(tmp, uaddr) != 0))
> +               ret = -EFAULT;
> +
> +out_pagefault_enable:
> +       pagefault_enable();     /* subsumes preempt_enable() */
> +
> +       if (ret == 0) {
> +               switch (cmp) {
> +               case FUTEX_OP_CMP_EQ: ret = (oldval == cmparg); break;
> +               case FUTEX_OP_CMP_NE: ret = (oldval != cmparg); break;
> +               case FUTEX_OP_CMP_LT: ret = (oldval < cmparg); break;
> +               case FUTEX_OP_CMP_GE: ret = (oldval >= cmparg); break;
> +               case FUTEX_OP_CMP_LE: ret = (oldval <= cmparg); break;
> +               case FUTEX_OP_CMP_GT: ret = (oldval > cmparg); break;
> +               default: ret = -ENOSYS;
> +               }
> +       }
> +       return ret;
> +}

This is also purely generic?
Do you know why the current version in asm-generic doesn't do the
{get,put}_user()?

Thanks for your answers!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
