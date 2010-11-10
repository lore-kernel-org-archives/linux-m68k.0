From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: compile error on latest git m68k kernel
Date: Wed, 10 Nov 2010 10:17:35 +0100
Message-ID: <AANLkTi=pzN+7-wQMsVeV4AgVBYA-mGt42MwazaLPmVhg@mail.gmail.com>
References: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:41945 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753516Ab0KJJRh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 10 Nov 2010 04:17:37 -0500
Received: by bwz15 with SMTP id 15so492852bwz.19
        for <linux-m68k@vger.kernel.org>; Wed, 10 Nov 2010 01:17:35 -0800 (PST)
In-Reply-To: <AANLkTimA0ZOhNo=RO5ZhrQFNA6wWORekgj42dMNhnpGY@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Wed, Nov 10, 2010 at 08:08, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
> seen this before?

Not this particular one...

> =C2=A0LD =C2=A0 =C2=A0 =C2=A0.tmp_vmlinux1
> fs/built-in.o: In function `alignfile':
> binfmt_elf.c:(.text+0x307bc): undefined reference to `__divdi3'
> fs/built-in.o: In function `elf_core_dump':
> binfmt_elf.c:(.text+0x3139c): undefined reference to `__divdi3'
> make: *** [.tmp_vmlinux1] Error 1
>
> Apparently caused by the roundup macro in include/linux/kernel.h:
>
> #define roundup(x, y) ( =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0typeof(y) __y =3D y; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0(((x) + (__y - 1)) / __y) * __y; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> }
>
> Toolchain issue?

=2E.. but depending on the version of gcc, we sometimes need things lik=
e
this, cfr.
arch/m68k/lib/. The fix is to add a __divdi3 there.

Which version are you using?

> =C2=A0MIchael (who just wanted to try out the genrtc driver on Atari =
:-( ...)

Genrtc (which is obsolete) or rtc-generic (to be obsoleted by rtc-cmos
on Atari ;-)?

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
