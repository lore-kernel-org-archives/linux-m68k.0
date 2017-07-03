From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.13
Date: Mon,  3 Jul 2017 09:28:30 +0200
Message-ID: <1499066910-2770-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.13-tag1

for you to fetch changes up to 204a2be30a7a8a8d12642f23f3fbdc8b9923b500:

  m68k: Remove ptrace_signal_deliver (2017-06-19 19:41:48 +0200)

----------------------------------------------------------------
m68k updates for 4.13

  - Nubus improvements and cleanups,
  - Defconfig updates,
  - Fix debugger syscall restart interactions, leading to the global
    removal of ptrace_signal_deliver().

----------------------------------------------------------------
Andreas Schwab (1):
      m68k: Remove ptrace_signal_deliver

David Huggins-Daines (1):
      nubus: Remove slot zero probe

Finn Thain (1):
      nubus: Fix pointer validation

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.12-rc1

 arch/m68k/configs/amiga_defconfig    |   8 ++-
 arch/m68k/configs/apollo_defconfig   |   8 ++-
 arch/m68k/configs/atari_defconfig    |   8 ++-
 arch/m68k/configs/bvme6000_defconfig |   8 ++-
 arch/m68k/configs/hp300_defconfig    |   8 ++-
 arch/m68k/configs/mac_defconfig      |   8 ++-
 arch/m68k/configs/multi_defconfig    |   8 ++-
 arch/m68k/configs/mvme147_defconfig  |   8 ++-
 arch/m68k/configs/mvme16x_defconfig  |   8 ++-
 arch/m68k/configs/q40_defconfig      |   8 ++-
 arch/m68k/configs/sun3_defconfig     |   8 ++-
 arch/m68k/configs/sun3x_defconfig    |   8 ++-
 arch/m68k/include/asm/signal.h       |   5 --
 arch/m68k/kernel/signal.c            |  16 -----
 drivers/nubus/nubus.c                | 125 +++--------------------------------
 include/linux/ptrace.h               |   4 --
 kernel/signal.c                      |   1 -
 17 files changed, 95 insertions(+), 152 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
