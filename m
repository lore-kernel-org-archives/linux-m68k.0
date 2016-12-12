From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 4.10
Date: Mon, 12 Dec 2016 11:04:14 +0100
Message-ID: <1481537054-3629-1-git-send-email-geert__1204.64150463722$1481537065$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi Linus,

The following changes since commit 7e251bb21ae08ca2e4fb28cc0981fac2685a8efa:

  m68k: Fix ndelay() macro (2016-10-30 10:13:55 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git tags/m68k-for-v4.10-tag1

for you to fetch changes up to ad595b77c4a8553516a5d76c9ecf68a0ff13960e:

  m68k/atari: Use seq_puts() in atari_get_hardware_list() (2016-12-09 08:52:29 +0100)

----------------------------------------------------------------
m68k updates for 4.10

  - Use seq_puts() for fixed strings.

----------------------------------------------------------------
Markus Elfring (2):
      m68k/amiga: Use seq_puts() in amiga_get_hardware_list()
      m68k/atari: Use seq_puts() in atari_get_hardware_list()

 arch/m68k/amiga/config.c | 3 +--
 arch/m68k/atari/config.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
