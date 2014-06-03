From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 3.16
Date: Tue, 3 Jun 2014 11:49:21 +1000
Message-ID: <201406030149.s531nLIO004581@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas03p.mx.bigpond.com ([61.9.189.143]:16563 "EHLO
	nschwmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751200AbaFCBt3 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 2 Jun 2014 21:49:29 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

Nothing too big, just a handfull of small changes. A couple of dragonball
fixes, coldfire qspi cleanup and fixes, and some coldfire gpio cleanup,
fixes and extensions.

Regards
Greg



The following changes since commit c7208164e66f63e3ec1759b98087849286410741:

  Linux 3.15-rc7 (2014-05-25 16:06:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 83c6bdb827c9422fe6e02130d9546800143304c1:

  m68knommu: Implement gpio support for m54xx. (2014-05-26 13:28:38 +1000)

----------------------------------------------------------------
Daniel Palmer (2):
      m68knommu: Fix mach_sched_init for EZ and VZ DragonBall chips
      m68k: fix a compiler warning when building for DragonBall

Steven King (7):
      m68knommu: Add qspi clk for Coldfire SoCs without real clks.
      m68knommu: Fix the 5249/525x qspi base address.
      m68knommu: qspi declutter.
      m68knommu: add to_irq function so we can map gpios to external interrupts.
      m68knommu: setting the gpio data direction register to output doesn't dependent upon the value to output!
      m68knommu: Make everything thats not exported, static.
      m68knommu: Implement gpio support for m54xx.

 arch/m68k/include/asm/m525xsim.h    |  2 +-
 arch/m68k/include/asm/m54xxsim.h    | 12 +++++++++---
 arch/m68k/include/asm/mcfgpio.h     | 12 ++++++++----
 arch/m68k/kernel/setup_no.c         | 13 ++++++-------
 arch/m68k/platform/68000/m68EZ328.c |  3 ++-
 arch/m68k/platform/68000/m68VZ328.c |  1 +
 arch/m68k/platform/coldfire/gpio.c  | 34 +++++++++++++++++++++++-----------
 arch/m68k/platform/coldfire/m520x.c |  8 ++------
 arch/m68k/platform/coldfire/m523x.c | 10 ++++------
 arch/m68k/platform/coldfire/m5249.c | 10 ++++------
 arch/m68k/platform/coldfire/m525x.c |  2 ++
 arch/m68k/platform/coldfire/m5272.c |  2 ++
 arch/m68k/platform/coldfire/m527x.c | 10 ++++------
 arch/m68k/platform/coldfire/m528x.c | 10 ++++------
 arch/m68k/platform/coldfire/m53xx.c |  8 ++------
 15 files changed, 74 insertions(+), 63 deletions(-)
