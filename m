From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.20
Date: Mon,  9 Feb 2015 16:28:20 +0100
Message-ID: <1423495700-24540-1-git-send-email-geert__17740.0975874209$1423495724$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit b1940cd21c0f4abdce101253e860feff547291b0:

  Linux 3.19-rc3 (2015-01-05 17:05:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next

for you to fetch changes up to 4436820a98cdaf497a874323095e328831030956:

  m68k/defconfig: Enable Ethernet bridging (2015-01-31 15:00:59 +0100)

Summary:
  - Switch to asm-generic/futex.h,
  - Various cleanups,
  - Defconfig updates.

----------------------------------------------------------------
Finn Thain (1):
      m68k/mac: Fix scsi_type for Mac LC and similar models

Geert Uytterhoeven (13):
      m68k: Switch to asm-generic/futex.h
      m68k/atari: Remove obsolete keyboard_tasklet scheduling
      net: atarilance: Remove obsolete IRQ_TYPE_PRIO
      parport: parport_atari: Remove obsolete IRQ_TYPE_SLOW
      video: atafb: Remove obsolete IRQ_TYPE_PRIO
      sound: dmasound_atari: Remove obsolete IRQ_TYPE_SLOW
      m68k/atari: Remove obsolete IRQ_TYPE_*
      m68k/defconfig: Refresh defconfigs for v3.16-rc1--v3.19-rc2
      m68k/defconfig: Enable test modules
      m68k/defconfig: Enable early printk support
      m68k/defconfig: Enable automounting of devtmpfs at /dev
      m68k/defconfig: Enable Atari EtherNAT and EtherNEC Ethernet support
      m68k/defconfig: Enable Ethernet bridging

Paul Gortmaker (1):
      m68k/mvme16x: rtc - Don't use module_init in non-modular code

Rickard Strandqvist (2):
      m68k/atari: atakeyb.c - Remove some unused functions
      m68k/mvme147: config.c - Remove unused functions

 arch/m68k/atari/atakeyb.c             | 72 +--------------------------
 arch/m68k/atari/stdma.c               |  2 +-
 arch/m68k/atari/time.c                |  3 +-
 arch/m68k/configs/amiga_defconfig     | 73 +++++++++++++++++++++++----
 arch/m68k/configs/apollo_defconfig    | 73 +++++++++++++++++++++++----
 arch/m68k/configs/atari_defconfig     | 78 +++++++++++++++++++++++++----
 arch/m68k/configs/bvme6000_defconfig  | 73 +++++++++++++++++++++++----
 arch/m68k/configs/hp300_defconfig     | 73 +++++++++++++++++++++++----
 arch/m68k/configs/mac_defconfig       | 72 +++++++++++++++++++++++----
 arch/m68k/configs/multi_defconfig     | 78 ++++++++++++++++++++++++-----
 arch/m68k/configs/mvme147_defconfig   | 73 +++++++++++++++++++++++----
 arch/m68k/configs/mvme16x_defconfig   | 72 +++++++++++++++++++++++----
 arch/m68k/configs/q40_defconfig       | 73 +++++++++++++++++++++++----
 arch/m68k/configs/sun3_defconfig      | 72 +++++++++++++++++++++++----
 arch/m68k/configs/sun3x_defconfig     | 73 +++++++++++++++++++++++----
 arch/m68k/include/asm/Kbuild          |  1 +
 arch/m68k/include/asm/atariints.h     |  5 --
 arch/m68k/include/asm/futex.h         | 94 -----------------------------------
 arch/m68k/include/asm/macintosh.h     |  2 +-
 arch/m68k/mac/config.c                | 32 ++++++------
 arch/m68k/mvme147/config.c            | 46 -----------------
 arch/m68k/mvme16x/rtc.c               |  2 +-
 drivers/net/ethernet/amd/atarilance.c |  8 +--
 drivers/parport/parport_atari.c       |  4 +-
 drivers/video/fbdev/atafb.c           |  3 +-
 sound/oss/dmasound/dmasound_atari.c   |  2 +-
 26 files changed, 782 insertions(+), 377 deletions(-)
 delete mode 100644 arch/m68k/include/asm/futex.h

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
