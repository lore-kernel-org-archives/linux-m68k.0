From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.5 (take two)
Date: Mon, 15 Feb 2016 10:00:57 +0100
Message-ID: <1455526857-6734-1-git-send-email-geert__39305.6563371376$1455526900$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to daf670bc9d36ba8b03e010f4bf798bebe08659fe:

  m68k/defconfig: Update defconfigs for v4.5-rc1 (2016-02-01 10:35:38 +0100)

Summary:
  - Wire up new copy_file_range syscall,
  - Update defconfigs

----------------------------------------------------------------
Geert Uytterhoeven (2):
      m68k: Wire up copy_file_range
      m68k/defconfig: Update defconfigs for v4.5-rc1

 arch/m68k/configs/amiga_defconfig    | 9 +++++++++
 arch/m68k/configs/apollo_defconfig   | 9 +++++++++
 arch/m68k/configs/atari_defconfig    | 9 +++++++++
 arch/m68k/configs/bvme6000_defconfig | 9 +++++++++
 arch/m68k/configs/hp300_defconfig    | 9 +++++++++
 arch/m68k/configs/mac_defconfig      | 9 +++++++++
 arch/m68k/configs/multi_defconfig    | 9 +++++++++
 arch/m68k/configs/mvme147_defconfig  | 9 +++++++++
 arch/m68k/configs/mvme16x_defconfig  | 9 +++++++++
 arch/m68k/configs/q40_defconfig      | 9 +++++++++
 arch/m68k/configs/sun3_defconfig     | 9 +++++++++
 arch/m68k/configs/sun3x_defconfig    | 9 +++++++++
 arch/m68k/include/asm/unistd.h       | 2 +-
 arch/m68k/include/uapi/asm/unistd.h  | 1 +
 arch/m68k/kernel/syscalltable.S      | 1 +
 15 files changed, 111 insertions(+), 1 deletion(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
