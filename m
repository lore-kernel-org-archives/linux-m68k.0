From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 33/35] m68k: do not use m68k startup or interrupt code for
 ColdFire CPU's
Date: Sun, 25 Dec 2011 21:33:23 +0100
Message-ID: <CAMuHMdX00Q9PFWPXRBRyMCFJgXaCmBtP7RLB-R+mU58iPHLwCA@mail.gmail.com>
References: <1324610148-20666-1-git-send-email-gerg@snapgear.com>
	<1324610148-20666-34-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:58574 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751129Ab1LYUdZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 25 Dec 2011 15:33:25 -0500
Received: by wibhm6 with SMTP id hm6so4078006wib.19
        for <linux-m68k@vger.kernel.org>; Sun, 25 Dec 2011 12:33:23 -0800 (PST)
In-Reply-To: <1324610148-20666-34-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Fri, Dec 23, 2011 at 04:15,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> The ColdFire CPUs have their own startup and interrupt code (in the
> platform/coldfire directory), and do not use the general m68k startup
> and interrupt code. So if CONFIG_COLDFIRE is true do not compile the
> general code for them.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> Acked-by: Matt Waddel <mwaddel@yahoo.com>
> Acked-by: Kurt Mahan <kmahan@xmission.com>
> ---
> =C2=A0arch/m68k/kernel/Makefile | =C2=A0 =C2=A04 +++-
> =C2=A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/kernel/Makefile b/arch/m68k/kernel/Makefile
> index ea0a396..a327816 100644
> --- a/arch/m68k/kernel/Makefile
> +++ b/arch/m68k/kernel/Makefile
> @@ -4,13 +4,15 @@
>
> =C2=A0extra-$(CONFIG_MMU) =C2=A0 =C2=A0:=3D head.o
> =C2=A0extra-$(CONFIG_SUN3) =C2=A0 :=3D sun3-head.o
> +extra-$(CONFIG_COLDFIRE):=3D

Why do you need the line above?

> =C2=A0extra-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D vmlinux.lds
>
> =C2=A0obj-y =C2=A0:=3D entry.o init_task.o irq.o m68k_ksyms.o module.=
o process.o ptrace.o
> =C2=A0obj-y =C2=A0+=3D setup.o signal.o sys_m68k.o syscalltable.o tim=
e.o traps.o
>
> +ifndef CONFIG_COLDFIRE
> =C2=A0obj-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0+=3D ints.o vectors.o
> -
> +endif

Alternatively:

obj-$(CONFIG_MMU_MOTOROLA) +=3D ints.o vectors.o
obj-$(CONFIG_MMU_SUN3) +=3D ints.o vectors.o

> =C2=A0ifndef CONFIG_MMU_SUN3
> =C2=A0obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0+=3D dma.o
> =C2=A0endif

Hmm, here it's more difficult to get rid of the "ifndef", as there's
no CONFIG_NOMMU.

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
