From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.1
Date: Mon, 13 Apr 2015 10:35:11 +0200
Message-ID: <1428914111-2284-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 9eccca0843205f87c00404b663188b88eb248051:

  Linux 4.0-rc3 (2015-03-08 16:09:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to b24f670b7f5b2058b95370caa9f104b3cefb9f1d:

  m68k/mac: Fix out-of-bounds array index in OSS IRQ source initialization (2015-03-30 10:14:34 +0200)

----------------------------------------------------------------
Dan Carpenter (1):
      m68k/pci: Remove a superflous KERN_ERR

Finn Thain (1):
      m68k/mac: Fix out-of-bounds array index in OSS IRQ source initialization

Geert Uytterhoeven (3):
      m68k: Remove FSF address
      m68k/q40: Make NE2000 builtin instead of modular
      m68k/defconfig: Update defconfigs for v4.0-rc1

 arch/m68k/configs/amiga_defconfig    | 3 +++
 arch/m68k/configs/apollo_defconfig   | 3 +++
 arch/m68k/configs/atari_defconfig    | 3 +++
 arch/m68k/configs/bvme6000_defconfig | 3 +++
 arch/m68k/configs/hp300_defconfig    | 3 +++
 arch/m68k/configs/mac_defconfig      | 3 +++
 arch/m68k/configs/multi_defconfig    | 3 +++
 arch/m68k/configs/mvme147_defconfig  | 3 +++
 arch/m68k/configs/mvme16x_defconfig  | 3 +++
 arch/m68k/configs/q40_defconfig      | 5 ++++-
 arch/m68k/configs/sun3_defconfig     | 3 +++
 arch/m68k/configs/sun3x_defconfig    | 3 +++
 arch/m68k/include/asm/mcfqspi.h      | 5 -----
 arch/m68k/kernel/pcibios.c           | 2 +-
 arch/m68k/lib/ashldi3.c              | 7 +------
 arch/m68k/lib/ashrdi3.c              | 7 +------
 arch/m68k/lib/divsi3.S               | 7 +------
 arch/m68k/lib/lshrdi3.c              | 7 +------
 arch/m68k/lib/modsi3.S               | 7 +------
 arch/m68k/lib/muldi3.c               | 7 +------
 arch/m68k/lib/mulsi3.S               | 7 +------
 arch/m68k/lib/udivsi3.S              | 7 +------
 arch/m68k/lib/umodsi3.S              | 7 +------
 arch/m68k/mac/oss.c                  | 3 +--
 24 files changed, 48 insertions(+), 63 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
