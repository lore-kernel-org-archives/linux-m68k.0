From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [git] m68k
Date: Thu, 23 Apr 2009 20:37:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0904232036310.17875@anakin>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from juliette.telenet-ops.be ([195.130.137.74]:50625 "EHLO
	juliette.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758430AbZDWShn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 23 Apr 2009 14:37:43 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Linus,

The following changes since commit 091069740304c979f957ceacec39c461d0192158:
  Linus Torvalds (1):
        Linux 2.6.30-rc3

are available in the git repository at:

  master.kernel.org:/pub/scm/linux/kernel/git/geert/linux-m68k.git for-linus

Geert Uytterhoeven (3):
      scsi: a4000 - Correct driver unregistration in case of failure
      m68k,m68knommu: Wire up preadv and pwritev
      m68k: Update defconfigs for 2.6.30-rc3

 arch/m68k/configs/amiga_defconfig    |  163 +++++++++++++++++++++------------
 arch/m68k/configs/apollo_defconfig   |  120 +++++++++++++++++--------
 arch/m68k/configs/atari_defconfig    |  155 +++++++++++++++++++++-----------
 arch/m68k/configs/bvme6000_defconfig |  119 +++++++++++++++++--------
 arch/m68k/configs/hp300_defconfig    |  120 +++++++++++++++++--------
 arch/m68k/configs/mac_defconfig      |  125 +++++++++++++++++---------
 arch/m68k/configs/multi_defconfig    |  157 ++++++++++++++++++++------------
 arch/m68k/configs/mvme147_defconfig  |  119 +++++++++++++++++--------
 arch/m68k/configs/mvme16x_defconfig  |  119 +++++++++++++++++--------
 arch/m68k/configs/q40_defconfig      |  122 +++++++++++++++++--------
 arch/m68k/configs/sun3_defconfig     |  120 +++++++++++++++++--------
 arch/m68k/configs/sun3x_defconfig    |  120 +++++++++++++++++--------
 arch/m68k/include/asm/unistd.h       |    4 +-
 arch/m68k/kernel/entry.S             |    2 +
 arch/m68knommu/kernel/syscalltable.S |    2 +
 drivers/scsi/a4000t.c                |    2 +-
 16 files changed, 1042 insertions(+), 527 deletions(-)

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
