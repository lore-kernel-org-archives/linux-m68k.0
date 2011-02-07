From: Michael Schmitz <schmitzmic@googlemail.com>
Subject: Re: find_next bitops on m68k may cause out of bounds memory access
Date: Tue, 8 Feb 2011 10:22:30 +1300
Message-ID: <AANLkTi=LA1fmipUSycAEk48TwVXhzwbY5KMSfu=YMiCy@mail.gmail.com>
References: <AANLkTik00GTZDn=t6J65dHjJiU53M5vXzBqToiYWz33P@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <AANLkTik00GTZDn=t6J65dHjJiU53M5vXzBqToiYWz33P@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Akinobu Mita <akinobu.mita@gmail.com>
Cc: linux-m68k@lists.linux-m68k.org

Thanks for spotting this - does anyone remember when this version of
find_next bitops was first introduced?

I wonder whether this might explain our crashes while using SLUB in
recent kernels.

  Michael

On Tue, Feb 8, 2011 at 1:37 AM, Akinobu Mita <akinobu.mita@gmail.com> w=
rote:
> find_next bitops on m68k (find_next_zero_bit, find_next_bit, and
> ext2_find_next_bit) may cause out of bounds memory access
> when the bitmap size in bits % 32 !=3D 0 and offset (the bitnumber
> to start searching at) is very close to the bitmap size.
>
> For example,
>
> =A0 =A0 =A0 =A0unsigned long bitmap[2] =3D { 0, 0};
> =A0 =A0 =A0 =A0find_next_bit(bitmap, 63, 62)
>
> 1. find_next_bit() tries to find any set bits in bitmap[1], but no bi=
ts set
>
> 2. Then find_first_bit(bimap + 2, -1)
>
> 3. Unfortunately find_fist_bit() takes unsigned int as the size argum=
ent.

Can't that be changed? After all, find_next_bit takes int as size as we=
ll.

> 4. find_first_bit will access bitmap[3~] until it find any set bits.
>
> Here is find_next_bit() in arch/m68k/include/asm/bitops_mm.h:
>
> static inline int find_next_bit(const unsigned long *vaddr, int size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int of=
fset)
> {
> =A0 =A0 =A0 =A0const unsigned long *p =3D vaddr + (offset >> 5);
> =A0 =A0 =A0 =A0int bit =3D offset & 31UL, res;
>
> =A0 =A0 =A0 =A0if (offset >=3D size)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return size;
>
> =A0 =A0 =A0 =A0if (bit) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long num =3D *p++ & (~0UL << =
bit);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0offset -=3D bit;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Look for one in first longword */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0__asm__ __volatile__ ("bfffo %1{#0,#0}=
,%0"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0: "=3Dd" (res) : "d" (num & -num));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (res < 32)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return offset + (res ^=
 31);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0offset +=3D 32;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0/* No one yet, search remaining full bytes for a one *=
/

I'll try adding a sanity check here to see whether this actually
causes any trouble with SLUB.

> =A0 =A0 =A0 =A0res =3D find_first_bit(p, size - ((long)p - (long)vadd=
r) * 8);
> =A0 =A0 =A0 =A0return offset + res;
> }
>
> find_next_zero_bit and ext2_find_next_bit also have same problem.
> Actually I found this while testing ext2_find_next_bit in user space.
>
> The easiest and reliable way to fix this is that switching to generic
> implementation of find bitops.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
