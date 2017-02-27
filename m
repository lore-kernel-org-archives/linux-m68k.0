From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.11
Date: Tue, 28 Feb 2017 09:51:21 +1000
Message-ID: <8d7df6bc-dc3a-7f67-42e0-e9b0f16c96c8@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: torvalds@linux-foundation.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.

Only a single change, to update the amcore board defconfig.

Regards
Greg



The following changes since commit 7089db84e356562f8ba737c29e472cc42d530dbc:

  Linux 4.10-rc8 (2017-02-12 13:03:20 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 73ec49463f8925363aa8482ed19030beeed75323:

  m68k/defconfig: amcore board defconfig tuning (2017-02-13 09:17:40 +1000)

----------------------------------------------------------------
Angelo Dureghello (1):
      m68k/defconfig: amcore board defconfig tuning

 arch/m68k/configs/amcore_defconfig | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)
