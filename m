From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound
 computation for COMPAT_BRK
Date: Mon, 28 Mar 2011 16:20:57 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1103281619320.26754@pobox.suse.cz>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz> <alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz> <alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz> <AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
 <alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz> <AANLkTi=g5z+GYkbOGbdLQcLaQkpY6yQ6tjGRjjk1H59R@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=g5z+GYkbOGbdLQcLaQkpY6yQ6tjGRjjk1H59R@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Sat, 26 Mar 2011, Geert Uytterhoeven wrote:

> >> | RAMDISK: gzip image found at block 0
> >> | VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
> >> | warning: process `update' used the obsolete bdflush system call
> >> | Fix your initscripts?
> >> | init: cannot open inittab
> >> | Kernel panic - not syncing: Attempted to kill init!
> >>
> >> Sorry for not noticing earlier, I usually boot full Debians under =
ARAnyM,
> >> instead of booting old ramdisks with libc5-based binaries that onc=
e were
> >> considered new.
> >
> > Oh well, one has to love the libc5-based binaries indeed.
>=20
> Yeah, binaries from 1996 ;-)
>=20
> > Is the patch below fixing the issue you are seeing on your Amiga/m6=
8k?
> > Thanks.
> >
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 2ec8eb5..0a02531 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -262,7 +262,7 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mm->start_brk > PAGE_ALIGN(mm->end_d=
ata))
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D =
mm->start_brk;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->=
end_data;
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->=
end_code;
> > =C2=A0#else
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm->start_brk;
> > =C2=A0#endif
>=20
> Unfortunately not...
>=20
> I added some printk()s:
>=20
> mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
> mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
> mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
> mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
> mm->start_brk =3D 0x80006000, PAGE_ALIGN(mm->end_data =3D 0x80004000)
>=20
> I.e. just before the failure, "mm->start_brk > PAGE_ALIGN(mm->end_dat=
a)"
> became true.

Hmm, I think we'd need some refresh on what the ancient libc5-based=20
binaries are actually doing.

Could you please send me strace of this application (restricting it to=20
brk()/mmap() calls should be enough).

Thanks,

--=20
Jiri Kosina
SUSE Labs, Novell Inc.
