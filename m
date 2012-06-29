From: <gerg@snapgear.com>
Subject: [PATCH 0/4] m68k: ColdFire PCI bus support
Date: Fri, 29 Jun 2012 15:17:46 +1000
Message-ID: <1340947070-10672-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:18141 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812Ab2F2FRm (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 29 Jun 2012 01:17:42 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org


The following patch series adds support for the PCI bus on the ColdFire
M54[78]x family of parts.

This is very much a work in progress, but it does work for some types of PCI
add-in cards using the M5474EVB board.

---
 b/arch/m68k/Kconfig.bus                |    7
 b/arch/m68k/include/asm/dma.h          |    4 
 b/arch/m68k/include/asm/io_mm.h        |   50 ++++-
 b/arch/m68k/include/asm/m54xxpci.h     |  138 ++++++++++++++
 b/arch/m68k/include/asm/m54xxsim.h     |    3 
 b/arch/m68k/include/asm/pci.h          |    6 
 b/arch/m68k/kernel/Makefile            |    1 
 b/arch/m68k/kernel/pcibios.c           |  109 +++++++++++
 b/arch/m68k/platform/coldfire/Makefile |    2 
 b/arch/m68k/platform/coldfire/pci.c    |  314 +++++++++++++++++++++++++++++++++
 b/drivers/pci/Makefile                 |    1 
 12 files changed, 634 insertions(+), 1 deletion(-)
