From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 4.1
Date: Mon, 20 Apr 2015 11:40:01 +1000
Message-ID: <201504200140.t3K1e1e8003814@goober.accelecon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas01p.mx.bigpond.com ([61.9.189.137]:40733 "EHLO
	nschwmtas01p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751261AbbDTBje (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 19 Apr 2015 21:39:34 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Nothing big, spelling fixes and fix/cleanup for ColdFire eth device setup.

Regards
Greg




The following changes since commit e42391cd048809d903291d07f86ed3934ce138e9:

  Linux 4.0-rc6 (2015-03-29 15:26:31 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 6e4206136faa9a4d588946dfa604e1d989a9b3b6:

  m68knommu: fix fec setup warning for ColdFire 5271 builds (2015-03-30 09:52:24 +1000)

----------------------------------------------------------------
Greg Ungerer (2):
      m68knommu: ColdFire 5271 only has a single FEC controller
      m68knommu: fix fec setup warning for ColdFire 5271 builds

Yannick Guerrini (1):
      m68k: Fix trivial typos in comments

 arch/m68k/coldfire/m527x.c          | 3 ++-
 arch/m68k/include/asm/m527xsim.h    | 2 ++
 arch/m68k/include/asm/m68360_pram.h | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)
