From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu important arch fix for 3.8
Date: Tue, 12 Feb 2013 13:26:35 +1000
Message-ID: <201302120326.r1C3QZhX010155@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntqsrv02p.mx.bigpond.com ([61.9.168.234]:47383 "EHLO
	nskntqsrv02p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752737Ab3BLDjo (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Mon, 11 Feb 2013 22:39:44 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.

It contains a single critical fix for the non-MMU m68k platforms. The change
of the kernel exec code path has revealed a problem in the start thread code
that causes crashing on boot. This is the fix for it.

Regards
Greg



The following changes since commit 88b62b915b0b7e25870eb0604ed9a92ba4bfc9f7:
  Linus Torvalds (1):
        Linux 3.8-rc6

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

Greg Ungerer (1):
      m68knommu: fix trap on execing /bin/init

 arch/m68k/include/asm/processor.h |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)
