From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: don't comment out syscalls used by glibc
Date: Thu, 10 Nov 2011 21:28:13 +0100
Message-ID: <CAMuHMdVkmZs60OrQRYVGbjX8Wh86Op1kRb2gcvphUDGA5s-7Cg@mail.gmail.com>
References: <m2d3dbd1kg.fsf@igel.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:41437 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751700Ab1KJU2O convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 10 Nov 2011 15:28:14 -0500
Received: by iage36 with SMTP id e36so3355960iag.19
        for <linux-m68k@vger.kernel.org>; Thu, 10 Nov 2011 12:28:13 -0800 (PST)
In-Reply-To: <m2d3dbd1kg.fsf@igel.home>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>

Hi Andreas,

On Tue, Nov 1, 2011 at 21:34, Andreas Schwab <schwab@linux-m68k.org> wr=
ote:
> Define again the syscalls that are used by glibc so that it is possib=
le to
> compile a feature-complete glibc with the newest kernel headers.

I'm a bit puzzled by this. What exactly is your objective? To build a g=
libc that
runs on any possible kernel version ever released?

> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> ---
> =C2=A0arch/m68k/include/asm/unistd.h | =C2=A0 10 +++++-----
> =C2=A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/u=
nistd.h
> index 43f984e..d97234b 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -132,10 +132,10 @@
> =C2=A0#define __NR_adjtimex =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0124
> =C2=A0#define __NR_mprotect =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0125
> =C2=A0#define __NR_sigprocmask =C2=A0 =C2=A0 =C2=A0 126
> -/*#define __NR_create_module =C2=A0 127*/
> +#define __NR_create_module =C2=A0 =C2=A0 127
> =C2=A0#define __NR_init_module =C2=A0 =C2=A0 =C2=A0 128
> =C2=A0#define __NR_delete_module =C2=A0 =C2=A0 129
> -/*#define __NR_get_kernel_syms 130*/
> +#define __NR_get_kernel_syms =C2=A0 130
> =C2=A0#define __NR_quotactl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0131
> =C2=A0#define __NR_getpgid =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 132
> =C2=A0#define __NR_fchdir =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=
3
> @@ -172,7 +172,7 @@
> =C2=A0#define __NR_setresuid =C2=A0 =C2=A0 =C2=A0 =C2=A0 164
> =C2=A0#define __NR_getresuid =C2=A0 =C2=A0 =C2=A0 =C2=A0 165
> =C2=A0#define __NR_getpagesize =C2=A0 =C2=A0 =C2=A0 166
> -/*#define __NR_query_module =C2=A0 =C2=A0167*/
> +#define __NR_query_module =C2=A0 =C2=A0 =C2=A0167

Support for the three syscalls above got removed day to day 10 years
ago, when adding support for Rusty's "In-kernel Module Loader" for
2.5.48. So I guess you need them for 2.4? I can understand that.

> =C2=A0#define __NR_poll =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0168
> =C2=A0#define __NR_nfsservctl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0169
> =C2=A0#define __NR_setresgid =C2=A0 =C2=A0 =C2=A0 =C2=A0 170
> @@ -193,8 +193,8 @@
> =C2=A0#define __NR_capset =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018=
5
> =C2=A0#define __NR_sigaltstack =C2=A0 =C2=A0 =C2=A0 186
> =C2=A0#define __NR_sendfile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0187
> -/*#define __NR_getpmsg =C2=A0 =C2=A0 =C2=A0 =C2=A0 188*/ =C2=A0 /* s=
ome people actually want streams */
> -/*#define __NR_putpmsg =C2=A0 =C2=A0 =C2=A0 =C2=A0 189*/ =C2=A0 /* s=
ome people actually want streams */
> +#define __NR_getpmsg =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 188 =C2=A0 =C2=
=A0 /* some people actually want streams */
> +#define __NR_putpmsg =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 189 =C2=A0 =C2=
=A0 /* some people actually want streams */
> =C2=A0#define __NR_vfork =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19=
0
> =C2=A0#define __NR_ugetrlimit =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0191
> =C2=A0#define __NR_mmap2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 19=
2

AFAIK, the upstream kernel never had an implementation for sys_{get,put=
}msg().
I did find "[Linux-streams] [PATCH] Linux-streams registration 2.5.46"
(http://www.mail-archive.com/linux-streams@gsyc.escet.urjc.es/msg00639.=
html)

2.1.115pre1 added placeholders on i386, and we just followed suit.
Why do you need these?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
