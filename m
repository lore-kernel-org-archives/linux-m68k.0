From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.11
Date: Mon, 20 Feb 2017 13:39:16 +0100
Message-ID: <1487594356-24582-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 7ce7d89f48834cefece7804d38fc5d85382edf77:

  Linux 4.10-rc1 (2016-12-25 16:13:08 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.11-tag1

for you to fetch changes up to 3dfe33020ca8a5e4f72993cc792a4838c464c8b3:

  m68k/sun3: Remove dead code in paging_init() (2017-02-13 10:03:19 +0100)

----------------------------------------------------------------
m68k updates for 4.11

  - Kernel message modernizations and cleanups,
  - Defconfig updates,
  - Cleanups.

Thanks for pulling!

----------------------------------------------------------------
Corentin Labbe (1):
      m68k/mac: Remove unneeded linux/miscdevice.h include

Finn Thain (3):
      m68k/mac: Improve NMI handler
      m68k/mac: Remove SHUTUP_SONIC interrupt hack
      m68k/mac: Clean up interrupt debug macros and printk statements

Geert Uytterhoeven (13):
      m68k/defconfig: Update defconfigs for v4.10-rc1
      m68k/atari: Modernize printing of kernel messages
      m68k/68000: Modernize printing of kernel messages
      m68k/bvme6000: Modernize printing of kernel messages
      m68k/mvme147: Modernize printing of kernel messages
      m68k/mvme16x: Modernize printing of kernel messages
      m68k/q40: Modernize printing of kernel messages
      m68k/sun3: Modernize printing of kernel messages
      m68k/sun3x: Modernize printing of kernel messages
      m68k/kernel: Modernize printing of kernel messages
      m68k/mm: sun3 - Modernize printing of kernel messages
      m68k/mm: Modernize printing of kernel messages
      m68k/include: Modernize printing of kernel messages

Markus Elfring (1):
      m68k: Delete an unnecessary variable assignment in sys_cacheflush()

Mathias Krause (1):
      m68k/sun3: Remove dead code in paging_init()

 arch/m68k/68000/m68328.c             |  6 +--
 arch/m68k/68000/m68EZ328.c           |  6 +--
 arch/m68k/68000/m68VZ328.c           |  6 +--
 arch/m68k/atari/atakeyb.c            | 14 +++---
 arch/m68k/atari/config.c             | 56 +++++++++++------------
 arch/m68k/bvme6000/config.c          |  8 ++--
 arch/m68k/bvme6000/rtc.c             |  2 +-
 arch/m68k/configs/amiga_defconfig    | 16 ++++++-
 arch/m68k/configs/apollo_defconfig   | 16 ++++++-
 arch/m68k/configs/atari_defconfig    | 16 ++++++-
 arch/m68k/configs/bvme6000_defconfig | 16 ++++++-
 arch/m68k/configs/hp300_defconfig    | 16 ++++++-
 arch/m68k/configs/mac_defconfig      | 16 ++++++-
 arch/m68k/configs/multi_defconfig    | 16 ++++++-
 arch/m68k/configs/mvme147_defconfig  | 16 ++++++-
 arch/m68k/configs/mvme16x_defconfig  | 16 ++++++-
 arch/m68k/configs/q40_defconfig      | 16 ++++++-
 arch/m68k/configs/sun3_defconfig     | 16 ++++++-
 arch/m68k/configs/sun3x_defconfig    | 16 ++++++-
 arch/m68k/include/asm/bug.h          |  4 +-
 arch/m68k/include/asm/floppy.h       |  6 +--
 arch/m68k/include/asm/macints.h      | 16 -------
 arch/m68k/include/asm/math-emu.h     | 10 ++---
 arch/m68k/include/asm/sun3_pgtable.h |  6 +--
 arch/m68k/include/asm/sun3xflop.h    | 14 +++---
 arch/m68k/kernel/dma.c               |  4 +-
 arch/m68k/kernel/module.c            | 12 ++---
 arch/m68k/kernel/process.c           | 20 ++++-----
 arch/m68k/kernel/signal.c            | 24 +++-------
 arch/m68k/kernel/sys_m68k.c          |  1 -
 arch/m68k/kernel/uboot.c             |  3 +-
 arch/m68k/mac/baboon.c               | 16 -------
 arch/m68k/mac/macints.c              | 87 ++++--------------------------------
 arch/m68k/mac/misc.c                 |  1 -
 arch/m68k/mac/oss.c                  | 20 ---------
 arch/m68k/mac/psc.c                  | 11 -----
 arch/m68k/mac/via.c                  |  8 ----
 arch/m68k/mm/init.c                  |  2 +-
 arch/m68k/mm/memory.c                |  4 +-
 arch/m68k/mm/sun3kmap.c              |  5 ++-
 arch/m68k/mm/sun3mmu.c               |  3 --
 arch/m68k/mvme147/config.c           |  2 +-
 arch/m68k/mvme16x/config.c           | 32 ++++++-------
 arch/m68k/mvme16x/rtc.c              |  2 +-
 arch/m68k/q40/config.c               | 14 +++---
 arch/m68k/q40/q40ints.c              | 15 ++++---
 arch/m68k/sun3/config.c              |  2 +-
 arch/m68k/sun3/dvma.c                |  3 +-
 arch/m68k/sun3/idprom.c              |  8 ++--
 arch/m68k/sun3/mmu_emu.c             | 47 +++++++++----------
 arch/m68k/sun3/prom/printf.c         |  2 +-
 arch/m68k/sun3/sun3dvma.c            | 51 +++++++++------------
 arch/m68k/sun3x/dvma.c               | 35 ++++++---------
 arch/m68k/sun3x/prom.c               |  4 +-
 54 files changed, 379 insertions(+), 405 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
