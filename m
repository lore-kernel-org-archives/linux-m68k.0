From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 0/4] m68k/mac: Various cleanups and fixes
Date: Thu, 26 Oct 2017 22:45:24 -0400 (EDT)
Message-ID: <cover.1509071937.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org



Finn Thain (4):
  m68k/mac: More printk modernization
  m68k/mac: Disentangle VIA and OSS initialization
  m68k/mac: Disentangle VIA/RBV and NuBus initialization
  m68k/mac: Add mutual exclusion for IOP interrupt polling

 arch/m68k/include/asm/mac_iop.h |  1 +
 arch/m68k/mac/baboon.c          |  2 +-
 arch/m68k/mac/config.c          |  2 +-
 arch/m68k/mac/iop.c             | 13 ++++++++--
 arch/m68k/mac/oss.c             | 16 ++++---------
 arch/m68k/mac/psc.c             |  6 ++---
 arch/m68k/mac/via.c             | 53 ++++++++++++++++-------------------------
 drivers/macintosh/adb-iop.c     |  4 +---
 drivers/nubus/nubus.c           | 13 ----------
 9 files changed, 42 insertions(+), 68 deletions(-)

-- 
2.13.6
