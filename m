From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.8
Date: Thu, 4 Aug 2016 09:54:39 +1000
Message-ID: <8233e2b6-e5f2-85b0-3728-68c6942f12fd@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Nicolas Pitre <nicolas.pitre@linaro.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.

This series is all about Nicolas flat format support for MMU systems.
Traditional m68k no-MMU flat format binaries can now be run on m68k MMU
enabled systems too. The series includes some nice cleanups of the
binfmt_flat code and converts it to using proper user space accessor
functions. With all this in place you can boot and run a complete no-MMU
flat format based user space on an MMU enabled system.

Sorry it is based on a random commit after rc7. There was a merge clash
on binfmt_flat.c after rc7. But it was merge clean from this point.

Regards
Greg



The following changes since commit 47ef4ad2684d380dd6d596140fb79395115c3950:

  Merge tag 'for-linus-20160715' of git://git.infradead.org/linux-mtd (2016-07-16 09:53:34 +0900)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to 002d2f01f13f1671d771e1493a3405ed4986694d:

  m68k: enable binfmt_flat on systems with an MMU (2016-07-28 13:29:13 +1000)

----------------------------------------------------------------
Greg Ungerer (3):
      m68k: fix bFLT executable running on MMU enabled systems
      m68k: fix file path comment
      m68k: use same start_thread() on MMU and no-MMU

Nicolas Pitre (13):
      binfmt_flat: assorted cleanups
      binfmt_flat: convert printk invocations to their modern form
      binfmt_flat: prevent kernel dammage from corrupted executable headers
      elf_fdpic_transfer_args_to_stack(): make it generic
      binfmt_flat: use generic transfer_args_to_stack()
      binfmt_flat: clean up create_flat_tables() and stack accesses
      binfmt_flat: use proper user space accessors with relocs processing code
      binfmt_flat: use proper user space accessors with old relocs code
      binfmt_flat: use clear_user() rather than memset() to clear .bss
      binfmt_flat: update libraries' data segment pointer with userspace accessors
      binfmt_flat: add MMU-specific support
      binfmt_flat: allow compressed flat binary format to work on MMU systems
      m68k: enable binfmt_flat on systems with an MMU

 arch/m68k/include/asm/flat.h      |  13 +-
 arch/m68k/include/asm/processor.h |  15 +-
 fs/Kconfig.binfmt                 |   3 +-
 fs/binfmt_elf_fdpic.c             |  38 +--
 fs/binfmt_flat.c                  | 525 +++++++++++++++++++++-----------------
 fs/exec.c                         |  33 +++
 include/linux/binfmts.h           |   2 +
 7 files changed, 344 insertions(+), 285 deletions(-)
