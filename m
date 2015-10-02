From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.3 (take two)
Date: Fri,  2 Oct 2015 17:54:14 +0200
Message-ID: <1443801254-3858-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 9ffecb10283508260936b96022d4ee43a7798b4c:

  Linux 4.3-rc3 (2015-09-27 07:50:08 -0400)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 95bc06ef049b808a067327bd8490b608b47e3870:

  m68k/defconfig: Update defconfigs for v4.3-rc1 (2015-09-28 10:01:09 +0200)

Summary:
  - Fix for accidental modification of arguments of syscall functions,
  - Wire up new syscalls,
  - Update defconfigs.

----------------------------------------------------------------
Andreas Schwab (1):
      m68k: Define asmlinkage_protect

Geert Uytterhoeven (4):
      m68k: Wire up direct socket calls
      m68k: Wire up userfaultfd
      m68k: Wire up membarrier
      m68k/defconfig: Update defconfigs for v4.3-rc1

 arch/m68k/configs/amiga_defconfig    |  9 ++++++++-
 arch/m68k/configs/apollo_defconfig   |  9 ++++++++-
 arch/m68k/configs/atari_defconfig    |  9 ++++++++-
 arch/m68k/configs/bvme6000_defconfig |  9 ++++++++-
 arch/m68k/configs/hp300_defconfig    |  9 ++++++++-
 arch/m68k/configs/mac_defconfig      |  9 ++++++++-
 arch/m68k/configs/multi_defconfig    |  9 ++++++++-
 arch/m68k/configs/mvme147_defconfig  |  9 ++++++++-
 arch/m68k/configs/mvme16x_defconfig  |  9 ++++++++-
 arch/m68k/configs/q40_defconfig      |  9 ++++++++-
 arch/m68k/configs/sun3_defconfig     |  9 ++++++++-
 arch/m68k/configs/sun3x_defconfig    |  9 ++++++++-
 arch/m68k/include/asm/linkage.h      | 30 ++++++++++++++++++++++++++++++
 arch/m68k/include/asm/unistd.h       |  2 +-
 arch/m68k/include/uapi/asm/unistd.h  | 19 +++++++++++++++++++
 arch/m68k/kernel/syscalltable.S      | 20 +++++++++++++++++++-
 16 files changed, 165 insertions(+), 14 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
