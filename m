From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [regression v2.6.38] Re: [PATCH v2] brk: fix min_brk lower bound
 computation for COMPAT_BRK
Date: Fri, 25 Mar 2011 11:20:23 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1103251119120.26754@pobox.suse.cz>
References: <alpine.LNX.2.00.1101030002390.26685@pobox.suse.cz> <alpine.LNX.2.00.1101031237210.26685@pobox.suse.cz> <alpine.LNX.2.00.1101031421470.26685@pobox.suse.cz> <AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:39039 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934032Ab1CYKUZ (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
	Fri, 25 Mar 2011 06:20:25 -0400
In-Reply-To: <AANLkTinK-TYnY70Wst_FTbEtn7Dwm8wEQoWMewsYM8dh@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

On Thu, 24 Mar 2011, Geert Uytterhoeven wrote:

> > From: Jiri Kosina <jkosina@suse.cz>
> > Subject: [PATCH] brk: fix min_brk lower bound computation for COMPA=
T_BRK
> >
> > Even if CONFIG_COMPAT_BRK is set in the kernel configuration, it ca=
n still
> > be overriden by randomize_va_space sysctl.
> >
> > If this is the case, the min_brk computation in sys_brk() implement=
ation
> > is wrong, as it solely takes into account COMPAT_BRK setting, assum=
ing
> > that brk start is not randomized. But that might not be the case if
> > randomize_va_space sysctl has been set to '2' at the time the binar=
y has
> > been loaded from disk.
> >
> > In such case, the check has to be done in a same way as in
> > !CONFIG_COMPAT_BRK case.
> >
> > In addition to that, the check for the COMPAT_BRK case introduced b=
ack in
> > a5b4592c ("brk: make sys_brk() honor COMPAT_BRK when computing lowe=
r
> > bound") is slightly wrong -- the lower bound shouldn't be mm->end_c=
ode,
> > but mm->end_data instead, as that's where the legacy applications e=
xpect
> > brk section to start (i.e. immediately after last global variable).
> >
> > Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> > ---
> > =C2=A0mm/mmap.c | =C2=A0 10 +++++++++-
> > =C2=A01 files changed, 9 insertions(+), 1 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 50a4aa0..ca2f164 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -253,7 +253,15 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0down_write(&mm->mmap_sem);
> >
> > =C2=A0#ifdef CONFIG_COMPAT_BRK
> > - =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->end_code;
> > + =C2=A0 =C2=A0 =C2=A0 /*
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* CONFIG_COMPAT_BRK can still be overr=
idden by setting
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* randomize_va_space to 2, which will =
still make mm->start_brk
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* to be arbitrarily shifted
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
> > + =C2=A0 =C2=A0 =C2=A0 if (mm->start_brk > PAGE_ALIGN(mm->end_data)=
)
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->=
start_brk;
> > + =C2=A0 =C2=A0 =C2=A0 else
> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 min_brk =3D mm->=
end_data;
> > =C2=A0#else
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0min_brk =3D mm->start_brk;
> > =C2=A0#endif
> > --
> > 1.7.3.1
>=20
> Sorry for chiming in this late, but I've just bisected a problem in
> 2.6.38 to commit
> 5520e89485252c759ee60d313e9422447659947b ("brk: fix min_brk lower bou=
nd
> computation for COMPAT_BRK").
>=20
> When booting my very old test ramdisk on Amiga/m68k, it fails like th=
is:
>=20
> | RAMDISK: gzip image found at block 0
> | VFS: Mounted root (ext2 filesystem) readonly on device 1:0.
> | warning: process `update' used the obsolete bdflush system call
> | Fix your initscripts?
> | init: cannot open inittab
> | Kernel panic - not syncing: Attempted to kill init!
>=20
> Sorry for not noticing earlier, I usually boot full Debians under ARA=
nyM,
> instead of booting old ramdisks with libc5-based binaries that once w=
ere
> considered new.

Oh well, one has to love the libc5-based binaries indeed.

Is the patch below fixing the issue you are seeing on your Amiga/m68k?=20
Thanks.


diff --git a/mm/mmap.c b/mm/mmap.c
index 2ec8eb5..0a02531 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -262,7 +262,7 @@ SYSCALL_DEFINE1(brk, unsigned long, brk)
 	if (mm->start_brk > PAGE_ALIGN(mm->end_data))
 		min_brk =3D mm->start_brk;
 	else
-		min_brk =3D mm->end_data;
+		min_brk =3D mm->end_code;
 #else
 	min_brk =3D mm->start_brk;
 #endif




--=20
Jiri Kosina
SUSE Labs, Novell Inc.
