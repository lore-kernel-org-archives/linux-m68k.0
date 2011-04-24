From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Debian kernel v2.6.38
Date: Sun, 24 Apr 2011 10:18:17 +0200
Message-ID: <BANLkTinPijbiOCN_uTokGwT79ua0YyhOEw@mail.gmail.com>
References: <BANLkTimCKhPbp3wOCpVusHu1JmoyhwKX0w@mail.gmail.com>
	<Pine.BSM.4.64L.1104231809290.3979@herc.mirbsd.org>
	<BANLkTimNekxddcHFFV1cAAyiCWsz2EY11g@mail.gmail.com>
	<4DB34EE6.6010004@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:50943 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755240Ab1DXIST convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 24 Apr 2011 04:18:19 -0400
Received: by fxm17 with SMTP id 17so886837fxm.19
        for <linux-m68k@vger.kernel.org>; Sun, 24 Apr 2011 01:18:17 -0700 (PDT)
In-Reply-To: <4DB34EE6.6010004@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: Thorsten Glaser <tg@mirbsd.de>, linux-m68k@vger.kernel.org

Hi Michael,

On Sun, Apr 24, 2011 at 00:12, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>> On Sat, Apr 23, 2011 at 20:13, Thorsten Glaser <tg@mirbsd.de> wrote:
>>> =E2=80=A2 Reserve ST RAM early
>>
>> Yeah, that's a valid one,
>> My (and probably lkml's) main issue there is that it introduces yet
>> another custom
>> allocator. Can we avoid that?
>
> Ideally it would not be an issue if we could properly flag ST-RAM onl=
y as
> DMA memory. I've tried in the past but setting the max. DMA address t=
o the
> 0x00ffffff did have unintended side effects elsewhere in the m68k mm =
code.
>
> If there is a generic lowmem allocator, we might be able to use that
> instead. It does not need to be available early on, but we need to be=
 able
> to reserve some lowmem early.

Reserving the pool using alloc_bootmem_low() is fine.
But the allocator for memory inside the pool could be changed to use e.=
g.
allocate_resource(), cfr. arch/m68k/amiga/chipram.c.
If I'm not mistaken, the main difference between Chip RAM on Amiga and =
ST-RAM
on Atari is that ST-RAM can be used as system memory, while Chip RAM ca=
nnot
(due to the lack of RMW bus support)?

> Another possible hack would be to allocate lowmem early on for each
> compiled-in user and store that in a platform device struct for use b=
y the
> driver once it initializes. Is there such a thing like early initcall=
s for
> this specific purpose (do a minimum early setup such as allocate reso=
urces,
> silence IRQs and the like)?.

That's a bit like we do on the ps3, cfr. arch/powerpc/platforms/ps3/set=
up.c.
The main disadvantage is that it's less flexible, esp. for modules.

> If all that is not an option (and for the sake of modules needing ST-=
RAM), I
> don't see another way to do it. Some parts of the hardware just need =
memory
> below 0x00ffffff.

If you would just reserve 1 MiB (or a better tuned amount) of ST-RAM po=
ol and
always use allocate_resource() to allocate ST-RAM, most of stram.c (e.g=
=2E
manageing the list of free blocks) can go?
As a bonus, you get freeing of memory from the pool.

I had a quick look into the ST-RAM users:
  - ataflop, atari_scsi, and atafb allocate ST-RAM only at driver
initialization,
  - dmasound_atari allocates/deallocates ST-RAM on sq_open()/close(),
so this will
    definitely break after a while if the ST-RAM pool doesn't support
freeing ST-RAM.

What do you think?

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
