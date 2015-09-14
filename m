From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 0/4] m68k: System call updates
Date: Mon, 14 Sep 2015 10:56:42 +0200
Message-ID: <1442221006-2027-1-git-send-email-geert__44861.3617489629$1442221078$gmane$org@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

	Hi,

This patch series, intended for v4.3, updates the m68k system calls:
  - Wire up direct socket and ipc calls,
  - Wire up new userfaultfd and membarrier system calls.

Changes compared to v1:
  - Add missing recvmmsg and sendmmsg,
  - Renumbered userfaultfd,
  - New patches 3 and 4.

Geert Uytterhoeven (4):
  m68k: Wire up direct socket calls
  m68k: Wire up userfaultfd
  m68k: Wire up direct ipc calls
  m68k: Wire up membarrier

 arch/m68k/include/asm/unistd.h      |  2 +-
 arch/m68k/include/uapi/asm/unistd.h | 30 ++++++++++++++++++++++++++++++
 arch/m68k/kernel/syscalltable.S     | 31 ++++++++++++++++++++++++++++++-
 3 files changed, 61 insertions(+), 2 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
