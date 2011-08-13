From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: merge the mmu and non-mmu kernel/Makefiles
Date: Sat, 13 Aug 2011 16:27:37 +0200
Message-ID: <CAMuHMdWKBP5waPOrOaHN2pbsUyrur07Ok2dHFiuZi2xzPmD2AQ@mail.gmail.com>
References: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f170.google.com ([209.85.210.170]:48489 "EHLO
	mail-iy0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987Ab1HMO1i convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Aug 2011 10:27:38 -0400
Received: by iye16 with SMTP id 16so3709101iye.1
        for <linux-m68k@vger.kernel.org>; Sat, 13 Aug 2011 07:27:37 -0700 (PDT)
In-Reply-To: <1313038044-25522-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Aug 11, 2011 at 06:47,  <gerg@snapgear.com> wrote:
> --- a/arch/m68k/kernel/Makefile
> +++ b/arch/m68k/kernel/Makefile
> @@ -1,5 +1,20 @@
> -ifdef CONFIG_MMU
> -include arch/m68k/kernel/Makefile_mm
> -else
> -include arch/m68k/kernel/Makefile_no
> +#
> +# Makefile for the linux kernel.
> +#
> +
> +extra-$(CONFIG_MMU) =C2=A0 =C2=A0:=3D head.o
> +extra-$(CONFIG_SUN3) =C2=A0 :=3D sun3-head.o
> +extra-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0+=3D vmlinux.lds
> +
> +obj-y =C2=A0:=3D entry.o m68k_ksyms.o process.o ptrace.o setup.o sig=
nal.o \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sys_m68k.o syscalltable.o time.o =
traps.o
> +
> +obj-y$(CONFIG_MMU_SUN3) +=3D dma.o =C2=A0 =C2=A0 =C2=A0 # no, it's n=
ot a typo
> +obj-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0+=3D ints.o module.o devres.o

On MMU, we unconditionally build module.c.

> +devres-$(CONFIG_MMU) =C2=A0 =3D ../../../kernel/irq/devres.o
> +
> +ifndef CONFIG_MMU
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
+=3D init_task.o irq.o
> +obj-$(CONFIG_MODULES) =C2=A0 +=3D module.o

On nommu, it depends on CONFIG_MODULES.

However, most inside module.c is already protected by #ifdef CONFIG_MOD=
ULES.
Except for module_fixup(), which is empty for nommu. After moving the w=
hole
module_fixup() inside #ifdef CONFIG_MMU, you can consolidate the module=
=2Eo
entry in the Makefile.

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
