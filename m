From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge mmu and non-mmu bitops.h
Date: Thu, 23 Jun 2011 19:30:48 +0200
Message-ID: <BANLkTimmPO3Vyt-rxD2_9B3rsS-DWtho8g@mail.gmail.com>
References: <1308792524-22126-1-git-send-email-gerg@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <1308792524-22126-1-git-send-email-gerg@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>
List-Id: linux-m68k@vger.kernel.org

On Thu, Jun 23, 2011 at 03:28,  <gerg@snapgear.com> wrote:
> @@ -10,6 +10,9 @@ config ARCH_MAY_HAVE_PC_FDC
> =C2=A0config ARCH_USES_GETTIMEOFFSET
> =C2=A0 =C2=A0 =C2=A0 =C2=A0def_bool y
>
> +config CPU_HAS_BITFIELDS
> + =C2=A0 =C2=A0 =C2=A0 bool
> +
> =C2=A0config EISA
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool
> =C2=A0 =C2=A0 =C2=A0 =C2=A0---help---
> @@ -223,6 +226,7 @@ comment "Processor type"
>
> =C2=A0config M68020
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "68020 support"
> + =C2=A0 =C2=A0 =C2=A0 select CPU_HAS_BITFIELDS
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you anticipate running this kernel o=
n a computer with a MC68020
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0processor, say Y. Otherwise, say N. Not=
e that the 68020 requires a

Upon second thought, this won't work for multi-CPU kernels, as there's
no runtime
check. The logic needs to be reverted, like:

config CPU_HAS_NO_BITFIELDS
        bool

config M680000
        bool "68000 support"
        select CPU_HAS_NO_BITFIELDS

so a kernel built to run on both 68000 and 68020 will not use the
bitfield instructions.
Sorry I didn't realize that earlier.

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
