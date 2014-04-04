From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 3.15
Date: Fri, 4 Apr 2014 11:01:29 +1000
Message-ID: <201404040101.s3411TEC025079@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv02p.mx.bigpond.com ([61.9.168.234]:44718 "EHLO
	nskntqsrv02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751215AbaDDBJB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 3 Apr 2014 21:09:01 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

Just a couple of fixes. Clean up compile warnings by using correct types
in function args, and clean out the removed CONFIG_MTD_PARTITIONS.

Regards
Greg




The following changes since commit fa389e220254c69ffae0d403eac4146171062d08:

  Linux 3.14-rc6 (2014-03-09 19:41:57 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 4dc5aa2172373fe7ccc25bc22fc21fcf150a66c5:

  m68knommu: fix arg types for outs* functions (2014-03-11 09:38:22 +1000)

----------------------------------------------------------------
Eunbong Song (1):
      m68k : Kill CONFIG_MTD_PARTITIONS

Greg Ungerer (1):
      m68knommu: fix arg types for outs* functions

 arch/m68k/configs/m5208evb_defconfig | 1 -
 arch/m68k/configs/m5249evb_defconfig | 1 -
 arch/m68k/configs/m5272c3_defconfig  | 1 -
 arch/m68k/configs/m5275evb_defconfig | 1 -
 arch/m68k/configs/m5307c3_defconfig  | 1 -
 arch/m68k/configs/m5407c3_defconfig  | 1 -
 arch/m68k/include/asm/io_no.h        | 6 +++---
 7 files changed, 3 insertions(+), 9 deletions(-)
