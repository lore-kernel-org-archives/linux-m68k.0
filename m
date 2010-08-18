From: Greg Ungerer <gerg@snapgear.com>
Subject: [git pull] m68knommu arch fixes
Date: Wed, 18 Aug 2010 14:56:40 +1000
Message-ID: <201008180456.o7I4uekp031013@goober.internal.moreton.com.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: gerg@uclinux.org, linux-kernel@vger.kernel.org, linux-m68k@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org


Hi Linus,

Can you please pull the m68knommu git tree, for-linus branch.
A couple of minor bug fixes here for the m68knommu arch.

Thanks
Greg



The following changes since commit da5cabf80e2433131bf0ed8993abc0f7ea618c73:
  Linus Torvalds (1):
        Linux 2.6.36-rc1

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

Greg Ungerer (1):
      m68knommu: include sched.h in ColdFire/SPI driver

Jate Sujjavanich (1):
      m68knommu: arch/m68k/include/asm/ide.h fix for nommu

Kulikov Vasiliy (1):
      m68knommu: formatting of pointers in printk()

 arch/m68k/include/asm/ide.h     |   13 +++++++++++--
 arch/m68knommu/kernel/process.c |   10 +++++-----
 drivers/spi/coldfire_qspi.c     |    1 +
 3 files changed, 17 insertions(+), 7 deletions(-)
