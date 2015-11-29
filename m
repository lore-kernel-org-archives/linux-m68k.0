From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.4 (take two)
Date: Sun, 29 Nov 2015 10:35:51 +0100
Message-ID: <1448789751-29871-1-git-send-email-geert__32077.4182714105$1448795021$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 21d380e54c30b5b15aa4167e2458bfe4e4862427:

  m68k: Wire up mlock2 (2015-11-22 11:35:26 +0100)

Summary:
  - Add missing initialization of max_pfn, which is needed to make
    selftests/vm/mlock2-tests succeed,
  - Wire up new mlock2 syscall.

----------------------------------------------------------------
Geert Uytterhoeven (5):
      m68k/mm: motorola - Add missing initialization of max_pfn
      m68k/mm: m54xx - Add missing initialization of max_pfn
      m68k/mm: sun3 - Add missing initialization of max_pfn and {min,max}_low_pfn
      m68knommu: Add missing initialization of max_pfn and {min,max}_low_pfn
      m68k: Wire up mlock2

 arch/m68k/coldfire/m54xx.c          | 2 +-
 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 1 +
 arch/m68k/kernel/setup_no.c         | 9 ++++++---
 arch/m68k/kernel/syscalltable.S     | 1 +
 arch/m68k/mm/motorola.c             | 2 +-
 arch/m68k/sun3/config.c             | 4 ++--
 7 files changed, 13 insertions(+), 8 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
