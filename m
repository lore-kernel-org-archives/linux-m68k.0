From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari TT (next)
Date: Sun, 8 Jan 2012 20:53:07 +0100
Message-ID: <CAMuHMdWDYC7v+QZ-jv0gjjcYfNCR8FOn+XCUBGhnRQ6zuQo2VQ@mail.gmail.com>
References: <4F079F6B.8080502@fairlite.co.uk>
	<4F07EA66.6020603@gmail.com>
	<4F08E748.4020305@fairlite.co.uk>
	<4F0917E9.9090600@gmail.com>
	<CAMuHMdX2BaAp2N0e4aYPz7roaMFD14V1Y076geQQjpPw6-g-5Q@mail.gmail.com>
	<CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:40816 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab2AHTxI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Jan 2012 14:53:08 -0500
Received: by wibhm6 with SMTP id hm6so2128573wib.19
        for <linux-m68k@vger.kernel.org>; Sun, 08 Jan 2012 11:53:07 -0800 (PST)
In-Reply-To: <CAOmrzkJ6eCKCd0FRfYk7C5VvJeyhRT9Y7yy8m-mGPQeOaRScuQ@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Alan Hourihane <alanh@fairlite.co.uk>, Linux/m68k <linux-m68k@vger.kernel.org>

Hi Michael,

On Sun, Jan 8, 2012 at 20:21, Michael Schmitz <schmitzmic@googlemail.co=
m> wrote:
>>> ST-RAM (breaking the above assumption). Something similar is done f=
or Amiga
>>> chip RAM - exactly how does the chip RAM situation differ, Geert? I=
s chip
>>> RAM being claimed by mem_init or is it being left aside?
>>
>> Chip RAM is different in that Linux (unlike AmigaOS) doesn't use it =
as
>> system RAM.
>> Being on the Zorro II bus (first 16 MiB), it's slow on most machines=
 and doesn't
>> support RMW cycles (needed for page tables) on Zorro III-capable mac=
hines.
>> In general, we don't use Z2 RAM as system memory on Z3 capable machi=
nes.
>
> But is its physical address lower than the kernel segment's, as in th=
is case?

Yes, Zorro II space is the first 16 MiB.
But it's handled completely separately from system RAM.
Its mapping is set up in mmu_init_amiga() in head.S.

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
