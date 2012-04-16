From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: Atari ROM port ISA
Date: Tue, 17 Apr 2012 08:21:51 +1200
Message-ID: <CAOmrzkLWAq3LJikDWLZojwYh5UGjBgW=kh_ip0rw_D9svUg2tA@mail.gmail.com>
References: <alpine.DEB.2.00.1204151113430.31626@ayla.of.borg>
	<4F8BCF49.4060109@gmail.com>
	<CAMuHMdXo=A581yup5uw3sPN_eMg_7nood_wmb7qEOWs+rEoSmw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXo=A581yup5uw3sPN_eMg_7nood_wmb7qEOWs+rEoSmw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@lists.linux-m68k.org>

Hi Geert,

On Mon, Apr 16, 2012 at 9:42 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Apr 16, 2012 at 09:50, Michael Schmitz
> <schmitzmic@googlemail.com> wrote:
>>> | #define rom_out_be16(addr, w) =A0 ({u16 __w, __v =3D (w); __w =3D=
 ((*(__force
>>> volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
>>> | #define rom_out_be32(addr, l) =A0 ({u32 __w, __v =3D (l); __w =3D=
 ((*(__force
>>> volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
>>> | #define rom_out_le16(addr, w) =A0 ({u16 __w, __v =3D cpu_to_le16(=
w); __w =3D
>>> ((*(__force volatile u16 *) ((addr) + 0x10000 + (__v<<1)))); })
>>> | #define rom_out_le32(addr, l) =A0 ({u32 __w, __v =3D cpu_to_le32(=
l); __w =3D
>>> ((*(__force volatile u32 *) ((addr) + 0x10000 + (__v<<1)))); })
>>>
>>> The above four also can't work. Remove them?
>>
>> Probably - not sure what the behavior will be if writing more than o=
ne byte
>> (might not be safe to use). Using dummies (potentially to generate c=
ompiler
>> warnings or =A0runtime warnings) might be safer.
>
> As soon as the value you're writing is bigger than 0x7fff, you'll get=
 out of the
> 64 KiB write window.

That's correct - on the ISA side only eight bits are wired up anyway
so ((addr) + 0x10000 + (( __v & 0xFF )<<1)) is making sure we only
write what's possible to write. The only side effect of the le[16,32]
versions is to put a different byte in the one-byte write aperture.
That's purely academic so let's lose it.

As Andreas has confirmed, there's no way the adapter hardware could be
extended to write full 16 bit words even if the design was changed to
use the full data bus width (by using tri-state latches so the same
ISA data lines can be wired to both data and address lines of the ROM
port, possibly) - since we need the A0 bit as read/write select we
only have 15 address bits left for writes.

Does this make sense? Either way, we only need byte reads and writes
so please remove the rest.

Cheers,

  Michael
