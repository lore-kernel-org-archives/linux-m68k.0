From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 3.10
Date: Fri, 10 May 2013 17:13:58 +1000
Message-ID: <201305100713.r4A7Dwq6031930@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv03p.mx.bigpond.com ([61.9.168.237]:20768 "EHLO
	nskntqsrv03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751561Ab3EJIPx (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 10 May 2013 04:15:53 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

The bulk of the changes are generalizing the ColdFire v3 core support and
adding in 537x CPU support. Also a couple of other bug fixes, one to fix
a reintroduction of a past bug in the romfs filesystem nommu support.

Regards
Greg




The following changes since commit 60d509fa6a9c4653a86ad830e4c4b30360b23f0e:

  Linux 3.9-rc8 (2013-04-21 14:38:45 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 2842e5b00e99b30404f9af1c1b367c8e467b5c6c:

  m68knommu: enable Timer on coldfire 532x (2013-04-29 09:17:59 +1000)

----------------------------------------------------------------
Greg Ungerer (8):
      romfs: fix nommu map length to keep inside filesystem
      m68k: remove unused asm/dbg.h
      m68knommu: create and use a common M53xx ColdFire class of CPUs
      m68knommu: make ColdFire M532x platform support more v3 generic
      m68knommu: add support for the ColdFire 537x family of CPUs
      m68knommu: add support for configuring a Freescale M5373EVB board
      m68knommu: fix ColdFire 5373/5329 QSPI base address
      m68knommu: enable Timer on coldfire 532x

Paul Bolle (1):
      m68k: clean up unused "config ROMVECSIZE"

Stany MARCEL (1):
      m68k: Set ColdFire ACR1 cache mode depending on kernel configuration

 arch/m68k/Kconfig.cpu                            | 12 ++++++++++++
 arch/m68k/Kconfig.machine                        | 16 +++++++---------
 arch/m68k/Makefile                               |  1 +
 arch/m68k/include/asm/dbg.h                      |  6 ------
 arch/m68k/include/asm/dma.h                      |  2 +-
 arch/m68k/include/asm/m53xxacr.h                 |  4 ++--
 arch/m68k/include/asm/{m532xsim.h => m53xxsim.h} | 12 ++++++------
 arch/m68k/include/asm/m54xxacr.h                 |  7 ++++++-
 arch/m68k/include/asm/mcfgpio.h                  | 10 +++++-----
 arch/m68k/include/asm/mcfsim.h                   |  4 ++--
 arch/m68k/include/asm/mcftimer.h                 |  2 +-
 arch/m68k/platform/coldfire/Makefile             |  2 +-
 arch/m68k/platform/coldfire/{m532x.c => m53xx.c} | 23 +++++++++++------------
 arch/m68k/platform/coldfire/timers.c             |  2 +-
 drivers/tty/serial/68328serial.c                 |  1 -
 fs/romfs/mmap-nommu.c                            |  5 ++++-
 16 files changed, 60 insertions(+), 49 deletions(-)
 delete mode 100644 arch/m68k/include/asm/dbg.h
 rename arch/m68k/include/asm/{m532xsim.h => m53xxsim.h} (99%)
 rename arch/m68k/platform/coldfire/{m532x.c => m53xx.c} (98%)
