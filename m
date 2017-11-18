From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v2 00/13] Modernization and fixes for NuBus subsystem
Date: Fri, 17 Nov 2017 21:30:11 -0500 (EST)
Message-ID: <cover.1510960933.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:34530 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161393AbdKRCaL (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Fri, 17 Nov 2017 21:30:11 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

This series begins with cleanups and fixes for the NuBus subsystem and
finishes with a patch to add support for the Linux Driver Model.
The next series, which requires this one, will modernize NuBus drivers.

Changes since v1:
- Added the missing NULL check in nubus_device_remove().
- Squashed the two /proc/bus/nubus/s/ patches into one patch.
- Combined the two sets of /proc/bus/nubus file operations into one set.
- Used the name 'nubus_rsrc' instead of 'nubus_functional_resource'.
- Used the name 'nubus_device_register' instead of 'nubus_device_add'.
- Dropped the unused EXPORT_SYMBOL(nubus_seq_write_rsrc_mem).
- Replaced licensing text in the new file with SPDX-License-Identifier.


Finn Thain (13):
  nubus: Avoid array underflow and overflow
  nubus: Fix up header split
  nubus: Use static functions where possible
  nubus: Fix log spam
  nubus: Validate slot resource IDs
  nubus: Call proc_mkdir() not more than once per slot directory
  nubus: Remove redundant code
  nubus: Clean up whitespace
  nubus: Generalize block resource handling
  nubus: Rework /proc/bus/nubus/s/ implementation
  nubus: Rename struct nubus_dev
  nubus: Add expansion_type values for various Mac models
  nubus: Add support for the driver model

 arch/m68k/include/asm/macintosh.h       |   9 +-
 arch/m68k/mac/config.c                  | 110 +++----
 drivers/net/ethernet/8390/mac8390.c     |  26 +-
 drivers/net/ethernet/natsemi/macsonic.c |  30 +-
 drivers/nubus/Makefile                  |   2 +-
 drivers/nubus/bus.c                     |  85 ++++++
 drivers/nubus/nubus.c                   | 501 ++++++++++++++++++--------------
 drivers/nubus/proc.c                    | 237 ++++++++-------
 drivers/video/fbdev/macfb.c             |   2 +-
 include/linux/nubus.h                   | 198 ++++++++-----
 include/uapi/linux/nubus.h              |  23 --
 11 files changed, 720 insertions(+), 503 deletions(-)
 create mode 100644 drivers/nubus/bus.c

-- 
2.13.6
