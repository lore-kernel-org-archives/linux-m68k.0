From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.17 (take 2)
Date: Thu, 4 Sep 2014 18:25:10 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1409041822460.17564@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

        Hi Linus,

The following changes since commit 69e273c0b0a3c337a521d083374c918dc52c666f:

  Linux 3.17-rc3 (2014-08-31 18:23:04 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 4ed7800987b1b082f8fc98c5cb7eb20cf74280a8:

  m68k: Wire up memfd_create (2014-09-01 10:28:00 +0200)

Summary:
  - m68k: Wire up new syscalls getrandom and memfd_create

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      m68k: Wire up getrandom
      m68k: Wire up memfd_create

 arch/m68k/include/asm/unistd.h      | 2 +-
 arch/m68k/include/uapi/asm/unistd.h | 2 ++
 arch/m68k/kernel/syscalltable.S     | 2 ++
 3 files changed, 5 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
