From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.8-rc1
Date: Thu, 11 Aug 2016 14:35:24 +1000
Message-ID: <7b32e508-b82a-e0ad-3d53-e65d25c3c127@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:22254
	"EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750741AbcHKEeB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>);
	Thu, 11 Aug 2016 00:34:01 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.

This contains only a single fix for a register corruption problem on certain
types of m68k flat format binaries.

Regards
Greg



The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to 0b98027122d0715aa2dc39882e4c295112275785:

  m68knommu: fix user a5 register being overwritten (2016-08-08 12:38:47 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68knommu: fix user a5 register being overwritten

 arch/m68k/kernel/signal.c | 1 -
 1 file changed, 1 deletion(-)
