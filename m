From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound
 computation for COMPAT_BRK
Date: Thu, 24 Mar 2011 22:49:45 +0100
Message-ID: <AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz>
	<alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Jiri Kosina <jkosina@suse.cz>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Mon, Jan 3, 2011 at 14:24, Jiri Kosina <jkosina@suse.cz> wrote:
>> > diff --git a/mm/mmap.c b/mm/mmap.c
>> > index 50a4aa0..35d9f9c 100644
>> > --- a/mm/mmap.c
>> > +++ b/mm/mmap.c
>> > @@ -253,7 +253,15 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
>> > =C2=A0 =C2=A0 down_write(&mm->mmap_sem);
>> >
>> > =C2=A0#ifdef CONFIG_COMPAT_BRK
>> > - =C2=A0 min_brk =3D mm->end_code;
>> > + =C2=A0 /*
>> > + =C2=A0 =C2=A0* CONFIG_COMPAT_BRK can still be overridden by sett=
ing
>> > + =C2=A0 =C2=A0* randomize_va_space to 2, which will still make mm=
->start_brk
>> > + =C2=A0 =C2=A0* to be arbitrarily shifted
>> > + =C2=A0 =C2=A0*/
>> > + =C2=A0 if (mm->start_brk > mm->end_code)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->start_brk;
>> > + =C2=A0 else
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->end_code;
>> > =C2=A0#else
>> > =C2=A0 =C2=A0 min_brk =3D mm->start_brk;
>> > =C2=A0#endif
>>
>> Hmm, actually no, that will bring us back into pre-a5b4592c era, ple=
ase
>> disregard that.
>>
>> I will have to come up with something more clever (we can't just che=
ck
>> 'randomize_va_space =3D=3D 2', as that would be racy for already run=
ning
>> programs).
>
> The patch below handles all the cases properly. Ingo, Andrew, please
> consider applying. Thanks.
>
>
>
> From: Jiri Kosina <jkosina@suse.cz>
> Subject: [PATCH] brk: fix min_brk lower bound computation for COMPAT_=
BRK
>
> Even if CONFIG_COMPAT_BRK is set in the kernel configuration, it can =
still
> be overriden by randomize_va_space sysctl.
>
> If this is the case, the min_brk computation in sys_brk() implementat=
ion
> is wrong, as it solely takes into account COMPAT_BRK setting, assumin=
g
> that brk start is not randomized. But that might not be the case if
> randomize_va_space sysctl has been set to '2' at the time the binary =
has
> been loaded from disk.
>
> In such case, the check has to be done in a same way as in
> !CONFIG_COMPAT_BRK case.
>
> In addition to that, the check for the COMPAT_BRK case introduced bac=
k in
> a5b4592c ("brk: make sys_brk() honor COMPAT_BRK when computing lower
> bound") is slightly wrong -- the lower bound shouldn't be mm->end_cod=
e,
> but mm->end_data instead, as that's where the legacy applications exp=
ect
> brk section to start (i.e. immediately after last global variable).
>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> ---
> =C2=A0mm/mmap.c | =C2=A0 10 +++++++++-
> =C2=A01 files changed, 9 insertions(+), 1 deletions(-)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 50a4aa0..ca2f164 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -253,7 +253,15 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0down_write(&mm->mmap_sem);
>
> =C2=A0#ifdef CONFIG_COMPAT_BRK
> - =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->end_code;
> + =C2=A0 =C2=A0 =C2=A0 /*
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* CONFIG_COMPAT_BRK can still be overrid=
den by setting
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* randomize_va_space to 2, which will st=
ill make mm->start_brk
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* to be arbitrarily shifted
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> + =C2=A0 =C2=A0 =C2=A0 if (mm->start_brk > PAGE_ALIGN(mm->end_data))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->st=
art_brk;
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->en=
d_data;
> =C2=A0#else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm->start_brk;
> =C2=A0#endif
> --
> 1.7.3.1

Sorry for chiming in this late, but I've just bisected a problem in
2.6.38 to commit
5520e89485252c759ee60d313e9422447659947b ("brk: fix min_brk lower bound
computation for COMPAT_BRK").

When booting my very old test ramdisk on Amiga/m68k, it fails like this=
:

| RAMDISK: gzip image found at block 0
| VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
| warning: process `update' used the obsolete bdflush system call
| Fix your initscripts?
| init: cannot open inittab
| Kernel panic - not syncing: Attempted to kill init!

Sorry for not noticing earlier, I usually boot full Debians under ARAny=
M,
instead of booting old ramdisks with libc5-based binaries that once wer=
e
considered new.

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
