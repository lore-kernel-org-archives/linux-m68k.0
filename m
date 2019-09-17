From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v5.4
Date: Tue, 17 Sep 2019 13:38:17 +1000
Message-ID: <a6d7c0bc-a6df-62be-ed2b-944551def5af@linux-m68k.org>
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

Only a single change, fix up header include in ColdFire specific GPIO
handling code.

Regards
Greg




The following changes since commit f74c2bb98776e2de508f4d607cd519873065118e:

   Linux 5.3-rc8 (2019-09-08 13:33:15 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 372ea263b3d9cdeb70f8cffa025b2e0875e51b62:

   m68k: coldfire: Include the GPIO driver header (2019-09-09 09:32:32 +1000)

----------------------------------------------------------------
Linus Walleij (1):
       m68k: coldfire: Include the GPIO driver header

  arch/m68k/coldfire/gpio.c | 1 +
  1 file changed, 1 insertion(+)
