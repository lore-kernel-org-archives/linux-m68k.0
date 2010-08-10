From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 2.6.36
Date: Tue, 10 Aug 2010 21:02:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1008102055280.17281@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

Please pull to receive the m68k updates for 2.6.36.

BTW, according to your comments for Jens, this time I did not rebase my
for-linus branch on top of your tree-of-the-moment, but on top of v2.6.35.
But I'm still wondering if this really is better? I never merge anything on
my for-linus branch, and I always verify that my (rebased on every stable
and rc release) m68k-queue branch gives an identical tree to my (merged
on every stable and rc release) private development branch.

The following changes since commit 9fe6206f400646a2322096b56c59891d530e8d51:
  Linus Torvalds (1):
        Linux 2.6.35

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Andrea Gelmini (1):
      arch/m68k/sun3/leds.c: Checkpatch cleanup

Finn Thain (2):
      m68k/mac: Add color classic ii support
      m68k/mac: Fix RTC on PMU machines

Geert Uytterhoeven (2):
      zorro: BKL removal
      zorro: Fix reading of proc/bus/zorro/* in small chunks

 arch/m68k/mac/config.c |    9 +++++++++
 arch/m68k/mac/misc.c   |    6 +++---
 arch/m68k/sun3/leds.c  |    4 ++--
 drivers/zorro/proc.c   |   17 +++++++++--------
 4 files changed, 23 insertions(+), 13 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
