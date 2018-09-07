From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fix for v4.19
Date: Fri, 7 Sep 2018 11:16:56 +1000
Message-ID: <fcd5e6a5-5de9-397d-eb31-c1706f7f2f46@linux-m68k.org>
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

Can you please pull the m68knommu git tree, for-linus branch.

A single change to fix booting on ColdFire platforms that have RAM
starting at a non-0 address.

Regards
Greg



The following changes since commit 57361846b52bc686112da6ca5368d11210796804:

   Linux 4.19-rc2 (2018-09-02 14:37:30 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to c90bbce9eedd14f9428388d9442b5b3e98a2a6dd:

   m68k: fix early memory reservation for ColdFire MMU systems (2018-09-03 10:19:36 +1000)

----------------------------------------------------------------
Mike Rapoport (1):
       m68k: fix early memory reservation for ColdFire MMU systems

  arch/m68k/mm/mcfmmu.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
