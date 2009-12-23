From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 9/15] arch/m68k: Use DIV_ROUND_CLOSEST
Date: Wed, 23 Dec 2009 20:20:37 +0100
Message-ID: <10f740e80912231120r363c4e0cg9b10053788fc16d9@mail.gmail.com>
References: <Pine.LNX.4.64.0908021047280.15557@ask.diku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755517AbZLWTUl@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0908021047280.15557@ask.diku.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia@diku.dk>
Cc: zippel@linux-m68k.org, linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Sun, Aug 2, 2009 at 09:47, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/=
2)/d
> but is perhaps more readable.

Thanks, applied.

> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
>
> // <smpl>
> @haskernel@
> @@
>
> #include <linux/kernel.h>
>
> @depends on haskernel@
> expression x,__divisor;
> @@
>
> - (((x) + ((__divisor) / 2)) / (__divisor))
> + DIV_ROUND_CLOSEST(x,__divisor)
> // </smpl>
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
>
> ---
> =C2=A0arch/m68k/amiga/config.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/amiga/config.c b/arch/m68k/amiga/config.c
> index 6e56275..002b9b0 100644
> --- a/arch/m68k/amiga/config.c
> +++ b/arch/m68k/amiga/config.c
> @@ -480,7 +480,7 @@ static void __init amiga_sched_init(irq_handler_t=
 timer_routine)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0static struct resource sched_res =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "tim=
er", .start =3D 0x00bfd400, .end =3D 0x00bfd5ff,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> - =C2=A0 =C2=A0 =C2=A0 jiffy_ticks =3D (amiga_eclock+HZ/2)/HZ;
> + =C2=A0 =C2=A0 =C2=A0 jiffy_ticks =3D DIV_ROUND_CLOSEST(amiga_eclock=
, HZ);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (request_resource(&mb_resources._ciab, =
&sched_res))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk("Cannot=
 allocate ciab.ta{lo,hi}\n");
>



--=20
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
