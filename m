From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH V2 1/4] vgaarb: Add support for setting the default video device
Date: Wed, 18 Apr 2012 11:44:52 +0200
Message-ID: <CAMuHMdUsMy1i+DSYt+tjGL-JX+DBY=v1JyMEPSyf8RwYCEkvxg@mail.gmail.com>
References: <1334607965-9582-1-git-send-email-mjg@redhat.com>
	<CAMuHMdVYSajTYmfXjtVRXhz0u=xW0LbQ5BxjR=n7PP77o0dXhw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:55804 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202Ab2DRJox convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 18 Apr 2012 05:44:53 -0400
In-Reply-To: <CAMuHMdVYSajTYmfXjtVRXhz0u=xW0LbQ5BxjR=n7PP77o0dXhw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: linux-kernel@vger.kernel.org, benh@kernel.crashing.org, airlied@redhat.com, Linux/m68k <linux-m68k@vger.kernel.org>

On Wed, Apr 18, 2012 at 11:37, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> On Mon, Apr 16, 2012 at 22:26, Matthew Garrett <mjg@redhat.com> wrote=
:
>> --- a/include/linux/vgaarb.h
>> +++ b/include/linux/vgaarb.h
>> @@ -31,6 +31,7 @@
>> =C2=A0#ifndef LINUX_VGA_H
>> =C2=A0#define LINUX_VGA_H
>>
>> +#include <video/vga.h>
>
> Is this include really needed? x86_64/allmodconfig builds fine withou=
t it.
>
> It causes m68k/allmodconfig to fail with:
>
> In file included from include/linux/vgaarb.h:35,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from drivers/=
gpu/drm/drm_irq.c:43:
> include/video/vga.h: In function =E2=80=98vga_mm_r=E2=80=99:
> include/video/vga.h:242: error: implicit declaration of function =E2=80=
=98z_readb=E2=80=99
> include/video/vga.h: In function =E2=80=98vga_mm_w=E2=80=99:
> include/video/vga.h:247: error: implicit declaration of function =E2=80=
=98z_writeb=E2=80=99
> include/video/vga.h: In function =E2=80=98vga_mm_w_fast=E2=80=99:
> include/video/vga.h:253: error: implicit declaration of function =E2=80=
=98z_writew=E2=80=99
> make[1]: *** [drivers/gpu/drm/drm_irq.o] Error 1
>
> http://kisskb.ellerman.id.au/kisskb/buildresult/6127136/
>
> Currently <video/vga.h> has a crude hack to make cirrusfb work on Ami=
ga,
> but that's the only VGA support m68k has.
> There's also no <asm/vga.h>, so m68k/allmodconfig with CONFIG_AMIGA
> disabled now fails with:
>
> In file included from include/linux/vgaarb.h:34,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from drivers/=
gpu/drm/drm_irq.c:42:
> include/video/vga.h:23:21: error: asm/vga.h: No such file or director=
y
> make[1]: *** [drivers/gpu/drm/drm_irq.o] Error 1
>
> Removing the #include <video/vga.h> fixes both cases.

Anyway, I'll move the hack for cirrusfb on Amiga to <asm/vga.h> on m68k=
=2E

You still may want to remove the include of <video/vga.h> if it's not n=
eeded.

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
