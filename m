From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.13
Date: Tue, 11 Jul 2017 13:35:19 +1000
Message-ID: <a0ba416d-b447-e5e7-d982-1769690d1468@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

Only a single change, to remove old Kconfig options from defconfigs.

Regards
Greg



The following changes since commit c0bc126f97fb929b3ae02c1c62322645d70eb408:

  Linux 4.12-rc7 (2017-06-25 18:30:05 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 354b6382847d1d95b576d0c851df7a5743b8a2c2:

  m68k: defconfig: Cleanup from old Kconfig options (2017-06-26 11:53:49 +1000)

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      m68k: defconfig: Cleanup from old Kconfig options

 arch/m68k/configs/m5208evb_defconfig | 1 -
 arch/m68k/configs/m5249evb_defconfig | 1 -
 arch/m68k/configs/m5272c3_defconfig  | 1 -
 arch/m68k/configs/m5275evb_defconfig | 1 -
 arch/m68k/configs/m5307c3_defconfig  | 1 -
 arch/m68k/configs/m5407c3_defconfig  | 1 -
 6 files changed, 6 deletions(-)
