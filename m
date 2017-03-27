From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.11 (take two)
Date: Mon, 27 Mar 2017 10:32:32 +0200
Message-ID: <1490603552-9671-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.11-tag2

for you to fetch changes up to e3b1ebd673876f2cdb0b84205e52a33b94a9860f:

  m68k: Wire up statx (2017-03-20 11:27:28 +0100)

----------------------------------------------------------------
m68k updates for 4.11 (take two)

  - Build warning fix,
  - Defconfig updates,
  - New syscall statx.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      m68k/bitops: Correct signature of test_bit()
      m68k/defconfig: Update defconfigs for v4.11-rc1
      m68k: Wire up statx

 arch/m68k/configs/amiga_defconfig    | 14 +++++++++++++-
 arch/m68k/configs/apollo_defconfig   | 14 +++++++++++++-
 arch/m68k/configs/atari_defconfig    | 14 +++++++++++++-
 arch/m68k/configs/bvme6000_defconfig | 14 +++++++++++++-
 arch/m68k/configs/hp300_defconfig    | 14 +++++++++++++-
 arch/m68k/configs/mac_defconfig      | 14 +++++++++++++-
 arch/m68k/configs/multi_defconfig    | 14 +++++++++++++-
 arch/m68k/configs/mvme147_defconfig  | 14 +++++++++++++-
 arch/m68k/configs/mvme16x_defconfig  | 14 +++++++++++++-
 arch/m68k/configs/q40_defconfig      | 14 +++++++++++++-
 arch/m68k/configs/sun3_defconfig     | 14 +++++++++++++-
 arch/m68k/configs/sun3x_defconfig    | 14 +++++++++++++-
 arch/m68k/include/asm/bitops.h       |  2 +-
 arch/m68k/include/asm/unistd.h       |  2 +-
 arch/m68k/include/uapi/asm/unistd.h  |  1 +
 arch/m68k/kernel/syscalltable.S      |  1 +
 16 files changed, 160 insertions(+), 14 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
