From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [GIT PULL] parisc fixes for 2.6.39-rc5
Date: Wed, 27 Apr 2011 22:36:40 +0200
Message-ID: <BANLkTimPzRuGqjxXqe7tn-C52suTVE9+ig@mail.gmail.com>
References: <1303935518.2583.27.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1303935518.2583.27.camel@mulgrave.site>
Sender: linux-kernel-owner@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Parisc List <linux-parisc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, Apr 27, 2011 at 22:18, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> These two fixes contain the agreed fix for our slub panic (agreed wit=
h
> the mm folks that we'll define SLUB broken in the !NUMA && DISCONTIGM=
EM
> case, which should fix m86k as well) and another buglet that turned u=
p
> examining the parisc discontigmem code.

Do we still need to mark SLUB broken?
On m68k, the issue seems to have been fixed by setting the N_NORMAL_MEM=
ORY flag
(pull request scheduled after one more linux-next build cycle).

Or do you plan to unmark it broken once every affected arch sets the
N_NORMAL_MEMORY flag?

> The patches are here:
>
> master.kernel.org:/pub/scm/linux/kernel/git/jejb/parisc-2.6.git#fixes
>
> The short changelog is:
>
> David Rientjes (1):
> =C2=A0 =C2=A0 =C2=A0[PARISC] set memory ranges in N_NORMAL_MEMORY whe=
n onlined
>
> James Bottomley (1):
> =C2=A0 =C2=A0 =C2=A0[PARISC] slub: fix panic with DISCONTIGMEM
>
> The diffstat is:
>
> =C2=A0arch/parisc/mm/init.c | =C2=A0 =C2=A04 +++-
> =C2=A0init/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01=
 +
> =C2=A02 files changed, 4 insertions(+), 1 deletions(-)
>
> And the full diff are below.
>
> James
>
> ---
>
> diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
> index b7ed8d7..b1d1262 100644
> --- a/arch/parisc/mm/init.c
> +++ b/arch/parisc/mm/init.c
> @@ -266,8 +266,10 @@ static void __init setup_bootmem(void)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(pfnnid_map, 0xff, sizeof(pfnnid_map=
));
>
> - =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < npmem_ranges; i++)
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < npmem_ranges; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 node_set_state(i, =
N_NORMAL_MEMORY);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0node_set_onlin=
e(i);
> + =C2=A0 =C2=A0 =C2=A0 }
> =C2=A0#endif
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
> diff --git a/init/Kconfig b/init/Kconfig
> index 56240e7..a7ad8fb 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1226,6 +1226,7 @@ config SLAB
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0per cpu and per node queues.
>
> =C2=A0config SLUB
> + =C2=A0 =C2=A0 =C2=A0 depends on BROKEN || NUMA || !DISCONTIGMEM
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "SLUB (Unqueued Allocator)"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SLUB is a slab allocator that mini=
mizes cache line usage

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
