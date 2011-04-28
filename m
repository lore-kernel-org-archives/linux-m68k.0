From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k SLUB fix for 2.6.39
Date: Thu, 28 Apr 2011 20:02:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1104282000200.1563@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, stable@kernel.org, David Rientjes <rientjes@google.com>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

This is the SLUB fix for m68k, which also applies to stable.

The following changes since commit 8e10cd74342c7f5ce259cceca36f6eba084f5d58:
  Linus Torvalds (1):
        Linux 2.6.39-rc5

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-2.6.39

Michael Schmitz (1):
      m68k/mm: Set all online nodes in N_NORMAL_MEMORY

 arch/m68k/mm/motorola.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
