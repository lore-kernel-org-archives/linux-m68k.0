From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k/atari: Call paging_init() before nf_init()
Date: Fri, 18 Oct 2013 09:42:12 +0200
Message-ID: <CAMuHMdVPnyRhfGjpMraMrwhxwy9_mSfm=ouDEnYm2YJMzhhZ_Q@mail.gmail.com>
References: <1382080184-19115-1-git-send-email-geert@linux-m68k.org>
	<172f2b40c29a29a470215c14250a559e@biophys.uni-duesseldorf.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <172f2b40c29a29a470215c14250a559e@biophys.uni-duesseldorf.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitz@biophys.uni-duesseldorf.de>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Oct 18, 2013 at 9:29 AM, Michael Schmitz
<schmitz@biophys.uni-duesseldorf.de> wrote:
> does your fiddling with memory blocks in bootinfo now result in kernels
> being possible to boot in FastRAM?

No, I only played with the start address of ST-RAM.

Probably you can run a kernel in FastRAM with some minor tweaks if
you remove the ST-RAM block from the bootinfo, but then you loose
(at least) atafb :-)

With the DISCONTIGMEM memory model, the kernel must be stored in the
first memory block. As ST-RAM is before FastRAM in memory, you cannot
have the kernel in FastRAM without losing ST-RAM (as main memory ---
you can still e.g. ioremap() it for atafb, and use the rest of it as
swap through
a block device like z2ram. This is basically what we do on Amiga with Chip RAM
and Z2 RAM).

With the SPARSEMEM memory model, you should be able to store the kernel
in FastRAM and have ST-RAM, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
