From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: fix find_next bitops
Date: Wed, 30 Mar 2011 20:02:50 +0200
Message-ID: <AANLkTikKA2MY6nf+LLyJbNQffX=qYY3eZdpNmwVQc21u@mail.gmail.com>
References: <1301050810-11329-1-git-send-email-akinobu.mita@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:64022 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754863Ab1C3SCv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 30 Mar 2011 14:02:51 -0400
In-Reply-To: <1301050810-11329-1-git-send-email-akinobu.mita@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, Michael Schmitz <schmitzmic@googlemail.com>

On Fri, Mar 25, 2011 at 12:00, Akinobu Mita <akinobu.mita@gmail.com> wr=
ote:
> find_next bitops on m68k (find_next_zero_bit, find_next_bit, and
> find_next_bit_le) may cause out of bounds memory access
> when the bitmap size in bits % 32 !=3D 0 and offset (the bitnumber
> to start searching at) is very close to the bitmap size.
>
> For example,
>
> =C2=A0 =C2=A0 =C2=A0 unsigned long bitmap[2] =3D { 0, 0 };
> =C2=A0 =C2=A0 =C2=A0 find_next_bit(bitmap, 63, 62);
>
> 1. find_next_bit() tries to find any set bits in bitmap[1],
> =C2=A0 but no bits set.
>
> 2. Then find_first_bit(bimap + 2, -1)
>
> 3. Unfortunately find_fist_bit() takes unsigned int as the size argum=
ent.
>
> 4. find_first_bit will access bitmap[2~] until it find any set bits.
>
> This switches find_next bitops to use generic implementation of
> find bitops to fix the problem.

Andreas, do you think it's worth keeping (and fixing) the m68k "optimiz=
ed"
versions?

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
