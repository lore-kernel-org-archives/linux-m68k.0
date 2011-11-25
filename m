From: <gerg@snapgear.com>
Subject: [PATCH 00/35 v2] m68k: ColdFire MMU support
Date: Fri, 25 Nov 2011 13:40:45 +1000
Message-ID: <1322192480-22822-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:16476 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830Ab1KYDi6 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 24 Nov 2011 22:38:58 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Hi All,

This is version 2 of a patch set that adds support for running the V4e
ColdFire cores with their MMU enabled. A bit of cleanup and some fixes over
the first version. In particular the following changes:

. rebased onto 3.2-rc3
. fixed FPU support
. fixed running with shared libraries
. fixed running at non-0 based RAM (thanks to Alexander Stein)
. many random small cleanups
. spelling and comment fixes

This patch set is based on 3.2-rc3 with all the recent patches I have sent
here applied first. It is available as a git tree for easier testing, just
pull this tree, with the cfmmu branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cfmmu

Some of the code in this set is taken from Freescales 2.6.25 kernel support
of MMU ColdFire.

Specifically I am testing this on a ColdFire 5475 (on a FireBee board).
I have test compiled and run this patch set on ARAnyM as well, I didn't have
any problems there. Also test compiled and run on MMU-less ColdFire.

Geert, any patches that changed in any significant way I dropped your
"Acked-by".

Regards
Greg


---
 arch/m68k/Kconfig                     |   10 +-
 arch/m68k/Kconfig.cpu                 |    8 +-
 arch/m68k/include/asm/atomic.h        |   10 +
 arch/m68k/include/asm/cacheflush_mm.h |   88 +++++++-
 arch/m68k/include/asm/elf.h           |    6 +-
 arch/m68k/include/asm/entry.h         |   10 +-
 arch/m68k/include/asm/fpu.h           |    2 +
 arch/m68k/include/asm/irq.h           |    5 +-
 arch/m68k/include/asm/m54xxacr.h      |   32 +++-
 arch/m68k/include/asm/mcf_pgalloc.h   |  102 ++++++++
 arch/m68k/include/asm/mcf_pgtable.h   |  422 +++++++++++++++++++++++++++++++++
 arch/m68k/include/asm/mcfmmu.h        |  119 +++++++++
 arch/m68k/include/asm/mmu_context.h   |  250 ++++++++++++++++----
 arch/m68k/include/asm/page.h          |    6 +-
 arch/m68k/include/asm/page_offset.h   |    8 +-
 arch/m68k/include/asm/pgalloc.h       |    4 +-
 arch/m68k/include/asm/pgtable_mm.h    |   30 ++-
 arch/m68k/include/asm/processor.h     |   16 +-
 arch/m68k/include/asm/segment.h       |   30 ++-
 arch/m68k/include/asm/setup.h         |   14 +
 arch/m68k/include/asm/thread_info.h   |    3 +
 arch/m68k/include/asm/tlbflush.h      |   23 ++-
 arch/m68k/include/asm/uaccess_mm.h    |   42 +++-
 arch/m68k/kernel/Makefile             |    4 +-
 arch/m68k/kernel/entry.S              |    2 +-
 arch/m68k/kernel/entry_no.S           |    3 +
 arch/m68k/kernel/process_mm.c         |   59 ++++-
 arch/m68k/kernel/ptrace_mm.c          |   18 ++
 arch/m68k/kernel/setup_mm.c           |   18 ++-
 arch/m68k/kernel/signal_mm.c          |  173 ++++++++++----
 arch/m68k/kernel/time.c               |    2 +-
 arch/m68k/kernel/traps.c              |  104 ++++++++
 arch/m68k/kernel/vmlinux.lds.S        |    2 +-
 arch/m68k/kernel/vmlinux.lds_no.S     |    8 +
 arch/m68k/lib/uaccess.c               |   22 +-
 arch/m68k/mm/Makefile                 |    8 +-
 arch/m68k/mm/cache.c                  |   24 ++-
 arch/m68k/mm/init_mm.c                |    2 +-
 arch/m68k/mm/kmap.c                   |    4 +
 arch/m68k/mm/mcfmmu.c                 |  219 +++++++++++++++++
 arch/m68k/mm/memory.c                 |    8 +-
 arch/m68k/platform/54xx/config.c      |   48 ++++
 arch/m68k/platform/coldfire/entry.S   |    6 +-
 arch/m68k/platform/coldfire/head.S    |   47 ++++-
 44 files changed, 1808 insertions(+), 213 deletions(-)
 create mode 100644 arch/m68k/include/asm/mcf_pgalloc.h
 create mode 100644 arch/m68k/include/asm/mcf_pgtable.h
 create mode 100644 arch/m68k/include/asm/mcfmmu.h
 create mode 100644 arch/m68k/mm/mcfmmu.c
