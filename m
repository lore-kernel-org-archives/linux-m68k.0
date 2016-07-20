From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.8
Date: Wed, 20 Jul 2016 10:34:50 +0200
Message-ID: <1469003690-8688-1-git-send-email-geert__9383.23396626419$1469003839$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.8-tag1

for you to fetch changes up to 6bd80f372371a7b3f5ff13e4e8a560066299c001:

  m68k/defconfig: Update defconfigs for v4.7-rc2 (2016-07-19 09:35:54 +0200)

----------------------------------------------------------------
m68k updates for 4.8

  - Assorted spelling fixes,
  - Defconfig updates.

----------------------------------------------------------------
Andrea Gelmini (1):
      m68k: Assorted spelling fixes

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.7-rc2

 arch/m68k/coldfire/head.S            | 2 +-
 arch/m68k/coldfire/m5272.c           | 2 +-
 arch/m68k/coldfire/pci.c             | 2 +-
 arch/m68k/configs/amiga_defconfig    | 4 ++++
 arch/m68k/configs/apollo_defconfig   | 4 ++++
 arch/m68k/configs/atari_defconfig    | 4 ++++
 arch/m68k/configs/bvme6000_defconfig | 4 ++++
 arch/m68k/configs/hp300_defconfig    | 4 ++++
 arch/m68k/configs/mac_defconfig      | 4 ++++
 arch/m68k/configs/multi_defconfig    | 4 ++++
 arch/m68k/configs/mvme147_defconfig  | 4 ++++
 arch/m68k/configs/mvme16x_defconfig  | 4 ++++
 arch/m68k/configs/q40_defconfig      | 4 ++++
 arch/m68k/configs/sun3_defconfig     | 4 ++++
 arch/m68k/configs/sun3x_defconfig    | 4 ++++
 arch/m68k/ifpsp060/src/fpsp.S        | 8 ++++----
 arch/m68k/ifpsp060/src/pfpsp.S       | 4 ++--
 arch/m68k/include/asm/dma.h          | 2 +-
 arch/m68k/include/asm/m525xsim.h     | 4 ++--
 arch/m68k/include/asm/mcfmmu.h       | 2 +-
 arch/m68k/include/asm/q40_master.h   | 2 +-
 arch/m68k/mac/iop.c                  | 2 +-
 arch/m68k/math-emu/fp_decode.h       | 2 +-
 23 files changed, 64 insertions(+), 16 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
