From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH v5 00/14] Modernization and fixes for NuBus subsystem
Date: Sat, 13 Jan 2018 17:37:13 -0500 (EST)
Message-ID: <cover.1515814167.git.fthain@telegraphics.com.au>
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from kvm5.telegraphics.com.au ([98.124.60.144]:43790 "EHLO
        kvm5.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753170AbeAMWhO (ORCPT
        <rfc822;linux-m68k@vger.kernel.org>); Sat, 13 Jan 2018 17:37:14 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org

This series begins with cleanups and fixes for the NuBus subsystem and
finishes with a patch to add support for the Linux Driver Model.
A separate series (which requires this one) modernizes NuBus drivers.

Changes since v1:
- Added the missing NULL check in nubus_device_remove().
- Squashed the two /proc/bus/nubus/s/ patches into one patch.
- Combined the two sets of /proc/bus/nubus file operations into one set.
- Used the name 'nubus_rsrc' instead of 'nubus_functional_resource'.
- Used the name 'nubus_device_register' instead of 'nubus_device_add'.
- Dropped the unused EXPORT_SYMBOL(nubus_seq_write_rsrc_mem).
- Replaced licensing text in the new file with SPDX-License-Identifier.

Changes since v2:
- Implemented an idiomatic device release function for nubus boards.
- Removed the global nubus_boards linked list.
- Removed nubus_board pointer from proc dir entry private data to improve
  modularity.
- Adopted the standard linked list implementation.
- Disambiguated unrecognized and empty resources under /proc/bus/nubus.
- Reduced redundancy in proc dir entry private data to save some memory.
- Replaced /proc/nubus custom seq file ops with single_open().

Changes since v3:
- Added Acked-by and Reviewed-by tags.
- Moved the SPDX tag in bus.c to the first line of the file.

Changes since v4:
- Addressed some code style issues.


Finn Thain (14):
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
  nubus: Adopt standard linked list implementation
  nubus: Add expansion_type values for various Mac models
  nubus: Add support for the driver model

 arch/m68k/include/asm/macintosh.h       |   9 +-
 arch/m68k/mac/config.c                  | 110 +++----
 drivers/net/ethernet/8390/mac8390.c     |  33 +-
 drivers/net/ethernet/cirrus/mac89x0.c   |   6 +-
 drivers/net/ethernet/natsemi/macsonic.c |  38 ++-
 drivers/nubus/Makefile                  |   2 +-
 drivers/nubus/bus.c                     | 117 +++++++
 drivers/nubus/nubus.c                   | 542 +++++++++++++++++---------------
 drivers/nubus/proc.c                    | 281 ++++++++---------
 drivers/video/fbdev/macfb.c             |  10 +-
 include/linux/nubus.h                   | 189 +++++++----
 include/uapi/linux/nubus.h              |  23 --
 12 files changed, 762 insertions(+), 598 deletions(-)
 create mode 100644 drivers/nubus/bus.c

-- 
2.13.6
