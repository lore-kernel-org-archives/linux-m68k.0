From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.11-rc6
Date: Fri, 16 Aug 2013 23:55:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1308162324580.23373__14672.3245307387$1376692992$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit d4e4ab86bcba5a72779c43dc1459f71fea3d89c8:

  Linux 3.11-rc5 (2013-08-11 18:04:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-3.11

for you to fetch changes up to ea077b1b96e073eac5c3c5590529e964767fc5f7:

  m68k: Truncate base in do_div() (2013-08-14 11:46:30 +0200)

----------------------------------------------------------------
Andreas Schwab (1):
      m68k: Truncate base in do_div()

Geert Uytterhoeven (1):
      m68k/atari: ARAnyM - Fix NatFeat module support

Summary:

These are two critical fixes, needed by distro kernels, and thus also
destined for stable:
  - The do_div() commit fixes a crash in mounting btrfs volumes, which was
    a regression from 3.2,
  - The ARAnyM fix allows to have NatFeat drivers as loadable modules,
    which is needed for initrds.

Thanks for pulling!

 arch/m68k/emu/natfeat.c       |   23 +++++++++++++++++++----
 arch/m68k/include/asm/div64.h |    9 +++++----
 2 files changed, 24 insertions(+), 8 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
