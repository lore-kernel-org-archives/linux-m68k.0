From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fixes for v4.19
Date: Mon, 20 Aug 2018 08:50:02 +1000
Message-ID: <cb438b4c-2539-b49b-6a4d-c43b734d8d90@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

Only two changes. One cleans up warnings in the ColdFire DMA code,
the other stubs out (with warnings) ColdFire clock api functions not
normally used.

Regards
Greg



The following changes since commit acb1872577b346bd15ab3a3f8dff780d6cca4b70:

   Linux 4.18-rc7 (2018-07-29 14:44:52 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 58064e1f46b174e108c11323c2b1011064fd3efe:

   m68knommu: Fix typos in Coldfire 5272 DMA debug code (2018-07-30 09:15:01 +1000)

----------------------------------------------------------------
Geert Uytterhoeven (2):
       m68k: coldfire: Normalize clk API
       m68knommu: Fix typos in Coldfire 5272 DMA debug code

  arch/m68k/coldfire/clk.c    | 29 +++++++++++++++++++++++++++++
  arch/m68k/include/asm/dma.h |  4 ++--
  2 files changed, 31 insertions(+), 2 deletions(-)
