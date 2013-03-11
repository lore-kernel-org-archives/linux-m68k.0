From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 3.9
Date: Mon, 11 Mar 2013 10:32:26 +1000
Message-ID: <201303110032.r2B0WQXC024689@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas03p.mx.bigpond.com ([61.9.168.143]:28720 "EHLO
	nskntmtas03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753418Ab3CKAdF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 10 Mar 2013 20:33:05 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.

It contains a few small fixes for the non-MMU m68k platforms. Fixes some
compilation problems, some broken header definitions, removes an unused
config option and adds a name for the old 68000 CPU support.

Regards
Greg



The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

  Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to ef9240f482e691e13a2d27208f60d1f1f5503545:

  m68k: drop "select EMAC_INC" (2013-03-06 16:08:26 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68knommu: fix misnamed GPIO pin definition for ColdFire 528x CPU

Luis Alves (2):
      m68knommu: add CPU_NAME for 68000
      m68knommu: fix MC68328.h defines

Paul Bolle (1):
      m68k: drop "select EMAC_INC"

Thadeu Lima de Souza Cascardo (1):
      m68knommu: fix build when CPU is not coldfire

 arch/m68k/Kconfig.machine           |  1 -
 arch/m68k/include/asm/MC68328.h     | 10 +++++-----
 arch/m68k/kernel/setup_no.c         |  3 +++
 arch/m68k/mm/init.c                 |  2 +-
 arch/m68k/platform/coldfire/m528x.c |  2 +-
 5 files changed, 10 insertions(+), 8 deletions(-)
