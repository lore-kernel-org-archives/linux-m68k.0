From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 3.1
Date: Sun, 31 Jul 2011 23:11:17 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1107312306130.605__19020.7911110067$1312146706$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Ungerer <gerg@uclinux.org>, Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit 02f8c6aee8df3cdc935e9bdd4f2d020306035dbe:
  Linus Torvalds (1):
        Linux 3.0

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus
  git://git.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Geert Uytterhoeven (13):
      m68k/amiga: Chip RAM - Use tabs for indentation
      m68k/amiga: Chip RAM - Convert from printk() to pr_*()
      m68k/amiga: Chip RAM - Always allocate from the start of memory
      m68k/amiga: Chip RAM - Change chipavail to an atomic_t
      m68k/amiga: Chip RAM - Use resource_size() to fix off-by-one error
      m68k/amiga: Chip RAM - Offset resource end by CHIP_PHYSADDR
      sparc: _sparc_find_resource() should check for exact matches
      resources: Add lookup_resource()
      m68k/amiga: Chip RAM - Use lookup_resource()
      sparc: iounmap() and *_free_coherent() - Use lookup_resource()
      m68k/atari: Prefix GPIO_{IN,OUT} with CODEC_
      m68k: Kill warning in setup_arch() when compiling for Sun3
      m68k/math-emu: Remove commented out old code

Greg Dietsche (1):
      m68k/math-emu: Remove unnecessary code

Michael Schmitz (1):
      m68k/atari: Reserve some ST-RAM early on for device buffer use

 arch/m68k/Kconfig.mmu               |    6 -
 arch/m68k/amiga/chipram.c           |  136 ++++-----
 arch/m68k/atari/stram.c             |  354 +++++-------------------
 arch/m68k/include/asm/atari_stram.h |    3 +-
 arch/m68k/include/asm/atarihw.h     |    4 +-
 arch/m68k/kernel/setup_mm.c         |    2 +
 arch/m68k/math-emu/fp_log.c         |    3 -
 arch/m68k/math-emu/multi_arith.h    |  530 -----------------------------------
 arch/m68k/mm/init_mm.c              |    5 -
 arch/sparc/kernel/ioport.c          |   32 +--
 include/linux/ioport.h              |    1 +
 kernel/resource.c                   |   21 ++
 12 files changed, 166 insertions(+), 931 deletions(-)

The changes to the sparc-code have been acked by David Miller.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
