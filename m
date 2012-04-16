From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Atari ROM port ISA
Date: Mon, 16 Apr 2012 11:42:37 +0200
Message-ID: <CAMuHMdXo=A581yup5uw3sPN_eMg_7nood_wmb7qEOWs+rEoSmw@mail.gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F8BCF49.4060109@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

On Mon, Apr 16, 2012 at 09:50, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>> | #define rom_out_be16(addr, w) =C2=A0 ({u16 __w, __v =3D (w); __w =3D=
 ((*(__force
>> volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
>> | #define rom_out_be32(addr, l) =C2=A0 ({u32 __w, __v =3D (l); __w =3D=
 ((*(__force
>> volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
>> | #define rom_out_le16(addr, w) =C2=A0 ({u16 __w, __v =3D cpu_to_le1=
6(w); __w =3D
>> ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
>> | #define rom_out_le32(addr, l) =C2=A0 ({u32 __w, __v =3D cpu_to_le3=
2(l); __w =3D
>> ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
>>
>> The above four also can't work. Remove them?
>
> Probably - not sure what the behavior will be if writing more than on=
e byte
> (might not be safe to use). Using dummies (potentially to generate co=
mpiler
> warnings or =C2=A0runtime warnings) might be safer.

As soon as the value you're writing is bigger than 0x7fff, you'll get o=
ut of the
64 KiB write window.

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
