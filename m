From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Multiple Memory Chunks
Date: Sat, 10 Aug 2013 13:46:16 +0200
Message-ID: <CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com>
References: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:46523 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757673Ab3HJLqR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 10 Aug 2013 07:46:17 -0400
Received: by mail-pb0-f51.google.com with SMTP id jt11so5343290pbb.24
        for <linux-m68k@vger.kernel.org>; Sat, 10 Aug 2013 04:46:16 -0700 (PDT)
In-Reply-To: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Cc: debian-68k@lists.debian.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Tue, Aug 6, 2013 at 9:54 AM, Ingo J=C3=BCrgensmann <ij@2013.bluespic=
e.org> wrote:
> Apparently the linux kernel only utilizes the largest memory chunk wi=
th
> highest priority on Amigas:

That's not entirely correct: it uses all (up to the configured limit) c=
hunks,
as long as the first chunk is the chunk with the lowest physical addres=
s.

> [    0.000000] Ignoring memory chunk at 0x7400000:0xc00000 before the=
 first
> chunk
>
> That's the 12 MB FastMem on the mainboard of Spice (A3000), running
> 3.2.0-4-amiga.
>
> I load the kernel with a memory file:
>
> amiboot-5.6 -m sys:work/debian/amiga/memfile -k vmlinux-3.2.0-4-amiga
> "root=3D/dev/sda5 video=3Dcirrusfb:mode=3D800x600-60 devtmpfs.mount=3D=
1"
>
> Memfile:
> 2097152
> 0x08000000 67108864
> 0x07400000 12582912

As 0x07400000 < 0x08000000, the kernel ignores the second chunk.
>
> So, apparently the second FastMem chunk is ignored by the kernel itse=
lf. Is
> there a way to make use of the additional 12 MB RAM? Although it's no=
t as
> fast as the 32bit memory on the accelerator card (64MB), it is still =
faster
> than swapping to/from disk.

If you reverse the order of the chunks, it will use both. Unfortunately=
 the
kernel will be in the slowest chunk.

> Especially this becomes important when we want to put BigRamPlus RAM
> extensions into Amigas. Those are 256MB RAM extensions via ZorroIII b=
us and
> the port would highly benefit from supporting multiple memory chunks.=
 Is
> this possible?

I'd expect a Zorro III RAM expansion to end up at either 0xff000000 or
0x40000000, which is a higher address than your other RAM, so it
should be OK.

Now why do you have a memfile like this: a long time ago, the m68k kern=
el
used its own mapping code for system RAM, where virtual and physical
addresses differed. This was needed as unlike on PC, (a) memory doesn't
always start at address zero, and (b) memory isn't always contiguous.
Hence we used the MMU to map all memory chunks next to each other,
starting at virtual address zero.

With the unification of memory mapping across the different architectur=
es,
ouw own mapping code (and this feature) was lost.
Due to lack of manpower, we (IIRC Roman Zippel) switched to the
simplest memory model, where virtual =3D=3D physical, but where memory
doesn't have to start at zero.

However, it should be possible to revive the virtual mapping using
generic code, as some of the big NUMA systems also needed it.

See mm/Kconfig, which offers DISCONTIGMEM (what we use),
SPARSEMEM (what you need), and FLATMEM.

Note that SPARSEMEM may give better performance with
BigRamPlus, as there's probably a huge gap between its physical
address and the addresses of your other memory chunks.

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
