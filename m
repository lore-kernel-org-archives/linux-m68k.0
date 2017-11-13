From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.15
Date: Mon, 13 Nov 2017 09:35:30 +0100
Message-ID: <1510562130-14410-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 0b07194bb55ed836c2cc7c22e866b87a14681984:

  Linux 4.14-rc7 (2017-10-29 13:58:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.15-tag1

for you to fetch changes up to 5e387199c17c4d2fb8b72ada82fbf81f4ba6f317:

  m68k/defconfig: Update defconfigs for v4.14-rc7 (2017-11-09 23:02:58 +0100)

----------------------------------------------------------------
m68k updates for 4.15

  - More printk modernization,
  - Various cleanups and fixes (incl. a race condition) for Mac,
  - Defconfig updates.

Note that this is based on v4.14-rc7 not -rc1 due to -rc7 triggering a
defconfig refresh.

Thanks for pulling!

----------------------------------------------------------------
Finn Thain (4):
      m68k/mac: More printk modernization
      m68k/mac: Disentangle VIA and OSS initialization
      m68k/mac: Disentangle VIA/RBV and NuBus initialization
      m68k/mac: Add mutual exclusion for IOP interrupt polling

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.14-rc7

 arch/m68k/configs/amiga_defconfig    |  6 ++--
 arch/m68k/configs/apollo_defconfig   |  6 ++--
 arch/m68k/configs/atari_defconfig    |  6 ++--
 arch/m68k/configs/bvme6000_defconfig |  6 ++--
 arch/m68k/configs/hp300_defconfig    |  6 ++--
 arch/m68k/configs/mac_defconfig      |  6 ++--
 arch/m68k/configs/multi_defconfig    |  6 ++--
 arch/m68k/configs/mvme147_defconfig  |  6 ++--
 arch/m68k/configs/mvme16x_defconfig  |  6 ++--
 arch/m68k/configs/q40_defconfig      |  6 ++--
 arch/m68k/configs/sun3_defconfig     |  6 ++--
 arch/m68k/configs/sun3x_defconfig    |  6 ++--
 arch/m68k/include/asm/mac_iop.h      |  1 +
 arch/m68k/mac/baboon.c               |  2 +-
 arch/m68k/mac/config.c               |  2 +-
 arch/m68k/mac/iop.c                  | 13 +++++++--
 arch/m68k/mac/oss.c                  | 16 +++--------
 arch/m68k/mac/psc.c                  |  6 ++--
 arch/m68k/mac/via.c                  | 53 ++++++++++++++----------------------
 drivers/macintosh/adb-iop.c          |  4 +--
 drivers/nubus/nubus.c                | 13 ---------
 21 files changed, 90 insertions(+), 92 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
