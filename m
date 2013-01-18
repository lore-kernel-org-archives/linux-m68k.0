From: Greg Ungerer <gerg@goober.accelcon.com>
Subject: [git pull] m68knommu arch fixes for 3.8
Date: Fri, 18 Jan 2013 16:47:16 +1000
Message-ID: <201301180647.r0I6lGbf020653@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv03p.mx.bigpond.com ([61.9.168.237]:39415 "EHLO
	nskntqsrv03p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751032Ab3ARIQO (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Fri, 18 Jan 2013 03:16:14 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch, at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

It contains a couple of fixes, both affecting compilation of non-mmu m68k
targets.

Regards
Greg




The following changes since commit d1c3ed669a2d452cacfb48c2d171a1f364dae2ed:
  Linus Torvalds (1):
        Linux 3.8-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

Greg Ungerer (2):
      m68knommu: add KMAP definitions for non-MMU definitions
      m68k: fix conditional use of init_pointer_table

 arch/m68k/include/asm/pgtable_no.h |    2 ++
 arch/m68k/mm/init.c                |    8 +++++---
 2 files changed, 7 insertions(+), 3 deletions(-)
