From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.3
Date: Sun, 30 Aug 2015 22:40:49 +0200
Message-ID: <1440967249-7651-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 1ecb40643a9af05683b7a898d7141884bcb28a82:

  m68k/bootinfo: Use kmemdup rather than duplicating its implementation (2015-08-10 10:26:33 +0200)

----------------------------------------------------------------
Andrzej Hajda (1):
      m68k/bootinfo: Use kmemdup rather than duplicating its implementation

Geert Uytterhoeven (2):
      m68k/defconfig: Disable experimental CONFIG_DM_CACHE
      m68k/defconfig: Update defconfigs for v4.2-rc1

 arch/m68k/configs/amiga_defconfig    | 16 +++++++++++-----
 arch/m68k/configs/apollo_defconfig   | 16 +++++++++++-----
 arch/m68k/configs/atari_defconfig    | 16 +++++++++++-----
 arch/m68k/configs/bvme6000_defconfig | 16 +++++++++++-----
 arch/m68k/configs/hp300_defconfig    | 16 +++++++++++-----
 arch/m68k/configs/mac_defconfig      | 16 +++++++++++-----
 arch/m68k/configs/multi_defconfig    | 16 +++++++++++-----
 arch/m68k/configs/mvme147_defconfig  | 16 +++++++++++-----
 arch/m68k/configs/mvme16x_defconfig  | 16 +++++++++++-----
 arch/m68k/configs/q40_defconfig      | 16 +++++++++++-----
 arch/m68k/configs/sun3_defconfig     | 16 +++++++++++-----
 arch/m68k/configs/sun3x_defconfig    | 16 +++++++++++-----
 arch/m68k/kernel/bootinfo_proc.c     |  4 +---
 13 files changed, 133 insertions(+), 63 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
