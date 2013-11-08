From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.13
Date: Fri, 8 Nov 2013 09:33:39 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1311080929260.10299@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>

	Hi Linus,

The following changes since commit 6e4664525b1db28f8c4e1130957f70a94c19213e:

  Linux 3.11 (2013-09-02 13:46:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 77a42796786c2ea2d3a67262fb5f1f707c3e0594:

  m68k: Remove deprecated IRQF_DISABLED (2013-09-26 09:54:16 +0200)

----------------------------------------------------------------
Geert Uytterhoeven (1):
      m68k/m68knommu: Implement __get_user_unaligned/__put_user_unaligned()

Michael Opdenacker (1):
      m68k: Remove deprecated IRQF_DISABLED

Summary:
  - __put_user_unaligned may/will be used by btrfs
  - m68k part of a global cleanup

Thanks for pulling!

 arch/m68k/include/asm/floppy.h         |    2 +-
 arch/m68k/include/asm/sun3xflop.h      |    2 +-
 arch/m68k/include/asm/uaccess.h        |    7 +++++++
 arch/m68k/platform/68000/timers.c      |    2 +-
 arch/m68k/platform/68360/config.c      |    2 +-
 arch/m68k/platform/coldfire/pit.c      |    2 +-
 arch/m68k/platform/coldfire/sltimers.c |    4 ++--
 arch/m68k/platform/coldfire/timers.c   |    4 ++--
 8 files changed, 16 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
