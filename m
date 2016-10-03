From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.9
Date: Mon,  3 Oct 2016 09:51:48 +0200
Message-ID: <1475481108-1956-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.9-tag1

for you to fetch changes up to 6736e65effc3a5a866cf8a03cda9ad277b712d3f:

  m68k: Migrate exception table users off module.h and onto extable.h (2016-09-30 10:25:41 +0200)

----------------------------------------------------------------
m68k updates for 4.8

  - Cleanups,
  - Defconfig updates,
  - GPG fingerprint update.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      m68k/defconfig: Update defconfigs for v4.8-rc1
      m68k: Use IS_ENABLED() instead of checking for built-in or module
      CREDITS: Update fingerprint for Geert Uytterhoeven

Paul Gortmaker (1):
      m68k: Migrate exception table users off module.h and onto extable.h

 CREDITS                              | 2 +-
 arch/m68k/amiga/config.c             | 2 +-
 arch/m68k/atari/config.c             | 2 +-
 arch/m68k/configs/amiga_defconfig    | 3 +++
 arch/m68k/configs/apollo_defconfig   | 3 +++
 arch/m68k/configs/atari_defconfig    | 3 +++
 arch/m68k/configs/bvme6000_defconfig | 3 +++
 arch/m68k/configs/hp300_defconfig    | 3 +++
 arch/m68k/configs/mac_defconfig      | 3 +++
 arch/m68k/configs/multi_defconfig    | 3 +++
 arch/m68k/configs/mvme147_defconfig  | 3 +++
 arch/m68k/configs/mvme16x_defconfig  | 3 +++
 arch/m68k/configs/q40_defconfig      | 3 +++
 arch/m68k/configs/sun3_defconfig     | 3 +++
 arch/m68k/configs/sun3x_defconfig    | 3 +++
 arch/m68k/kernel/setup_mm.c          | 2 +-
 arch/m68k/kernel/signal.c            | 2 +-
 arch/m68k/mac/config.c               | 2 +-
 arch/m68k/q40/config.c               | 2 +-
 19 files changed, 43 insertions(+), 7 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
