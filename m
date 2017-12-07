From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fixes for v4.15
Date: Thu, 7 Dec 2017 12:00:26 +1000
Message-ID: <38687a30-f6d2-9617-71f6-7cc49050ca89@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from icp-osb-irony-out9.external.iinet.net.au ([203.59.1.226]:40155
        "EHLO icp-osb-irony-out9.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752342AbdLGCAa (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Wed, 6 Dec 2017 21:00:30 -0500
Content-Language: en-US
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.

There is two fixes here. One to add a missing linker section to the m68k
architecture linker scripts, the other to fix a defconfig build problem.

Regards
Greg



The following changes since commit ae64f9bd1d3621b5e60d7363bc20afb46aede215:

  Linux 4.15-rc2 (2017-12-03 11:01:47 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to 65323ee1ab528c9c169f671944ac51896f507428:

  m68k/defconfig: fix stmark2 broken local compilation (2017-12-04 22:36:43 +1000)

----------------------------------------------------------------
Angelo Dureghello (1):
      m68k/defconfig: fix stmark2 broken local compilation

Greg Ungerer (1):
      m68k: add missing SOFTIRQENTRY_TEXT linker section

 arch/m68k/configs/stmark2_defconfig | 1 -
 arch/m68k/kernel/vmlinux-nommu.lds  | 2 ++
 arch/m68k/kernel/vmlinux-std.lds    | 2 ++
 arch/m68k/kernel/vmlinux-sun3.lds   | 2 ++
 4 files changed, 6 insertions(+), 1 deletion(-)
