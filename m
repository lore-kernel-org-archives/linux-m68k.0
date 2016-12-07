From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 00/22] m68k: Modernize printing of kernel messages
Date: Wed,  7 Dec 2016 16:08:58 +0100
Message-ID: <1481123360-10978-1-git-send-email-geert__19924.3761286654$1481123899$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Joshua Thompson <funaho@jurai.org>, Finn Thain <fthain@telegraphics.com.au>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi all,

This patch series modernizes the printing of kernel messages in the m68k
architecture core, which is mainly about converting from printk() to
pr_*().

The trigger for (finally) doing this was the user-visible breakage
caused by commit 4bcc595ccd80decb ("printk: reinstate KERN_CONT for
printing continuation lines").

I had hoped to sent this series much earlier, to be still included in
v4.9, but that didn't happen due to lack of time. Fortunately v4.9 will
be an LTS(I) kernel, so the first three patches (tagged with a "Fixes"
tag) will hopefully make it to v4.9.x later ;-)

Compile-tested with my standard set of configs.
Boot-tested on ARAnyM.

Thanks for your comments!

Geert Uytterhoeven (22):
  m68k/atari: Modernize printing of kernel messages
  m68k/mac: macints - Modernize printing of kernel messages
  m68k/mac: via - Modernize printing of kernel messages
  m68k/68000: Modernize printing of kernel messages
  m68k/bvme6000: Modernize printing of kernel messages
  m68k/coldfire: Modernize printing of kernel messages
  m68k/mac: baboon - Modernize printing of kernel messages
  m68k/mac: iop - Modernize printing of kernel messages
  m68k/mac: oss - Modernize printing of kernel messages
  m68k/mac: psc - Modernize printing of kernel messages
  m68k/mac: Modernize printing of kernel messages
  m68k/mvme147: Modernize printing of kernel messages
  m68k/mvme16x: Modernize printing of kernel messages
  m68k/q40: Modernize printing of kernel messages
  m68k/sun3: Modernize printing of kernel messages
  m68k/sun3x: Modernize printing of kernel messages
  m68k/kernel: Modernize printing of kernel messages
  m68k/mm: kmap - Modernize printing of kernel messages
  m68k/mm: motorola - Modernize printing of kernel messages
  m68k/mm: sun3 - Modernize printing of kernel messages
  m68k/mm: Modernize printing of kernel messages
  m68k/include: Modernize printing of kernel messages

 arch/m68k/68000/m68328.c                 |  6 +-
 arch/m68k/68000/m68EZ328.c               |  6 +-
 arch/m68k/68000/m68VZ328.c               |  6 +-
 arch/m68k/atari/atakeyb.c                | 14 ++---
 arch/m68k/atari/config.c                 | 56 +++++++++---------
 arch/m68k/bvme6000/config.c              |  8 +--
 arch/m68k/bvme6000/rtc.c                 |  2 +-
 arch/m68k/coldfire/m528x.c               |  4 +-
 arch/m68k/coldfire/sltimers.c            |  4 +-
 arch/m68k/coldfire/timers.c              |  4 +-
 arch/m68k/coldfire/vectors.c             |  2 +-
 arch/m68k/include/asm/bug.h              |  4 +-
 arch/m68k/include/asm/dma.h              | 98 +++++++++++---------------------
 arch/m68k/include/asm/floppy.h           |  6 +-
 arch/m68k/include/asm/math-emu.h         | 10 ++--
 arch/m68k/include/asm/mcf_pgtable.h      |  9 +--
 arch/m68k/include/asm/motorola_pgtable.h |  6 +-
 arch/m68k/include/asm/sun3_pgtable.h     |  6 +-
 arch/m68k/include/asm/sun3xflop.h        | 14 ++---
 arch/m68k/kernel/dma.c                   |  4 +-
 arch/m68k/kernel/module.c                | 12 ++--
 arch/m68k/kernel/process.c               | 20 +++----
 arch/m68k/kernel/signal.c                | 24 +++-----
 arch/m68k/kernel/uboot.c                 |  3 +-
 arch/m68k/mac/baboon.c                   | 22 ++++---
 arch/m68k/mac/config.c                   | 34 ++++++-----
 arch/m68k/mac/iop.c                      | 69 ++++++++++------------
 arch/m68k/mac/macints.c                  | 42 +++++++-------
 arch/m68k/mac/misc.c                     |  8 +--
 arch/m68k/mac/oss.c                      | 26 +++++----
 arch/m68k/mac/psc.c                      | 32 +++++------
 arch/m68k/mac/via.c                      | 54 +++++++++---------
 arch/m68k/mm/init.c                      |  2 +-
 arch/m68k/mm/kmap.c                      | 26 ++++-----
 arch/m68k/mm/memory.c                    |  4 +-
 arch/m68k/mm/motorola.c                  | 32 ++++-------
 arch/m68k/mm/sun3kmap.c                  |  5 +-
 arch/m68k/mvme147/config.c               |  2 +-
 arch/m68k/mvme16x/config.c               | 32 +++++------
 arch/m68k/mvme16x/rtc.c                  |  2 +-
 arch/m68k/q40/config.c                   | 14 ++---
 arch/m68k/q40/q40ints.c                  | 15 +++--
 arch/m68k/sun3/config.c                  |  2 +-
 arch/m68k/sun3/dvma.c                    |  3 +-
 arch/m68k/sun3/idprom.c                  |  8 ++-
 arch/m68k/sun3/mmu_emu.c                 | 47 +++++++--------
 arch/m68k/sun3/prom/printf.c             |  2 +-
 arch/m68k/sun3/sun3dvma.c                | 51 +++++++----------
 arch/m68k/sun3x/dvma.c                   | 35 +++++-------
 arch/m68k/sun3x/prom.c                   |  4 +-
 50 files changed, 412 insertions(+), 489 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
