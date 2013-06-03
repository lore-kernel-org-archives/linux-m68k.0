From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.10, take 3
Date: Mon, 3 Jun 2013 09:57:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1306030955390.17881__35243.1978368715$1370246609$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit e4aa937ec75df0eea0bee03bffa3303ad36c986b:
  Linus Torvalds (1):
        Linux 3.10-rc3

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Finn Thain (1):
      m68k/mac: Fix unexpected interrupt with CONFIG_EARLY_PRINTK

Summarized:
  - A boot lock-up on Mac, also destined for stable.

Thanks for pulling!

 arch/m68k/kernel/head.S |   29 +++++++++++++++++++----------
 1 files changed, 19 insertions(+), 10 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
