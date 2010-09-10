From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k/m68knommu: merge MMU and non-MMU string.h
Date: Fri, 10 Sep 2010 14:36:52 +1000
Message-ID: <4C89B5E4.5030104@snapgear.com>
References: <201009070452.o874qqmg006794@goober.internal.moreton.com.au>	<AANLkTim+jWjOKX_M52DWSKH2+oRWBXqc3TUFQp6esf3r@mail.gmail.com>	<4C8776C5.9030205@snapgear.com> <AANLkTikhxWgp6xLDqPSLMax6LS2zT71d+WLZnmo-WCyH@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:28695 "HELO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752818Ab0IJEh3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 10 Sep 2010 00:37:29 -0400
In-Reply-To: <AANLkTikhxWgp6xLDqPSLMax6LS2zT71d+WLZnmo-WCyH@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, gerg@uclinux.org


Hi Geert,

Geert Uytterhoeven wrote:
> On Wed, Sep 8, 2010 at 13:43, Greg Ungerer <gerg@snapgear.com> wrote:
>> On 08/09/10 06:35, Geert Uytterhoeven wrote:
>>> Now I see:
>>>
>>> | arch/m68k/kernel/entry.S: Assembler messages:
>>> | arch/m68k/kernel/entry.S:56: Error: can't resolve `0' {*ABS* sect=
ion} - `THREAD_SIZE' {*UND* section}
>>> | arch/m68k/kernel/entry.S:64: Error: can't resolve `0' {*UND* sect=
ion} - `THREAD_SIZE' {*UND* section}
>>> | arch/m68k/kernel/entry.S:119: Error: can't resolve `0' {*UND* sec=
tion} - `THREAD_SIZE' {*UND* section}
>>> | arch/m68k/kernel/entry.S:203: Error: can't resolve `0' {*UND* sec=
tion} - `THREAD_SIZE' {*UND* section}
>>> | arch/m68k/kernel/entry.S:236: Error: can't resolve `0' {*UND* sec=
tion} - `THREAD_SIZE' {*UND* section}
>>> | arch/m68k/kernel/entry.S:257: Error: can't resolve `0' {*UND* sec=
tion} - `THREAD_SIZE' {*UND* section}
>>>
>>> this is expanded from `GET_CURRENT'.
>> Just a thought, is it enough to include thread_info.h inside entry_m=
m.h?
>=20
> No, because <asm/thread_info.h> is no longer ASSEMBLY-clean, as it in=
cludes
> <asm/current.h>, which is C-only.
> The #include <asm/current.h> in there used to be protected by #ifndef=
 ASSEMBLY.
> If I move that include up just above the definition of struct thread_=
info,
> <asm/thread_info.h> is ASSEMBLY-clean again.
>=20
> However, just including <asm/thread_info.h> from <asm/entry_mm.h> cau=
ses other
> problems for the C part, as <asm/thread_info.h> needs the definition =
of struct
> restart_block in <linux/thread_info.h>. And <linux/thread_info.h> is =
definitely
> not ASSEMBLY-clean.
>=20
> So I came up with the patch (white-space damaged due to the GMail web=
 interface)
> below. Note that this changes the behavior for m68knommu, which didn'=
t include
> <asm/current.h> from <asm/thread_info.h> before. I hope it doesn't hu=
rt...

Unfortunately that breaks the m68knommu build:

/home/gerg/new-wave.2635/linux-2.6.x.git/arch/m68k/include/asm/current.=
h:=20
In function =E2=80=98get_current=E2=80=99:
/home/gerg/new-wave.2635/linux-2.6.x.git/arch/m68k/include/asm/current.=
h:21:=20
error: implicit declaration of function =E2=80=98current_thread_info=E2=
=80=99
=2E..

If we just wrap the include of asm/current.h with its own "#ifndef=20
__ASSEMBLY__", instead of moving it from above struct thread_info,
is that better for you?

Regards
Greg



> diff --git a/arch/m68k/include/asm/entry_mm.h b/arch/m68k/include/asm=
/entry_mm.h
> index 6f70823..73b8c8f 100644
> --- a/arch/m68k/include/asm/entry_mm.h
> +++ b/arch/m68k/include/asm/entry_mm.h
> @@ -3,6 +3,9 @@
>=20
>  #include <asm/setup.h>
>  #include <asm/page.h>
> +#ifdef __ASSEMBLY__
> +#include <asm/thread_info.h>
> +#endif
>=20
>  /*
>   * Stack layout in 'ret_from_exception':
> diff --git a/arch/m68k/include/asm/thread_info.h
> b/arch/m68k/include/asm/thread_info.h
> index f28775e..aec5eff 100644
> --- a/arch/m68k/include/asm/thread_info.h
> +++ b/arch/m68k/include/asm/thread_info.h
> @@ -22,6 +22,8 @@
>=20
>  #ifndef __ASSEMBLY__
>=20
> +#include <asm/current.h>
> +
>  struct thread_info {
>  	struct task_struct	*task;		/* main task structure */
>  	unsigned long		flags;
> @@ -49,8 +51,6 @@ struct thread_info {
>=20
>  #ifdef CONFIG_MMU
>=20
> -#include <asm/current.h>
> -
>  #ifdef ASM_OFFSETS_C
>  #define task_thread_info(tsk)	((struct thread_info *) NULL)
>  #else
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linu=
x-m68k.org
>=20
> In personal conversations with technical people, I call myself a hack=
er. But
> when I'm talking to journalists I just say "programmer" or something =
like that.
>                                 -- Linus Torvalds
>=20


--=20
-----------------------------------------------------------------------=
-
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.co=
m
SnapGear Group, McAfee                      PHONE:       +61 7 3435 288=
8
8 Gardner Close                             FAX:         +61 7 3217 532=
3
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.co=
m
