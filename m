From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.16
Date: Mon, 29 Jan 2018 10:18:02 +0100
Message-ID: <1517217482-18026-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.16-tag1

for you to fetch changes up to 2334b1ac1235934fc196f2d25bae7f348d3bf42e:

  MAINTAINERS: Add NuBus subsystem entry (2018-01-16 16:55:39 +0100)

----------------------------------------------------------------
m68k updates for 4.16

  - First part of an overhaul of the NuBus subsystem, to bring it up to
    modern driver model standards,
  - A race condition fix for Mac,
  - Defconfig updates.

Thanks for pulling!

----------------------------------------------------------------
Finn Thain (16):
      nubus: Avoid array underflow and overflow
      nubus: Fix up header split
      nubus: Use static functions where possible
      nubus: Fix log spam
      nubus: Validate slot resource IDs
      nubus: Call proc_mkdir() not more than once per slot directory
      nubus: Remove redundant code
      nubus: Clean up whitespace
      nubus: Generalize block resource handling
      nubus: Rework /proc/bus/nubus/s/ implementation
      nubus: Rename struct nubus_dev
      nubus: Adopt standard linked list implementation
      nubus: Add expansion_type values for various Mac models
      nubus: Add support for the driver model
      m68k/mac: Fix race conditions in OSS interrupt dispatch
      MAINTAINERS: Add NuBus subsystem entry

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.15-rc1

 MAINTAINERS                             |   9 +
 arch/m68k/configs/amiga_defconfig       |   4 +-
 arch/m68k/configs/apollo_defconfig      |   4 +-
 arch/m68k/configs/atari_defconfig       |   4 +-
 arch/m68k/configs/bvme6000_defconfig    |   4 +-
 arch/m68k/configs/hp300_defconfig       |   4 +-
 arch/m68k/configs/mac_defconfig         |   4 +-
 arch/m68k/configs/multi_defconfig       |   4 +-
 arch/m68k/configs/mvme147_defconfig     |   4 +-
 arch/m68k/configs/mvme16x_defconfig     |   4 +-
 arch/m68k/configs/q40_defconfig         |   4 +-
 arch/m68k/configs/sun3_defconfig        |   4 +-
 arch/m68k/configs/sun3x_defconfig       |   4 +-
 arch/m68k/include/asm/macintosh.h       |   9 +-
 arch/m68k/mac/config.c                  | 110 +++----
 arch/m68k/mac/oss.c                     |  67 ++--
 drivers/net/ethernet/8390/mac8390.c     |  33 +-
 drivers/net/ethernet/cirrus/mac89x0.c   |   6 +-
 drivers/net/ethernet/natsemi/macsonic.c |  38 ++-
 drivers/nubus/Makefile                  |   2 +-
 drivers/nubus/bus.c                     | 117 +++++++
 drivers/nubus/nubus.c                   | 542 +++++++++++++++++---------------
 drivers/nubus/proc.c                    | 281 ++++++++---------
 drivers/video/fbdev/macfb.c             |  10 +-
 include/linux/nubus.h                   | 189 +++++++----
 include/uapi/linux/nubus.h              |  23 --
 26 files changed, 833 insertions(+), 651 deletions(-)
 create mode 100644 drivers/nubus/bus.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
