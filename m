From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.7
Date: Mon, 11 Apr 2016 10:26:57 +0200
Message-ID: <1460363217-9640-1-git-send-email-geert__4769.16875127262$1460363251$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 9735a22799b9214d17d3c231fe377fc852f042e9:

  Linux 4.6-rc2 (2016-04-03 09:09:40 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 7b8ba82ad4ada669c564ec8ccba9cadc6e8abfb1:

  m68k/defconfig: Update defconfigs for v4.6-rc2 (2016-04-07 11:45:31 +0200)

----------------------------------------------------------------
Geert Uytterhoeven (2):
      m68k: Wire up preadv2 and pwritev2
      m68k/defconfig: Update defconfigs for v4.6-rc2

 arch/m68k/configs/amiga_defconfig    | 13 ++++++-------
 arch/m68k/configs/apollo_defconfig   | 13 ++++++-------
 arch/m68k/configs/atari_defconfig    | 13 ++++++-------
 arch/m68k/configs/bvme6000_defconfig | 13 ++++++-------
 arch/m68k/configs/hp300_defconfig    | 13 ++++++-------
 arch/m68k/configs/mac_defconfig      | 13 ++++++-------
 arch/m68k/configs/multi_defconfig    | 13 ++++++-------
 arch/m68k/configs/mvme147_defconfig  | 13 ++++++-------
 arch/m68k/configs/mvme16x_defconfig  | 13 ++++++-------
 arch/m68k/configs/q40_defconfig      | 13 ++++++-------
 arch/m68k/configs/sun3_defconfig     | 13 ++++++-------
 arch/m68k/configs/sun3x_defconfig    | 13 ++++++-------
 arch/m68k/include/asm/unistd.h       |  2 +-
 arch/m68k/include/uapi/asm/unistd.h  |  2 ++
 arch/m68k/kernel/syscalltable.S      |  2 ++
 15 files changed, 77 insertions(+), 85 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
