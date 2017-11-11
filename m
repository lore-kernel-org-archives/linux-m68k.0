From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 00/14] Modernization and fixes for NuBus subsystem
Date: Sat, 11 Nov 2017 01:12:48 -0500 (EST)
Message-ID: <cover.1510377368.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:57804 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750789AbdKKGMt (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 11 Nov 2017 01:12:49 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

This series begins with cleanups and fixes for the NuBus subsystem and
finishes with a patch to add support for the Linux Driver Model.
The next series, which requires this one, will modernize NuBus drivers.


Finn Thain (14):
  nubus: Avoid array underflow and overflow
  nubus: Fix up header split
  nubus: Use static functions where possible
  nubus: Fix log spam
  nubus: Validate slot resource IDs
  nubus: Call proc_mkdir() not more than once per slot
  nubus: Remove redundant code
  nubus: Clean up whitespace
  nubus: Don't needlessly unpack vidname and driver resources
  nubus: Depopulate /proc/bus/nubus/s/
  nubus: Repopulate /proc/bus/nubus/s/
  nubus: Rename struct nubus_dev
  nubus: Add expansion_type values for various Mac models
  nubus: Add support for the driver model

 arch/m68k/include/asm/macintosh.h       |   9 +-
 arch/m68k/mac/config.c                  | 110 +++----
 drivers/net/ethernet/8390/mac8390.c     |  12 +-
 drivers/net/ethernet/natsemi/macsonic.c |  12 +-
 drivers/nubus/Makefile                  |   2 +-
 drivers/nubus/bus.c                     |  87 ++++++
 drivers/nubus/nubus.c                   | 500 ++++++++++++++++++--------------
 drivers/nubus/proc.c                    | 247 ++++++++++------
 drivers/video/fbdev/macfb.c             |   2 +-
 include/linux/nubus.h                   | 200 ++++++++-----
 include/uapi/linux/nubus.h              |  23 --
 11 files changed, 724 insertions(+), 480 deletions(-)
 create mode 100644 drivers/nubus/bus.c

-- 
2.13.6
