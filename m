From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: remove unnecessary code
Date: Thu, 16 Jun 2011 19:23:25 +0200
Message-ID: <BANLkTimLFpdy=bOE4wYd0EpORj0O_X4gZQ@mail.gmail.com>
References: <1308242527-28971-1-git-send-email-Gregory.Dietsche@cuw.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1308242527-28971-1-git-send-email-Gregory.Dietsche@cuw.edu>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Cc: linux-m68k@lists.linux-m68k.org, kernel-janitors@vger.kernel.org

On Thu, Jun 16, 2011 at 18:42, Greg Dietsche <Gregory.Dietsche@cuw.edu>=
 wrote:
> remove unnecessary code that matches this coccinelle pattern
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (...)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;
>
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>

Thanks, will queue for 3.1.

> ---
> =C2=A0arch/m68k/math-emu/fp_log.c | =C2=A0 =C2=A03 ---
> =C2=A01 files changed, 0 insertions(+), 3 deletions(-)
>
> diff --git a/arch/m68k/math-emu/fp_log.c b/arch/m68k/math-emu/fp_log.=
c
> index 367ecee..3384a52 100644
> --- a/arch/m68k/math-emu/fp_log.c
> +++ b/arch/m68k/math-emu/fp_log.c
> @@ -105,9 +105,6 @@ fp_fetoxm1(struct fp_ext *dest, struct fp_ext *sr=
c)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fp_monadic_check(dest, src);
>
> - =C2=A0 =C2=A0 =C2=A0 if (IS_ZERO(dest))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dest;
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return dest;
> =C2=A0}
>
> --
> 1.7.2.5
>
>



--=20
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
