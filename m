From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [git pull] m68k updates for 2.6.35
Date: Wed, 26 May 2010 19:59:07 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1005261956560.21517@ayla.of.borg>
References: <alpine.DEB.2.00.1005172139470.30344@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1005172139470.30344@ayla.of.borg>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "James E.J. Bottomley" <James.Bottomley@suse.de>, Linux/m68k <linux-m68k@lists.linux-m68k.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

On Mon, 17 May 2010, Geert Uytterhoeven wrote:
> Please pull to receive the first batch of m68k updates for 2.6.35.
> The platform patch has been acked by GregKH.
> 
> I have a second batch ready, but it has to wait a bit since it depends on
> a big pile of SCSI patches.

Here's the second batch. The SCSI changes have been ack'ed by James.
Thanks for pulling!

The following changes since commit 63a6440326e4cd01d6a663069208a0e68e9b833f:
  Linus Torvalds (1):
        Merge git://git.kernel.org/.../pkl/squashfs-linus

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

FUJITA Tomonori (1):
      m68k: set ARCH_KMALLOC_MINALIGN

Geert Uytterhoeven (23):
      m68k: Enable atomic64_t
      m68k/scsi: gvp11 - Kill ugly DMA() macro
      m68k/scsi: a3000 - Kill ugly DMA() macro
      m68k/scsi: mvme147 - Kill static global mvme147_host
      m68k/scsi: a3000 - Kill static global a3000_host
      m68k/scsi: gvp11 - Extract check_wd33c93()
      m68k/scsi: a2091 - Kill a2091_scsiregs typedef
      m68k/scsi: gvp11 - Kill gvp11_scsiregs typedef
      m68k/scsi: a3000 - Kill a3000_scsiregs typedef
      m68k/scsi: mvme147 - Kill obsolete HOSTS_C logic
      m68k: amiga - A2091/A590 SCSI zorro_driver conversion
      m68k/scsi: a2091 - Do not use legacy Scsi_Host.base
      m68k: amiga - GVP Series II SCSI zorro_driver conversion
      m68k/scsi: gvp11 - Do not use legacy Scsi_Host.base
      m68k: amiga - A3000 SCSI platform device conversion
      m68k/scsi: a3000 - Do not use legacy Scsi_Host.base
      m68k: amiga - A4000T SCSI platform device conversion
      m68k: amiga - Amiga Gayle IDE platform device conversion
      m68k: amiga - Keyboard platform device conversion
      m68k: amiga - Mouse platform device conversion
      m68k: amiga - Serial port platform device conversion
      m68k: amiga - Parallel port platform device conversion
      m68k: amiga - RTC platform device conversion

 arch/m68k/Kconfig                |    1 +
 arch/m68k/amiga/config.c         |  174 ------------
 arch/m68k/amiga/platform.c       |  116 ++++++++-
 arch/m68k/include/asm/amigayle.h |    6 +
 arch/m68k/include/asm/atomic.h   |    2 +
 arch/m68k/include/asm/cache.h    |    2 +
 drivers/char/amiserial.c         |   61 +++--
 drivers/ide/gayle.c              |  147 ++++++-----
 drivers/input/keyboard/amikbd.c  |   97 ++++---
 drivers/input/mouse/amimouse.c   |   98 +++++---
 drivers/parport/parport_amiga.c  |   64 +++--
 drivers/scsi/a2091.c             |  245 ++++++++++--------
 drivers/scsi/a2091.h             |    4 +-
 drivers/scsi/a3000.c             |  256 +++++++++++--------
 drivers/scsi/a3000.h             |    4 +-
 drivers/scsi/a4000t.c            |  101 ++++----
 drivers/scsi/gvp11.c             |  541 ++++++++++++++++++++------------------
 drivers/scsi/gvp11.h             |   11 +-
 drivers/scsi/mvme147.c           |   33 ++--
 19 files changed, 1045 insertions(+), 918 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
