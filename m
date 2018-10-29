From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu fix for v4.20
Date: Mon, 29 Oct 2018 13:20:43 +1000
Message-ID: <4071c24c-db60-c098-9fe7-aad3dc528f39@linux-m68k.org>
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

Only a single change to fix an out of bounds array access when
parsing boot command line.

Regards
Greg




The following changes since commit 35a7f35ad1b150ddf59a41dcac7b2fa32982be0e:

   Linux 4.19-rc8 (2018-10-15 07:20:24 +0200)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 381fdd62c38344a771aed06adaf14aae65c47454:

   m68k: fix command-line parsing when passed from u-boot (2018-10-16 09:46:02 +1000)

----------------------------------------------------------------
Angelo Dureghello (1):
       m68k: fix command-line parsing when passed from u-boot

  arch/m68k/kernel/uboot.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
