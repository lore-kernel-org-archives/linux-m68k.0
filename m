From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fixes for v4.18
Date: Tue, 3 Jul 2018 11:06:34 +1000
Message-ID: <c166ef5e-89a9-1078-6a82-53c506c26f6e@linux-m68k.org>
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

It contains a single fix, for breakage introduced in 4.18-rc1.

Regards
Greg




The following changes since commit 021c91791a5e7e85c567452f1be3e4c2c6cb6063:

   Linux 4.18-rc3 (2018-07-01 16:04:53 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-linus

for you to fetch changes up to ecd60532e060e45c63c57ecf1c8549b1d656d34d:

   m68k: fix "bad page state" oops on ColdFire boot (2018-07-02 10:05:13 +1000)

----------------------------------------------------------------
Greg Ungerer (1):
       m68k: fix "bad page state" oops on ColdFire boot

  arch/m68k/include/asm/mcf_pgalloc.h | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
