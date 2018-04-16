From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH 00/10] New network driver for Amiga X-Surf 100 (m68k)
Date: Tue, 17 Apr 2018 10:04:35 +1200
Message-ID: <1523916285-6057-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

This patch series adds support for the Individual Computers X-Surf 100
network card for m68k Amiga, a network adapter based on the AX88796 chip set.

The driver was originally written for kernel version 3.19 by Michael Karcher
(see CC:), and adapted to 4.16 for submission to netdev by me. Questions  
regarding motivation for some of the changes are probably best directed at
Michael Karcher.

The driver has been tested by Adrian <glaubitz@physik.fu-berlin.de> who will
send his Tested-by tag separately.

A few changes to the ax88796 driver were required:
- to read the MAC address, some setup of the ax99796 chip must be done,
- attach to the MII bus only on device open to allow module unloading,
- allow to supersede ax_block_input/ax_block_output by card-specific
  optimized code,
- use an optional interrupt status callback to allow easier sharing of the
  card interrupt,
- set IRQF_SHARED if platform IRQ resource is marked shareable,
- add a dummy control register write to MII reset code so back-to-back
  reset requests work.

Some additional cleanup:
- do not attempt to free IRQ in ax_remove (complements 82533ad9a1c),
- unregister and free mdiobus resources in ax_mii_init error path,
- clear platform drvdata on probe fail and module remove.

The patch series, in order:

01/10 net: ax88796: Fix MAC address reading
02/10 net: ax88796: Attach MII bus only when open
03/10 net: ax88796: Do not free IRQ in ax_remove() (already freed in ax_close()).
04/10 net: ax88796: Add block_input/output hooks to ax_plat_data
05/10 net: ax88796: add interrupt status callback to platform data
06/10 net: ax88796: set IRQF_SHARED flag when IRQ resource is marked as shareable
07/10 net: ax88796: unregister mdiobus on ax_mii_init() fail
08/10 net: ax88796: Make reset more robust on AX88796B
09/10 net: ax88796: release platform device drvdata on probe error and module remove
10/10 net: New ax88796 platform driver for Amiga X-Surf 100 Zorro board (m68k)

 drivers/net/ethernet/8390/Kconfig    |   14 +-
 drivers/net/ethernet/8390/Makefile   |    1 +
 drivers/net/ethernet/8390/ax88796.c  |   66 +++++-
 drivers/net/ethernet/8390/xsurf100.c |  411 ++++++++++++++++++++++++++++++++++
 include/net/ax88796.h                |   14 +-
 5 files changed, 495 insertions(+), 11 deletions(-)

Cheers,

	Michael Schmitz
