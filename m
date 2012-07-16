From: <gerg@snapgear.com>
Subject: [PATCH v2 0/5] ColdFire PCI bus support
Date: Mon, 16 Jul 2012 22:27:21 +1000
Message-ID: <1342441646-5645-1-git-send-email-gerg@snapgear.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from dnvwsmailout1.mcafee.com ([161.69.31.173]:36800 "EHLO
	DNVWSMAILOUT1.mcafee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751996Ab2GPMZZ (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 16 Jul 2012 08:25:25 -0400
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org


This is version 2 of the ColdFire PCI bus support.

The following patch series adds support for the PCI bus on the ColdFire
M54[78]x family of parts.

Changes since the last version:

. change to drivers/pci/Makefile sent to linux-pci email list separately
. header file changes broken out into a separate patch (for easier review)
. IO barriers added within PCI config space access functions

---
 arch/m68k/Kconfig.bus                |    7 
 arch/m68k/include/asm/dma.h          |    4 
 arch/m68k/include/asm/io_mm.h        |   50 +++++
 arch/m68k/include/asm/m54xxpci.h     |  138 ++++++++++++++
 arch/m68k/include/asm/m54xxsim.h     |    3 
 arch/m68k/include/asm/pci.h          |    6 
 arch/m68k/kernel/Makefile            |    1 
 arch/m68k/kernel/pcibios.c           |  109 +++++++++++
 arch/m68k/platform/coldfire/Makefile |    2 
 arch/m68k/platform/coldfire/pci.c    |  327 +++++++++++++++++++++++++++++++++++
 10 files changed, 646 insertions(+), 1 deletion(-)
