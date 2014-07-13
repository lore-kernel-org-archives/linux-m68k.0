From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.16 (take 2)
Date: Sun, 13 Jul 2014 11:08:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1407131105390.7520@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit cd3de83f147601356395b57a8673e9c5ff1e59d1:

  Linux 3.16-rc4 (2014-07-06 12:37:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

for you to fetch changes up to 5bc8c7cdeb6e3d9c1b938b4029d9a22f8dc5cd9d:

  m68k: Export mach_random_get_entropy to modules (2014-07-11 10:37:53 +0200)

Summary:
  - Fix for a boot regression introduced in v3.16-rc1,
  - Fix for a built issue in -next.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (2):
      m68k: Fix boot regression on machines with RAM at non-zero
      m68k: Export mach_random_get_entropy to modules

 arch/m68k/kernel/head.S | 3 ++-
 arch/m68k/kernel/time.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
