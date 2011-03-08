From: Greg Ungerer <gerg@uclinux.org>
Subject: [PATCH 00/12] m68knommu: clean up ColdFire peripheral mapping registers
Date: Tue, 8 Mar 2011 23:03:57 +1000
Message-ID: <1299589449-24974-1-git-send-email-gerg@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sncsmrelay2.nai.com ([67.97.80.206]:61683 "EHLO
	sncsmrelay2.nai.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab1CHNMV (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 8 Mar 2011 08:12:21 -0500
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


Seeing as the m68k and m68knommu will hopefully be merged pretty soon
I am going to just send all the m68knommu patches to both m68k and
uclinux mailing lists. I will push these via the m68knommu git tree
to Linus as usual though.

This series of patches aims to clean up the mess of peripheral mapping
register setting and work arounds that has gathered in coldfire.h.
The main problem has stemmed from much code insisting and using an MBAR
register in many places. In fact only a subset of ColdFire parts actually
have the MBAR register for mapping the base address of the internal
peripherals. Some parts use an IPSBAR register instead (which has some 
slightly differet rules for its valid settings), and some just have fixed
mappings.

The following patches make MBAR, IPSBAR and direct mapping apply to only
those parts that they should. It also ultimately allows for the MBAR and
IPSBAR settings to be configurable.

This touches pretty much every possible ColdFire CPU type, but really
nothing else. It could quite possibly break any out-of-tree drivers,
since it changes quite a few of the internal peripheral register base
addresses (adding MBAR or IPSBAR as required).

--
 arch/m68k/include/asm/coldfire.h            |   46 ++++++++++-----------
 arch/m68k/include/asm/m5206sim.h            |   16 +++----
 arch/m68k/include/asm/m520xsim.h            |   40 ++++++++++--------
 arch/m68k/include/asm/m523xsim.h            |   43 ++++++++++++++++----
 arch/m68k/include/asm/m5249sim.h            |   18 ++++++--
 arch/m68k/include/asm/m527xsim.h            |   59 ++++++++++++++++++----------
 arch/m68k/include/asm/m528xsim.h            |   38 ++++++++++++++----
 arch/m68k/include/asm/m5307sim.h            |   10 ++--
 arch/m68k/include/asm/m5407sim.h            |   10 ++--
 arch/m68knommu/platform/coldfire/head.S     |    6 +-
 b/arch/m68k/include/asm/coldfire.h          |    1 
 b/arch/m68k/include/asm/m5206sim.h          |    3 +
 b/arch/m68k/include/asm/m520xsim.h          |    6 ++
 b/arch/m68k/include/asm/m523xsim.h          |    5 +-
 b/arch/m68k/include/asm/m5249sim.h          |    5 ++
 b/arch/m68k/include/asm/m5272sim.h          |    2 
 b/arch/m68k/include/asm/m527xsim.h          |    5 +-
 b/arch/m68k/include/asm/m528xsim.h          |    5 +-
 b/arch/m68k/include/asm/m5307sim.h          |    8 +++
 b/arch/m68k/include/asm/m5407sim.h          |    8 +++
 b/arch/m68k/include/asm/m54xxsim.h          |    3 -
 b/arch/m68k/include/asm/mcfdma.h            |   23 ----------
 b/arch/m68k/include/asm/mcfpit.h            |   16 -------
 b/arch/m68knommu/Kconfig                    |   40 ++++++++++++++++++
 b/arch/m68knommu/platform/520x/config.c     |   36 ++++++++---------
 b/arch/m68knommu/platform/523x/config.c     |   10 ++--
 b/arch/m68knommu/platform/527x/config.c     |   14 +++---
 b/arch/m68knommu/platform/528x/config.c     |   14 +++---
 b/arch/m68knommu/platform/coldfire/dma.c    |    8 +--
 b/arch/m68knommu/platform/coldfire/head.S   |    4 -
 b/arch/m68knommu/platform/coldfire/intc-2.c |   14 ++----
 b/arch/m68knommu/platform/coldfire/pit.c    |    2 
 32 files changed, 317 insertions(+), 201 deletions(-)
