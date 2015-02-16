From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 3.20
Date: Mon, 16 Feb 2015 14:02:01 +1000
Message-ID: <201502160402.t1G421eH032113@goober.accelecon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nschwmtas05p.mx.bigpond.com ([61.9.189.149]:50623 "EHLO
	nschwmtas05p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752203AbbBPECF (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Sun, 15 Feb 2015 23:02:05 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Nothing big, only a small collection of minor cleanups/fixes to be pulled.

Regards
Greg


The following changes since commit e36f014edff70fc02b3d3d79cead1d58f289332e:

  Linux 3.19-rc7 (2015-02-01 20:07:21 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 21b30ca5da14613dcf8fd8350ecdb0d5d245e814:

  arch: m68k: 68360: config: Remove unused function (2015-02-03 14:16:23 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68knommu: fix irq handler types in 68360/commproc.c

Paul Bolle (1):
      m68k: remove check for CONFIG_BSEIP

Rickard Strandqvist (1):
      arch: m68k: 68360: config: Remove unused function

 arch/m68k/68360/commproc.c       |  8 ++++----
 arch/m68k/68360/config.c         | 13 -------------
 arch/m68k/include/asm/commproc.h | 24 +-----------------------
 3 files changed, 5 insertions(+), 40 deletions(-)
