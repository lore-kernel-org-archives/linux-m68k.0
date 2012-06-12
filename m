From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.5 (take two)
Date: Tue, 12 Jun 2012 22:32:25 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1206122230360.446@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit f8f5701bdaf9134b1f90e5044a82c66324d2073f:
  Linus Torvalds (1):
        Linux 3.5-rc1

are available in the git repository at:

  ra.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Geert Uytterhoeven (1):
      m68k: Use generic strncpy_from_user(), strlen_user(), and strnlen_user()

 arch/m68k/Kconfig                  |    2 +
 arch/m68k/include/asm/Kbuild       |    2 +
 arch/m68k/include/asm/uaccess_mm.h |   11 +++--
 arch/m68k/lib/uaccess.c            |   74 ------------------------------------
 4 files changed, 11 insertions(+), 78 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
