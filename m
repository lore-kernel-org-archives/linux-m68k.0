From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.2
Date: Mon, 22 Jun 2015 09:35:06 +0200
Message-ID: <1434958506-5444-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit c65b99f046843d2455aa231747b5a07a999a9f3d:

  Linux 4.1-rc6 (2015-05-31 19:01:07 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-4.2

for you to fetch changes up to 1214c525484cabb27ed37df936c3451682757263:

  m68k: Use for_each_sg() (2015-06-01 10:36:29 +0200)

----------------------------------------------------------------
Akinobu Mita (1):
      m68k: Use for_each_sg()

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.1-rc6

 arch/m68k/configs/amiga_defconfig    |  8 ++++++--
 arch/m68k/configs/apollo_defconfig   |  8 ++++++--
 arch/m68k/configs/atari_defconfig    |  8 ++++++--
 arch/m68k/configs/bvme6000_defconfig |  8 ++++++--
 arch/m68k/configs/hp300_defconfig    |  8 ++++++--
 arch/m68k/configs/mac_defconfig      |  8 ++++++--
 arch/m68k/configs/multi_defconfig    |  8 ++++++--
 arch/m68k/configs/mvme147_defconfig  |  8 ++++++--
 arch/m68k/configs/mvme16x_defconfig  |  8 ++++++--
 arch/m68k/configs/q40_defconfig      |  8 ++++++--
 arch/m68k/configs/sun3_defconfig     |  8 ++++++--
 arch/m68k/configs/sun3x_defconfig    |  8 ++++++--
 arch/m68k/kernel/dma.c               | 19 ++++++++++++-------
 13 files changed, 84 insertions(+), 31 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
