From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH][resend] m68k,m68knommu: Do not include linux/hardirq.h in asm/irqflags.h
Date: Fri, 29 Oct 2010 18:31:57 +0200
Message-ID: <AANLkTin4v0=R0Q2etqi+WkLSJTV7T5J01rd+AbymutqG@mail.gmail.com>
References: <4CCAD4E8.8040801@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:56621 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704Ab0J2Qb7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Oct 2010 12:31:59 -0400
In-Reply-To: <4CCAD4E8.8040801@snapgear.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, dhowells@redhat.com, gerg@uclinux.org, phdm@macqel.be, linux-kernel@vger.kernel.org

On Fri, Oct 29, 2010 at 16:06, Greg Ungerer <gerg@snapgear.com> wrote:
> Philippe DeMuyter noticed this build failure with Linus' current git
> tree. I think it is m68k clean too. If all are ok with it I'll
> pass it directly to Linus.

Sorry, I saw his patch before, but had no spare cycles left for testing=
=2E

Unfortunately that breaks CONFIG_MMU=3Dy:

arch/m68k/include/asm/irqflags.h: In function =E2=80=98arch_local_irq_e=
nable=E2=80=99:
arch/m68k/include/asm/irqflags.h:43: error: implicit declaration of
function =E2=80=98hardirq_count=E2=80=99

But if you protect the #include <linux/hardirq.h> by #ifdef
CONFIG_MMU, I'm happy with
it.

> m68k,m68knommu: Do not include linux/hardirq.h in asm/irqflags.h
>
> Recent changes to header files made kernel compilation for m68k/m68kn=
ommu
> fail with :
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0arch/m68knommu/kernel/asm-offsets.s
> In file included from /archives/linux/git/arch/m68k/include/asm/syste=
m.h:2,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/wait.h:25,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/mmzone.h:9,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/gfp.h:4,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/irq.h:20,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
asm-generic/hardirq.h:12,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from
> /archives/linux/git/arch/m68k/include/asm/hardirq_no.h:17,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /archive=
s/linux/git/arch/m68k/include/asm/hardirq.h:2,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/hardirq.h:10,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /archive=
s/linux/git/arch/m68k/include/asm/irqflags.h:5,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/irqflags.h:15,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/spinlock.h:53,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/seqlock.h:29,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/time.h:8,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/timex.h:56,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from include/=
linux/sched.h:56,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from arch/m68=
knommu/kernel/asm-offsets.c:12:
> /archives/linux/git/arch/m68k/include/asm/system_no.h: In function
> =C3=A2=E2=82=AC=CB=9C__xchg=C3=A2=E2=82=AC=E2=84=A2:
> /archives/linux/git/arch/m68k/include/asm/system_no.h:79: error: impl=
icit
> declaration of function =C3=A2=E2=82=AC=CB=9Clocal_irq_save=C3=A2=E2=82=
=AC=E2=84=A2
> /archives/linux/git/arch/m68k/include/asm/system_no.h:101: error: imp=
licit
> declaration of function =C3=A2=E2=82=AC=CB=9Clocal_irq_restore=C3=A2=E2=
=82=AC=E2=84=A2
>
> Fix that
>
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>
>
> ---
> diff --git a/arch/m68k/include/asm/irqflags.h
> b/arch/m68k/include/asm/irqflags.h
> index 4a5b284..38b414d 100644
> --- a/arch/m68k/include/asm/irqflags.h
> +++ b/arch/m68k/include/asm/irqflags.h
> @@ -2,7 +2,6 @@
> =C2=A0#define _M68K_IRQFLAGS_H
> =C2=A0#include <linux/types.h>
> -#include <linux/hardirq.h>
> =C2=A0#include <linux/preempt.h>
> =C2=A0#include <asm/thread_info.h>
> =C2=A0#include <asm/entry.h>

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
