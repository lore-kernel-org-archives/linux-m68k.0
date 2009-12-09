From: Greg Ungerer <gerg@snapgear.com>
Subject: [git pull] m68knommu arch updates
Date: Wed, 9 Dec 2009 17:58:25 +1000
Message-ID: <200912090758.nB97wPok013748@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from rex.securecomputing.com ([203.24.151.4]:34268 "EHLO
	cyberguard.com.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750707AbZLIH6j (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 9 Dec 2009 02:58:39 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org

Hi Linus,

Please pull to get the latest m68knommu arch fixes. Not a lot in here,
mostly small fixes. The biggest change is Tim Abbott's linker script
cleanups.

git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-li=
nus

Thanks
Greg




The following changes since commit 22763c5cf3690a681551162c15d34d935308=
c8d7:
  Linus Torvalds (1):
        Linux 2.6.32

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-=
linus

Greg Ungerer (3):
      m68knommu: define arch_has_single_step() and friends
      m68knommu: add a task_pt_regs() macro
      m68knommu: rename BSS define in linker script

Lennart Sorensen (1):
      m68knommu: add uboot commandline argument passing support

Steven King (2):
      m68knommu: Coldfire GPIO corrections
      m68knommu: export clk_* symbols in clk.c

Tim Abbott (7):
      m68knommu: Don't hardcode the value of PAGE_SIZE in the linker sc=
ript.
      m68knommu: Make THREAD_SIZE available to assembly files.
      m68knommu: Use INIT_TASK_DATA and CACHELINE_ALIGNED_DATA.
      m68knommu: Use more macros inside the .init section.
      m68knommu: Move __init_begin out of the .init section.
      m68knommu: Move __init_end out of the .init section.
      m68knommu: Split the .init section into INIT_TEXT_SECTION and INI=
T_DATA_SECTION.

Uwe Kleine-K=C3=B6nig (1):
      m68knommu: move mcf_remove to .devexit.text

 arch/m68k/include/asm/processor.h       |    2 +
 arch/m68k/include/asm/ptrace.h          |   12 ++++
 arch/m68k/include/asm/thread_info_no.h  |    4 +-
 arch/m68knommu/Kconfig                  |    7 ++
 arch/m68knommu/kernel/ptrace.c          |   18 +++++-
 arch/m68knommu/kernel/setup.c           |   92 +++++++++++++++++++++++=
+++++++-
 arch/m68knommu/kernel/vmlinux.lds.S     |   47 +++++-----------
 arch/m68knommu/platform/523x/gpio.c     |    5 +-
 arch/m68knommu/platform/527x/gpio.c     |    6 +-
 arch/m68knommu/platform/528x/gpio.c     |    2 +-
 arch/m68knommu/platform/coldfire/clk.c  |    7 ++-
 arch/m68knommu/platform/coldfire/head.S |   10 +++
 drivers/serial/mcf.c                    |    2 +-
 13 files changed, 167 insertions(+), 47 deletions(-)
