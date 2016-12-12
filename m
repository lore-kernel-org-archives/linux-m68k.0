From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.10
Date: Mon, 12 Dec 2016 10:35:01 +1000
Message-ID: <d89dfa8b-a830-f985-471c-1a7ead5883da@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

There are two sets of changes in this pull. The largest is the addition
of the ColdFire platform side i2c support (the IO addressing, setup and
clock definitions). The i2c hardware module itself is driven by the kernels
existing iMX i2c driver. The other change is the addition of support for
the Amcore board.

Regards
Greg



The following changes since commit 3e5de27e940d00d8d504dfb96625fb654f641509:

  Linux 4.9-rc8 (2016-12-04 12:50:51 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 07c65a665b8d88f871d8083644ba3f41e68f048f:

  m68knommu: AMCORE board, add iMX i2c support (2016-12-05 08:53:27 +1000)

----------------------------------------------------------------
Angelo Dureghello (2):
      m68k: add Sysam AMCORE open board support
      m68knommu: AMCORE board, add iMX i2c support

Steven King (1):
      m68knommu: platform support for i2c devices on ColdFire SoC

 arch/m68k/Kconfig.machine          |   6 ++
 arch/m68k/coldfire/Makefile        |   1 +
 arch/m68k/coldfire/amcore.c        | 156 ++++++++++++++++++++++++++++++++++++
 arch/m68k/coldfire/device.c        | 159 +++++++++++++++++++++++++++++++++++++
 arch/m68k/coldfire/m5206.c         |  12 +++
 arch/m68k/coldfire/m520x.c         |  24 +++++-
 arch/m68k/coldfire/m523x.c         |  18 +++++
 arch/m68k/coldfire/m5249.c         |  25 ++++++
 arch/m68k/coldfire/m525x.c         |  10 ++-
 arch/m68k/coldfire/m527x.c         |  28 +++++++
 arch/m68k/coldfire/m528x.c         |  18 +++++
 arch/m68k/coldfire/m5307.c         |  14 ++++
 arch/m68k/coldfire/m53xx.c         |  20 ++++-
 arch/m68k/coldfire/m5407.c         |  14 ++++
 arch/m68k/coldfire/m5441x.c        |  12 +--
 arch/m68k/coldfire/m54xx.c         |  17 ++++
 arch/m68k/configs/amcore_defconfig | 118 +++++++++++++++++++++++++++
 arch/m68k/include/asm/m5206sim.h   |   8 ++
 arch/m68k/include/asm/m520xsim.h   |   8 ++
 arch/m68k/include/asm/m523xsim.h   |  10 ++-
 arch/m68k/include/asm/m527xsim.h   |   8 ++
 arch/m68k/include/asm/m528xsim.h   |   9 +++
 arch/m68k/include/asm/m5307sim.h   |   9 ++-
 arch/m68k/include/asm/m53xxsim.h   |   8 ++
 arch/m68k/include/asm/m5407sim.h   |   8 ++
 arch/m68k/include/asm/m54xxsim.h   |  11 +++
 26 files changed, 713 insertions(+), 18 deletions(-)
 create mode 100644 arch/m68k/coldfire/amcore.c
 create mode 100644 arch/m68k/configs/amcore_defconfig
