From: Arnaud Lacombe <lacombar@gmail.com>
Subject: Re: [PATCH 01/11] arch/m68k: do not use EXTRA_{A,C,LD}FLAGS
Date: Mon, 15 Aug 2011 01:11:52 -0400
Message-ID: <CACqU3MUXhMGgVwgRYfwkC1N6cHj=U6zS+G8mSnZc5i6cn1PTug__21210.0280834877$1313385519$gmane$org@mail.gmail.com>
References: <1313384834-24433-1-git-send-email-lacombar@gmail.com>
	<1313384834-24433-2-git-send-email-lacombar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1313384834-24433-2-git-send-email-lacombar@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-m68k@lists.linux-m68k.org

Hi,

On Mon, Aug 15, 2011 at 1:07 AM, Arnaud Lacombe <lacombar@gmail.com> wr=
ote:
> Usage of these flags has been deprecated for nearly 4 years by:
>
> =A0 =A0commit f77bf01425b11947eeb3b5b54685212c302741b8
> =A0 =A0Author: Sam Ravnborg <sam@neptun.(none)>
> =A0 =A0Date: =A0 Mon Oct 15 22:25:06 2007 +0200
>
> =A0 =A0 =A0 =A0kbuild: introduce ccflags-y, asflags-y and ldflags-y
>
> Moreover, these flags (at least EXTRA_CFLAGS) have been documented fo=
r command
> line use. By default, gmake(1) do not override command line setting, =
so this is
> likely to result in build failure or unexpected behavior.
>
> Replace their usage by Kbuild's `{as,cc,ld}flags-y'.
>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: linux-m68k@lists.linux-m68k.org
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>

 - Arnaud

> ---
> =A0arch/m68k/fpsp040/Makefile =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/m68k/ifpsp060/Makefile =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/m68k/platform/54xx/Makefile | =A0 =A04 ++--
> =A03 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/m68k/fpsp040/Makefile b/arch/m68k/fpsp040/Makefile
> index 9506d88..628a351 100644
> --- a/arch/m68k/fpsp040/Makefile
> +++ b/arch/m68k/fpsp040/Makefile
> @@ -10,6 +10,6 @@ obj-y =A0 =A0:=3D bindec.o binstr.o decbin.o do_fun=
c.o gen_except.o get_op.o \
> =A0 =A0 =A0 =A0 =A0 =A0x_bsun.o x_fline.o x_operr.o x_ovfl.o x_snan.o=
 x_store.o \
> =A0 =A0 =A0 =A0 =A0 =A0x_unfl.o x_unimp.o x_unsupp.o bugfix.o skeleto=
n.o
>
> -EXTRA_LDFLAGS :=3D -x
> +ldflags-y :=3D -x
>
> =A0$(OS_OBJS): fpsp.h
> diff --git a/arch/m68k/ifpsp060/Makefile b/arch/m68k/ifpsp060/Makefil=
e
> index 43b4350..5ba2d1e 100644
> --- a/arch/m68k/ifpsp060/Makefile
> +++ b/arch/m68k/ifpsp060/Makefile
> @@ -6,4 +6,4 @@
>
> =A0obj-y :=3D fskeleton.o iskeleton.o os.o
>
> -EXTRA_LDFLAGS :=3D -x
> +ldflags-y :=3D -x
> diff --git a/arch/m68k/platform/54xx/Makefile b/arch/m68k/platform/54=
xx/Makefile
> index 6cfd090..967b51d 100644
> --- a/arch/m68k/platform/54xx/Makefile
> +++ b/arch/m68k/platform/54xx/Makefile
> @@ -8,8 +8,8 @@
> =A0# on the console port whenever a DBG interrupt occurs. You have to
> =A0# set up you HW breakpoints to trigger a DBG interrupt:
> =A0#
> -# EXTRA_CFLAGS +=3D -DTRAP_DBG_INTERRUPT
> -# EXTRA_AFLAGS +=3D -DTRAP_DBG_INTERRUPT
> +# ccflags-y +=3D -DTRAP_DBG_INTERRUPT
> +# ccflags-y +=3D -DTRAP_DBG_INTERRUPT
> =A0#
>
> =A0asflags-$(CONFIG_FULLDEBUG) :=3D -DDEBUGGER_COMPATIBLE_CACHE=3D1
> --
> 1.7.6.153.g78432
>
>
