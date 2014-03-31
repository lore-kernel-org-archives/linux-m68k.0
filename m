From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.15
Date: Mon, 31 Mar 2014 15:09:45 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1403311440160.11624__17769.583015661$1396271418$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit cfbf8d4857c26a8a307fb7cd258074c9dcd8c691:

  Linux 3.14-rc4 (2014-02-23 17:40:03 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 50be9eba831da114e1979726f4119d342698e651:

  m68k: Update defconfigs for v3.14-rc1 (2014-03-31 15:07:24 +0200)

Thanks for pulling!

----------------------------------------------------------------
Arnd Bergmann (1):
      [SCSI] atari_scsi: Fix sleep_on race

Finn Thain (2):
      m68k: Remove CONSOLE_PENGUIN macro, adopt CONFIG_LOGO
      m68k: Remove dead code

Geert Uytterhoeven (2):
      m68k: head.S - Remove bogus L prefix in comment
      m68k: Update defconfigs for v3.14-rc1

 arch/m68k/configs/amiga_defconfig    |   10 +++--
 arch/m68k/configs/apollo_defconfig   |   10 +++--
 arch/m68k/configs/atari_defconfig    |   10 +++--
 arch/m68k/configs/bvme6000_defconfig |   10 +++--
 arch/m68k/configs/hp300_defconfig    |   10 +++--
 arch/m68k/configs/mac_defconfig      |   10 +++--
 arch/m68k/configs/multi_defconfig    |   10 +++--
 arch/m68k/configs/mvme147_defconfig  |   10 +++--
 arch/m68k/configs/mvme16x_defconfig  |   10 +++--
 arch/m68k/configs/q40_defconfig      |   10 +++--
 arch/m68k/configs/sun3_defconfig     |   10 +++--
 arch/m68k/configs/sun3x_defconfig    |   10 +++--
 arch/m68k/kernel/head.S              |   70 ++++------------------------------
 drivers/scsi/atari_scsi.c            |   12 ++++--
 14 files changed, 88 insertions(+), 114 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
