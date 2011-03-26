From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound
 computation for COMPAT_BRK
Date: Sat, 26 Mar 2011 14:51:49 +0100
Message-ID: <AANLkTi=g5z+GYkbOGbdLQcLaQkpY6yQ6tjGRjjk1H59R@mail.gmail.com>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz>
	<AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
	<alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

Hi Jiri,

On Fri, Mar 25, 2011 at 11:20, Jiri Kosina <jkosina@suse.cz> wrote:
> On Thu, 24 Mar 2011, Geert Uytterhoeven wrote:
>> > From: Jiri Kosina <jkosina@suse.cz>
>> > Subject: [PATCH] brk: fix min_brk lower bound computation for COMP=
AT_BRK
>> >
>> > Even if CONFIG_COMPAT_BRK is set in the kernel configuration, it c=
an still
>> > be overriden by randomize_va_space sysctl.
>> >
>> > If this is the case, the min_brk computation in sys_brk() implemen=
tation
>> > is wrong, as it solely takes into account COMPAT_BRK setting, assu=
ming
>> > that brk start is not randomized. But that might not be the case i=
f
>> > randomize_va_space sysctl has been set to '2' at the time the bina=
ry has
>> > been loaded from disk.
>> >
>> > In such case, the check has to be done in a same way as in
>> > !CONFIG_COMPAT_BRK case.
>> >
>> > In addition to that, the check for the COMPAT_BRK case introduced =
back in
>> > a5b4592c ("brk: make sys_brk() honor COMPAT_BRK when computing low=
er
>> > bound") is slightly wrong -- the lower bound shouldn't be mm->end_=
code,
>> > but mm->end_data instead, as that's where the legacy applications =
expect
>> > brk section to start (i.e. immediately after last global variable)=
=2E
>> >
>> > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
>> > ---
>> > =C2=A0mm/mmap.c | =C2=A0 10 +++++++++-
>> > =C2=A01 files changed, 9 insertions(+), 1 deletions(-)
>> >
>> > diff --git a/mm/mmap.c b/mm/mmap.c
>> > index 50a4aa0..ca2f164 100644
>> > --- a/mm/mmap.c
>> > +++ b/mm/mmap.c
>> > @@ -253,7 +253,15 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0down_write(&mm->mmap_sem);
>> >
>> > =C2=A0#ifdef CONFIG_COMPAT_BRK
>> > - =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->end_code;
>> > + =C2=A0 =C2=A0 =C2=A0 /*
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* CONFIG_COMPAT_BRK can still be over=
ridden by setting
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* randomize_va_space to 2, which will=
 still make mm->start_brk
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* to be arbitrarily shifted
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> > + =C2=A0 =C2=A0 =C2=A0 if (mm->start_brk > PAGE_ALIGN(mm->end_data=
))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm-=
>start_brk;
>> > + =C2=A0 =C2=A0 =C2=A0 else
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm-=
>end_data;
>> > =C2=A0#else
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm->start_brk;
>> > =C2=A0#endif
>> > --
>> > 1.7.3.1
>>
>> Sorry for chiming in this late, but I've just bisected a problem in
>> 2.6.38 to commit
>> 5520e89485252c759ee60d313e9422447659947b ("brk: fix min_brk lower bo=
und
>> computation for COMPAT_BRK").
>>
>> When booting my very old test ramdisk on Amiga/m68k, it fails like t=
his:
>>
>> | RAMDISK: gzip image found at block 0
>> | VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
>> | warning: process `update' used the obsolete bdflush system call
>> | Fix your initscripts?
>> | init: cannot open inittab
>> | Kernel panic - not syncing: Attempted to kill init!
>>
>> Sorry for not noticing earlier, I usually boot full Debians under AR=
AnyM,
>> instead of booting old ramdisks with libc5-based binaries that once =
were
>> considered new.
>
> Oh well, one has to love the libc5-based binaries indeed.

Yeah, binaries from 1996 ;-)

> Is the patch below fixing the issue you are seeing on your Amiga/m68k=
?
> Thanks.
>
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 2ec8eb5..0a02531 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -262,7 +262,7 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mm->start_brk > PAGE_ALIGN(mm->end_dat=
a))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm=
->start_brk;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->en=
d_data;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->en=
d_code;
> =C2=A0#else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm->start_brk;
> =C2=A0#endif

Unfortunately not...

I added some printk()s:

mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
mm->start_brk =3D 0x8000a000, PAGE_ALIGN(mm->end_data =3D 0x8000a000)
mm->start_brk =3D 0x80006000, PAGE_ALIGN(mm->end_data =3D 0x80004000)

I.e. just before the failure, "mm->start_brk > PAGE_ALIGN(mm->end_data)=
"
became true.

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
