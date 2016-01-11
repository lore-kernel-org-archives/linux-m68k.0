From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.5
Date: Mon, 11 Jan 2016 20:36:38 +0100
Message-ID: <1452540998-8715-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 1ec218373b8ebda821aec00bb156a9c94fad9cd4:

  Linux 4.4-rc2 (2015-11-22 16:45:59 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to eb37bc3f85b69f529d2ad06c41fad8dedd654c76:

  m68k: Provide __phys_to_pfn() and __pfn_to_phys() (2016-01-10 13:56:40 +0100)

----------------------------------------------------------------
Finn Thain (1):
      m68k/atari, m68k/sun3: Fix SCSI platform device registration when driver is modular

Geert Uytterhoeven (2):
      m68k/mac: Kill psc_present
      m68k/defconfig: Update defconfigs for v4.4-rc1

Sudip Mukherjee (1):
      m68k: Provide __phys_to_pfn() and __pfn_to_phys()

 arch/m68k/atari/config.c             | 4 ++--
 arch/m68k/configs/amiga_defconfig    | 4 ++++
 arch/m68k/configs/apollo_defconfig   | 5 +++++
 arch/m68k/configs/atari_defconfig    | 4 ++++
 arch/m68k/configs/bvme6000_defconfig | 4 ++++
 arch/m68k/configs/hp300_defconfig    | 5 +++++
 arch/m68k/configs/mac_defconfig      | 5 +++++
 arch/m68k/configs/multi_defconfig    | 5 +++++
 arch/m68k/configs/mvme147_defconfig  | 4 ++++
 arch/m68k/configs/mvme16x_defconfig  | 4 ++++
 arch/m68k/configs/q40_defconfig      | 5 +++++
 arch/m68k/configs/sun3_defconfig     | 5 +++++
 arch/m68k/configs/sun3x_defconfig    | 5 +++++
 arch/m68k/include/asm/mac_psc.h      | 1 -
 arch/m68k/include/asm/page.h         | 3 +++
 arch/m68k/mac/macints.c              | 6 +++---
 arch/m68k/mac/psc.c                  | 7 +++----
 arch/m68k/sun3/config.c              | 2 +-
 18 files changed, 67 insertions(+), 11 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
