From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Multiple Memory Chunks
Date: Fri, 16 Aug 2013 09:42:33 +0200
Message-ID: <CAMuHMdU85B38g2wNM=vQTZC9YQbN=KA4_pMK50wnueeA2CTB6Q@mail.gmail.com>
References: <2ff3a4b6bf1251e63cd24d4bda680c5b@localhost>
	<CAMuHMdVEdz9cmenqYNeemSK+O0aZj0RG7oKdxwygfBE6WWONsg@mail.gmail.com>
	<6EF44417-6A7D-467E-8489-3E9928E22B12@2013.bluespice.org>
	<CAMuHMdUNS5UXbzV5g_YFESJmu43EqiZsE6c1_F3YSLpxN39+Wg@mail.gmail.com>
	<4E605291-9891-4120-AA3E-728A63C052D8@2013.bluespice.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pb0-f54.google.com ([209.85.160.54]:35677 "EHLO
	mail-pb0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149Ab3HPHme convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 16 Aug 2013 03:42:34 -0400
Received: by mail-pb0-f54.google.com with SMTP id ro12so1705094pbb.27
        for <linux-m68k@vger.kernel.org>; Fri, 16 Aug 2013 00:42:33 -0700 (PDT)
In-Reply-To: <4E605291-9891-4120-AA3E-728A63C052D8@2013.bluespice.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Ingo_J=C3=BCrgensmann?= <ij@2013.bluespice.org>
Cc: Debian m68k <debian-68k@lists.debian.org>, Linux/m68k <linux-m68k@vger.kernel.org>

On Fri, Aug 16, 2013 at 7:59 AM, Ingo J=C3=BCrgensmann <ij@2013.bluespi=
ce.org> wrote:
> Am 13.08.2013 um 11:14 schrieb Geert Uytterhoeven <geert@linux-m68k.o=
rg>:
>>> Yes, and I would like to avoid this, of course. ;-) It really slows=
 down the machine and you can even feel it... ;)
>> We may also use the slow mainboard RAM (I get ca. 12 MiB/s) as a fas=
t swap
>> device.
>
> I would like to avoid using those kind of RAM as swap. Reasons:
> - it would add an additional layer of paging in/out. Even if it is co=
mparable fast, pages of data and code would need to swapped in and out.
> - to make sense it would need an higher swap priority to get used fir=
st, but then again it will most likey result in being filled with somet=
hing that accidently gets swapped out first, whereas stuff that gets fr=
equently used and swapped in/out will still be swapped to disk.
> - to avoid this we would need some kind of write through cache like i=
t's often used for SSD hybrid disks where stuff that is often needed wi=
ll reside within SSD side of that hybrid disks while other stuff will b=
e stored on the slower spinning disk.

IIRC, Linux itself now also has a software variant of the SSD hybrid
disk approach.
So we could use that on a RAM block device instead of an SSD.

>>>> Now why do you have a memfile like this: a long time ago, the m68k=
 kernel
>>>> used its own mapping code for system RAM, where virtual and physic=
al
>>>
>>> Remember that there were problems with loading 3.2.0-4-amiga withou=
t the memfile.
>> Yes, going out of memory when allocating the page table arrays? That=
 won't
>> improve when adding 256 MiB of Z3 RAM in the far end of the physical
>> address space...
>
> No, but we would have more memory to waste for this. Excluding 8 MB f=
or this from 128 MB does hurt more than 8 MB out of 384 MB. ;)

I mean that we would waste more memory too, due to the Z3 RAM being far=
 from
the rest of RAM in the address space.

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
