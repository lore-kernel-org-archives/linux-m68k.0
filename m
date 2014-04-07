From: =?iso-8859-1?Q?Lu=EDs?= Henriques <luis.henriques@canonical.com>
Subject: Re: Boot crash fix for 68030
Date: Mon, 7 Apr 2014 11:37:50 +0100
Message-ID: <20140407103750.GB3796@hercules>
References: <alpine.DEB.2.02.1404061132530.6867@ayla.of.borg>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:51740 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740AbaDGKhz (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 7 Apr 2014 06:37:55 -0400
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1404061132530.6867@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: stable@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, Finn Thain <fthain@telegraphics.com.au>, Thomas Gleixner <tglx@linutronix.de>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sun, Apr 06, 2014 at 11:34:46AM +0200, Geert Uytterhoeven wrote:
> Please queue the two commits below for stable:
>   - The second commit fixes a boot crash on 68030,
>   - The first commit is a prerequisite for the second.
>=20
> This fix is needed on all versions that contain commit
> e4f2dfbb5e92be4e46c0625f4f8eb101110f756f ("m68k: implement futex.h to=
 support
> userspace robust futexes and PI mutexes"), i.e. v3.10 until v3.14.
>=20
> The first commit only applies cleanly to v3.14.
> I appended a backported version for v3.10..v3.13 at the bottom of thi=
s email.
>=20
> Thanks for applying!

Thank you Geert, I'll queue both patches for the 3.11 kernel.

Cheers,
--
Lu=EDs

> commit 03b8c7b623c80af264c4c8d6111e5c6289933666
> Author: Heiko Carstens <heiko.carstens@de.ibm.com>
> Date: =A0 Sun Mar 2 13:09:47 2014 +0100
>=20
> =A0 =A0 futex: Allow architectures to skip futex_atomic_cmpxchg_inato=
mic() test
> =A0 =A0
> =A0 =A0 If an architecture has futex_atomic_cmpxchg_inatomic() implem=
ented and there
> =A0 =A0 is no runtime check necessary, allow to skip the test within =
futex_init().
> =A0 =A0
> =A0 =A0 This allows to get rid of some code which would always give t=
he same result,
> =A0 =A0 and also allows the compiler to optimize a couple of if state=
ments away.
> =A0 =A0
> =A0 =A0 Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> =A0 =A0 Cc: Finn Thain <fthain@telegraphics.com.au>
> =A0 =A0 Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> =A0 =A0 Link: http://lkml.kernel.org/r/20140302120947.GA3641@osiris
> =A0 =A0 Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>=20
> commit e571c58f313d35c56e0018470e3375ddd1fd320e
> Author: Finn Thain <fthain@telegraphics.com.au>
> Date: =A0 Thu Mar 6 10:29:27 2014 +1100
>=20
> =A0 =A0 m68k: Skip futex_atomic_cmpxchg_inatomic() test
> =A0 =A0
> =A0 =A0 Skip the futex_atomic_cmpxchg_inatomic() test in futex_init()=
=2E It causes a
> =A0 =A0 fatal exception on 68030 (and presumably 68020 also).
> =A0 =A0
> =A0 =A0 Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> =A0 =A0 Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> =A0 =A0 Link: http://lkml.kernel.org/r/alpine.LNX.2.00.1403061006440.=
5525@nippy.intranet
> =A0 =A0 Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>=20
> ---
> From 4ff4cbd563da5ff27b61abb31cb6efaf9498cf07 Mon Sep 17 00:00:00 200=
1
> From: Heiko Carstens <heiko.carstens@de.ibm.com>
> Date: Sun, 2 Mar 2014 13:09:47 +0100
> Subject: [PATCH] futex: Allow architectures to skip
>  futex_atomic_cmpxchg_inatomic() test
>=20
> If an architecture has futex_atomic_cmpxchg_inatomic() implemented an=
d there
> is no runtime check necessary, allow to skip the test within futex_in=
it().
>=20
> This allows to get rid of some code which would always give the same =
result,
> and also allows the compiler to optimize a couple of if statements aw=
ay.
>=20
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Finn Thain <fthain@telegraphics.com.au>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: http://lkml.kernel.org/r/20140302120947.GA3641@osiris
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> [geert: Backported to v3.10..v3.13]
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/s390/Kconfig     |    1 +
>  include/linux/futex.h |    4 ++++
>  init/Kconfig          |    7 +++++++
>  kernel/futex.c        |   14 ++++++++++++--
>  4 files changed, 24 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index e9f312532526..c8d8283cb20e 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -117,6 +117,7 @@ config S390
>  	select HAVE_FUNCTION_GRAPH_TRACER
>  	select HAVE_FUNCTION_TRACER
>  	select HAVE_FUNCTION_TRACE_MCOUNT_TEST
> +	select HAVE_FUTEX_CMPXCHG if FUTEX
>  	select HAVE_KERNEL_BZIP2
>  	select HAVE_KERNEL_GZIP
>  	select HAVE_KERNEL_LZ4
> diff --git a/include/linux/futex.h b/include/linux/futex.h
> index b0d95cac826e..6435f46d6e13 100644
> --- a/include/linux/futex.h
> +++ b/include/linux/futex.h
> @@ -55,7 +55,11 @@ union futex_key {
>  #ifdef CONFIG_FUTEX
>  extern void exit_robust_list(struct task_struct *curr);
>  extern void exit_pi_state_list(struct task_struct *curr);
> +#ifdef CONFIG_HAVE_FUTEX_CMPXCHG
> +#define futex_cmpxchg_enabled 1
> +#else
>  extern int futex_cmpxchg_enabled;
> +#endif
>  #else
>  static inline void exit_robust_list(struct task_struct *curr)
>  {
> diff --git a/init/Kconfig b/init/Kconfig
> index 4e5d96ab2034..66e6759e4436 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1399,6 +1399,13 @@ config FUTEX
>  	  support for "fast userspace mutexes".  The resulting kernel may n=
ot
>  	  run glibc-based applications correctly.
> =20
> +config HAVE_FUTEX_CMPXCHG
> +	bool
> +	help
> +	  Architectures should select this if futex_atomic_cmpxchg_inatomic=
()
> +	  is implemented and always working. This removes a couple of runti=
me
> +	  checks.
> +
>  config EPOLL
>  	bool "Enable eventpoll support" if EXPERT
>  	default y
> diff --git a/kernel/futex.c b/kernel/futex.c
> index f6ff0191ecf7..0d74e3aecb0b 100644
> --- a/kernel/futex.c
> +++ b/kernel/futex.c
> @@ -68,7 +68,9 @@
> =20
>  #include "locking/rtmutex_common.h"
> =20
> +#ifndef CONFIG_HAVE_FUTEX_CMPXCHG
>  int __read_mostly futex_cmpxchg_enabled;
> +#endif
> =20
>  #define FUTEX_HASHBITS (CONFIG_BASE_SMALL ? 4 : 8)
> =20
> @@ -2731,10 +2733,10 @@ SYSCALL_DEFINE6(futex, u32 __user *, uaddr, i=
nt, op, u32, val,
>  	return do_futex(uaddr, op, val, tp, uaddr2, val2, val3);
>  }
> =20
> -static int __init futex_init(void)
> +static void __init futex_detect_cmpxchg(void)
>  {
> +#ifndef CONFIG_HAVE_FUTEX_CMPXCHG
>  	u32 curval;
> -	int i;
> =20
>  	/*
>  	 * This will fail and we want it. Some arch implementations do
> @@ -2748,6 +2750,14 @@ static int __init futex_init(void)
>  	 */
>  	if (cmpxchg_futex_value_locked(&curval, NULL, 0, 0) =3D=3D -EFAULT)
>  		futex_cmpxchg_enabled =3D 1;
> +#endif
> +}
> +
> +static int __init futex_init(void)
> +{
> +	int i;
> +
> +	futex_detect_cmpxchg();
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(futex_queues); i++) {
>  		plist_head_init(&futex_queues[i].chain);
> --=20
> 1.7.9.5
>=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
> 							    -- Linus Torvalds
> --
> To unsubscribe from this list: send the line "unsubscribe stable" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
