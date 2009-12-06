From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git pull] m68k updates for 2.6.33
Date: Sun, 6 Dec 2009 20:19:35 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0912062016350.1656__35830.5078153082$1260127489$gmane$org@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg Ungerer <gerg@uclinux.org>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

Please pull to receive the m68k updates for 2.6.33.
The 2 new RTC drivers have been ack'ed by the RTC maintainer, and will be
wired up shortly.

Thanks!

The following changes since commit 22763c5cf3690a681551162c15d34d935308c8d7:
  Linus Torvalds (1):
        Linux 2.6.32

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Andreas Schwab (2):
      m68k: use generic code for ptrace requests
      m68k: ptrace fixes

Geert Uytterhoeven (2):
      rtc: Add an RTC driver for the Oki MSM6242
      rtc: Add an RTC driver for the Ricoh RP5C01

Greg Ungerer (1):
      m68knommu: define arch_has_single_step() and friends

John Kacur (1):
      m68k: Remove the BKL from sys_execve

Krzysztof Helt (1):
      fbdev: atafb - add palette register check

Roel Kluin (1):
      m68k: parport_mfc3 - Not makes it a bool before the comparison.

Stephen Rothwell (1):
      m68k: don't export static inline functions

Tim Abbott (2):
      m68k: Make thread_info.h usable from assembly.
      m68k: Cleanup linker scripts using new linker script macros.

 arch/m68k/include/asm/ptrace.h         |   17 ++
 arch/m68k/include/asm/thread_info_mm.h |    5 +-
 arch/m68k/kernel/entry.S               |    6 +-
 arch/m68k/kernel/process.c             |    5 +-
 arch/m68k/kernel/ptrace.c              |  112 ++++++--------
 arch/m68k/kernel/vmlinux-std.lds       |   61 ++------
 arch/m68k/kernel/vmlinux-sun3.lds      |   54 +------
 arch/m68knommu/kernel/ptrace.c         |   18 ++-
 drivers/dio/dio-driver.c               |    1 -
 drivers/parport/parport_mfc3.c         |    2 +-
 drivers/rtc/Kconfig                    |   19 +++
 drivers/rtc/Makefile                   |    2 +
 drivers/rtc/rtc-msm6242.c              |  269 ++++++++++++++++++++++++++++++++
 drivers/rtc/rtc-rp5c01.c               |  222 ++++++++++++++++++++++++++
 drivers/video/atafb.c                  |    3 +
 drivers/zorro/zorro-driver.c           |    1 -
 16 files changed, 624 insertions(+), 173 deletions(-)
 create mode 100644 drivers/rtc/rtc-msm6242.c
 create mode 100644 drivers/rtc/rtc-rp5c01.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
