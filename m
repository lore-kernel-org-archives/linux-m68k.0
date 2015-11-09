From: Greg Ungerer <gerg@uclinux.org>
Subject: [git pull] m68knommu/coldfire fixes for 4.4
Date: Mon, 9 Nov 2015 13:06:01 +1000
Message-ID: <56400D99.4020309@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>, Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org


Hi Linus,

Can you please pull the m68knommu git tree, for-next branch.
Only a single patch, fixes brk area setup problem in nommu environments.

Regards
Greg



The following changes since commit 32b88194f71d6ae7768a29f87fbba454728273ee:

  Linux 4.3-rc7 (2015-10-25 10:39:47 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git for-next

for you to fetch changes up to 4ac313111018cb44ecc250445de5ccb93026a980:

  fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU (2015-10-26 09:02:32 +1000)

----------------------------------------------------------------
Rich Felker (1):
      fs/binfmt_elf_fdpic.c: fix brk area overlap with stack on NOMMU

 fs/binfmt_elf_fdpic.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)
