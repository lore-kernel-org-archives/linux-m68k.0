From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fix for v5.1
Date: Mon, 11 Mar 2019 10:25:31 +1000
Message-ID: <c2d18bdf-e9ed-6c43-57ea-695b82417530@linux-m68k.org>
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

Only a single change to provide platform side support for the eDMA
hardware module on the ColdFire MCF5441X SoC.

Regards
Greg




The following changes since commit 5908e6b738e3357af42c10e1183753c70a0117a9:

   Linux 5.0-rc8 (2019-02-24 16:46:45 -0800)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to d7e9d01ac2920959b474c6363dba269a868f4db9:

   m68k: add ColdFire mcf5441x eDMA platform support (2019-02-25 11:04:05 +1000)

----------------------------------------------------------------
Angelo Dureghello (1):
       m68k: add ColdFire mcf5441x eDMA platform support

  arch/m68k/coldfire/device.c       | 81 +++++++++++++++++++++++++++++++++++++++
  arch/m68k/coldfire/m5441x.c       |  4 +-
  arch/m68k/include/asm/m5441xsim.h | 15 ++++++++
  3 files changed, 98 insertions(+), 2 deletions(-)
