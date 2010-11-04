From: Greg Ungerer <gerg@snapgear.com>
Subject: [git pull] m68knommu arch fixes
Date: Thu, 4 Nov 2010 15:22:00 +1000
Message-ID: <201011040522.oA45M09r006758@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org


Hi Linus,

Please pull from:

git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus-fixes

to get fixes for some rc1 breakage. Two things in there for minor problems
with some of the m68k/m68knommu merged headers.

Thanks
Greg


 
---
The following changes since commit d88c0922fa0e2c021a028b310a641126c6d4b7dc:
  Michel Lespinasse (1):
        Release page reference during page fault retry

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus-fixes

Greg Ungerer (1):
      m68knommu: add back in declaration of do_IRQ

Philippe De Muyter (1):
      m68k, m68knommu: Do not include linux/hardirq.h in asm/irqflags.h

 arch/m68k/include/asm/irqflags.h |    2 ++
 arch/m68k/include/asm/machdep.h  |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)
