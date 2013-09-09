From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 3.12
Date: Mon, 9 Sep 2013 10:22:42 +1000
Message-ID: <201309090022.r890Mgi3005822@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwqsrv03p.mx.bigpond.com ([61.9.189.237]:16823 "EHLO
	nschwqsrv03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751119Ab3IIBBk (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sun, 8 Sep 2013 21:01:40 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

Just a small collection of cleanups and fixes this time, no big changes.
The most interresting are to make the m68k and m68knommu consistently use
CONFIG_IOMAP, clean out some unused board config options and flush the
cache on signal stack creation.

Regards
Greg



The following changes since commit d8dfad3876e4386666b759da3c833d62fb8b2267:

  Linux 3.11-rc7 (2013-08-25 17:43:22 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to c065edde73508c6da4afaf064e5999eb3e5aead1:

  m68k: remove 16 unused boards in Kconfig.machine (2013-08-26 16:51:14 +1000)

----------------------------------------------------------------
Alexander Stein (1):
      m68k/coldfire: flush cache when creating the signal stack frame

Geert Uytterhoeven (1):
      m68knommu: Mark functions only called from setup_arch() __init

Greg Ungerer (2):
      m68knommu: user generic iomap to support ioread*/iowrite*
      m68k: define 'VM_DATA_DEFAULT_FLAGS' no matter whether has 'NOMMU' or not

Paul Bolle (1):
      m68k: remove 16 unused boards in Kconfig.machine

 arch/m68k/Kconfig                   |   2 +-
 arch/m68k/Kconfig.machine           | 134 ------------------------------------
 arch/m68k/include/asm/io_no.h       |   1 +
 arch/m68k/include/asm/page.h        |   3 +
 arch/m68k/include/asm/page_mm.h     |   3 -
 arch/m68k/kernel/setup_no.c         |   2 +-
 arch/m68k/kernel/signal.c           |   8 +++
 arch/m68k/platform/68000/m68328.c   |   3 +-
 arch/m68k/platform/68000/m68EZ328.c |   3 +-
 arch/m68k/platform/68000/m68VZ328.c |   9 +--
 arch/m68k/platform/68360/commproc.c |   3 +-
 arch/m68k/platform/68360/config.c   |   3 +-
 12 files changed, 27 insertions(+), 147 deletions(-)
