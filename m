From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: TASK_SIZE for !MMU
Date: Mon, 2 Jun 2014 10:51:50 +0200
Message-ID: <20140602085150.GA31147@pengutronix.de>
References: <20140429100028.GH28564@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20140429100028.GH28564@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Rabin Vincent <rabin@rab.in>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: David Howells <dhowells@redhat.com>, uclinux-dist-devel@blackfin.uclinux.org, linux-m68k@lists.linux-m68k.org, linux-c6x-dev@linux-c6x.org, linux-m32r@ml.linux-m32r.org, microblaze-uclinux@itee.uq.edu.au, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org

Hello

[expand Cc: a bit]

On Tue, Apr 29, 2014 at 12:00:28PM +0200, Uwe Kleine-K=F6nig wrote:
> I grepped through the kernel (v3.15-rc1) for usages of TASK_SIZE to
> check if/how it is used on !MMU ARM machines. Most open questions als=
o
> affect the other !MMU platforms, so I put the blackfin, c6x, frv and
> m32r, m68k, microblaze and xtensa lists on Cc:. (Did I miss a platfor=
m
> that cares for !MMU ?)
>=20
> Most occurences are fine, see the list at the end of this mail. Howev=
er
> some are not or are unclear to me. Here is the complete list[1] apart=
 from
> the definition of TASK_SIZE for !MMU in arch/arm/include/asm/memory.h=
:
>=20
>  - Probably this should be explict s/TASK_SIZE/CONFIG_DRAM_SIZE/. Thi=
s
>    is generic code however while CONFIG_DRAM_SIZE is ARM only.
>         mm/nommu.c:     if (!rlen || rlen > TASK_SIZE)
>=20
>  - The issue the patch by Rabin is addressing (Subject: [PATCH] ARM: =
fix
>    string functions on !MMU), alternatively make TASK_SIZE ~0UL.
>         arch/arm/include/asm/uaccess.h:#define user_addr_max() \
>         arch/arm/include/asm/uaccess.h: (segment_eq(get_fs(), USER_DS=
) ? TASK_SIZE : ~0UL)
[reference: http://www.spinics.net/lists/arm-kernel/msg324112.html ]
=20
>  - probably bearable if broken:
>         drivers/misc/lkdtm.c:           if (user_addr >=3D TASK_SIZE)=
 {
>         lib/test_user_copy.c:   user_addr =3D vm_mmap(...)
>         lib/test_user_copy.c:   if (user_addr >=3D (unsigned long)(TA=
SK_SIZE)) {
>         lib/test_user_copy.c:           pr_warn("Failed to allocate u=
ser memory\n");
>         lib/test_user_copy.c:           return -ENOMEM;
>=20
>  - unclear to me:
>         fs/exec.c:      current->mm->task_size =3D TASK_SIZE;
>    - depends on PERF_EVENTS
>         kernel/events/core.c:   if (!addr || addr >=3D TASK_SIZE)
>         kernel/events/core.c:   return TASK_SIZE - addr;
>         kernel/events/uprobes.c:                area->vaddr =3D get_u=
nmapped_area(NULL, TASK_SIZE - PAGE_SIZE,
>    - depends on (PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)):
>         arch/arm/kernel/hw_breakpoint.c:        return (va >=3D TASK_=
SIZE) && ((va + len - 1) >=3D TASK_SIZE);
>    - seems to cope with big TASK_SIZE
>         fs/namespace.c:        size =3D TASK_SIZE - (unsigned long)da=
ta;
>         fs/namespace.c:        if (size > PAGE_SIZE)
>         fs/namespace.c:                size =3D PAGE_SIZE;
>    - depends on PLAT_S5P || ARCH_EXYNOS, this looks wrong
>         drivers/media/platform/s5p-mfc/s5p_mfc_common.h:#define DST_Q=
UEUE_OFF_BASE      (TASK_SIZE / 2)
>    - used for prctl(PR_SET_MM, ...)
>         kernel/sys.c:   if (addr >=3D TASK_SIZE || addr < mmap_min_ad=
dr)
>=20
> Any help to judge if these are OK is appreciated (even from Will :-)
>=20
> I think it would be OK to define TASK_SIZE to 0xffffffff for !MMU.
> blackfin, frv and m68k also do this. c6x does define it to 0xFFFFF000=
 to
> leave space for error codes.
>=20
> Thoughts?
The problem is that current linus/master (and also next) doesn't boot o=
n
my ARM-nommu machine because the user string functions (strnlen_user,
strncpy_from_user et al.) refuse to work on strings above TASK_SIZE
which in my case also includes the XIP kernel image.

Maybe someone of the mm people can bring light into the unclear points
above and the question what TASK_SIZE is supposed to be on no-MMU
machines?

Best regards
Uwe

> [1] complete as in "skip everything below arch/ but arch/arm" :-)
>=20
[removed the list, if you're interested, it's available at
http://mid.gmane.org/20140429100028.GH28564@pengutronix.de]

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
