From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 0/5] m68k/atari: Remove obsolete IRQ_TYPE_*
Date: Mon, 12 Jan 2015 09:40:16 +0100
Message-ID: <1421052021-12560-1-git-send-email-geert__8527.14495636082$1421052125$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi net/fbdev/sound maintainers,

IRQ_TYPE_SLOW, IRQ_TYPE_FAST, and IRQ_TYPE_PRIO are no longer used by
the Atari platform interrupt code since commit 734085651c9b80aa
("[PATCH] m68k: convert atari irq code") in v2.6.18-rc1, so drop them.

Note that their values have been reused for different purposes
(IRQ_TYPE_NONE, IRQ_TYPE_EDGE_RISING, and IRQ_TYPE_EDGE_FALLING) since
commit 6a6de9ef5850d063 ("[PATCH] genirq: core") in v2.6.18-rc1.

The last patch depends on the first 4 patches.
Please either apply the relevant patches (1, 3 or 4; parport has no
maintainer) to your trees, or ack them.

Thanks in advance!

Geert Uytterhoeven (5):
  net: atarilance: Remove obsolete IRQ_TYPE_PRIO
  parport: parport_atari: Remove obsolete IRQ_TYPE_SLOW
  video: atafb: Remove obsolete IRQ_TYPE_PRIO
  sound: dmasound_atari: Remove obsolete IRQ_TYPE_SLOW
  m68k/atari: Remove obsolete IRQ_TYPE_*

 arch/m68k/atari/atakeyb.c             | 5 ++---
 arch/m68k/atari/stdma.c               | 2 +-
 arch/m68k/atari/time.c                | 3 +--
 arch/m68k/include/asm/atariints.h     | 5 -----
 drivers/net/ethernet/amd/atarilance.c | 8 ++++----
 drivers/parport/parport_atari.c       | 4 ++--
 drivers/video/fbdev/atafb.c           | 3 +--
 sound/oss/dmasound/dmasound_atari.c   | 2 +-
 8 files changed, 12 insertions(+), 20 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
