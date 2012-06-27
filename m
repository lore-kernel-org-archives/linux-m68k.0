From: Greg Ungerer <gerg@snapgear.com>
Subject: [git pull] m68knommu arch fix for 3.5-rc4
Date: Wed, 27 Jun 2012 15:35:43 +1000
Message-ID: <201206270535.q5R5ZhcM009947@goober.corp.nai.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:56609 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929Ab2F0Fi1 (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Wed, 27 Jun 2012 01:38:27 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org

Hi Linus,

Can you plase pull the m68knommu git tree, for-linus branch:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

It contains a single fix for breakage using the Freescale FEC eth driver
on ColdFire CPUs.

Thanks
Greg




The following changes since commit 6b16351acbd415e66ba16bf7d473ece1574cf0bc:
  Linus Torvalds (1):
        Linux 3.5-rc4

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

Greg Ungerer (1):
      m68knommu: define a local devm_clk_get() function

 arch/m68k/platform/coldfire/clk.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)
