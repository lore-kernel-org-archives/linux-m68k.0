From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu arch fixes for 4.2
Date: Mon, 29 Jun 2015 09:07:50 +1000
Message-ID: <201506282307.t5SN7oxH015997@goober.accelecon.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org, geert@linux-m68k.org
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Only a couple of small changes. Improved the m68knommu MAINTAINERS
entry to make it clearer which m68k parts this applies to, and a print
format clean up.

Regards
Greg




The following changes since commit 0f57d86787d8b1076ea8f9cbdddda2a46d534a27:

  Linux 4.1-rc8 (2015-06-14 15:51:10 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to e1632fa2471281c69bb3b6414d2c0fb01c56cc70:

  m68k: improve m68knommu MAINTAINERS entry (2015-06-19 17:22:17 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68k: improve m68knommu MAINTAINERS entry

Joe Perches (1):
      m68k: Use vsprintf %pM extension

 MAINTAINERS                | 6 +++++-
 arch/m68k/68000/m68EZ328.c | 3 +--
 arch/m68k/68000/m68VZ328.c | 3 +--
 arch/m68k/68360/config.c   | 3 +--
 4 files changed, 8 insertions(+), 7 deletions(-)
