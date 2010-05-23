From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Remaining m68k wd33c93 patches
Date: Sun, 23 May 2010 11:16:04 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1005231105020.873@ayla.of.borg>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: "James E.J. Bottomley" <James.Bottomley@suse.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>

	Hi James,

Can you please take the remaining m68k wd33c93 SCSI patches [*] and feed them
to Linus, or ack them, so I can flush my for-2.6.35 branch that depends on
them?

Thanks in advance!

[*] The following changes since commit f4b87dee923342505e1ddba8d34ce9de33e75050:
  Randy Dunlap (1):
        fbmem: avoid printk format warning with 32-bit resources

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-scsi

Geert Uytterhoeven (16):
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

 arch/m68k/amiga/platform.c |   22 ++
 drivers/scsi/a2091.c       |  245 +++++++++++---------
 drivers/scsi/a2091.h       |    4 +-
 drivers/scsi/a3000.c       |  256 +++++++++++++---------
 drivers/scsi/a3000.h       |    4 +-
 drivers/scsi/a4000t.c      |  101 ++++-----
 drivers/scsi/gvp11.c       |  541 +++++++++++++++++++++++---------------------
 drivers/scsi/gvp11.h       |   11 +-
 drivers/scsi/mvme147.c     |   33 ++--
 9 files changed, 663 insertions(+), 554 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
