From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: rfc: remove early_printk from a few arches? (blackfin, m68k, mips)
Date: Fri, 19 Dec 2014 09:03:16 +0100
Message-ID: <CAMuHMdXGsUeAuV63hknXFkrwFoW+9_SR5wt5tzPJttGnCR_YDQ__39600.0015353367$1418976224$gmane$org@mail.gmail.com>
References: <1418849927.28384.1.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1418849927.28384.1.camel@perches.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: linux-arch <linux-arch@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Steven Miao <realmz6@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, linux-mips <linux-mips@linux-mips.org>, Finn Thain <fthain@telegraphics.com.au>

On Wed, Dec 17, 2014 at 9:58 PM, Joe Perches <joe@perches.com> wrote:
> It seems like early_printk can be configured into
> a few architectures but also appear not to be used.
>
> $ git grep -w "early_printk"

[...]

> arch/m68k/kernel/Makefile:obj-$(CONFIG_EARLY_PRINTK)    += early_printk.o

[...]

> These seem to the only uses:
>
> arch/arm/mach-socfpga/socfpga.c:        early_printk("Early printk initialized\n");
> []
> arch/microblaze/kernel/cpu/cpuinfo-pvr-full.c:  early_printk("ERROR: Microblaze " x "-different for PVR and DTS\n");
> arch/microblaze/kernel/cpu/cpuinfo-static.c:    early_printk("ERROR: Microblaze " x "-different for kernel and DTS\n");
> []
> arch/tile/kernel/early_printk.c:        early_printk("Kernel panic - not syncing: %pV", &vaf);
> []
> arch/x86/kernel/e820.c: early_printk(msg);
> arch/x86/kernel/head64.c:               early_printk("Kernel alive\n");
> arch/x86/kernel/head_64.S:      call early_printk
> []
> kernel/events/core.c:           early_printk("perf interrupt took too long (%lld > %lld), lowering "
>
> So blackfin, m68k, and mips seems to have it possible to enable,
> but also don't appear at first glance to use it,
>
> Is early_printk really used by these architectures?
> Should it be removed?

The m68k "early_printk" match is not about the early_printk()
function, but about
the early printk functionality. Hence nothing to remove there.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
