From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu follow up fixes for 3.10
Date: Thu, 6 Jun 2013 15:30:38 +1000
Message-ID: <201306060530.r565UceA013254@goober.accelcon.com>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from nskntmtas04p.mx.bigpond.com ([61.9.168.146]:45903 "EHLO
	nskntmtas04p.mx.bigpond.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751670Ab3FFF3t (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Thu, 6 Jun 2013 01:29:49 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.

It contains only a single fix for compilation breakage to many of the
ColdFire CPU targets.

Regards
Greg



The following changes since commit e4aa937ec75df0eea0bee03bffa3303ad36c986b:

  Linux 3.10-rc3 (2013-05-26 16:00:47 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to cf6c31fc5c3de225348742c95cc6185fca20a2f2:

  m68k: only use local gpio_request_one if not using GPIOLIB (2013-05-29 16:56:45 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68k: only use local gpio_request_one if not using GPIOLIB

 arch/m68k/include/asm/gpio.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
