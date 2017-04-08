From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 00/10] mac68k: Miscellaneous fixes, cleanup and modernization
Date: Sat,  8 Apr 2017 19:51:15 -0400 (EDT)
Message-ID: <cover.1491695243.git.fthain@telegraphics.com.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

This series has various patches from several different people. Two printk
modernization patches were originally from Geert Uytterhoeven and three
Nubus patches were originally committed to the Linux/mac68k CVS by
David Huggins-Daines.


Finn Thain (10):
  m68k/mac: IOP - Modernize printing of kernel messages
  m68k/mac: Modernize printing of kernel messages
  m68k/mac: Adopt platform_device_register_simple()
  m68k/mac: Clarify IOP message alloc/free confusion
  nubus: Fix nubus_rewinddir (from mac68k CVS)
  nubus: Remove slot zero probe (from mac68k CVS)
  nubus: Clean up printk calls (from mac68k CVS)
  nubus: Fix pointer validation
  nubus: Clean up whitespace
  nubus: Add MVC and VSC video card definitions

 arch/m68k/mac/config.c     |  61 ++---
 arch/m68k/mac/iop.c        |  93 +++-----
 arch/m68k/mac/misc.c       |  23 +-
 drivers/nubus/nubus.c      | 556 +++++++++++++++++----------------------------
 include/uapi/linux/nubus.h |   4 +-
 5 files changed, 275 insertions(+), 462 deletions(-)

-- 
2.10.2
