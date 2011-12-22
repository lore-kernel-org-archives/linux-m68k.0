From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68knommu: add missing make rule for Palm/Pilot bitmap
 boot logo
Date: Thu, 22 Dec 2011 08:18:47 +0100
Message-ID: <CAMuHMdVjEn2cNvPCYegp3gweNp_98XjPvoBEf20J5jQ++UNLkA@mail.gmail.com>
References: <1324537383-16741-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:63138 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252Ab1LVHSt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 22 Dec 2011 02:18:49 -0500
Received: by wgbdr13 with SMTP id dr13so15429145wgb.1
        for <linux-m68k@vger.kernel.org>; Wed, 21 Dec 2011 23:18:48 -0800 (PST)
In-Reply-To: <1324537383-16741-1-git-send-email-gerg@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: gerg@snapgear.com
Cc: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, Greg Ungerer <gerg@uclinux.org>

On Thu, Dec 22, 2011 at 08:03,  <gerg@snapgear.com> wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>
> Compiling for the m68knommu/68328 Palm/Pilot target you get:
>
> =C2=A0AS =C2=A0 =C2=A0 =C2=A0arch/m68k/platform/68328/head-pilot.o
> arch/m68k/platform/68328/head-pilot.S:37:23: fatal error: bootlogo.rh=
: No such file or directory
>
> The Makefile contains rules to make the bootlogo.rh file from the C s=
ource
> bootlogo.h. But it is missing a dependency that compiling head-pilot.=
S needs
> bootlogo.rh.
>
> Signed-off-by: Greg Ungerer <gerg@uclinux.org>
> ---
> =C2=A0arch/m68k/platform/68328/Makefile | =C2=A0 =C2=A03 +++
> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/arch/m68k/platform/68328/Makefile b/arch/m68k/platform/6=
8328/Makefile
> index e4dfd8f..704e36d 100644
> --- a/arch/m68k/platform/68328/Makefile
> +++ b/arch/m68k/platform/68328/Makefile
> @@ -16,6 +16,9 @@ obj-$(CONFIG_ROM) =C2=A0 =C2=A0 +=3D romvec.o
> =C2=A0extra-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D head.o
> =C2=A0extra-$(CONFIG_M68328) +=3D bootlogo.rh head.o
>
> +$(obj)/head-pilot.o: $(obj)/bootlogo.rh
> +$(obj)/head-rom.o: $(obj)/bootlogo.rh
> +
> =C2=A0$(obj)/bootlogo.rh: $(src)/bootlogo.h
> =C2=A0 =C2=A0 =C2=A0 =C2=A0perl $(src)/bootlogo.pl < $(src)/bootlogo.=
h > $(obj)/bootlogo.rh

Nothing serious, you just made me wondering:
 1. Any chance bootlogo.h can be generated from a more edit-friendly fo=
rmat,
    cfr. drivers/video/logo/?
 2. Why do you include the *.rh file from an assembler source file, ins=
tead of
    including the *.h file from a C source file?

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
