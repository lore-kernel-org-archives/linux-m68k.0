From: Finn Thain <fthain@telegraphics.com.au>
Subject: Boot crash on 68030, was Re: [PATCH][M68K] implement futex.h to
 support userspace robust futexes and PI mutexes
Date: Tue, 10 Dec 2013 10:11:42 +1100 (EST)
Message-ID: <alpine.LNX.2.00.1312101000250.10258@nippy.intranet>
References: <20793.61385.652975.797741@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:59107 "EHLO
	kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753511Ab3LIXLs (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 9 Dec 2013 18:11:48 -0500
In-Reply-To: <20793.61385.652975.797741@pilspetsen.it.uu.se>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Mikael Pettersson <mikpe@it.uu.se>
Cc: linux-m68k@vger.kernel.org


Hi all,

This patch (which first appeared in 3.10) consistently causes a boot crash 
on 68030.

I used git bisect to isolate the offending commit, which turned out to be
[e4f2dfbb5e92be4e46c0625f4f8eb101110f756f] m68k: implement futex.h to 
support userspace robust futexes and PI mutexes

Recently there have been several bug reports from end users and some 
inconclusive discussion on debian-68k:
http://lists.debian.org/debian-68k/2013/11/msg00144.html
http://lists.debian.org/debian-68k/2013/10/msg00085.html

Anyone have any suggestions? I'm out of ideas.

Finn


Data read fault at 0x00000000 in Super Data (pc=0x3afec)
BAD KERNEL BUSERR
Oops: 00000000
Modules linked in:
PC: [<0003afec>] cmpxchg_futex_value_locked+0x14/0x4a
SR: 2004  SP: 0082fed4  a2: 0082c000
d0: 00000000    d1: 00000001    d2: 00000018    d3: 00000000
d4: 00000061    d5: 00001000    a0: 00000000    a1: 0082e000
Process swapper (pid: 1, task=0082c000)
Frame format=B ssw=074d isc=4a80 isb=661c daddr=00000000 dobuf=00000001
baddr=0003aff2 dibuf=00000000 ver=f
Stack from 0082ff5c:
        002b8cb8 0082ff70 00000000 00000000 00000000 00000000 00000000 000020ac
        00000018 00000007 00000061 00001000 00000000 00000000 002cab50 00002008
        002b3a56 002b8ca4 0082c3f0 00000000 0082c53c 001e316a 00000000 00000000
        001e3172 001e316a 000025d4 00000000 00000000 00000000 00000000 00000000
        00000000 00000000 00000000 00000000 00000000 00000000 00000000 20000000
        00000000
Call Trace: [<002b8cb8>] futex_init+0x14/0x54
 [<000020ac>] do_one_initcall+0xa4/0x144
 [<00001000>] kernel_pg_dir+0x0/0x1000
 [<00002008>] do_one_initcall+0x0/0x144
 [<002b3a56>] kernel_init_freeable+0xca/0x152
 [<002b8ca4>] futex_init+0x0/0x54
 [<001e316a>] kernel_init+0x0/0xc8
 [<001e3172>] kernel_init+0x8/0xc8
 [<001e316a>] kernel_init+0x0/0xc8
 [<000025d4>] ret_from_kernel_thread+0xc/0x14


On Fri, 8 Mar 2013, Mikael Pettersson wrote:

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
> 
> Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
> ---
>  arch/m68k/include/asm/futex.h |   94 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> --- linux-3.8/arch/m68k/include/asm/futex.h.~1~	1970-01-01 01:00:00.000000000 +0100
> +++ linux-3.8/arch/m68k/include/asm/futex.h	2013-02-20 22:07:23.459917612 +0100
> @@ -0,0 +1,94 @@
> +#ifndef _ASM_M68K_FUTEX_H
> +#define _ASM_M68K_FUTEX_H
> +
> +#ifdef __KERNEL__
> +#if !defined(CONFIG_MMU)
> +#include <asm-generic/futex.h>
> +#else	/* CONFIG_MMU */
> +
> +#include <linux/futex.h>
> +#include <linux/uaccess.h>
> +#include <asm/errno.h>
> +
> +static inline int
> +futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
> +			      u32 oldval, u32 newval)
> +{
> +	u32 val;
> +
> +	if (unlikely(get_user(val, uaddr) != 0))
> +		return -EFAULT;
> +
> +	if (val == oldval && unlikely(put_user(newval, uaddr) != 0))
> +		return -EFAULT;
> +
> +	*uval = val;
> +
> +	return 0;
> +}
> +
> +static inline int
> +futex_atomic_op_inuser(int encoded_op, u32 __user *uaddr)
> +{
> +	int op = (encoded_op >> 28) & 7;
> +	int cmp = (encoded_op >> 24) & 15;
> +	int oparg = (encoded_op << 8) >> 20;
> +	int cmparg = (encoded_op << 20) >> 20;
> +	int oldval, ret;
> +	u32 tmp;
> +
> +	if (encoded_op & (FUTEX_OP_OPARG_SHIFT << 28))
> +		oparg = 1 << oparg;
> +
> +	pagefault_disable();	/* implies preempt_disable() */
> +
> +	ret = -EFAULT;
> +	if (unlikely(get_user(oldval, uaddr) != 0))
> +		goto out_pagefault_enable;
> +
> +	ret = 0;
> +	tmp = oldval;
> +
> +	switch (op) {
> +	case FUTEX_OP_SET:
> +		tmp = oparg;
> +		break;
> +	case FUTEX_OP_ADD:
> +		tmp += oparg;
> +		break;
> +	case FUTEX_OP_OR:
> +		tmp |= oparg;
> +		break;
> +	case FUTEX_OP_ANDN:
> +		tmp &= ~oparg;
> +		break;
> +	case FUTEX_OP_XOR:
> +		tmp ^= oparg;
> +		break;
> +	default:
> +		ret = -ENOSYS;
> +	}
> +
> +	if (ret == 0 && unlikely(put_user(tmp, uaddr) != 0))
> +		ret = -EFAULT;
> +
> +out_pagefault_enable:
> +	pagefault_enable();	/* subsumes preempt_enable() */
> +
> +	if (ret == 0) {
> +		switch (cmp) {
> +		case FUTEX_OP_CMP_EQ: ret = (oldval == cmparg); break;
> +		case FUTEX_OP_CMP_NE: ret = (oldval != cmparg); break;
> +		case FUTEX_OP_CMP_LT: ret = (oldval < cmparg); break;
> +		case FUTEX_OP_CMP_GE: ret = (oldval >= cmparg); break;
> +		case FUTEX_OP_CMP_LE: ret = (oldval <= cmparg); break;
> +		case FUTEX_OP_CMP_GT: ret = (oldval > cmparg); break;
> +		default: ret = -ENOSYS;
> +		}
> +	}
> +	return ret;
> +}
> +
> +#endif /* CONFIG_MMU */
> +#endif /* __KERNEL__ */
> +#endif /* _ASM_M68K_FUTEX_H */
