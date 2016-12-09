From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.9 (take two)
Date: Fri,  9 Dec 2016 09:00:23 +0100
Message-ID: <1481270423-24910-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

I almost forgot I still had some commits queued for v4.9, so here they
are.
Unfortunately the fixes for the pr_cont() breakage aren't ready yet, so
they'll have to wait for (a second PR for) v4.10.

Thanks for pulling!

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.9-tag2

for you to fetch changes up to 7e251bb21ae08ca2e4fb28cc0981fac2685a8efa:

  m68k: Fix ndelay() macro (2016-10-30 10:13:55 +0100)

----------------------------------------------------------------
m68k updates for 4.9 (take two)

  - Build fix for drivers calling ndelay() in a conditional block
    without curly braces,
  - Defconfig updates.

----------------------------------------------------------------
Boris Brezillon (1):
      m68k: Fix ndelay() macro

Geert Uytterhoeven (1):
      m68k/defconfig: Update defconfigs for v4.9-rc1

 arch/m68k/configs/amiga_defconfig    | 8 ++++++--
 arch/m68k/configs/apollo_defconfig   | 8 ++++++--
 arch/m68k/configs/atari_defconfig    | 8 ++++++--
 arch/m68k/configs/bvme6000_defconfig | 8 ++++++--
 arch/m68k/configs/hp300_defconfig    | 8 ++++++--
 arch/m68k/configs/mac_defconfig      | 8 ++++++--
 arch/m68k/configs/multi_defconfig    | 8 ++++++--
 arch/m68k/configs/mvme147_defconfig  | 8 ++++++--
 arch/m68k/configs/mvme16x_defconfig  | 8 ++++++--
 arch/m68k/configs/q40_defconfig      | 8 ++++++--
 arch/m68k/configs/sun3_defconfig     | 8 ++++++--
 arch/m68k/configs/sun3x_defconfig    | 8 ++++++--
 arch/m68k/include/asm/delay.h        | 2 +-
 13 files changed, 73 insertions(+), 25 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
