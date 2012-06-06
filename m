From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()
Date: Wed, 6 Jun 2012 15:44:03 +0200
Message-ID: <CAMuHMdW0XqO9iOiuOXrRao_A41L-0iZXXyZugCmiizG=7-VkHg@mail.gmail.com>
References: <1338327216-15309-1-git-send-email-geert@linux-m68k.org>
	<20120530102226.GA28628@frolo.macqel>
	<CAMuHMdV5GVZR1BvGD3EncDFfPt=Bt9ndkKE8Mp7euE9KoSaGNQ@mail.gmail.com>
	<20120530140444.GA10543@frolo.macqel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120530140444.GA10543@frolo.macqel>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Philippe De Muyter <phdm@macqel.be>
Cc: linux-m68k@lists.linux-m68k.org, Greg Ungerer <gerg@uclinux.org>, linux-kernel@vger.kernel.org

On Wed, May 30, 2012 at 4:04 PM, Philippe De Muyter <phdm@macqel.be> wr=
ote:
>> > Sorry, I did not follow what happened to unaligned accesses, but
>> > CPU32 family (at least 68340) crashes on unaligned accesses.
>>
>> We don't seem to have CONFIG_M68340 in arch/m68k/Kconfig.cpu?
>
> I have a local port here (but based on an ancient linux kernel, 2.6.2=
 IIRC)

Just to be sure: basically include/asm-m68knommu/unaligned.h has always
been wrong (also in 2.6.2), so you had to fix this locally?

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
