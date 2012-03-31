From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH RFC] Simplify the Linux kernel by reducing its state space
Date: Sat, 31 Mar 2012 18:40:30 +0200
Message-ID: <CAMuHMdWTB+_AtqM6JixY=Oo_zmzX_dNxnivpARBYSbPJzp4t6A__14293.1596994915$1333212511$gmane$org@mail.gmail.com>
References: <20120331163321.GA15809@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20120331163321.GA15809@linux.vnet.ibm.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: paulmck@linux.vnet.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, uclinux-dist-devel@blackfin.uclinux.org, linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, linux-m32r@ml.linux-m32r.org, linux-m32r-ja@ml.linux-m32r.org, linux-mips@linux-mips.org, linux-am33-list@redhat.com, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, tglx@linutronix.de, linux@arm.linux.org.uk, dhowells@redhat.com, jejb@parisc-linux.org, linux390@de.ibm.com, x86@kernel.org, cmetcalf@tilera.com, linux-m68k <linux-m68k@lists.linux-m68k.org>

Hi Paul,

On Sat, Mar 31, 2012 at 18:33, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> Although there have been numerous complaints about the complexity of
> parallel programming (especially over the past 5-10 years), the plain
> truth is that the incremental complexity of parallel programming over
> that of sequential programming is not as large as is commonly believe=
d.
> Despite that you might have heard, the mind-numbing complexity of mod=
ern
> computer systems is not due so much to there being multiple CPUs, but
> rather to there being any CPUs at all. =C2=A0In short, for the ultima=
te in
> computer-system simplicity, the optimal choice is NR_CPUS=3D0.
>
> This commit therefore limits kernel builds to zero CPUs. =C2=A0This c=
hange
> has the beneficial side effect of rendering all kernel bugs harmless.
> Furthermore, this commit enables additional beneficial changes, for
> example, the removal of those parts of the kernel that are not needed
> when there are zero CPUs.
>
> Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>
> =C2=A0alpha/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 11 ++++++-----
> =C2=A0arm/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 +++---
> =C2=A0blackfin/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
> =C2=A0hexagon/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A09 +++++----
> =C2=A0ia64/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A09 +++++----
> =C2=A0m32r/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 10 ++++++----
> =C2=A0mips/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 21 +++++++++++----------
> =C2=A0mn10300/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 ++-
> =C2=A0parisc/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---
> =C2=A0powerpc/platforms/Kconfig.cputype | =C2=A0 =C2=A08 ++++----
> =C2=A0s390/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 12 +++++++-----
> =C2=A0sh/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 11 ++++++-----
> =C2=A0sparc/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 ++++----
> =C2=A0tile/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A09 +++++----
> =C2=A0x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 16 +++++++++-------
> =C2=A015 files changed, 78 insertions(+), 64 deletions(-)

You forgot to fix half of the architectures, a.o. m68k?

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert (still at GMT+2)

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
