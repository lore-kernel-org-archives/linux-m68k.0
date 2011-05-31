From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/4] resources: Add lookup_resource()
Date: Tue, 31 May 2011 09:47:15 +0200
Message-ID: <BANLkTi=YE4fSVQTNaYAwZ1YijqsUfTRmHg@mail.gmail.com>
References: <1306006756-32009-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1306006756-32009-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, linux-m68k@lists.linux-m68k.org
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>

On Sat, May 21, 2011 at 21:39, Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
> The resource system is a nice existing subsystem to implement simple =
allocators
> on top of.
> Unfortunately, there's no official method to find an existing resourc=
e by a
> resource start address, which is needed for a freeing function that j=
ust takes
> the start address of the region to free.
>
> Currently there are 3 users of the resource subsystem that implement =
this by
> traversing the resource tree theirselves:
> =C2=A0- The Amiga Chip RAM allocator on m68k,
> =C2=A0- iomap()/iounmap() on sparc,
> =C2=A0- DMA allocation API on sparc.
> They all lack locking of the resource tree, as resource_lock is stati=
c in
> kernel/resource.c.
>
> Hence this patchset adds lookup_resource() and converts the above use=
rs to it.
>
> =C2=A0[1/4] sparc: _sparc_find_resource() should check for exact matc=
hes
> =C2=A0[2/4] resources: Add lookup_resource()
> =C2=A0[3/4] m68k/amiga: Chip RAM - Use lookup_resource()
> =C2=A0[4/4] sparc: iounmap() and *_free_coherent() - Use lookup_resou=
rce()

As I got two acks from David for the sparc bits and no objections, I
queued these
on my for-2.6.41 and for-next branches.

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
