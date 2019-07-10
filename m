From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v5.3
Date: Wed, 10 Jul 2019 15:22:09 +1000
Message-ID: <cf9d62c7-2b47-e234-ee35-2562b125a411@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-m68k@vger.kernel.org


Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

A series of cleanups for the FLAT format binary loader, binfmt_flat,
from Christoph. The end goal is to support no-MMU on RISC-V, and the
last patch enables that.

Regards
Greg



The following changes since commit 4b972a01a7da614b4796475f933094751a295a2f:

   Linux 5.2-rc6 (2019-06-22 16:01:36 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to ad97f9df0fee4ddc9ef056dda4dcbc6630d9f972:

   riscv: add binfmt_flat support (2019-06-24 09:16:47 +1000)

----------------------------------------------------------------
Christoph Hellwig (17):
       binfmt_flat: remove flat_reloc_valid
       binfmt_flat: remove flat_set_persistent
       binfmt_flat: provide a default version of flat_get_relocate_addr
       binfmt_flat: remove flat_old_ram_flag
       binfmt_flat: replace flat_argvp_envp_on_stack with a Kconfig variable
       binfmt_flat: remove the uapi <linux/flat.h> header
       binfmt_flat: remove the unused OLD_FLAT_FLAG_RAM definition
       binfmt_flat: consolidate two version of flat_v2_reloc_t
       binfmt_flat: use fixed size type for the on-disk format
       binfmt_flat: add endianess annotations
       binfmt_flat: add a ARCH_HAS_BINFMT_FLAT option
       binfmt_flat: make support for old format binaries optional
       binfmt_flat: provide an asm-generic/flat.h
       binfmt_flat: remove the persistent argument from flat_get_addr_from_rp
       binfmt_flat: move the MAX_SHARED_LIBS definition to binfmt_flat.c
       binfmt_flat: don't offset the data start
       riscv: add binfmt_flat support

  arch/arm/Kconfig                                   |  2 +
  arch/arm/include/asm/Kbuild                        |  1 +
  arch/c6x/Kconfig                                   |  1 +
  arch/c6x/include/asm/flat.h                        |  7 +-
  arch/h8300/Kconfig                                 |  3 +
  arch/h8300/include/asm/flat.h                      |  7 +-
  arch/m68k/Kconfig                                  |  2 +
  arch/m68k/include/asm/flat.h                       | 30 +------
  arch/microblaze/Kconfig                            |  1 +
  arch/microblaze/include/asm/flat.h                 |  7 +-
  arch/riscv/Kconfig                                 |  1 +
  arch/riscv/include/asm/Kbuild                      |  1 +
  arch/sh/Kconfig                                    |  1 +
  arch/sh/include/asm/flat.h                         |  7 +-
  arch/xtensa/Kconfig                                |  1 +
  arch/xtensa/include/asm/flat.h                     |  7 +-
  fs/Kconfig.binfmt                                  | 18 +++-
  fs/binfmt_flat.c                                   | 99 ++++++++++++++--------
  .../arm/include/asm => include/asm-generic}/flat.h | 19 +----
  include/linux/flat.h                               | 58 +++++++++----
  include/uapi/linux/flat.h                          | 59 -------------
  21 files changed, 145 insertions(+), 187 deletions(-)
  rename {arch/arm/include/asm => include/asm-generic}/flat.h (55%)
  delete mode 100644 include/uapi/linux/flat.h
