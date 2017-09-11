From: Greg Ungerer <gerg@linux-m68k.org>
Subject: [git pull] m68knommu changes for v4.14
Date: Mon, 11 Sep 2017 11:29:31 +1000
Message-ID: <3db9c070-cede-72d7-cf06-5a6bbd8ceaa2@linux-m68k.org>
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

Only 2 changes. One removes unused code, the other makes local clock code
arguments consistent with generic clock code.

Regards
Greg




The following changes since commit cc4a41fe5541a73019a864883297bd5043aa6d98:

  Linux 4.13-rc7 (2017-08-27 17:20:40 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 8a1943492bd629b7eae64535a96fcb959a01bbd0:

  m68knommu: remove dead code (2017-08-28 10:40:30 +1000)

----------------------------------------------------------------
Alexandre Belloni (1):
      m68knommu: remove dead code

Jonas Gorski (1):
      m68k: allow NULL clock for clk_get_rate

 arch/m68k/coldfire/clk.c    |  3 +++
 arch/m68k/coldfire/m5441x.c | 37 -------------------------------------
 2 files changed, 3 insertions(+), 37 deletions(-)
