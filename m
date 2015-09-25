From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 0/3] m68k: System call updates
Date: Fri, 25 Sep 2015 09:08:06 +0200
Message-ID: <1443164889-6217-1-git-send-email-geert@linux-m68k.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>, Andreas Schwab <schwab@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

This patch series, intended for v4.3, updates the m68k system calls:
  - Wire up direct socket calls,
  - Wire up new userfaultfd and membarrier system calls.

Changes compared to v2:
  - Postponed adding direct ipc calls, until ipc_parse_version() is
    resolved,
  - Renumbered membarrier,

Changes compared to v1:
  - Add missing recvmmsg and sendmmsg,
  - Renumbered userfaultfd,
  - New patches 3 and 4.

Geert Uytterhoeven (3):
  m68k: Wire up direct socket calls
  m68k: Wire up userfaultfd
  m68k: Wire up membarrier

 arch/m68k/include/asm/unistd.h      |  2 +-
 arch/m68k/include/uapi/asm/unistd.h | 19 +++++++++++++++++++
 arch/m68k/kernel/syscalltable.S     | 20 +++++++++++++++++++-
 3 files changed, 39 insertions(+), 2 deletions(-)

-- 
1.9.1
