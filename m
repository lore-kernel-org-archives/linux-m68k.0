From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 07/35] m68k: use addr_limit checking for m68k CPUs that do
 no support address spaces
Date: Sun, 25 Dec 2011 21:01:31 +0100
Message-ID: <CAMuHMdXTN6ugyh3LuCYzs+z5PxLM82KXem7e=dPSt8BCyPJQVg@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-8-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:63362 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab1LYUBc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 15:01:32 -0500
Received: by wgbdr13 with SMTP id dr13so19412697wgb.1
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 12:01:31 -0800 (PST)
In-Reply-To: <1324610148-20666-8-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>, Alexander Stein <alexander.stein@systec-electronic.com>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The ColdFire CPU family, and the original 68000, do not support separ=
ate
> address spaces like the other 680x0 CPU types. Modify the set_fs()/ge=
t_fs()
> functions and macros to use a thread_info addr_limit for address spac=
e
> checking. This is pretty much what all other architectures that do no=
t
> support separate setable address spaces do.
>
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com=
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Matt Waddel <mwaddel@yahoo.com>
> Acked-by: Kurt Mahan <kmahan@xmission.com>

> diff --git a/arch/m68k/include/asm/thread_info.h b/arch/m68k/include/=
asm/thread_info.h
> index 01cef3c..29fa6da 100644
> --- a/arch/m68k/include/asm/thread_info.h
> +++ b/arch/m68k/include/asm/thread_info.h
> @@ -3,6 +3,7 @@
>
> =C2=A0#include <asm/types.h>
> =C2=A0#include <asm/page.h>
> +#include <asm/segment.h>
>
> =C2=A0/*
> =C2=A0* On machines with 4k pages we default to an 8k thread size, th=
ough we
> @@ -26,6 +27,7 @@ struct thread_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct task_struct =C2=A0 =C2=A0 =C2=A0*ta=
sk; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* main task structure */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct exec_domain =C2=A0 =C2=A0 =C2=A0*ex=
ec_domain; =C2=A0 /* execution domain */
> + =C2=A0 =C2=A0 =C2=A0 mm_segment_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0addr_limit; =C2=A0 =C2=A0 /* thread address space */

Shouldn't the above be protected by #ifndef CONFIG_CPU_HAS_ADDRESS_SPAC=
ES?

> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 preempt_count; =C2=A0/* 0 =3D> preempta=
ble, <0 =3D> BUG */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
/* should always be 0 on m68k */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 tp_value; =C2=A0 =C2=A0 =C2=A0 /* thread pointer */
> @@ -39,6 +41,7 @@ struct thread_info {
> =C2=A0{ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.task =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=
 &tsk, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.exec_domain =C2=A0 =C2=A0=3D &default_exe=
c_domain, \
> + =C2=A0 =C2=A0 =C2=A0 .addr_limit =C2=A0 =C2=A0 =3D KERNEL_DS, =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\

Same here

> =C2=A0 =C2=A0 =C2=A0 =C2=A0.preempt_count =C2=A0=3D INIT_PREEMPT_COUN=
T, =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.restart_block =3D { =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fn =3D do_no_=
restart_syscall, =C2=A0 =C2=A0\

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
