From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 00/10] Replace via-maciisi with via-cuda driver
Date: Thu,  1 Dec 2016 01:09:33 -0500 (EST)
Message-ID: <cover.1480572271.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:59528 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753926AbcLAGJe (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Thu, 1 Dec 2016 01:09:34 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

This patch series has some improvements for the the Cuda driver: cleanup,
bug fixes and new functionality.

The broken via-maciisi driver is then replaced by via-cuda. This
eliminates over 600 LoC.

Thanks to Stan Johnson for testing these patches on a Mac LC III and
a PowerMac G3.


Finn Thain (10):
  via-cuda: Cleanup printk calls
  via-cuda: Remove redundant temporary variable
  via-cuda: Add TREQ, TIP and TACK signal helpers
  via-cuda: Prevent read buffer overflow
  via-cuda: Fix re-initialization of reply_ptr and reading_reply
  via-cuda: Avoid TREQ race condition
  via-cuda: Use spinlock_irq_save/restore instead of enable/disable_irq
  via-cuda: Initialize data_index early and increment consistently
  via-cuda: Add support for Egret system controller
  m68k/mac: Replace via-maciisi driver with via-cuda driver

 arch/m68k/include/asm/macintosh.h |   2 +-
 arch/m68k/mac/config.c            |  18 +-
 arch/m68k/mac/misc.c              |  72 +---
 drivers/macintosh/Kconfig         |  24 +-
 drivers/macintosh/Makefile        |   1 -
 drivers/macintosh/adb.c           |   4 -
 drivers/macintosh/via-cuda.c      | 294 ++++++++++++-----
 drivers/macintosh/via-maciisi.c   | 677 --------------------------------------
 8 files changed, 235 insertions(+), 857 deletions(-)
 delete mode 100644 drivers/macintosh/via-maciisi.c

-- 
2.7.3
