From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Multiple Memory Chunks
Date: Tue, 13 Aug 2013 11:14:14 +0200
Message-ID: <CAMuHMdUNS5UXbzV5g_YFESJmu43EqiZsE6c1_F3YSLpxN39+Wg@mail.gmail.com>
References: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost>
	<CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com>
	<6EF44417-6A7D-467E-8489-3E9928E22B12@2013.bluespice.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:46103 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756061Ab3HMJOP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 13 Aug 2013 05:14:15 -0400
Received: by mail-pd0-f178.google.com with SMTP id w10so4580918pde.23
        for <linux-m68k@vger.kernel.org>; Tue, 13 Aug 2013 02:14:14 -0700 (PDT)
In-Reply-To: <6EF44417-6A7D-467E-8489-3E9928E22B12@2013.bluespice.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Sat, Aug 10, 2013 at 11:00 PM, Ingo J=C3=BCrgensmann
<ij@2013.bluespice.org> wrote:
> Am 10.08.2013 um 13:46 schrieb Geert Uytterhoeven <geert@linux-m68k.o=
rg>:
>>> So, apparently the second FastMem chunk is ignored by the kernel it=
self. Is
>>> there a way to make use of the additional 12 MB RAM? Although it's =
not as
>>> fast as the 32bit memory on the accelerator card (64MB), it is stil=
l faster
>>> than swapping to/from disk.
>> If you reverse the order of the chunks, it will use both. Unfortunat=
ely the
>> kernel will be in the slowest chunk.
>
> Yes, and I would like to avoid this, of course. ;-) It really slows d=
own the machine and you can even feel it... ;)

We may also use the slow mainboard RAM (I get ca. 12 MiB/s) as a fast s=
wap
device.
=46or Z2 RAM we have our good old z2ram driver, but in the mean time th=
ere's a
more generic solution in drivers/mtd, IIRC.

>>> Especially this becomes important when we want to put BigRamPlus RA=
M
>>> extensions into Amigas. Those are 256MB RAM extensions via ZorroIII=
 bus and
>>> the port would highly benefit from supporting multiple memory chunk=
s. Is
>>> this possible?
>> I'd expect a Zorro III RAM expansion to end up at either 0xff000000 =
or
>> 0x40000000, which is a higher address than your other RAM, so it
>> should be OK.
>
> Except that the ZorroIII RAM will be 4-6x slower than the RAM on the =
accelerator cards.

So this is also a candidate for swap? Does anyone have benchmark result=
s?
I found that ZoRAM does 12 MiB/s.

BTW, http://www.bigbookofamigahardware.com/bboah/product.aspx?id=3D1936=
 claims
it's only guaranteed to work with the original daughter board, and thus=
 may fail
with '060 accelerators.

>> Now why do you have a memfile like this: a long time ago, the m68k k=
ernel
>> used its own mapping code for system RAM, where virtual and physical
>
> Remember that there were problems with loading 3.2.0-4-amiga without =
the memfile.

Yes, going out of memory when allocating the page table arrays? That wo=
n't
improve when adding 256 MiB of Z3 RAM in the far end of the physical
address space...

>> addresses differed. This was needed as unlike on PC, (a) memory does=
n't
>> always start at address zero, and (b) memory isn't always contiguous=
=2E
>> Hence we used the MMU to map all memory chunks next to each other,
>> starting at virtual address zero.
>>
>> With the unification of memory mapping across the different architec=
tures,
>> ouw own mapping code (and this feature) was lost.
>> Due to lack of manpower, we (IIRC Roman Zippel) switched to the
>> simplest memory model, where virtual =3D=3D physical, but where memo=
ry
>> doesn't have to start at zero.
>>
>> However, it should be possible to revive the virtual mapping using
>> generic code, as some of the big NUMA systems also needed it.
>
> Yeah, that would be great...
>
> But we would still have the problem with the loading the kernel to th=
e proper memory chunk, i.e. the fastest.
> AmigaOS has the concept of priorities for memory chunks. The memory o=
n Cyberstorm MK2 accel cards have a priority of 40 whereas normal FastR=
AM on the mainboard has a priority of 10 (IIRC). The Amiga memory manag=
er automatically selects the priority based on actually memory speeds o=
n each boot, as stated at http://amigadev.elowar.com/read/ADCD_2.1/Hard=
ware_Manual_guide/node00D2.html and http://amigadev.elowar.com/read/ADC=
D_2.1/Hardware_Manual_guide/node00D4.html outlines that the fastest mem=
ory will be located between the mainboard memory and the ZorroIII memor=
y, as you said above.
> So the trick is get the kernel loaded in the fastest memory chunk and=
 then reorder the other chunks accordingly. I think it's easier to have=
 the kernel do the right thing[TM] than to rely on a fixed version of a=
miboot. That way we could use the memfile to determine where the kernel=
 will get loaded (fastest chunk) by amiboot.

The NUMA code should also take into account priorities, at least for CP=
U
affinity (although we have only one CPU).

>> See mm/Kconfig, which offers DISCONTIGMEM (what we use),
>> SPARSEMEM (what you need), and FLATMEM.
>>
>> Note that SPARSEMEM may give better performance with
>> BigRamPlus, as there's probably a huge gap between its physical
>> address and the addresses of your other memory chunks.
>
> So, to test this, I could edit that file, make the change and recompi=
le the kernel and see whether amiboot loads the kernel to 0x08000000 an=
d the kernel still uses the 12 MB memory on the mainboard?

Unfortunately it's not that simple. I haven't checked the details, but
I think we'll
have to change other parts in arch/m68k/mm, too. Definitely the check t=
o
ignore blocks with lower addresses has to go ;-)

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
