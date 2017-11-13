From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.15
Date: Mon, 13 Nov 2017 15:25:26 +1000
Message-ID: <1837dd8e-4c05-54ab-09f2-2834f557f711@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

The bulk of the changes are to support the ColdFire 5441x SoC family with
their MMU enabled. The parts have been supported for a long time now, but
only in no-MMU mode. Angelo Dureghello has a new board with a 5441x and
we have ironed out the last problems with MMU enabled on it. So there is
also some changes to properly support that board too. Also a fix for a
link problem when selecting the traditional 68k beep device in no-MMU
configurations.

Regards
Greg




The following changes since commit 39dae59d66acd86d1de24294bd2f343fd5e7a625:

  Linux 4.14-rc8 (2017-11-05 13:05:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to c8b61d508986b7e77bab11f8252b67e6e2b9a7cc:

  m68k: add Sysam stmark2 open board support (2017-11-07 13:27:38 +1000)

----------------------------------------------------------------
Alexandre Belloni (1):
      m68k: pull mach_beep in setup.c

Angelo Dureghello (2):
      m68k: coldfire: add dspi0 module support
      m68k: add Sysam stmark2 open board support

Greg Ungerer (3):
      m68k: move coldfire MMU initialization code
      m68k: fix ColdFire node shift size calculation
      m68k: allow ColdFire m5441x parts to run with MMU enabled

 arch/m68k/Kconfig.cpu               |   2 +-
 arch/m68k/Kconfig.machine           |   6 ++
 arch/m68k/coldfire/Makefile         |   3 +-
 arch/m68k/coldfire/m5441x.c         |   3 +-
 arch/m68k/coldfire/m54xx.c          |   4 --
 arch/m68k/coldfire/stmark2.c        | 119 ++++++++++++++++++++++++++++++++++++
 arch/m68k/configs/stmark2_defconfig |  92 ++++++++++++++++++++++++++++
 arch/m68k/include/asm/m5441xsim.h   |   6 ++
 arch/m68k/include/asm/mcfmmu.h      |   1 +
 arch/m68k/include/asm/mmu_context.h |   1 -
 arch/m68k/kernel/setup.c            |   5 ++
 arch/m68k/kernel/setup_mm.c         |   6 +-
 arch/m68k/mm/mcfmmu.c               |   4 +-
 13 files changed, 238 insertions(+), 14 deletions(-)
 create mode 100644 arch/m68k/coldfire/stmark2.c
 create mode 100644 arch/m68k/configs/stmark2_defconfig
