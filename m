From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.6
Date: Tue, 15 Mar 2016 13:21:12 +0100
Message-ID: <1458044472-20272-1-git-send-email-geert__16633.7232491516$1458044577$gmane$org@linux-m68k.org>
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

for you to fetch changes up to efbec135f11d6f14f40806935827c53d8889f59b:

  m68k: Fix misspellings in comments. (2016-02-29 09:51:44 +0100)

----------------------------------------------------------------
Adam Buchbinder (1):
      m68k: Fix misspellings in comments.

Geliang Tang (1):
      zorro: Use kobj_to_dev()

Greg Ungerer (1):
      m68k: Use conventional function parameters for do_sigreturn

 arch/m68k/include/asm/MC68328.h   | 6 +++---
 arch/m68k/include/asm/MC68EZ328.h | 6 +++---
 arch/m68k/include/asm/MC68VZ328.h | 6 +++---
 arch/m68k/include/asm/m54xxacr.h  | 4 ++--
 arch/m68k/include/asm/mac_iop.h   | 2 +-
 arch/m68k/include/asm/mcftimer.h  | 2 +-
 arch/m68k/kernel/entry.S          | 6 ++++++
 arch/m68k/kernel/signal.c         | 8 ++------
 arch/m68k/mac/via.c               | 2 +-
 drivers/zorro/zorro-sysfs.c       | 3 +--
 10 files changed, 23 insertions(+), 22 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
