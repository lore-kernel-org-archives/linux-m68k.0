From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.9
Date: Tue, 19 Feb 2013 22:31:50 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1302192229230.12529@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit 19f949f52599ba7c3f67a5897ac6be14bfcb1200:
  Linus Torvalds (1):
        Linux 3.8

are available in the git repository at:

  ra.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Geert Uytterhoeven (1):
      m68k: Sort out !CONFIG_MMU_SUN3 vs. CONFIG_HAS_DMA

Jean Delvare (1):
      swim: Add missing spinlock init

 arch/m68k/include/asm/dma-mapping.h |    5 -----
 arch/m68k/kernel/Makefile           |    4 +---
 drivers/block/swim.c                |    1 +
 3 files changed, 2 insertions(+), 8 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
