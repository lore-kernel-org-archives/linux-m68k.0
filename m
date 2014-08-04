From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.17
Date: Mon, 4 Aug 2014 21:50:18 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1408042146210.19306@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following extremely non-spectacular changes since commit
5bc8c7cdeb6e3d9c1b938b4029d9a22f8dc5cd9d:

  m68k: Export mach_random_get_entropy to modules (2014-07-11 10:37:53 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 9117710a5997eb078035052800a31b77d47e0e5a:

  m68k/sun3: Remove define statement no longer needed (2014-07-26 17:48:34 +0200)

Thanks for pulling!

----------------------------------------------------------------
Himangi Saraogi (1):
      zorro: Use ARRAY_SIZE

Nicholas Krause (1):
      m68k/sun3: Remove define statement no longer needed

 arch/m68k/include/asm/sun3_pgalloc.h | 4 ----
 drivers/zorro/names.c                | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
