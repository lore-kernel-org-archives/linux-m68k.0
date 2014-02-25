From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.14 (take 2)
Date: Tue, 25 Feb 2014 21:02:09 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1402252058290.9497@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit b28a960c42fcd9cfc987441fa6d1c1a471f0f9ed:

  Linux 3.14-rc2 (2014-02-09 18:15:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 7247f55381d54645a1eb47588de51bb26fa7cb7a:

  m68k: Wire up sched_setattr and sched_getattr (2014-02-10 20:10:20 +0100)

Summary:
  - More barrier.h consolidation,
  - Sched_[gs]etattr() syscalls.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      m68k: Sort arch/m68k/include/asm/Kbuild
      m68k: Switch to asm-generic/barrier.h
      m68k: Wire up sched_setattr and sched_getattr

 arch/m68k/include/asm/Kbuild        |    6 +++---
 arch/m68k/include/asm/barrier.h     |    8 --------
 arch/m68k/include/asm/unistd.h      |    2 +-
 arch/m68k/include/uapi/asm/unistd.h |    2 ++
 arch/m68k/kernel/syscalltable.S     |    2 ++
 5 files changed, 8 insertions(+), 12 deletions(-)
 delete mode 100644 arch/m68k/include/asm/barrier.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
