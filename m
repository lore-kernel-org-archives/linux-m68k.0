From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 2.6.34
Date: Mon, 29 Mar 2010 20:52:37 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1003292048530.3832__28405.421638354$1269889093$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

Please pull to receive 2 more m68k updates for 2.6.34:
  - The first one fixes a build problem we started seeing lately,
  - The second one corrects struct sigcontext for ColdFire, as I've
    accidentally merged the wrong version of a patch for the previous
    pull request.

Thanks!

The following changes since commit b72c40949b0f04728f2993a1434598d3bad094ea:
  Linus Torvalds (1):
        Merge branch 'for-linus' of git://git.kernel.org/.../jbarnes/pci-2.6

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Geert Uytterhoeven (1):
      m68k: Fix asm constraints for atomic_sub_and_test() and atomic_add_negative()

Maxim Kuvyrkov (1):
      m68k: Fix `struct sigcontext' for ColdFire

 arch/m68k/include/asm/atomic_mm.h  |    8 ++++++--
 arch/m68k/include/asm/sigcontext.h |    4 +---
 2 files changed, 7 insertions(+), 5 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
