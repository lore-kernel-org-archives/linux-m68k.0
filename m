From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 00/28 v6] m68k: Convert to genirq
Date: Tue, 13 Sep 2011 13:18:06 +0200
Message-ID: <CAMuHMdXJEeooAjdQo+JhUWJcrGzKZb-jQPPhVggy3ocQyPe3Lw__7532.01423581249$1315912712$gmane$org@mail.gmail.com>
References: <1315742394-16036-1-git-send-email-geert@linux-m68k.org>
	<alpine.LNX.2.00.1109132030020.14483@nippy.intranet>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.1109132030020.14483@nippy.intranet>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

On Tue, Sep 13, 2011 at 13:11, Finn Thain <fthain@telegraphics.com.au> =
wrote:
> When I was testing your v5 patch series, I had to patch macmace.c to
> resolve some compiler errors --
>
> --- linux-m68k.orig/drivers/net/macmace.c =C2=A0 =C2=A0 =C2=A0 2011-0=
9-13 18:33:55.000000000 +1000
> +++ linux-m68k/drivers/net/macmace.c =C2=A0 =C2=A02011-09-13 18:34:05=
=2E000000000 +1000
> @@ -31,8 +31,8 @@
> =C2=A0#include <linux/dma-mapping.h>
> =C2=A0#include <linux/platform_device.h>
> =C2=A0#include <linux/gfp.h>
> +#include <linux/interrupt.h>
> =C2=A0#include <asm/io.h>
> -#include <asm/irq.h>
> =C2=A0#include <asm/macints.h>
> =C2=A0#include <asm/mac_psc.h>
> =C2=A0#include <asm/page.h>
>
> Would you please check whether this is still needed after the v6 seri=
es?

Will do. Don't think I ever saw that problem, though.
Did it show up with genirq disabled or enabled?

> (I'd check myself, but I don't have the source tree on which your ema=
iled
> patches were based...)

They're based on a v3.1-rc5 version of the m68k tree. I think it's
identical to the
current m68k master with v3.1-rc5 merged into.

> BTW, you'll probably want to patch this comment in
> include/linux/interrupt.h --
>
> /*
> =C2=A0* Special function to avoid ifdeffery in kernel/irq/devres.c wh=
ich
> =C2=A0* gets magically built by GENERIC_HARDIRQS=3Dn architectures (s=
parc,
> =C2=A0* m68k).

Thanks, will do.

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
