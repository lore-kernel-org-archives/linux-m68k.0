From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.9
Date: Thu, 6 Oct 2016 10:13:34 +1000
Message-ID: <e494fb35-ea65-2985-78ae-8302cf901351@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out6.external.iinet.net.au ([203.59.1.106]:7287
        "EHLO icp-osb-irony-out6.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S934542AbcJFANb (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 5 Oct 2016 20:13:31 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

The bulk of the changes here are to clean up the ColdFire 5441x SoC
support so that it can run with MMU enabled. We have only supported
it with MMU disabled up to now. There is also a few individual bug
fixes across the ColdFire support code.

Regards
Greg



The following changes since commit 08895a8b6b06ed2323cd97a36ee40a116b3db8ed:

  Linux 4.8-rc8 (2016-09-25 18:47:13 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 742859adc721da65ff4e8b59412d73bd3d2a57fe:

  m68k: let clk_disable() return immediately if clk is NULL (2016-09-26 12:02:59 +1000)

----------------------------------------------------------------
Greg Ungerer (14):
      m68knommu: fix early setup to not access variables
      m68knommu: switch to using IO access methods in WildFire board code
      m68knommu: fix IO write size in nettel pin set
      m68k: move CONFIG_FPU set to per-CPU configuration
      m68k: set appropriate machine type for m5411x SoC platforms
      m68k: report correct FPU type on ColdFire MMU platforms
      m68k: move ColdFire _bootmem_alloc code
      m68k: generalize io memory region setup for ColdFire ACR registers
      m68k: always make available dump_fpu()
      m68k: only generate FPU instructions if CONFIG_FPU enabled
      m68k: don't panic if no hardware FPU defined
      m68k: generalize uboot command line support
      m68knommu: clean up uClinux boot log output
      m68knommu: convert printk(KERN_INFO) to pr_info()

Masahiro Yamada (1):
      m68k: let clk_disable() return immediately if clk is NULL

 arch/m68k/Kconfig                     |   1 -
 arch/m68k/Kconfig.cpu                 |   6 ++
 arch/m68k/coldfire/clk.c              |   4 ++
 arch/m68k/coldfire/head.S             |   8 +--
 arch/m68k/coldfire/m528x.c            |   8 +--
 arch/m68k/coldfire/m53xx.c            |   8 +--
 arch/m68k/coldfire/m54xx.c            |  40 +------------
 arch/m68k/include/asm/bootinfo.h      |   6 ++
 arch/m68k/include/asm/m5441xsim.h     |   4 ++
 arch/m68k/include/asm/m54xxacr.h      |   2 +-
 arch/m68k/include/asm/m54xxsim.h      |   4 ++
 arch/m68k/include/asm/mcfmmu.h        |   1 +
 arch/m68k/include/asm/nettel.h        |   2 +-
 arch/m68k/include/uapi/asm/bootinfo.h |   1 +
 arch/m68k/kernel/Makefile             |   1 +
 arch/m68k/kernel/process.c            |  56 +++++++++---------
 arch/m68k/kernel/setup_mm.c           |   6 +-
 arch/m68k/kernel/setup_no.c           | 103 +++++---------------------------
 arch/m68k/kernel/uboot.c              | 107 ++++++++++++++++++++++++++++++++++
 arch/m68k/mm/mcfmmu.c                 |  31 +++++++++-
 20 files changed, 222 insertions(+), 177 deletions(-)
 create mode 100644 arch/m68k/kernel/uboot.c
