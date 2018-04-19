From: Michael Schmitz <schmitzmic@gmail.com>
Subject: [PATCH v4 00/10] New network driver for Amiga X-Surf 100 (m68k)
Date: Thu, 19 Apr 2018 14:05:17 +1200
Message-ID: <1524103526-12240-1-git-send-email-schmitzmic@gmail.com>
References: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1524025616-3722-1-git-send-email-schmitzmic@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch, fthain@telegraphics.com.au, geert@linux-m68k.org, f.fainelli@gmail.com, linux-m68k@vger.kernel.org, Michael.Karcher@fu-berlin.de
List-Id: linux-m68k@vger.kernel.org

[This is a resend of my v3 series which was based on the wrong version and
tree. Only substantial change is to Asix AX99796B PHY driver.]

This patch series adds support for the Individual Computers X-Surf 100
network card for m68k Amiga, a network adapter based on the AX88796 chip set.

The driver was originally written for kernel version 3.19 by Michael Karcher
(see CC:), and adapted to 4.16+ for submission to netdev by me. Questions
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
- set IRQF_SHARED if platform IRQ resource is marked shareable

The Asix Electronix PHY used on the X-Surf 100 is buggy, and causes the
software reset to hang if the previous command sent to the PHY was also
a soft reset. This bug requires addition of a PHY driver for Asix PHYs
to provide a fixed .soft_reset function, included in this series.

Some additional cleanup:
- do not attempt to free IRQ in ax_remove (complements 82533ad9a1c),
- clear platform drvdata on probe fail and module remove.

Changes since v1:

Raised in review by Andrew Lunn:
- move MII code around to avoid need for forward declaration,
- combine patches 2 and 7 to add cleanup in error path

Changes since v2:

- corrected authorship attribution to Michael Karcher

Suggested by Geert Uytterhoeven:
- use ei_local->reset_8390() instead of duplicating ax_reset_8390(),
- use %pR to format struct resource pointers,
- assign pdev and xs100 pointers in declaration,
- don't split error messages,
- change Kconfig logic to only require XSURF100 set on Amiga

Suggested by Andrew Lunn:
- add COMPILE_TEST to ax88796 Kconfig options,
- use new Asix PHY driver for X-Surf 100

Suggested by Andrew Lunn/Finn Thain:
- declare struct sk_buff in ax88796.h,
- correct whitespace error in ax88796.h

Changes since v3:

- various checkpatch cleanup

Andrew Lunn:
- don't duplicate genphy_soft_reset in Asix PHY driver, just call 
  genphy_soft_reset after writing zero to control register

This series' patches, in order:

1/9 net-next: phy: new Asix Electronics PHY driver
2/9 net-next: ax88796: Fix MAC address reading
3/9 net-next: ax88796: Attach MII bus only when open
4/9 net-next: ax88796: Do not free IRQ in ax_remove() (already freed in ax_close()).
5/9 net-next: ax88796: Add block_input/output hooks to ax_plat_data
6/9 net-next: ax88796: add interrupt status callback to platform data
7/9 net-next: ax88796: set IRQF_SHARED flag when IRQ resource is marked as shareable
8/9 net-next: ax88796: release platform device drvdata on probe error and module remove
9/9 net-next: New ax88796 platform driver for Amiga X-Surf 100 Zorro board (m68k)

 drivers/net/ethernet/8390/Kconfig    |   17 ++-
 drivers/net/ethernet/8390/Makefile   |    1 +
 drivers/net/ethernet/8390/ax88796.c  |  228 ++++++++++++--------
 drivers/net/ethernet/8390/xsurf100.c |  382 ++++++++++++++++++++++++++++++++++
 drivers/net/phy/Kconfig              |    6 +
 drivers/net/phy/Makefile             |    1 +
 drivers/net/phy/asix.c               |   63 ++++++
 include/net/ax88796.h                |   14 ++
 8 files changed, 617 insertions(+), 95 deletions(-)

Cheers,

	Michael
