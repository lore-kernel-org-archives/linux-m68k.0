From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu/coldfire fixes for 4.2-rc3
Date: Fri, 17 Jul 2015 09:38:15 +1000
Message-ID: <201507162338.t6GNcFem029669@goober.accelecon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas06p.mx.bigpond.com ([61.9.168.152]:39769 "EHLO
	nskntmtas06p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752358AbbGPXgn (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 16 Jul 2015 19:36:43 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Contains build fixes and updates for the ColdFire defconfigs.
Specifically there is a couple of fixes that address problems
building allnoconfig. Also fix for enabling PCI bus on the
M54xx family of ColdFire.

Regards
Greg



The following changes since commit bc0195aad0daa2ad5b0d76cce22b167bc3435590:

  Linux 4.2-rc2 (2015-07-12 15:10:30 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 67592f699cb309559575b89d727d510ea076521c:

  m68k: enable PCI support for m5475evb defconfig (2015-07-13 09:34:40 +1000)

----------------------------------------------------------------
Greg Ungerer (12):
      m68knommu: force setting of CONFIG_CLOCK_FREQ for ColdFire
      m68knommu: improve the clock configuration defaults
      m68knommu: make ColdFire SoC selection a choice
      m68knommu: update defconfig for m5208evb
      m68knommu: update defconfig for ColdFire m5249evb
      m68knommu: update defconfig for ColdFire m5272c3
      m68knommu: update defconfig for ColdFire m5275evb
      m68knommu: update defconfig for ColdFire m5307c3
      m68knommu: update defconfig for ColdFire m5407c3
      m68knommu: update defconfig for ColdFire m5475evb
      m68k: fix io functions for ColdFire/MMU/PCI case
      m68k: enable PCI support for m5475evb defconfig

 arch/m68k/Kconfig.cpu                | 49 ++++++++++++++++++++----------------
 arch/m68k/configs/m5208evb_defconfig | 22 +++-------------
 arch/m68k/configs/m5249evb_defconfig | 17 ++-----------
 arch/m68k/configs/m5272c3_defconfig  | 14 ++---------
 arch/m68k/configs/m5275evb_defconfig | 19 ++------------
 arch/m68k/configs/m5307c3_defconfig  | 21 +++-------------
 arch/m68k/configs/m5407c3_defconfig  | 17 ++-----------
 arch/m68k/configs/m5475evb_defconfig |  9 +------
 arch/m68k/include/asm/coldfire.h     |  2 +-
 arch/m68k/include/asm/io_mm.h        |  3 ++-
 10 files changed, 45 insertions(+), 128 deletions(-)
