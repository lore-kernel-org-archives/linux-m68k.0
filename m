From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/2] Make PPC macro spin_event_timeout() architecture independent
Date: Tue, 30 Jul 2013 15:08:43 +0200
Message-ID: <CAMuHMdXP3-uKbftP-2UeZdE6X_iTi1podNDh0aVF3bJwDYssdg@mail.gmail.com>
References: <1375187900-17582-1-git-send-email-B44344@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <1375187900-17582-1-git-send-email-B44344@freescale.com>
Sender: sparclinux-owner@vger.kernel.org
To: Arpit Goel <B44344@freescale.com>
Cc: Russell King <linux@arm.linux.org.uk>, Hirokazu Takata <takata@linux-m32r.org>, Philip Blundell <philb@gnu.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux390@de.ibm.com, "David S. Miller" <davem@davemloft.net>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@nvidia.com>, John Stultz <john.stultz@linaro.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Greg KH <gregkh@linuxfoundation.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-m32r@ml.linux-m32r.org, linux-m32r-ja@ml.linux-m32r.org, Linux/m68k <linux-m68k@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, sparclinux <sparclinux@vger>
List-Id: linux-m68k@vger.kernel.org

On Tue, Jul 30, 2013 at 2:38 PM, Arpit Goel <B44344@freescale.com> wrote:
> This patch-set moves USECS_PER_JIFFY to architecture timex.h from architecture
> specific C files. Patch-set further uses this to make PPC macro
> spin_event_timeout() architecture independent. This change enables drivers to
> use spin_event_timeout() even in non-PowerPC based SoC's.
>
> This patchset has been compiled for ARM, PowerPC and x86.
>
> Patch[1/2] : Moves USECS_PER_JIFFY to architecture specific timex.h files from
>              architecture specific C files.

>  arch/arm/include/asm/timex.h      |  2 ++
>  arch/arm/kernel/time.c            |  3 ---
>  arch/m32r/include/asm/timex.h     |  2 ++
>  arch/m32r/kernel/time.c           |  3 ---
>  arch/m68k/hp300/time.c            |  4 +---
>  arch/m68k/include/asm/timex.h     |  2 ++
>  arch/s390/include/asm/timex.h     |  2 ++
>  arch/s390/kernel/time.c           |  2 --
>  arch/sparc/include/asm/timex_32.h |  2 ++
>  arch/sparc/include/asm/timex_64.h |  2 ++
>  arch/sparc/kernel/pcic.c          |  1 -

As the definition is the same on all architectures, why not move it to
<linux/delay.h>?

> Patch[2/2] : Converts PPC macro spin_event_timeout() in architecture independent
>              macro.

>  include/linux/delay.h             | 40 +++++++++++++++++++++++++++++++++++++++

After your first patch, USECS_PER_JIFFY is still available only on
arm/m32r/m68k/s390/sparc. What about other architectures?
If anyone uses spin_event_timeout() on e.g. x86, it will fail to compile.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
