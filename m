From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Add private syscalls to support NPTL
Date: Fri, 11 Dec 2009 15:01:55 +0100
Message-ID: <10f740e80912110601o2b7f3f19sf0a3ee19fa2dbaad@mail.gmail.com>
References: <4A89D037.7090807@codesourcery.com>
	<4B1CBEE8.7000907@codesourcery.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <4B1CBEE8.7000907@codesourcery.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Maxim Kuvyrkov <maxim@codesourcery.com>
Cc: linux-m68k@vger.kernel.org, Andreas Schwab <schwab@linux-m68k.org>, uClinux development list <uclinux-dev@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Dec 7, 2009 at 09:38, Maxim Kuvyrkov <maxim@codesourcery.com> wrote=
:
> Maxim Kuvyrkov wrote:
>> The attached patches add kernel support for userspace NPTL bits for m68k=
.
>
> Here is yet another final version of the patch. =C2=A0As Andreas pointed =
out in
> another thread, the indentation is off in couple of places, so I fixed th=
at
> by formatting the code with scripts/Lindent. =C2=A0I also forwarded the
> reformatted version of the uClinux patch to uclinux-dev@.

> diff --git a/arch/m68k/include/asm/unistd.h b/arch/m68k/include/asm/unist=
d.h
> index 48b87f5..d076bea 100644
> --- a/arch/m68k/include/asm/unistd.h
> +++ b/arch/m68k/include/asm/unistd.h
> @@ -336,10 +336,14 @@
> =C2=A0#define __NR_pwritev =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 330
> =C2=A0#define __NR_rt_tgsigqueueinfo 331
> =C2=A0#define __NR_perf_event_open =C2=A0 332
> +#define __NR_read_tp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 333
> +#define __NR_write_tp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0334
> +#define __NR_atomic_cmpxchg_32 335
> +#define __NR_atomic_barrier =C2=A0 =C2=A0336

BTW, other architectures seem to call these __NR_[gs]et_thread_area
instead of __NR_{read,write}_tp?
Shouldn't we follow for consistency?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
							    -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
