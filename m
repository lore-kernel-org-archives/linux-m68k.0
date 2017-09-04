From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.14
Date: Mon,  4 Sep 2017 12:42:34 +0200
Message-ID: <1504521754-26149-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.14-tag1

for you to fetch changes up to 558d5ad276c9b2ffbe706e78310a777f87e65c5f:

  m68k/mac: Avoid soft-lockup warning after mach_power_off (2017-08-21 11:52:56 +0200)

----------------------------------------------------------------
m68k updates for 4.14

  - Restore symbol versions for symbols exported from assembly,
  - Defconfig updates,
  - Mac fixes.

Thanks for pulling!

----------------------------------------------------------------
Ben Hutchings (1):
      m68k: Restore symbol versions for symbols exported from assembly

Finn Thain (2):
      m68k/mac: Don't hang waiting for Cuda power-down command
      m68k/mac: Avoid soft-lockup warning after mach_power_off

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.13-rc1

 arch/m68k/configs/amiga_defconfig      |  7 +++++--
 arch/m68k/configs/apollo_defconfig     |  7 +++++--
 arch/m68k/configs/atari_defconfig      |  8 ++++++--
 arch/m68k/configs/bvme6000_defconfig   |  7 +++++--
 arch/m68k/configs/hp300_defconfig      |  7 +++++--
 arch/m68k/configs/mac_defconfig        |  7 +++++--
 arch/m68k/configs/multi_defconfig      |  7 +++++--
 arch/m68k/configs/mvme147_defconfig    |  7 +++++--
 arch/m68k/configs/mvme16x_defconfig    |  7 +++++--
 arch/m68k/configs/q40_defconfig        |  7 +++++--
 arch/m68k/configs/sun3_defconfig       |  7 +++++--
 arch/m68k/configs/sun3x_defconfig      |  7 +++++--
 arch/m68k/include/asm/asm-prototypes.h |  5 +++++
 arch/m68k/mac/misc.c                   | 16 ++++++++++++++--
 14 files changed, 80 insertions(+), 26 deletions(-)
 create mode 100644 arch/m68k/include/asm/asm-prototypes.h

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
