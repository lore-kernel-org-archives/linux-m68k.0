From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/irq: don't use pr_crit in an header
Date: Sun, 18 Dec 2011 11:32:21 +0100
Message-ID: <CAMuHMdXyf_ofM+y6yKrzftyKTOyrSKzW7fUVAJyY6XTV_FVhNA@mail.gmail.com>
References: <Pine.BSM.4.64L.1112161437090.856@herc.mirbsd.org>
	<1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:45719 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371Ab1LRKcX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 18 Dec 2011 05:32:23 -0500
In-Reply-To: <1324152592-1718-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: debian-kernel@lists.debian.org, linux-m68k@vger.kernel.org, Thorsten Glaser <tg@debian.org>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

2011/12/17 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>:
> Using pr_crit in an header results in funny messages. Consider
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#define pr_fmt(fmt) "mydriver: " fmt
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#include <linux/hardirq.h>
>
> which makes the message from ack_bad_irq
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mydriver: unexpected IRQ trap...
>
> so better use plain printk with KERN_CRIT directly.

Yep, that's expected behavior, as defining pr_fmt() modifies all kernel=
 messages
generated from that module.

> This fixes a build problem on m68k with aufs3 en passant because the
> latter builds with
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ccflags-y +=3D -D'pr_fmt(fmt)=3DAUFS_NAME"=
\040%s:%d:%s[%d]:\040"fmt,__func__,__LINE__,current->comm,current->pid'
>
> without providing AUFS_NAME early enough for ack_bad_irq (which is th=
e
> problem of aufs).

Isn't this a problem with (out of tree) aufs?
Why does it put a define that relies on an (apparently sometimes still
undefined)
variable on the build command line?
Any header may contain calls to pr_*().

> Cc: Thorsten Glaser <tg@debian.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> =C2=A0arch/m68k/include/asm/hardirq.h | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/m68k/include/asm/hardirq.h b/arch/m68k/include/asm/=
hardirq.h
> index db30ed2..1f652e0 100644
> --- a/arch/m68k/include/asm/hardirq.h
> +++ b/arch/m68k/include/asm/hardirq.h
> @@ -20,7 +20,7 @@
>
> =C2=A0static inline void ack_bad_irq(unsigned int irq)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 pr_crit("unexpected IRQ trap at vector %02x\n"=
, irq);
> + =C2=A0 =C2=A0 =C2=A0 printk(KERN_CRIT "unexpected IRQ trap at vecto=
r %02x\n", irq);

Nack. Nowadays pr_crit(...) is recommended over "printk(KERN_CRIT ...)"=
=2E

Besides, there are (albeit not that many yet) other callers of pr_*() i=
n
header files. Do you plan to revert them to printk(), too?

Please fix aufs instead. Thanks!

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
