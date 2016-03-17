From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu/coldfire fixes for 4.6
Date: Fri, 18 Mar 2016 08:18:13 +1000
Message-ID: <56EB2D25.3020602@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out2.external.iinet.net.au ([203.59.1.155]:33752
	"EHLO icp-osb-irony-out2.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756723AbcCQWSV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 17 Mar 2016 18:18:21 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
The main change is the removal of the bit-rotten 68360 support.
Also a fix to always make the ethernet FEC platform info available.

Regards
Greg



The following changes since commit f6cede5b49e822ebc41a099fe41ab4989f64e2cb:

  Linux 4.5-rc7 (2016-03-06 14:48:03 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to a3595962d82495f51a80feb19dcdb135556a9527:

  m68knommu: remove obsolete 68360 support (2016-03-07 10:07:17 +1000)

----------------------------------------------------------------
Greg Ungerer (2):
      m68knommu: fix FEC platform device registration when driver is modular
      m68knommu: remove obsolete 68360 support

 arch/m68k/68360/Makefile             |  12 -
 arch/m68k/68360/commproc.c           | 309 ----------------
 arch/m68k/68360/config.c             | 169 ---------
 arch/m68k/68360/entry.S              | 164 ---------
 arch/m68k/68360/head-ram.S           | 402 ---------------------
 arch/m68k/68360/head-rom.S           | 413 ----------------------
 arch/m68k/68360/ints.c               | 138 --------
 arch/m68k/Kconfig.cpu                |   7 -
 arch/m68k/Kconfig.debug              |   2 +-
 arch/m68k/Kconfig.machine            |   6 -
 arch/m68k/Makefile                   |   3 -
 arch/m68k/coldfire/device.c          |   4 +-
 arch/m68k/include/asm/commproc.h     | 664 -----------------------------------
 arch/m68k/include/asm/m68360.h       |  13 -
 arch/m68k/include/asm/m68360_enet.h  | 177 ----------
 arch/m68k/include/asm/m68360_pram.h  | 431 -----------------------
 arch/m68k/include/asm/m68360_quicc.h | 362 -------------------
 arch/m68k/include/asm/m68360_regs.h  | 408 ---------------------
 arch/m68k/kernel/early_printk.c      |   8 +-
 arch/m68k/kernel/setup_no.c          |   7 -
 20 files changed, 7 insertions(+), 3692 deletions(-)
 delete mode 100644 arch/m68k/68360/Makefile
 delete mode 100644 arch/m68k/68360/commproc.c
 delete mode 100644 arch/m68k/68360/config.c
 delete mode 100644 arch/m68k/68360/entry.S
 delete mode 100644 arch/m68k/68360/head-ram.S
 delete mode 100644 arch/m68k/68360/head-rom.S
 delete mode 100644 arch/m68k/68360/ints.c
 delete mode 100644 arch/m68k/include/asm/commproc.h
 delete mode 100644 arch/m68k/include/asm/m68360.h
 delete mode 100644 arch/m68k/include/asm/m68360_enet.h
 delete mode 100644 arch/m68k/include/asm/m68360_pram.h
 delete mode 100644 arch/m68k/include/asm/m68360_quicc.h
 delete mode 100644 arch/m68k/include/asm/m68360_regs.h
