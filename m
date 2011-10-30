From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 24/36] m68k: compile appropriate mm arch files for
 ColdFire V4e MMU support
Date: Sun, 30 Oct 2011 14:46:17 +0100
Message-ID: <CAMuHMdUZqddsHwWoBqnB+nLBRqHOGOVZwqzoZGC0FEByDwA8kw@mail.gmail.com>
References: <1319527168-11166-1-git-send-email-gerg@snapgear.com>
	<1319527168-11166-25-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:34293 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755548Ab1J3NqS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 30 Oct 2011 09:46:18 -0400
Received: by iaby12 with SMTP id y12so6113019iab.19
        for <linux-m68k@vger.kernel.org>; Sun, 30 Oct 2011 06:46:17 -0700 (PDT)
In-Reply-To: <1319527168-11166-25-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Tue, Oct 25, 2011 at 09:19,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Compile the mcfmmu.c code when the ColdFire V4e MMU is enabled.
> And don't compile the unnecessary hwtest.c code for it.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/mm/Makefile | =C2=A0 =C2=A08 +++++++-
> =C2=A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/mm/Makefile b/arch/m68k/mm/Makefile
> index 09cadf1..1732e31 100644
> --- a/arch/m68k/mm/Makefile
> +++ b/arch/m68k/mm/Makefile
> @@ -4,6 +4,12 @@
>
> =C2=A0obj-y =C2=A0:=3D init.o
>
> -obj-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 cache.o fault.o hwtest.o
> +obj-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 cache.o fault.o
> =C2=A0obj-$(CONFIG_MMU_MOTOROLA) =C2=A0 =C2=A0 +=3D kmap.o memory.o m=
otorola.o
> =C2=A0obj-$(CONFIG_MMU_SUN3) =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D sun3kma=
p.o sun3mmu.o
> +
> +ifdef CONFIG_COLDFIRE
> +obj-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 kmap.o memory.o mcfmmu.o

What about introducing CONFIG_MMU_COLDFIRE and writing

obj-$(CONFIG_MMU_MOTOROLA) +=3D kmap.o memory.o mcfmmu.o

instead?

It could turn out to be useful in other places too, especially when con=
sidering
merging more mm/no sources files.

> +else
> +obj-$(CONFIG_MMU) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D=
 hwtest.o
> +endif

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
