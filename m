From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.17
Date: Mon, 9 Apr 2018 11:17:05 +1000
Message-ID: <f7e92f49-9ad9-ae33-2298-f55957d374fa@linux-m68k.org>
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

Only a single fix to set the DMA masks in the ColdFire FEC platform
data structure. Stops the warning from dma-mapping.h coming out at
boot time.

Regards
Greg



The following changes since commit 3eb2ce825ea1ad89d20f7a3b5780df850e4be274:

  Linux 4.16-rc7 (2018-03-25 12:44:30 -1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to f61e64310b75733d782e930d1fb404b84699eed6:

  m68k: set dma and coherent masks for platform FEC ethernets (2018-03-28 22:27:09 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
      m68k: set dma and coherent masks for platform FEC ethernets

 arch/m68k/coldfire/device.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
