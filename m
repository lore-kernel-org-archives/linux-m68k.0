From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: cirrusfb: Picasso 4 card
Date: Wed, 4 Mar 2009 22:46:59 +0100
Message-ID: <10f740e80903041346g66852195t6ba370f0d7c7a65a@mail.gmail.com>
References: <20090224223702.86f7e129.krzysztof.h1@poczta.fm>
	 <10f740e80902250048j31a9a2c5n5c39066ba156c10d@mail.gmail.com>
	 <20090225093729.GA18736@chumley.debian.net>
	 <20090304212348.7d1e7df3.krzysztof.h1@poczta.fm>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20090304212348.7d1e7df3.krzysztof.h1@poczta.fm>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Krzysztof Helt <krzysztof.h1@poczta.fm>
Cc: "Christian T. Steigies" <cts@debian.org>, linux-m68k@lists.linux-m68k.org

On Wed, Mar 4, 2009 at 21:23, Krzysztof Helt <krzysztof.h1@poczta.fm> w=
rote:
> I have finished Cirrus GD5446 chip fixes for x86.
> The same chipset is used on the Picasso 4 card.

Thanks a lot!

> I would be grateful if you can test the cirrusfb driver
> with your Zorro =C2=A0card.

Unfortunately I don't have a Picasso card, and Christian has a Picasso
IV in an Amiga 2000,
which has Zorro II slots only.

> I am not Amiga specialist I see that these defines
> are not used in the driver.
>
> #define =C2=A0ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_MEM1 =C2=A0 =C2=
=A0 =C2=A0 ZORRO_ID(VILLAGE_TRONIC, 0x15, 0)
> #define =C2=A0ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_MEM2 =C2=A0 =C2=
=A0 =C2=A0 ZORRO_ID(VILLAGE_TRONIC, 0x16, 0)
> #define =C2=A0ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_REG =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ZORRO_ID(VILLAGE_TRONIC, 0x17, 0)
>
> Does anybody know how to use them inside the driver?

Zorro II is a 16-bit bus with 24-bit adressing.
Zorro III is a faster 32-bit bus with 32-bit adressing.

The Picasso IV can work in both Zorro II and Zorro III mode. But
currently cirrusfb handles Zorro III mode only.

As Zorro II doesn't provide much address space, the Picasso IV shows
up as _3_ separate Zorro devices in Zorro II mode, hence the 3
different Zorro IDs.

=46rom a conversation I had with Christian 4 years ago:

--- snip ---

zorro.ids has:

0877  Village Tronic
        1500  Picasso IV Z2 RAM [Graphics Card]
        1600  Picasso IV Z2 RAM [Graphics Card]
        1700  Picasso IV Z2 [Graphics Card]
        1800  Picasso IV Z3 [Graphics Card]


`lszorro -v -v' shows:

Your Z2 has 3 Zorro IDs:

> 01: Village Tronic Picasso IV Z2 RAM [Graphics Card]
>       Type: Zorro II
>       Address: 00200000 (00200000 bytes)
>       Serial number: 00000000
>       Slot address: 0020
>       Slot size: 0020

2 MiB for the graphics memory

> 02: Village Tronic Picasso IV Z2 RAM [Graphics Card]
>       Type: Zorro II
>       Address: 00400000 (00200000 bytes)
>       Serial number: 00000000
>       Slot address: 0040
>       Slot size: 0020

Another 2 MiB for the graphics memory. You have a 4 MiB card? (yes, of =
course,
since it does 1024x768x24). Probably they used 2x2 MiB instead of 1x4 M=
iB to
reduce pressure on the Z2 address space.

> 03: Village Tronic Picasso IV Z2 [Graphics Card]
>       Type: Zorro II
>       Address: 00ec0000 (00020000 bytes)
>       Serial number: 00000000
>       Slot address: 00ec
>       Slot size: 0002

128 kiB for the registers.

Z3 cards have only one ID, since Z3 has plenty of address space. So the
`difficult' part is to find out how the pieces are related.

And it may become tricky if the 2 pieces of 2 MiB are not contiguous in
memory. Hmm, probably that's impossible, since I guess the 3 parts are =
always
initialized after each other. So if there's enough Z2 space to handle t=
he full
4 MiB, it will be contiguous, else only the first 2 MiB will be there.

---snip---

To handle Zorro II mode, the driver needs to handle the 3 IDs.

Probably you can add ZORRO_PROD_VILLAGE_TRONIC_PICASSO_IV_Z2_REG to
cirrusfb_zorro_table[],
and handle the other 2 IDs using zorro_find() in the probe code.

I thought to remember Christian once emailed me more register offset
info for the Zorro II mode, but I can't seem to find it.

=46ortunately we still have the NetBSD source at
http://cvsweb.netbsd.org/bsdweb.cgi/~checkout~/src/sys/arch/amiga/dev/g=
rf_cl.c?rev=3D1.41&content-type=3Dtext/plain&only_with_tag=3DMAIN

=46or Picasso IV, look for the code that matches with
zap->prodid =3D 21/22/23 (0x15/0x16/0x17 i.e. Picasso IV Z2)
zap->prodid =3D 24 (0x18 i.e. Picasso IV Z3)

The relevant part is:

    switch (zap->prodid) {
        case 21:
            cl_fbaddr =3D zap->va;
            cl_fbautosize =3D zap->size;
            break;
        case 22:
            cl_fbautosize +=3D zap->size;
            break;
        case 23:
            cl_regaddr =3D (void *)((unsigned long)(zap->va) + 0x10000)=
;
            break;
        case 24:
            cl_regaddr =3D (void *)((unsigned long)(zap->va) + 0x600000=
);
            /* check for PicassoIV with 64MB config and handle it */
            if (zap->size =3D=3D 0x04000000) {
                cl_fbaddr =3D (void *)((unsigned long)(zap->va) + 0x020=
00000);
            } else {
                cl_fbaddr =3D (void *)((unsigned long)(zap->va) + 0x010=
00000);
            }
            cl_fbautosize =3D 0x400000;
            break;
        default:
            return (0);
    }

So in Zorro III mode, the Cirrus Logic's chip registers are at offset
0x600000 of the single Zorro device,
while the frame buffer can be at offset 0x1000000 or 0x2000000
(cirrusfb seems to handle the former case only?).

In Zorro II mode, the Cirrus Logic's chip registers are at offset
0x10000 of the `reg' Zorro device,
while the 1 or 2 `RAM' Zorro devices are the frame buffer memory (2
MiB or 4 MiB).

Hope this helps...

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
