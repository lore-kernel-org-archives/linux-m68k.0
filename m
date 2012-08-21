From: Greg Ungerer <gerg@snapgear.com>
Subject: [git pull] m68knommu arch fixes for 3.6
Date: Tue, 21 Aug 2012 23:19:25 +1000
Message-ID: <201208211319.q7LDJPXg027836@goober.corp.nai.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dalsmrelay2.nai.com ([205.227.136.216]:40493 "EHLO
	dalsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754451Ab2HUNUi (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 21 Aug 2012 09:20:38 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch, at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

It contains 2 fixes. One fixes compilation of ColdFire clk code, the other
makes sure we use the generic atomic64 support on all m68k targets.

Regards
Greg



The following changes since commit d9875690d9b89a866022ff49e3fcea892345ad92:
  Linus Torvalds (1):
        Linux 3.6-rc2

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

Greg Ungerer (2):
      m68knommu: select CONFIG_HAVE_CLK for ColdFire CPU types
      m68k: select CONFIG_GENERIC_ATOMIC64 for all m68k CPU types

 arch/m68k/Kconfig     |    1 +
 arch/m68k/Kconfig.cpu |    5 +----
 2 files changed, 2 insertions(+), 4 deletions(-)
